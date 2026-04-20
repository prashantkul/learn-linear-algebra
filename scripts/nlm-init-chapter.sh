#!/usr/bin/env bash
# nlm-init-chapter.sh
#
# Create a NotebookLM notebook for a chapter, upload its sources, and
# (optionally) generate audio overview / quiz / mind map / slides.
#
# Requires: nlm CLI (https://github.com/jacob-bd/notebooklm-mcp-cli) with
# an authenticated profile (`nlm doctor` to check).
#
# Usage:
#   ./scripts/nlm-init-chapter.sh chapters/01-foundations
#   ./scripts/nlm-init-chapter.sh chapters/01-foundations --with-extracts
#   ./scripts/nlm-init-chapter.sh chapters/01-foundations --all
#
# Flags:
#   --with-extracts   Also upload chapters/NN/extracts/*.pdf (run extract_pages.py first).
#   --audio           Generate an audio overview (deep-dive podcast).
#   --quiz            Generate a quiz.
#   --mindmap         Generate a mind map.
#   --slides          Generate a slide deck.
#   --infographic     Generate an infographic.
#   --reports         Generate a Briefing Doc + a Study Guide report.
#   --share           Make the notebook publicly accessible (anyone with link can view + copy).
#   --all             Shorthand for: --with-extracts --audio --quiz --mindmap --slides --infographic --reports --share
#   --dry-run         Print what would happen without doing anything.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  sed -n '2,22p' "$0" >&2
  exit 1
fi

CHAPTER_DIR="${1%/}"
shift

WITH_EXTRACTS=0
WANT_AUDIO=0
WANT_QUIZ=0
WANT_MINDMAP=0
WANT_SLIDES=0
WANT_INFOGRAPHIC=0
WANT_REPORTS=0
WANT_SHARE=0
DRY_RUN=0

for arg in "$@"; do
  case "$arg" in
    --with-extracts) WITH_EXTRACTS=1 ;;
    --audio)         WANT_AUDIO=1 ;;
    --quiz)          WANT_QUIZ=1 ;;
    --mindmap)       WANT_MINDMAP=1 ;;
    --slides)        WANT_SLIDES=1 ;;
    --infographic)   WANT_INFOGRAPHIC=1 ;;
    --reports)       WANT_REPORTS=1 ;;
    --share)         WANT_SHARE=1 ;;
    --all)
      WITH_EXTRACTS=1
      WANT_AUDIO=1
      WANT_QUIZ=1
      WANT_MINDMAP=1
      WANT_SLIDES=1
      WANT_INFOGRAPHIC=1
      WANT_REPORTS=1
      WANT_SHARE=1
      ;;
    --dry-run) DRY_RUN=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 1 ;;
  esac
done

if [[ ! -d "$CHAPTER_DIR" ]]; then
  echo "error: chapter directory not found: $CHAPTER_DIR" >&2
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHAPTER_NUM="$(basename "$CHAPTER_DIR" | cut -d- -f1)"
CHAPTER_SLUG="$(basename "$CHAPTER_DIR" | cut -d- -f2-)"
TITLE="LA Ch.${CHAPTER_NUM} — ${CHAPTER_SLUG//-/ }"

run() {
  if [[ "$DRY_RUN" == "1" ]]; then
    echo "DRY RUN: $*"
  else
    echo "RUN: $*"
    "$@"
  fi
}

echo "==> Creating notebook: $TITLE"
if [[ "$DRY_RUN" == "1" ]]; then
  NOTEBOOK_ID="<DRY-RUN-NOTEBOOK-ID>"
  echo "DRY RUN: nlm create notebook \"$TITLE\""
else
  CREATE_OUTPUT="$(nlm create notebook "$TITLE")"
  echo "$CREATE_OUTPUT"
  # Notebook IDs are hex strings with optional dashes; pull the first long token.
  NOTEBOOK_ID="$(echo "$CREATE_OUTPUT" | grep -Eo '[a-f0-9-]{20,}' | head -n1)"
  if [[ -z "$NOTEBOOK_ID" ]]; then
    echo "error: could not parse notebook ID from nlm output" >&2
    exit 1
  fi
  echo "  Notebook ID: $NOTEBOOK_ID"
fi

# Upload chapter markdown files
echo
echo "==> Uploading markdown sources"
for f in notes.md worked-examples.md exercises.md sources.md; do
  path="$CHAPTER_DIR/$f"
  if [[ -f "$path" ]]; then
    run nlm source add "$NOTEBOOK_ID" --file "$path" --title "$f" --wait
  fi
done

# Upload extracts if requested
if [[ "$WITH_EXTRACTS" == "1" ]]; then
  echo
  echo "==> Uploading extracts"
  EXTRACTS_DIR="$CHAPTER_DIR/extracts"
  if [[ ! -d "$EXTRACTS_DIR" ]]; then
    echo "warning: $EXTRACTS_DIR not found — run 'uv run scripts/extract_pages.py $CHAPTER_DIR' first" >&2
  else
    for pdf in "$EXTRACTS_DIR"/*.pdf; do
      [[ -e "$pdf" ]] || continue
      run nlm source add "$NOTEBOOK_ID" --file "$pdf" --title "$(basename "${pdf%.pdf}")" --wait
    done
  fi
fi

# Generate artifacts
if [[ "$WANT_AUDIO" == "1" ]]; then
  echo
  echo "==> Generating audio overview (podcast)"
  run nlm audio create "$NOTEBOOK_ID" --format deep_dive --length default -y
fi
if [[ "$WANT_QUIZ" == "1" ]]; then
  echo
  echo "==> Generating quiz"
  run nlm quiz create "$NOTEBOOK_ID" --count 10 --difficulty 3 -y
fi
if [[ "$WANT_MINDMAP" == "1" ]]; then
  echo
  echo "==> Generating mind map"
  run nlm mindmap create "$NOTEBOOK_ID" --title "$TITLE" -y
fi
if [[ "$WANT_SLIDES" == "1" ]]; then
  echo
  echo "==> Generating slide deck"
  run nlm slides create "$NOTEBOOK_ID" --format detailed_deck --length default -y
fi
if [[ "$WANT_INFOGRAPHIC" == "1" ]]; then
  echo
  echo "==> Generating infographic"
  run nlm infographic create "$NOTEBOOK_ID" -y
fi
if [[ "$WANT_REPORTS" == "1" ]]; then
  echo
  echo "==> Generating Briefing Doc report"
  run nlm report create "$NOTEBOOK_ID" --format "Briefing Doc" -y
  echo
  echo "==> Generating Study Guide report"
  run nlm report create "$NOTEBOOK_ID" --format "Study Guide" -y
fi
if [[ "$WANT_SHARE" == "1" ]]; then
  echo
  echo "==> Enabling public sharing"
  run nlm share public "$NOTEBOOK_ID"
fi

echo
echo "==> Done."
echo "    Notebook ID: $NOTEBOOK_ID"
echo "    Open at: https://notebooklm.google.com/notebook/$NOTEBOOK_ID"
if [[ "$WANT_SHARE" == "1" ]]; then
  echo "    (Public — add this URL to README.md and notebooks.md)"
fi
