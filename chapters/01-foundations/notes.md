# Chapter 1 — Foundations: Sets, Functions, Linearity, ℝⁿ

> *"It is mathematics, and not just (as Bismarck claimed) politics, that consists in 'the art of the possible.'"* — Bretscher, Preface

## 1.0 Why we start here

Most linear algebra books start with matrices and equations. We're going to start one step earlier — with **sets**, **functions**, and the precise meaning of the word **linear**. Three reasons:

1. Every theorem in linear algebra is a statement about a particular kind of function (a "linear transformation"). If the word *function* feels fuzzy, the rest of the course will feel fuzzy too.
2. The leap from ℝ² (the xy-plane you've drawn since high school) to ℝⁿ for n > 3 is not a leap of *visualization* — you can't picture ℝ⁴ — but a leap of **language**. Sets and functions are that language.
3. Linear algebra is the study of one specific property of functions: **linearity**. We need to know exactly what we're looking for before we go hunting.

By the end of this chapter you should be able to look at a function and answer two questions instantly: *what's its domain?* and *is it linear?*

---

## 1.1 Sets — just enough

A **set** is a collection of objects. The objects are called its **elements**. That's the whole definition; it's deliberately loose.

We write `x ∈ S` to mean "x is an element of S" and `x ∉ S` for "x is not an element of S."

**Two ways to specify a set:**

- **By listing**: `S = {1, 2, 3, 4}`. Order and repetition don't matter: `{1, 2, 3, 4} = {4, 1, 2, 3, 1}`.
- **By a condition** (set-builder notation): `S = {n ∈ ℤ : n is even}`. Read it as *"the set of integers n such that n is even."*

**Sets you'll meet constantly:**

| Symbol | Meaning |
|---|---|
| ℕ | Natural numbers: {0, 1, 2, 3, …} (sometimes starting at 1) |
| ℤ | Integers: {…, −2, −1, 0, 1, 2, …} |
| ℚ | Rationals: fractions p/q with p, q ∈ ℤ, q ≠ 0 |
| ℝ | Real numbers: the entire number line |
| ℂ | Complex numbers: a + bi with a, b ∈ ℝ |

**Subset.** `A ⊆ B` means every element of A is also in B. So `{1, 2} ⊆ {1, 2, 3}` and `ℕ ⊆ ℤ ⊆ ℚ ⊆ ℝ ⊆ ℂ`.

```mermaid
flowchart LR
    classDef ring fill:#dbeafe,stroke:#1e40af,color:#1e3a8a,stroke-width:2px
    N["ℕ<br/>natural<br/>0, 1, 2, …"]:::ring
    Z["ℤ<br/>integers<br/>…, −1, 0, 1, …"]:::ring
    Q["ℚ<br/>rationals<br/>p/q"]:::ring
    R["ℝ<br/>reals<br/>the number line"]:::ring
    C["ℂ<br/>complex<br/>a + bi"]:::ring
    N -->|"⊆"| Z -->|"⊆"| Q -->|"⊆"| R -->|"⊆"| C
```

**Cartesian product.** Given sets A and B, the set of all *ordered pairs* `(a, b)` with `a ∈ A` and `b ∈ B` is written `A × B`. The familiar **xy-plane** is `ℝ × ℝ`, written `ℝ²`. The points `(2, 3)` and `(3, 2)` are different — order matters in a Cartesian product, unlike in a set.

> **Saveliev pp. 12–17, 30–34** has many pictures of these ideas: marbles in a bag (a set is unordered), the xy-plane as ℝ × ℝ.

---

## 1.2 Functions — the main character of the course

A **function** `f: A → B` is a rule that assigns to each element of A *exactly one* element of B.

- `A` is the **domain** — the set of valid inputs.
- `B` is the **codomain** — the set the outputs are drawn from.
- The **image** (or **range**) is the actual set of outputs `{f(a) : a ∈ A}`. The image is a subset of the codomain, possibly smaller.

```mermaid
flowchart LR
    classDef domain fill:#dbeafe,stroke:#1e40af,color:#1e3a8a,stroke-width:2px
    classDef func fill:#fef3c7,stroke:#92400e,color:#78350f,stroke-width:2px
    classDef codomain fill:#d1fae5,stroke:#065f46,color:#064e3b,stroke-width:2px
    classDef image fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px

    A["Domain A<br/>(valid inputs)"]:::domain
    F["f<br/>(the rule)"]:::func
    B["Codomain B<br/>(outputs drawn from here)"]:::codomain
    I["Image f(A)<br/>(actually-hit outputs)"]:::image

    A -->|"x"| F -->|"f(x)"| B
    I -.->|"⊆"| B
    F -.->|"hits"| I
```

**Three crucial properties** a function may or may not have:

| Property | Plain English | Test |
|---|---|---|
| **Injective** (one-to-one) | Different inputs give different outputs | `f(a₁) = f(a₂)` ⟹ `a₁ = a₂` |
| **Surjective** (onto) | Every element of the codomain is hit by some input | image = codomain |
| **Bijective** | Both | A perfect pairing of A and B |

A bijective function has an **inverse** `f⁻¹: B → A`. This will matter a lot when we ask: *can a linear transformation be undone?*

**Composition.** If `f: A → B` and `g: B → C`, then `(g ∘ f)(a) = g(f(a))` is a function from A to C. We will see (in Chapter 4) that **matrix multiplication is just composition of linear transformations**. So compositions deserve respect from day one.

> **Saveliev Chapter 2** is the visual reference here. Pictures of one-to-one and onto functions, and the inverse as a "flipped" function.

---

## 1.3 What does "linear" actually mean?

Forget for a moment everything you've heard about matrices. Look at a single-variable function `f: ℝ → ℝ`. We say `f` is **linear** if it satisfies two rules:

1. **Additivity:** `f(x + y) = f(x) + f(y)` for all x, y ∈ ℝ.
2. **Homogeneity:** `f(c · x) = c · f(x)` for all x ∈ ℝ and all scalars c ∈ ℝ.

Equivalently (and this single equation is the most useful form to remember):

> **Definition.** A function `f` is **linear** if `f(c₁ x₁ + c₂ x₂) = c₁ f(x₁) + c₂ f(x₂)` for all inputs and all scalars.

Read it as: *"f respects linear combinations."* Whatever combination you build out of inputs, applying f and combining gives the same answer as combining first and applying f. This is the entire game of linear algebra in one sentence.

**Example.** `f(x) = 3x` is linear: `f(x + y) = 3(x + y) = 3x + 3y = f(x) + f(y)`. ✓

**Counterexample.** `f(x) = 3x + 1` is **not** linear, even though its graph is a straight line! Check: `f(1 + 1) = f(2) = 7`, but `f(1) + f(1) = 4 + 4 = 8`. They differ. (Mathematicians call `3x + 1` an *affine* function — a linear function plus a constant shift.)

**The linearity test as a flowchart:**

```mermaid
flowchart TD
    classDef test fill:#fef3c7,stroke:#92400e,color:#78350f,stroke-width:2px
    classDef yes fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px
    classDef no fill:#ef4444,stroke:#991b1b,color:#fff,stroke-width:2px

    START(["Given a function f"]):::test
    Q1{"Is f(0) = 0 ?"}:::test
    Q2{"Is f(x + y) = f(x) + f(y)<br/>for all x, y ?"}:::test
    Q3{"Is f(c·x) = c·f(x)<br/>for all scalars c ?"}:::test
    LIN["✓ LINEAR"]:::yes
    NOTLIN["✗ NOT linear"]:::no

    START --> Q1
    Q1 -->|no| NOTLIN
    Q1 -->|yes| Q2
    Q2 -->|no| NOTLIN
    Q2 -->|yes| Q3
    Q3 -->|no| NOTLIN
    Q3 -->|yes| LIN
```

> **Trap:** in high school, "linear" meant *"its graph is a line"*, which includes `y = mx + b`. In linear algebra, "linear" is stricter — the graph must pass through the origin. A linear function always sends 0 to 0, because `f(0) = f(0 + 0) = f(0) + f(0)` ⟹ `f(0) = 0`.

**The only linear functions ℝ → ℝ are `f(x) = mx`** for some constant m. (Try to convince yourself why no other shape works.)

> **Saveliev §1.9 and §1.11** have side-by-side pictures: the linear `y = mx` versus the affine `y = mx + b`, and why the distinction matters.

---

## 1.4 The leap from ℝ to ℝⁿ

So far our inputs and outputs were single real numbers. But the real reason linear algebra exists is that real-world quantities come in **bundles**:

- A point in 3D space has 3 coordinates.
- An RGB color has 3 components.
- A grayscale 28×28 image has 784 pixels.
- A monthly stock portfolio has hundreds of holdings.
- A neural network's hidden layer has thousands of activations.

```mermaid
flowchart LR
    classDef seen fill:#dbeafe,stroke:#1e40af,color:#1e3a8a,stroke-width:2px
    classDef edge fill:#a78bfa,stroke:#6d28d9,color:#fff,stroke-width:2px
    classDef abstract fill:#f59e0b,stroke:#b45309,color:#fff,stroke-width:2px

    R1["ℝ¹<br/>line<br/>1 number"]:::seen
    R2["ℝ²<br/>plane<br/>(x, y)"]:::seen
    R3["ℝ³<br/>space<br/>RGB color"]:::seen
    R4["ℝ⁴<br/>spacetime?<br/>can't picture"]:::edge
    R784["ℝ⁷⁸⁴<br/>28×28 image<br/>algebra only"]:::abstract
    Rn["ℝⁿ<br/>n as big as you want"]:::abstract

    R1 --> R2 --> R3 --> R4 --> R784 --> Rn
```

We bundle these into ordered tuples and call the set of all such tuples **ℝⁿ**:

```
ℝⁿ = { (x₁, x₂, …, xₙ) : each xᵢ ∈ ℝ }
```

For n = 1, 2, 3 you can picture ℝⁿ — it's the line, the plane, ordinary space. For n ≥ 4 you cannot. **That's fine.** You don't need to picture it; you reason about it using the same algebra that worked in low dimensions.

This is the central liberation of the course: once you trust the algebra, you can do geometry in dimensions your eyes can't see.

> **Saveliev §4.1–4.5 (pp. 239–281)** spends a whole chapter on exactly this leap. Read it slowly — especially **§4.4 *Where vectors come from*** (pp. 264–273), which makes the philosophical case for ℝⁿ better than I can.

---

## 1.5 Vectors: arrows and tuples (and why both views matter)

A **vector** in ℝⁿ is an element of ℝⁿ — that is, an n-tuple of real numbers. We typically write it as a column:

```
     ⎡ x₁ ⎤
v =  ⎢ x₂ ⎥
     ⎢ ⋮  ⎥
     ⎣ xₙ ⎦
```

```mermaid
flowchart LR
    classDef same fill:#fef3c7,stroke:#92400e,color:#78350f,stroke-width:3px
    classDef tuple fill:#dbeafe,stroke:#1e40af,color:#1e3a8a,stroke-width:2px
    classDef arrow fill:#10b981,stroke:#047857,color:#fff,stroke-width:2px

    V["v<br/><i>one mathematical object</i>"]:::same
    T["[3, 4]<br/>n-tuple<br/>(use this for computing)"]:::tuple
    A["arrow from origin to (3, 4)<br/>(use this for intuition)"]:::arrow

    V --- T
    V --- A
    T <-.->|"same object,<br/>two pictures"| A
```

But this same object has **two equally valid mental pictures**:

| Picture | Where it lives | When it's helpful |
|---|---|---|
| **Tuple of numbers** | A list, an array | Computing, programming, large n |
| **Arrow from origin** | ℝ², ℝ³ | Geometry, intuition, small n |

In Python, vectors are NumPy arrays:

```python
import numpy as np
v = np.array([3.0, 4.0])  # a vector in ℝ²
```

Geometrically the same vector is the arrow from `(0, 0)` to `(3, 4)`.

**The two operations that make ℝⁿ a vector space:**

1. **Addition** (component by component):
   `(x₁, …, xₙ) + (y₁, …, yₙ) = (x₁ + y₁, …, xₙ + yₙ)`.

   Geometrically: place the tail of the second arrow at the tip of the first; the sum is the arrow from origin to the new tip. (The "parallelogram rule.")

2. **Scalar multiplication**:
   `c · (x₁, …, xₙ) = (c·x₁, …, c·xₙ)`.

   Geometrically: scale the arrow's length by c (and flip if c is negative).

That's it. From these two operations everything else in the course will follow.

> **Read this side-by-side.** Saveliev §4.5–4.6 (pp. 274–289) gives the visual story; Bretscher Appendix A (pp. 457–466) gives the compact algebraic story. The two views reinforce each other.

---

## 1.6 The big picture: where we're heading

Linear algebra studies functions `T : ℝⁿ → ℝᵐ` that are **linear**:

> `T(c₁ v₁ + c₂ v₂) = c₁ T(v₁) + c₂ T(v₂)`.

The miracle — and the reason the subject is so beautiful — is that **every such function can be represented by a single rectangular block of numbers (a matrix)**. So the entire study of linear functions in any dimension reduces to the study of matrices, which we can compute with by hand or by computer.

The next nine chapters unpack this miracle:

```mermaid
flowchart TD
    classDef now fill:#3b82f6,stroke:#1e40af,color:#fff,stroke-width:3px
    classDef foundation fill:#a78bfa,stroke:#6d28d9,color:#fff,stroke-width:2px
    classDef advanced fill:#f59e0b,stroke:#b45309,color:#fff,stroke-width:2px
    classDef capstone fill:#ec4899,stroke:#9d174d,color:#fff,stroke-width:2px

    C1["Ch 1 — Foundations<br/>functions · linearity · ℝⁿ<br/><i>you are here</i>"]:::now
    C2["Ch 2 — Vector geometry<br/>dot product · projection · angle"]:::foundation
    C3["Ch 3 — Linear systems<br/>Gauss-Jordan · Ax = b"]:::foundation
    C4["Ch 4 — Linear transformations<br/>matrices as maps"]:::foundation
    C5["Ch 5 — Subspaces<br/>image · kernel · basis · dimension"]:::foundation
    C6["Ch 6 — Abstract vector spaces<br/>polynomials, functions as 'vectors'"]:::advanced
    C7["Ch 7 — Orthogonality &amp; least squares<br/>Gram-Schmidt · QR · data fitting"]:::advanced
    C8["Ch 8 — Determinants<br/>volume · invertibility"]:::advanced
    C9["Ch 9 — Eigenvalues &amp; diagonalization<br/>directions of pure stretch"]:::advanced
    C10["Ch 10 — SVD &amp; applications<br/>image compression · PCA · everything"]:::capstone

    C1 --> C2
    C1 --> C3
    C2 --> C4
    C3 --> C4
    C4 --> C5
    C5 --> C6
    C5 --> C7
    C5 --> C8
    C8 --> C9
    C7 --> C10
    C9 --> C10
```

You're standing at the trailhead. Let's go.

---

## Summary checklist

After this chapter you should be able to, without hesitation:

- [ ] Distinguish a set's domain, codomain, and image when given a function.
- [ ] State whether a function is injective, surjective, or bijective.
- [ ] Write down the test for linearity in one equation.
- [ ] Explain why `f(x) = 3x + 1` is **not** linear.
- [ ] Add two vectors in ℝⁿ and scale a vector by a real number, both algebraically and (for n ≤ 3) geometrically.
- [ ] Argue that `f(0) = 0` for any linear function.

If any of these are shaky, re-read the corresponding section before moving on. Then work through `worked-examples.md` and `exercises.md`.
