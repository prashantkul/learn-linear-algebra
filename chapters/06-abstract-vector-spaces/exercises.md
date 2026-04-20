# Chapter 6 — Exercises

Ten problems, each with a brief answer at the bottom of its section. Try them on paper before peeking. Cover: axioms, subspace tests in `Pₙ` / `M_{n×n}` / function spaces, coordinates, matrix of a linear transformation, isomorphisms, change of basis.

---

## Exercise 1 — Subspace or not?

For each of the following subsets, decide whether it's a subspace of the indicated vector space. If yes, give a basis and dimension. If no, give a specific axiom that fails (with concrete counterexample).

(a) `W = {(x, y, z) ∈ ℝ³ : x + 2y − z = 0}`.

(b) `W = {(x, y, z) ∈ ℝ³ : x² + y² = z²}`.

(c) `W = {p ∈ P₃ : p(0) = p(1)}`.

(d) `W = {A ∈ M_{2×2} : det A = 0}`.

(e) `W = {f ∈ C(ℝ) : f(0) = 0  and  f(1) = 0}`.

> **Answer.**
>
> (a) Subspace (linear constraint, contains 0). Parametrize: `z = x + 2y`, so a basis is `(1, 0, 1), (0, 1, 2)`. **`dim = 2`.**
>
> (b) **Not** a subspace. The set is a cone: scalars stay in it, but addition doesn't. Take `u = (1, 0, 1)` and `v = (0, 1, 1)`, both in `W` (`1 + 0 = 1²`, `0 + 1 = 1²`). Sum `u + v = (1, 1, 2)` satisfies `1 + 1 = 2 ≠ 4 = 2²`. **Closure under `+` fails.**
>
> (c) Subspace. `eval₀ − eval₁: P₃ → ℝ` is linear; `W` is its kernel. Parametrize: `p = a + bx + cx² + dx³`, `p(0) = a`, `p(1) = a + b + c + d`. Constraint: `b + c + d = 0`. Free vars `a, c, d` (and `b = −c − d`). Basis: `1`, `−x + x²`, `−x + x³`. **`dim = 3`.**
>
> (d) **Not** a subspace. `[[1, 0], [0, 0]]` and `[[0, 0], [0, 1]]` are both singular, but their sum `I = [[1, 0], [0, 1]]` is invertible. **Closure under `+` fails.**
>
> (e) Subspace. Two linear constraints (`eval₀` and `eval₁`), each with a 1D image, so `W = ker(eval₀) ∩ ker(eval₁)` is a subspace of `C(ℝ)`. Infinite-dimensional (e.g. `x(x−1)`, `x(x−1)(x−1/2)`, ... give independent elements).

---

## Exercise 2 — Linear independence in `P₃`

Are `p₁ = 1 + 2x`, `p₂ = x + 2x²`, `p₃ = 2 + x − x²` linearly independent in `P₃`? If not, give a dependency.

> **Answer.** Coordinates in `(1, x, x², x³)`: `(1, 2, 0, 0)`, `(0, 1, 2, 0)`, `(2, 1, −1, 0)`. Stack as `4 × 3` matrix; the bottom row is zero so check the top `3 × 3`:
>
> ```
>   det ⎡ 1   0   2 ⎤
>       ⎢ 2   1   1 ⎥  =  1·(1·(−1) − 2·1) − 0 + 2·(2·2 − 1·1) = 1·(−3) + 2·3 = 3.
>       ⎣ 0   2  −1 ⎦
> ```
>
> Nonzero ⇒ **independent**.

---

## Exercise 3 — Coordinates in `P₂`

Let `𝓒 = (1 + x, 1 − x, x²)`. Find `[2 + 3x − 4x²]_𝓒`.

> **Answer.** `2 + 3x − 4x² = a(1 + x) + b(1 − x) + c x²` ⇒ `c = −4`, `a + b = 2`, `a − b = 3`. Solving: `a = 5/2`, `b = −1/2`. **`(5/2, −1/2, −4)`.**

---

## Exercise 4 — Matrix of an LT: integration on `P₂`

Let `T: P₂ → P₃` be `T(p)(x) = ∫₀ˣ p(t) dt`. Build `[T]_{𝓒 ← 𝓑}` for `𝓑 = (1, x, x²)` and `𝓒 = (1, x, x², x³)`. Then use the matrix to compute `T(3 + 2x + 6x²)`.

