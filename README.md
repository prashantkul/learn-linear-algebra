# Learn Linear Algebra

> **A new way to learn linear algebra** — built around how humans actually learn in 2026: read, listen, watch, drill, code, and *talk back to* the material.

A self-study curriculum in 10 chapters, anchored on two textbooks. Each chapter ships with notes, worked examples, exercises, **two Jupyter notebooks** (NumPy for numerics, SageMath for exact symbolics — runnable free in [CoCalc](https://cocalc.com/)), and a **pre-built [NotebookLM](https://notebooklm.google.com/) notebook** with audio overview (podcast), quiz, mind map, slide deck, and infographic.

## 👋 A note from me

Hi — I'm **Prashant Kulkarni**. I started this because I'm convinced we've been studying math the wrong way for a long time, and 2026 is finally the year that changes.

Here is how I think learning should feel:

- **Interactive, not passive.** You should be able to *click, run, change a number, and watch what happens* — not just stare at a static page and hope it sticks. Every chapter here ships with two runnable Jupyter notebooks (NumPy + SageMath) precisely so you can poke the math.
- **Conversational.** When you don't get something, you should be able to *ask* — out loud, in plain English. Modern AI tutors (NotebookLM, Claude, ChatGPT) are absurdly good at *"explain this to me again, but as if I were a chemist"* or *"give me one more example with smaller numbers."* That's a superpower previous generations of students never had. Use it shamelessly.
- **Fun.** A good audio overview on a walk. A quiz on the train. A slide deck before bed. A Sage notebook with the cat in your lap. If the learning isn't fun, you won't come back tomorrow — and the math does not care if you are tired.
- **Collaborative.** Studying alone is the slow path. Studying *with others* — friends, teachers, AI co-pilots, the open-source community — is faster, deeper, and actually enjoyable. This repo is meant to be remixed, forked, criticized, improved. Pair up with a friend and race through the exercises. Spin up a study group on Discord. Open a PR when you spot a typo. Open an issue when an explanation falls flat. The whole thing gets better the more eyes are on it.

That is the bet behind this curriculum: take a rigorous classical text (Bretscher) and a beautifully visual one (Saveliev), wrap them in modern interactive tools (NotebookLM, Jupyter, SageMath, Mermaid), and learn linear algebra the way 2026 actually lets you learn — together.

— *Prashant* · [kulkarniprashants@gmail.com](mailto:kulkarniprashants@gmail.com) · [@prashantkul on GitHub](https://github.com/prashantkul)

---

## 🎧 Start here

You don't need to clone anything. **[Open the NotebookLM index →](notebooks.md)**

Each public NotebookLM gives you the chapter's notes + textbook page extracts + AI-generated audio overview, quiz, mind map, slides, and infographic — and you can chat with the sources. Click *"Make a copy"* in NotebookLM to clone it to your own account and customize.

---

## Why linear algebra, in the age of language models?

Because language models *are* linear algebra at scale.

```mermaid
flowchart LR
    classDef math fill:#3b82f6,stroke:#1e40af,color:#fff,stroke-width:2px
    classDef bridge fill:#8b5cf6,stroke:#5b21b6,color:#fff,stroke-width:2px
    classDef ai fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px
    classDef app fill:#f59e0b,stroke:#b45309,color:#fff,stroke-width:2px

    LA["Linear Algebra<br/>vectors · matrices · subspaces<br/>eigenvalues · SVD"]:::math
    EMB["Embeddings<br/>(words, images, users<br/>as vectors in ℝⁿ)"]:::bridge
    ATT["Attention<br/>(softmax of QKᵀ/√d · V<br/>= matrix multiplication)"]:::bridge
    GRAD["Gradient descent<br/>(walking on a high-dim<br/>loss surface)"]:::bridge
    LLM["Language Models<br/>GPT · Claude · Gemini"]:::ai
    DIFF["Diffusion Models<br/>(image · video · audio)"]:::ai
    REC["Recommenders<br/>(matrix factorization)"]:::ai
    SCI["Scientific Computing<br/>(physics · biology · climate)"]:::ai
    APP["Everything you<br/>actually use today"]:::app

    LA --> EMB
    LA --> ATT
    LA --> GRAD
    EMB --> LLM
    ATT --> LLM
    GRAD --> LLM
    GRAD --> DIFF
    EMB --> REC
    LA --> SCI
    LLM --> APP
    DIFF --> APP
    REC --> APP
    SCI --> APP
```

The frontier moves fast. The math underneath does not. **Embeddings, attention, fine-tuning, RAG, retrieval — every LLM technique you read about lives or dies on linear-algebra fluency.** Without it, you're a black-box prompt user. With it, you understand *why* models work, *when* they fail, *how* to extend them — and you can read papers without bouncing off the notation.

A few specific reasons it matters more, not less, in the LLM era:

- **You ask better questions.** "Why does retrieval over cosine similarity miss this query?" requires you to know what cosine similarity *is* — a normalized dot product on embeddings.
- **You debug better.** "Why did fine-tuning blow up the loss?" requires you to think in terms of gradients, conditioning, rank.
- **You compose better.** Combining LLMs with classical ML, search, and reasoning systems means moving fluently between linear maps, projections, and decompositions.
- **You stay free.** Tools change every year. The math is the same math Gauss did. Investing here compounds for a lifetime.

> *"Mathematics is not yet ready for such problems. Yet, the mathematics is the same mathematics that you can study today."* — paraphrasing John von Neumann, who knew a thing or two about both math and machines.

---

## How you'll learn here

This isn't a textbook PDF. It's a **multimodal learning loop**, where each chapter gives you several different ways into the same ideas — and you cycle through whichever ones stick best for *your* brain.

```mermaid
flowchart TB
    classDef read fill:#3b82f6,stroke:#1e40af,color:#fff,stroke-width:2px
    classDef listen fill:#ec4899,stroke:#9d174d,color:#fff,stroke-width:2px
    classDef watch fill:#8b5cf6,stroke:#5b21b6,color:#fff,stroke-width:2px
    classDef do fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px
    classDef ask fill:#f59e0b,stroke:#b45309,color:#fff,stroke-width:2px
    classDef test fill:#ef4444,stroke:#991b1b,color:#fff,stroke-width:2px

    NOTES["📖 Read<br/>notes.md +<br/>Bretscher / Saveliev<br/>page extracts"]:::read
    PODCAST["🎧 Listen<br/>NotebookLM<br/>audio overview<br/>(deep-dive podcast)"]:::listen
    SLIDES["📊 Watch<br/>NotebookLM<br/>slide deck +<br/>mind map + infographic"]:::watch
    QUIZ["🎯 Test<br/>NotebookLM<br/>quiz +<br/>chapter exercises"]:::test
    PYTHON["🐍 Code (numerical)<br/>Python notebook<br/>NumPy · matplotlib"]:::do
    SAGE["🧮 Code (symbolic)<br/>SageMath notebook<br/>exact arithmetic"]:::do
    CHAT["💬 Ask<br/>NotebookLM chat<br/>'explain X'<br/>'what if Y?'"]:::ask

    NOTES --> PODCAST
    PODCAST --> SLIDES
    SLIDES --> QUIZ
    QUIZ --> PYTHON
    PYTHON --> SAGE
    SAGE --> CHAT
    CHAT --> NOTES
```

No single mode is "the right one." You don't have to do all of them. The point is that when one explanation doesn't click, **you have five other angles to try** — and one of them will land. That's how mastery actually happens, and it's only really possible now that AI tools can generate audio, slides, quizzes, and conversations on demand.

### Two perspectives, two languages, one curriculum

```mermaid
flowchart LR
    classDef book fill:#3b82f6,stroke:#1e40af,color:#fff,stroke-width:2px
    classDef lang fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px
    classDef out fill:#f59e0b,stroke:#b45309,color:#fff,stroke-width:2px

    BR["Bretscher<br/><i>Linear Algebra<br/>with Applications</i><br/>computational · applied"]:::book
    SV["Saveliev<br/><i>Linear Algebra<br/>Illustrated</i><br/>visual · geometric"]:::book
    PY["Python + NumPy<br/>numerical · ML-ready"]:::lang
    SG["SageMath<br/>symbolic · exact"]:::lang
    YOU["A solid mental model<br/>of linear algebra<br/>that you actually own"]:::out

    BR --> YOU
    SV --> YOU
    PY --> YOU
    SG --> YOU
```

- **Bretscher** drives the chapter ordering and gives you computational power and applications.
- **Saveliev** gives you the geometric pictures that make the algebra *make sense*.
- **Python/NumPy** is the language of every ML library on Earth — what you'll use at work.
- **SageMath** is the language of pure math — exact, symbolic, perfect for *proving* what numerics only suggest.

Together they give you the same idea from four directions. That redundancy is the feature, not a bug.

---

## Chapter map

| # | Chapter | Sources (Bretscher · Saveliev) | NotebookLM 🎧 | 🐍 Python | 🧮 SageMath |
|---|---|---|---|---|---|
| 1 | [Foundations: sets, functions, linearity, ℝⁿ](chapters/01-foundations/notes.md)<br/><sub>*Sets, maps, linearity, vectors in ℝⁿ — the vocabulary for everything ahead.*</sub> | App. A · Ch. 1, 2, 4.1–4.5 | [open ↗](https://notebooklm.google.com/notebook/d52edb24-e2e2-43b6-840d-a2c5d7a47519) | [view](chapters/01-foundations/code/python/01_foundations.ipynb) | [view](chapters/01-foundations/code/sage/01_foundations.ipynb) |
| 2 | [Vectors & vector geometry (dot product, projections)](chapters/02-vectors-and-geometry/notes.md)<br/><sub>*Dot product, norms, angles, projections — the geometry that makes the algebra make sense.*</sub> | App. A · 4.6–4.11 | [open ↗](https://notebooklm.google.com/notebook/457ac832-f039-4da2-b724-e98b43b40983) | [view](chapters/02-vectors-and-geometry/code/python/02_vectors_and_geometry.ipynb) | [view](chapters/02-vectors-and-geometry/code/sage/02_vectors_and_geometry.ipynb) |
| 3 | [Linear systems & Gauss–Jordan elimination](chapters/03-linear-systems/notes.md)<br/><sub>*RREF to solve any Ax = b; **LU factorization** as the algorithmic form of elimination.*</sub> | Ch. 1 · §1.1 | [open ↗](https://notebooklm.google.com/notebook/903ab7ba-0ab1-45d2-8870-af522afaad77) | [view](chapters/03-linear-systems/code/python/03_linear_systems.ipynb) | [view](chapters/03-linear-systems/code/sage/03_linear_systems.ipynb) |
| 4 | [Linear transformations & matrix algebra](chapters/04-linear-transformations/notes.md)<br/><sub>*Linear map ⇔ matrix; composition = matrix multiplication; inverses and invertibility.*</sub> | Ch. 2 · §3.4, 5.1–5.4, 5.10–5.11 | [open ↗](https://notebooklm.google.com/notebook/140962a0-9c09-49af-9830-b8ad42c96c3c) | [view](chapters/04-linear-transformations/code/python/04_linear_transformations.ipynb) | [view](chapters/04-linear-transformations/code/sage/04_linear_transformations.ipynb) |
| 5 | [Subspaces, image/kernel, basis, dimension, coordinates](chapters/05-subspaces-basis-dimension/notes.md)<br/><sub>*The four fundamental subspaces, rank–nullity, and how to change coordinates.*</sub> | Ch. 3 · §5.8 | [open ↗](https://notebooklm.google.com/notebook/c542121c-e617-4e61-9735-69fd5e2d3983) | [view](chapters/05-subspaces-basis-dimension/code/python/05_subspaces.ipynb) | [view](chapters/05-subspaces-basis-dimension/code/sage/05_subspaces.ipynb) |
| 6 | [Abstract linear (vector) spaces](chapters/06-abstract-vector-spaces/notes.md)<br/><sub>*Polynomials, functions, matrices are all vectors — same axioms, same theorems.*</sub> | Ch. 4 · — | _soon_ | _soon_ | _soon_ |
| 7 | [Orthogonality, projections, Gram–Schmidt, QR, least squares](chapters/07-orthogonality-and-least-squares/notes.md)<br/><sub>*Orthonormal bases via Gram–Schmidt, **QR factorization** (A = QR), and least squares for overdetermined systems.*</sub> | Ch. 5 · §4.10–4.11 | _soon_ | _soon_ | _soon_ |
| 8 | [Determinants — algebra and geometry](chapters/08-determinants/notes.md)<br/><sub>*Determinant as signed volume, multiplicativity, Cramer's rule — the tool that sets up eigenvalues.*</sub> | Ch. 6 · §5.5 | _soon_ | _soon_ | _soon_ |
| 9 | [Eigenvalues, eigenvectors, diagonalization, dynamical systems](chapters/09-eigenvalues-and-diagonalization/notes.md)<br/><sub>*Diagonalization **A = PDP⁻¹**, spectral analysis of discrete dynamics, Jordan form when P fails.*</sub> | Ch. 7 · §5.6–5.7, 5.9 | _soon_ | _soon_ | _soon_ |
| 10 | [Symmetric matrices, quadratic forms, SVD, applications](chapters/10-svd-and-applications/notes.md)<br/><sub>*Spectral theorem **A = PDPᵀ**, **Cholesky** (LLᵀ), **SVD** (full/thin/truncated), polar decomposition — powers PCA, compression, and LLMs.*</sub> | Ch. 8, 9 · (Ch. 6 as bonus) | _soon_ | _soon_ | _soon_ |

**Running the notebooks**

- 🐍 **Python** — `uv sync && uv run jupyter lab` from the repo root, then open the file. (See [CONTRIBUTING.md](CONTRIBUTING.md) for setup.)
- 🧮 **SageMath** — easiest path: open [CoCalc](https://cocalc.com/), create a project, *Files → New → From URL*, paste the raw GitHub URL of the `.ipynb`. CoCalc has SageMath pre-installed and runs free in the browser. Or install Sage locally (`brew install --cask sage` on macOS) and run `sage -n jupyter`.

Every chapter's text also lives in this repo under [`chapters/`](chapters/) — read it directly on GitHub.

## Audience and depth

Self-study, undergraduate level. Intuition first, proofs sketched (not belabored). Geometric pictures wherever possible. Every concept has at least one worked example and one exercise. No prerequisites beyond high-school algebra and a willingness to be confused for a few hours before things click.

## Source texts

This curriculum is anchored on (and respects the copyrights of) two excellent textbooks. The page extracts in the NotebookLM notebooks fall under fair-use educational commentary; the books themselves are not redistributed.

- **Otto Bretscher — *Linear Algebra with Applications*, 5th ed.** (Pearson, 2013, ISBN 978-0-321-79697-4) — the computational and applications-focused spine.
- **Peter Saveliev — *Linear Algebra Illustrated*** — the visual, foundations-up companion. Available from the author at https://calculus123.com/.

If you want a deeper read, get your own copies of these books — they're worth it.

## License

Tutorial material (notes, worked examples, exercises, code, scripts) is licensed under the MIT License — see [LICENSE](LICENSE).

## Contributing

Want to improve an explanation, add a worked example, fix an exercise, or contribute a translation? See [CONTRIBUTING.md](CONTRIBUTING.md) for the dev setup (uv, PDF extraction, NotebookLM publishing pipeline) and how to send a PR.
