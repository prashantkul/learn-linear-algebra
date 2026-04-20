# Learn Linear Algebra

A self-study curriculum in 10 chapters, anchored on two textbooks and designed to be ingested chapter-by-chapter into [NotebookLM](https://notebooklm.google.com/).

## Source texts

This curriculum is anchored on two textbooks. **You need to obtain your own copies** — they are not included in this repo (they're copyrighted).

- **Otto Bretscher — *Linear Algebra with Applications*, 5th ed.** (Pearson, 2013, ISBN 978-0-321-79697-4) — the computational and applications-focused spine. Drives chapter ordering from Chapter 3 onward.
- **Peter Saveliev — *Linear Algebra Illustrated*** — the visual, foundations-up companion. Provides geometric intuition and diagrams. Available from the author at https://calculus123.com/.

Place your PDFs at:

```
books/Bretscher.pdf
books/LinearAlgebraIllustratedSaveliev.pdf
```

The `books/` folder is gitignored, as are the per-chapter `extracts/` folders the page-extractor produces. The page references in each chapter's `sources.md` (and the page ranges in `extracts.yaml`) refer to *book page numbers* (the numbers printed on the page), not PDF page numbers; the extractor handles the offset.

## How to use this with NotebookLM

This repo plays well with the [`nlm` CLI](https://github.com/jacob-bd/notebooklm-mcp-cli). Once you're authenticated (`nlm doctor` to check), each chapter becomes its own NotebookLM notebook in two steps.

**Step 1 — Extract the relevant pages from the source PDFs.** Each chapter has an `extracts.yaml` listing which Bretscher/Saveliev page ranges to slice out:

```bash
uv run scripts/extract_pages.py chapters/01-foundations
# writes chapters/01-foundations/extracts/*.pdf
```

The extractor handles per-book page-number offsets (Bretscher's front matter pushes book p.1 to PDF p.20; Saveliev has no offset).

**Step 2 — Create the NotebookLM notebook and (optionally) generate artifacts.**

```bash
# Markdown sources only
./scripts/nlm-init-chapter.sh chapters/01-foundations

# Markdown + extracted PDF excerpts
./scripts/nlm-init-chapter.sh chapters/01-foundations --with-extracts

# Full pipeline: extracts + audio overview (podcast) + quiz + mind map + slides
./scripts/nlm-init-chapter.sh chapters/01-foundations --all

# Show commands without executing
./scripts/nlm-init-chapter.sh chapters/01-foundations --all --dry-run
```

Individual artifact flags (`--audio`, `--quiz`, `--mindmap`, `--slides`) can be combined as you like.

The script creates a notebook named *"LA Ch.NN — chapter-slug"* and uploads `notes.md`, `worked-examples.md`, `exercises.md`, and `sources.md`. With `--with-extracts`, it also uploads the per-chapter extracted PDFs.

Once the notebook exists, you can also use the `nlm` CLI directly:

- chat with sources: `nlm query <notebook-id> "explain the linearity test"`
- create flashcards: `nlm flashcards create <notebook-id>`
- download audio: `nlm download audio <notebook-id>`

Or open it in the [NotebookLM web UI](https://notebooklm.google.com/) for the full interactive experience.

The Python notebooks in each chapter's `code/` folder are for hands-on numerical experimentation — run them locally rather than uploading them to NotebookLM.

## Chapter map

| # | Chapter | Bretscher | Saveliev |
|---|---|---|---|
| 1 | Foundations: sets, functions, linearity, R^n | App. A | Ch. 1, 2, 4.1–4.5 |
| 2 | Vectors & vector geometry (dot product, projections) | App. A | 4.6–4.11 |
| 3 | Linear systems & Gauss–Jordan elimination | Ch. 1 | §1.1 |
| 4 | Linear transformations & matrix algebra | Ch. 2 | §3.4, 5.1–5.4, 5.10–5.11 |
| 5 | Subspaces, image/kernel, basis, dimension, coordinates | Ch. 3 | §5.8 |
| 6 | Abstract linear (vector) spaces | Ch. 4 | — |
| 7 | Orthogonality, projections, Gram–Schmidt, QR, least squares | Ch. 5 | §4.10–4.11 |
| 8 | Determinants — algebra and geometry | Ch. 6 | §5.5 |
| 9 | Eigenvalues, eigenvectors, diagonalization, dynamical systems | Ch. 7 | §5.6–5.7, 5.9 |
| 10 | Symmetric matrices, quadratic forms, SVD, applications | Ch. 8, 9 | (Ch. 6 as bonus) |

## Per-chapter folder layout

```
chapters/NN-topic/
  README.md           # objectives, prereqs, time estimate
  notes.md            # main tutorial — the "textbook" source for NotebookLM
  worked-examples.md  # solved problems, step by step
  exercises.md        # practice problems with answers
  sources.md          # Bretscher §X.Y pp. A–B, Saveliev §X.Y pp. C–D, external links
  code/               # Jupyter notebooks (NumPy + matplotlib + sympy)
  visuals/            # citations of diagrams (page references), or original figures
```

## Python setup

This is a `uv`-managed project. From the repo root:

```bash
uv sync                        # creates .venv and installs deps from pyproject.toml/uv.lock
uv run jupyter lab             # opens the notebooks in your browser
```

To add a new dependency: `uv add <package>`.

## Repo layout

```
learn-linear-algebra/
  README.md                       # this file
  pyproject.toml                  # uv project + Python deps
  uv.lock                         # locked dependency versions
  books/                          # source PDFs (Bretscher, Saveliev)
  chapters/NN-topic/
    README.md                     # chapter objectives
    notes.md                      # main tutorial
    worked-examples.md            # solved problems
    exercises.md                  # practice + answers
    sources.md                    # page references and external links
    extracts.yaml                 # which pages to slice from source PDFs
    extracts/*.pdf                # generated by scripts/extract_pages.py
    code/                         # Jupyter notebooks
    visuals/                      # diagram references
  scripts/
    extract_pages.py              # PDF extractor (uv run)
    nlm-init-chapter.sh           # create NotebookLM notebook for a chapter
```

## Audience and depth

Self-study, undergraduate level. Intuition first, proofs sketched (not belabored). Geometric pictures wherever possible. Every concept has at least one worked example and one exercise.

## License

Tutorial material (notes, worked examples, exercises, code, scripts) is licensed under the MIT License — see [LICENSE](LICENSE).

The two source textbooks (Bretscher, Saveliev) are copyrighted and **not** included in this repo. Users must obtain their own copies. See the *Source texts* section above.

## Contributing

Contributions are welcome — improvements to explanations, more worked examples, better exercises, additional code, or translations. Open an issue or PR.