> **Answer.** `T(1) = x`, `T(x) = x²/2`, `T(x²) = x³/3`. Columns: `(0, 1, 0, 0)`, `(0, 0, 1/2, 0)`, `(0, 0, 0, 1/3)`.
>
> ```
>                ⎡ 0   0    0   ⎤
>                ⎢ 1   0    0   ⎥
>   [T]_{𝓒←𝓑} = ⎢ 0  1/2   0   ⎥ .
>                ⎣ 0   0   1/3  ⎦
> ```
>
> `[3 + 2x + 6x²]_𝓑 = (3, 2, 6)`. Multiply: `(0, 3, 1, 2)`. So `T(3 + 2x + 6x²) = 3x + x² + 2x³`. Verify: `∫₀ˣ (3 + 2t + 6t²) dt = 3x + x² + 2x³`. ✓

---

## Exercise 5 — Matrix of derivative on `P₃` in a non-standard basis

Recompute `[D]_{𝓑'}` for `D: P₃ → P₃` (derivative as map `P₃ → P₃ — note codomain is now P₃ too`) in basis `𝓑' = (1, 1+x, 1+x+x², 1+x+x²+x³)`.

> **Answer.**
>
> - `D(1) = 0`. Column `(0, 0, 0, 0)`.
> - `D(1 + x) = 1`. In `𝓑'`: column `(1, 0, 0, 0)`.
> - `D(1 + x + x²) = 1 + 2x`. Need to write as combo of `𝓑'`: `1 + 2x = a · 1 + b(1+x) + c(1+x+x²) + d(1+x+x²+x³)`. Match: `d = 0`, `c = 0`, `b = 2`, `a = −1`. Column `(−1, 2, 0, 0)`.
> - `D(1 + x + x² + x³) = 1 + 2x + 3x²`. `1 + 2x + 3x² = a + b(1+x) + c(1+x+x²) + d(1+x+x²+x³)` → `d = 0`, `c = 3`, `b + c = 2` so `b = −1`, `a + b + c = 1` so `a = −1`. Column `(−1, −1, 3, 0)`.
>
> ```
>             ⎡ 0   1  −1  −1 ⎤
>             ⎢ 0   0   2  −1 ⎥
>   [D]_{𝓑'} = ⎢ 0   0   0   3 ⎥ .
>             ⎣ 0   0   0   0 ⎦
> ```

---

## Exercise 6 — Kernel and image of an LT in an abstract space

Let `T: P₂ → ℝ²` be `T(p) := (p(0), p(1))`. Build the matrix in `𝓑 = (1, x, x²)` and standard basis of ℝ². Find `dim ker T`, give a basis of `ker T`, and decide whether `T` is onto.

> **Answer.** Columns: `T(1) = (1, 1)`, `T(x) = (0, 1)`, `T(x²) = (0, 1)`.
>
> ```
>   M = ⎡ 1   0   0 ⎤
>       ⎣ 1   1   1 ⎦.
> ```
>
> Rank 2, so `dim(im T) = 2 = dim ℝ²` ⇒ **`T` is onto**. `dim ker T = 3 − 2 = 1`. Kernel of `M`: solve `Mc = 0`. From row 1: `c₁ = 0`. From row 2: `c₂ + c₃ = 0`, so `c₂ = −c₃`. Free `c₃ = 1`: `(0, −1, 1)` = coords of `−x + x²`. **`ker T = span(x² − x)`** — polynomials vanishing at both 0 and 1, in `P₂` that's `x(x−1)` up to scalar.

---

## Exercise 7 — Isomorphism check

Are the following pairs of vector spaces isomorphic? Justify.

(a) `P₅` and `M_{2×3}`.
(b) `P₃` and the subspace of `M_{2×2}` consisting of trace-zero matrices.
(c) `ℂ` (as a real vector space) and `M_{1×2}(ℝ)`.
(d) `P` (all polynomials) and `C(ℝ)`.

> **Answer.** Use the classification theorem (§6.7.5).
>
> (a) `dim P₅ = 6`, `dim M_{2×3} = 6`. **Isomorphic.**
>
> (b) `dim P₃ = 4`, trace-zero `2×2` has dim 3. **Not isomorphic.**
>
> (c) Both have real dimension 2. **Isomorphic.**
>
> (d) Both infinite-dimensional, but the classification theorem only applies in finite dimensions. The right answer here uses cardinality: `P` has a countable basis (the monomials), but `C(ℝ)` is way bigger — no countable basis. **Not isomorphic** as vector spaces.

---

## Exercise 8 — Change of basis on `ℝ²`

