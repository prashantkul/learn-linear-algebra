#!/usr/bin/env -S uv run python
"""Extract page ranges from source PDFs into per-chapter excerpt PDFs.

Reads `chapters/NN-topic/extracts.yaml` and writes
`chapters/NN-topic/extracts/<slug>.pdf` for each entry.

Usage:
    uv run scripts/extract_pages.py chapters/01-foundations
    uv run scripts/extract_pages.py chapters/01-foundations --force

The manifest format (extracts.yaml):

    extracts:
      - book: bretscher
        pages: "457-466"
        title: "Bretscher App. A — Vectors"
      - book: saveliev
        pages: "7-87"
        title: "Saveliev Ch 1 — Sets and functions"

`pages` accepts a single range like "457-466" or a comma-separated list of
ranges/singles like "1,5-10,42".
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

import yaml
from pypdf import PdfReader, PdfWriter

REPO_ROOT = Path(__file__).resolve().parent.parent

# Page-offset between book page numbers (as cited in `sources.md`) and PDF page
# numbers (1-based). offset = pdf_page - book_page.
BOOKS = {
    "bretscher": {
        "path": REPO_ROOT / "books" / "Bretscher.pdf",
        "offset": 19,
    },
    "saveliev": {
        "path": REPO_ROOT / "books" / "LinearAlgebraIllustratedSaveliev.pdf",
        "offset": 0,
    },
}


def parse_pages(spec: str) -> list[int]:
    """Parse "1,5-10,42" into [1, 5, 6, 7, 8, 9, 10, 42]."""
    pages: list[int] = []
    for part in str(spec).split(","):
        part = part.strip()
        if "-" in part:
            lo, hi = part.split("-", 1)
            pages.extend(range(int(lo), int(hi) + 1))
        else:
            pages.append(int(part))
    return pages


def slugify(s: str) -> str:
    s = s.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    return s.strip("-")


def extract(chapter_dir: Path, force: bool = False) -> None:
    chapter_dir = chapter_dir.resolve()
    manifest_path = chapter_dir / "extracts.yaml"
    if not manifest_path.exists():
        print(f"no extracts.yaml in {chapter_dir} — skipping")
        return

    manifest = yaml.safe_load(manifest_path.read_text()) or {}
    entries = manifest.get("extracts", [])
    if not entries:
        print(f"{manifest_path}: no `extracts` entries")
        return

    out_dir = chapter_dir / "extracts"
    out_dir.mkdir(exist_ok=True)

    # Cache PdfReader per book (parsing is expensive)
    readers: dict[str, PdfReader] = {}

    for entry in entries:
        book = entry["book"]
        if book not in BOOKS:
            raise ValueError(f"unknown book: {book!r}. Known: {list(BOOKS)}")
        if book not in readers:
            readers[book] = PdfReader(str(BOOKS[book]["path"]))

        reader = readers[book]
        offset = BOOKS[book]["offset"]
        n_pages = len(reader.pages)

        title = entry["title"]
        slug = slugify(title)
        out_path = out_dir / f"{slug}.pdf"

        if out_path.exists() and not force:
            print(f"skip (exists): {out_path.relative_to(REPO_ROOT)}")
            continue

        writer = PdfWriter()
        book_pages = parse_pages(entry["pages"])
        for bp in book_pages:
            pdf_page_idx = bp + offset - 1  # 0-based index
            if pdf_page_idx < 0 or pdf_page_idx >= n_pages:
                raise IndexError(
                    f"{title}: book p.{bp} → PDF page {pdf_page_idx + 1} "
                    f"out of range [1, {n_pages}]"
                )
            writer.add_page(reader.pages[pdf_page_idx])

        with out_path.open("wb") as f:
            writer.write(f)
        print(
            f"wrote {out_path.relative_to(REPO_ROOT)} "
            f"({len(book_pages)} pages from {book})"
        )


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    p.add_argument(
        "chapter_dirs",
        nargs="+",
        type=Path,
        help="One or more chapter directories (e.g. chapters/01-foundations)",
    )
    p.add_argument(
        "--force",
        action="store_true",
        help="Overwrite existing extract PDFs",
    )
    args = p.parse_args()

    for d in args.chapter_dirs:
        extract(d, force=args.force)
    return 0


if __name__ == "__main__":
    sys.exit(main())
