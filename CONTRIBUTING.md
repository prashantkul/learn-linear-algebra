# Contributing

Thanks for considering a contribution. The fastest way to help: pick a chapter, read it, then open an issue or PR with anything that's unclear, missing, or could be sharper.

## Repo layout

```
learn-linear-algebra/
  README.md                       # consumer-facing entry point
  CONTRIBUTING.md                 # this file
  notebooks.md                    # public NotebookLM index
  LICENSE                         # MIT
  pyproject.toml                  # uv project + Python deps
  uv.lock                         # locked dependency versions
  books/                          # gitignored — bring your own PDFs
  chapters/NN-topic/
    README.md                     # chapter objectives
    notes.md                      # main tutorial
    worked-examples.md            # solved problems
    exercises.md                  # practice + answers
    sources.md                    # page references and external links
    extracts.yaml                 # which pages to slice from source PDFs
    extracts/                     # gitignored — generated PDFs
    code/
      python/                     # NumPy/matplotlib/sympy notebooks (uv kernel)
      sage/                       # SageMath notebooks (Sage kernel)
    visuals/                      # diagram references
  scripts/
    extract_pages.py              # PDF excerpter (uv run)
    nlm-init-chapter.sh           # publish a chapter to NotebookLM
```

## What you need to develop locally

You only need this setup if you want to run the Jupyter notebooks, regenerate a NotebookLM, or modify the content with the publishing pipeline. **For just reading or fixing typos in the markdown, no setup is required.**

### 1. Get the source PDFs

The two anchor textbooks are copyrighted and **not** redistributed in this repo. Obtain your own copies and place them at:

```
books/Bretscher.pdf
books/LinearAlgebraIllustratedSaveliev.pdf
```

Both files are in `.gitignore`.

- Otto Bretscher, *Linear Algebra with Applications*, 5th ed. (Pearson, 2013, ISBN 978-0-321-79697-4).
- Peter Saveliev, *Linear Algebra Illustrated* — available from the author at https://calculus123.com/.

### 2. Python environment for the NumPy notebooks (uv)

This is a [uv](https://docs.astral.sh/uv/)-managed project. From the repo root:

```bash
uv sync                        # creates .venv and installs deps
uv run jupyter lab             # opens the Python notebooks in your browser
```

Add new dependencies with `uv add <package>` (do not use `pip` directly).

### 3. SageMath for the symbolic notebooks

Each chapter has both a NumPy notebook (`code/python/NN_*.ipynb`) and a SageMath notebook (`code/sage/NN_*.ipynb`). The Sage one uses exact arithmetic and Sage's first-class `Matrix`/`vector` types.

**Two ways to run the Sage notebooks:**

- **Easiest — [CoCalc](https://cocalc.com/) in the browser.** Sign in (free tier works), create a project, *Files → New → From URL*, and paste the raw GitHub URL of the `.ipynb`. CoCalc has SageMath pre-installed.
- **Local install** (large download, ~3 GB):
  - macOS: `brew install --cask sage`
  - Linux: package manager or the [official installer](https://www.sagemath.org/download.html)
  - Then run `sage -n jupyter` to open Jupyter with the SageMath kernel.

You don't need Sage installed locally to edit the `.ipynb` source — any text editor or Jupyter-without-Sage will let you change cells. You just won't be able to run them.

### 4. NotebookLM CLI (only if regenerating notebooks)

The publishing pipeline uses the [`nlm` CLI](https://github.com/jacob-bd/notebooklm-mcp-cli). Install and authenticate it:

```bash
pipx install notebooklm-mcp-cli
nlm login          # opens a browser; sign into your Google account
nlm doctor         # confirms auth and prerequisites
```

## How a chapter gets published to NotebookLM

Two steps once you have the PDFs in place.

**Step 1 — Extract the page ranges from the source PDFs.** Each chapter has an `extracts.yaml` listing which Bretscher/Saveliev page ranges to slice out:

```bash
uv run scripts/extract_pages.py chapters/01-foundations
# writes chapters/01-foundations/extracts/*.pdf
```

The extractor handles per-book offsets (Bretscher front matter pushes book p.1 to PDF p.20; Saveliev has no offset). Outputs are gitignored.

**Step 2 — Create the NotebookLM notebook + artifacts + share publicly.**

```bash
# Markdown sources only
./scripts/nlm-init-chapter.sh chapters/01-foundations

# Markdown + extracted PDF excerpts (no artifacts)
./scripts/nlm-init-chapter.sh chapters/01-foundations --with-extracts

# Full pipeline: extracts + audio + quiz + mind map + slides + infographic + public share
./scripts/nlm-init-chapter.sh chapters/01-foundations --all

# Show what would happen, without doing it
./scripts/nlm-init-chapter.sh chapters/01-foundations --all --dry-run
```

Individual artifact flags (`--audio`, `--quiz`, `--mindmap`, `--slides`, `--infographic`, `--share`) can be combined as you like.

After `--all` finishes, copy the printed notebook URL into:

- the *Chapter map* table in `README.md`
- the corresponding row in `notebooks.md`
- the chapter's own `chapters/NN/README.md`

## Style guide for the markdown

- Tone: undergraduate self-study, intuition first, proofs sketched (not belabored).
- Every chapter has: `notes.md`, `worked-examples.md` (≥5 examples), `exercises.md` (≥10 problems with answers at the bottom), `sources.md` (precise page references), and a Jupyter notebook in `code/`.
- Every concept has at least one worked example and one exercise.
- Cite Bretscher and Saveliev page ranges generously — readers are expected to read alongside.
- Use ASCII or LaTeX-style math (`x²`, `ℝⁿ`, `||v||`, `<u, v>`) — NotebookLM renders these fine.
- Don't redistribute textbook prose or figures. Reference them by page number.

## Submitting changes

1. Fork the repo, make a branch.
2. Make the change. Run `uv run pytest` (when we have tests) and re-render the relevant Jupyter notebook to confirm it still executes.
3. If the change touches a published chapter's `notes.md`, `worked-examples.md`, or `exercises.md`, also re-publish that chapter's NotebookLM with `--all` (or just re-upload the changed source) so the public notebook stays in sync.
4. Open a PR. Small, focused PRs are preferred.

## Code of conduct

Be kind. Assume good faith. Help newcomers.
