# Chapter 1 — Exercises

Try each problem before peeking at the answers at the bottom.

---

## Set 1 — Sets and functions

**1.1** Write the following sets in set-builder notation:
(a) The positive even integers.
(b) The set of points on the unit circle in ℝ².

**1.2** Let `f : ℤ → ℤ` be defined by `f(n) = 2n`.
(a) What is the image of f?
(b) Is f injective? Surjective?

**1.3** Let `g : ℝ → ℝ` be `g(x) = x³`.
(a) Is g injective?
(b) Is g surjective?
(c) What is `g⁻¹`?

---

## Set 2 — Linearity

**1.4** For each function below, decide whether it is linear. Justify each answer with one sentence.
(a) `f(x) = −7x`
(b) `f(x) = sin(x)`
(c) `f(x, y) = 2x − 5y`
(d) `f(x, y) = x + 1`
(e) `f(x, y, z) = x + y + z`
(f) `f(x, y) = (x + y, x − y)`  (note: this is `ℝ² → ℝ²`)

**1.5** Suppose `f : ℝ → ℝ` is linear and you know `f(3) = 12`. What is `f(7)`? What is `f(0)`?

**1.6** Show that if `f : ℝⁿ → ℝᵐ` is linear, then for any vectors `v₁, …, vₖ` and scalars `c₁, …, cₖ`,
`f(c₁v₁ + … + cₖvₖ) = c₁f(v₁) + … + cₖf(vₖ)`.
(Hint: induction on k. The base case k = 2 is the definition of linearity.)

---

## Set 3 — ℝⁿ and vector arithmetic

**1.7** Let `u = (1, −2, 3)` and `v = (4, 0, −1)` in ℝ³. Compute:
(a) `u + v`
(b) `3u`
(c) `2u − 5v`

**1.8** Find a vector `w` in ℝ² such that `(2, 5) + w = (0, 0)`. (This `w` is called the **negative** of `(2, 5)`.)

**1.9** Suppose `T : ℝ² → ℝ²` is linear, `T(1, 0) = (3, 1)`, and `T(0, 1) = (−2, 4)`. Compute:
(a) `T(2, 5)`
(b) `T(−1, 3)`

**1.10** Explain in one paragraph (no more) why we can't draw ℝ⁴ but can still reason about it. What does the algebra give us that the geometry can't?

---

## Answers

**1.1** (a) `{n ∈ ℤ : n > 0 and n is divisible by 2}` or equivalently `{2k : k ∈ ℕ, k ≥ 1}`. (b) `{(x, y) ∈ ℝ² : x² + y² = 1}`.

**1.2** (a) Image = even integers = `{2n : n ∈ ℤ}`. (b) Injective: yes (`2n₁ = 2n₂ ⟹ n₁ = n₂`). Surjective: no (odd integers are in the codomain ℤ but never hit).

**1.3** (a) Yes — distinct reals have distinct cubes. (b) Yes — every real is the cube of some real. (c) `g⁻¹(y) = ∛y`.

**1.4** (a) Linear. (b) Not linear: `sin(0) = 0` is fine, but `sin(π/2 + π/2) = sin(π) = 0`, while `sin(π/2) + sin(π/2) = 2`. Additivity fails. (c) Linear. (d) Not linear: `f(0,0) = 1 ≠ 0`. (e) Linear. (f) Linear: each output component is a linear combination of the inputs.

**1.5** From `f(3) = 12` and the fact that `f(x) = mx` for some `m`, we get `m = 4`. So `f(7) = 28` and `f(0) = 0`.

**1.6** Base case k = 2 is the definition. Inductive step: assume the result for k. Then `f(c₁v₁ + … + cₖ₊₁vₖ₊₁) = f((c₁v₁ + … + cₖvₖ) + cₖ₊₁vₖ₊₁)`, which by the k = 2 case equals `f(c₁v₁ + … + cₖvₖ) + f(cₖ₊₁vₖ₊₁)`, which by the inductive hypothesis and homogeneity equals `c₁f(v₁) + … + cₖ₊₁f(vₖ₊₁)`. ∎

**1.7** (a) `(5, −2, 2)` (b) `(3, −6, 9)` (c) `2u − 5v = (2, −4, 6) − (20, 0, −5) = (−18, −4, 11)`.

**1.8** `w = (−2, −5)`.

**1.9** Use `(2, 5) = 2·(1,0) + 5·(0,1)` and linearity:
(a) `T(2, 5) = 2·(3, 1) + 5·(−2, 4) = (6 − 10, 2 + 20) = (−4, 22)`.
(b) `T(−1, 3) = −1·(3, 1) + 3·(−2, 4) = (−3 − 6, −1 + 12) = (−9, 11)`.

**1.10** *Sample answer.* The xy-plane is just the set of pairs of real numbers — a picture is one *representation* of that set, not the set itself. ℝ⁴ is the set of 4-tuples of reals, defined the same way. The algebraic operations (addition, scaling, dot product, …) work identically in any dimension, and theorems proved in ℝⁿ hold for all n. The geometry is a crutch we use when n ≤ 3; the algebra is the actual content.