Let `T: ℝ² → ℝ²` have matrix `A = [[3, 1], [0, 2]]` in the standard basis. Compute `[T]_{𝓑'}` for `𝓑' = ((1, 1), (1, 2))`.

> **Answer.** `P⁻¹ = [[1, 1], [1, 2]]` (columns are `𝓑'`-vectors). `det = 1`, so `P = [[2, −1], [−1, 1]]`.
>
> Compute `P A P⁻¹`:
>
> ```
>   A P⁻¹ = ⎡ 3 1 ⎤ ⎡ 1 1 ⎤ = ⎡ 4   5 ⎤
>           ⎣ 0 2 ⎦ ⎣ 1 2 ⎦   ⎣ 2   4 ⎦.
>
>   P (A P⁻¹) = ⎡ 2 −1 ⎤ ⎡ 4   5 ⎤ = ⎡ 6   6 ⎤
>               ⎣ −1  1 ⎦ ⎣ 2   4 ⎦   ⎣ −2 −1 ⎦.
> ```
>
> So **`[T]_{𝓑'} = [[6, 6], [−2, −1]]`**.
>
> *Sanity.* `tr` and `det` are similarity-invariant. `tr A = 5`, `tr [T]_{𝓑'} = 5`. ✓ `det A = 6`, `det [T]_{𝓑'} = 6 · (−1) − 6 · (−2) = −6 + 12 = 6`. ✓

---

## Exercise 9 — Function-space subspace

Let `V` be the subspace of `C^∞(ℝ)` spanned by `1, cos x, sin x, cos 2x, sin 2x`. Take `D: V → V` to be the derivative. Build `[D]_𝓑` in `𝓑 = (1, cos x, sin x, cos 2x, sin 2x)`. Then identify `ker D` and `im D`.

> **Answer.**
>
> - `D(1) = 0`. Column `(0, 0, 0, 0, 0)`.
> - `D(cos x) = −sin x`. Column `(0, 0, −1, 0, 0)`.
> - `D(sin x) = cos x`. Column `(0, 1, 0, 0, 0)`.
> - `D(cos 2x) = −2 sin 2x`. Column `(0, 0, 0, 0, −2)`.
> - `D(sin 2x) = 2 cos 2x`. Column `(0, 0, 0, 2, 0)`.
>
> ```
>            ⎡ 0   0   0   0   0 ⎤
>            ⎢ 0   0   1   0   0 ⎥
>   [D]_𝓑 = ⎢ 0  −1   0   0   0 ⎥ .
>            ⎢ 0   0   0   0   2 ⎥
>            ⎣ 0   0   0  −2   0 ⎦
> ```
>
> Rank 4, nullity 1. **`ker D = span(1)`** (the constants). **`im D = span(cos x, sin x, cos 2x, sin 2x)`** — the 4D subspace of "no constant term".

---

## Exercise 10 — Polynomial space with point-evaluation basis

Let `𝓑 = (ℓ₀, ℓ₁, ℓ₂)` be the **Lagrange basis** of `P₂` for the nodes `0, 1, 2`:

```
   ℓ₀(x) = (x − 1)(x − 2) / 2,
   ℓ₁(x) = −x (x − 2),
   ℓ₂(x) = x (x − 1) / 2.
```

(Each `ℓⱼ` is `1` at `x = j` and `0` at the other two nodes.) Find `[3 + 2x − x²]_𝓑`.

> **Hint.** Coordinates in the Lagrange basis are just **the values at the nodes**: `[p]_𝓑 = (p(0), p(1), p(2))`.
>
> **Answer.** `p(x) = 3 + 2x − x²`. `p(0) = 3`, `p(1) = 4`, `p(2) = 3`. **`[p]_𝓑 = (3, 4, 3)`.**
>
> *Verify:* `3 ℓ₀ + 4 ℓ₁ + 3 ℓ₂` evaluated at `x = 0`: `3 · 1 + 4 · 0 + 3 · 0 = 3`. ✓ At `x = 1`: `0 + 4 + 0 = 4`. ✓ At `x = 2`: `0 + 0 + 3 = 3`. ✓ Two polynomials in `P₂` that agree at 3 points are equal — so the linear combination really equals `p`.
>
> *Why this is cool.* In the Lagrange basis, **coordinates *are* function values**. The "coefficient extraction" is just evaluation. This shows up in numerical analysis (interpolation) and is one of the prettiest payoffs of the Ch 6 abstraction.
