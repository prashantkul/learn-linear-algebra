# Chapter 5 — Exercises

Ten problems, answers below. Try them on paper first. Use the Python notebook to check.

---

## Problems

### E1 — Subspace checks

For each set, decide whether it's a subspace of its ambient ℝⁿ. Justify with an axiom check or a concrete counterexample.

(a) `{(x, y) ∈ ℝ² : 3x − 2y = 0}`

(b) `{(x, y) ∈ ℝ² : 3x − 2y = 1}`

(c) `{(x, y, z) ∈ ℝ³ : x + y + z ≥ 0}`

(d) `{(x, y, z) ∈ ℝ³ : x = y = z}`

---

### E2 — Image basis and rank

Let

```
         ⎡ 1   3   2 ⎤
   A  =  ⎢ 2   6   5 ⎥ .
         ⎣ 1   3   4 ⎦
```

Find a basis for `im A` and state `rank A`. Is `(4, 10, 9) ∈ im A`?

---

### E3 — Kernel basis and nullity

For the same `A` as E2, find a basis for `ker A` and state `nullity A`. Verify rank–nullity.

---

### E4 — Independence in ℝ⁴

Determine whether the following vectors are linearly independent in ℝ⁴:

```
   v₁ = (1, 0, 2, 1),   v₂ = (2, 1, 3, 0),   v₃ = (1, 1, 1, −1).
```

If dependent, write one vector as a combination of the others.

---

### E5 — Basis from a spanning set

Let `V = span(u₁, u₂, u₃, u₄)` with

```
   u₁ = (1, 2, 3),   u₂ = (2, 4, 6),   u₃ = (1, 0, 1),   u₄ = (0, 1, 1).
```

Extract a basis of `V` from the `uᵢ`'s and state `dim V`.

---

### E6 — Coordinates relative to a basis

In ℝ³, `𝓑 = (v₁, v₂, v₃)` with

```
   v₁ = (1, 1, 0),   v₂ = (1, 0, 1),   v₃ = (0, 1, 1).
```

Verify `𝓑` is a basis. Then find `[x]_𝓑` for `x = (2, 3, 4)`.

---

### E7 — Change of basis

In ℝ², take `𝓑 = ((1, 0), (1, 1))` and `𝓒 = ((2, 1), (1, 2))`.

(a) Build `P_{𝓑 → 𝓒}`.

(b) Convert `[x]_𝓑 = (1, 2)` to 𝓒-coordinates.

(c) Double-check by rebuilding `x` in standard coordinates both ways.

---

### E8 — Rank from shape

Answer each independently.

(a) If `A` is `4 × 7` of rank 4, what is `nullity A`?

(b) If `A` is `6 × 4` of rank 4, what is `nullity A`? Is `Ax = b` solvable for every `b ∈ ℝ⁶`?

(c) Can a `5 × 5` matrix have rank 4 and be invertible?

---

### E9 — Subspace intersection

Let `U = span((1, 0, 1), (0, 1, 1))` and `W = span((1, 1, 0), (1, 2, 1))` — two planes through `0` in ℝ³. Find a basis for `U ∩ W` (all vectors in both planes).

*Hint.* A vector is in `U ∩ W` iff it's expressible two different ways. Set up a homogeneous system and use the kernel.

---

### E10 — Polynomial subspace (preview of Ch 6)

Consider the set `P₂` of real polynomials `p(x) = a₀ + a₁ x + a₂ x²` of degree at most 2. We'll treat `P₂` as a "vector space" by identifying each polynomial with its coefficient vector `(a₀, a₁, a₂) ∈ ℝ³`.

Let `V = {p ∈ P₂ : p(1) = 0}`.

(a) Show that `V` is a subspace (of `P₂`, equivalently of ℝ³ via the identification).

(b) Find a basis for `V`. What is `dim V`?

---

## Answers

---

### A1 — Subspace checks

(a) **Yes.** The set of solutions to a homogeneous linear equation in ℝ² — a line through `0` with normal `(3, −2)`. Contains `0`; closed under `+` and scalar mult. (same proof as E1 in worked examples).

(b) **No.** Does not contain `0`: `3·0 − 2·0 = 0 ≠ 1`.

(c) **No.** Not closed under scalar mult.: `(1, 1, 1) ∈ W` (sum `= 3 ≥ 0`), but `(−1)·(1, 1, 1) = (−1, −1, −1)` has sum `−3 < 0`, so not in `W`.

(d) **Yes.** This is `span((1, 1, 1))` — a line through `0` in ℝ³.

---

### A2 — Image basis and rank

Row-reduce `A`:

```
   R₂ ← R₂ − 2R₁,   R₃ ← R₃ − R₁:

         ⎡ 1   3   2 ⎤
         ⎢ 0   0   1 ⎥
         ⎣ 0   0   2 ⎦

   R₃ ← R₃ − 2R₂,   R₁ ← R₁ − 2R₂:

         ⎡ 1   3   0 ⎤
         ⎢ 0   0   1 ⎥   =  RREF(A).
         ⎣ 0   0   0 ⎦
```

Pivots in columns 1, 3. **Basis of `im A`:** `{(1, 2, 1), (2, 5, 4)}` (original columns 1 and 3). **`rank A = 2`.**

Is `(4, 10, 9) ∈ im A`? Check if it's a linear combination of the basis: `α·(1, 2, 1) + β·(2, 5, 4) = (4, 10, 9)` gives `α + 2β = 4, 2α + 5β = 10, α + 4β = 9`. From (i): `α = 4 − 2β`. Plug into (ii): `2(4 − 2β) + 5β = 10 ⇒ 8 + β = 10 ⇒ β = 2, α = 0`. Check (iii): `0 + 8 = 8 ≠ 9`. Inconsistent. **No, `(4, 10, 9) ∉ im A`.**

---

### A3 — Kernel basis and nullity

From RREF above, column 2 is free. Set `x₂ = 1`: row 1 gives `x₁ + 3 = 0`, so `x₁ = −3`; row 2 gives `x₃ = 0`. **Basis of `ker A`:** `{(−3, 1, 0)}`. **`nullity A = 1`.**

Rank–nullity: `rank + nullity = 2 + 1 = 3 = n` ✓.

---

### A4 — Independence in ℝ⁴

Stack as columns:

```
         ⎡ 1   2   1 ⎤
   M  =  ⎢ 0   1   1 ⎥
         ⎢ 2   3   1 ⎥
         ⎣ 1   0  −1 ⎦
```

Row-reduce. `R₃ ← R₃ − 2R₁`, `R₄ ← R₄ − R₁`:

```
         ⎡ 1   2   1 ⎤
         ⎢ 0   1   1 ⎥
         ⎢ 0  −1  −1 ⎥
         ⎣ 0  −2  −2 ⎦
```

`R₃ ← R₃ + R₂`, `R₄ ← R₄ + 2R₂`:

```
         ⎡ 1   2   1 ⎤
         ⎢ 0   1   1 ⎥
         ⎢ 0   0   0 ⎥
         ⎣ 0   0   0 ⎦
```

`R₁ ← R₁ − 2R₂`:

```
         ⎡ 1   0  −1 ⎤
         ⎢ 0   1   1 ⎥   =  RREF(M).
         ⎢ 0   0   0 ⎥
         ⎣ 0   0   0 ⎦
```

Only 2 pivots, but 3 columns. **Dependent.** Free `x₃ = 1`: `x₁ = 1, x₂ = −1`. So `v₁ − v₂ + v₃ = 0`, i.e. `v₃ = v₂ − v₁`. Check: `(2−1, 1−0, 3−2, 0−1) = (1, 1, 1, −1) ✓`.

---

### A5 — Basis from a spanning set

Stack as `M`:

```
         ⎡ 1   2   1   0 ⎤
   M  =  ⎢ 2   4   0   1 ⎥
         ⎣ 3   6   1   1 ⎦
```

`R₂ ← R₂ − 2R₁`, `R₃ ← R₃ − 3R₁`:

```
         ⎡ 1   2   1   0 ⎤
         ⎢ 0   0  −2   1 ⎥
         ⎣ 0   0  −2   1 ⎦
```

`R₃ ← R₃ − R₂`:

```
         ⎡ 1   2   1   0 ⎤
         ⎢ 0   0  −2   1 ⎥
         ⎣ 0   0   0   0 ⎦
```

Pivots in columns 1, 3. **Basis of `V`:** `{u₁, u₃} = {(1, 2, 3), (1, 0, 1)}`. **`dim V = 2`.**

(Dependencies: `u₂ = 2 u₁` and `u₄ = ½ u₁ − ½ u₃` — verify: `½ (1,2,3) − ½ (1,0,1) = (0, 1, 1) = u₄ ✓`.)

---

### A6 — Coordinates in `𝓑`

`𝓑 = (v₁, v₂, v₃)` basis-check: stack as `S = [v₁|v₂|v₃]`:

```
         ⎡ 1   1   0 ⎤
   S  =  ⎢ 1   0   1 ⎥
         ⎣ 0   1   1 ⎦
```

`det S = 1·(0·1 − 1·1) − 1·(1·1 − 1·0) + 0 = −1 − 1 = −2 ≠ 0` ⇒ invertible ⇒ basis.

Solve `S c = x = (2, 3, 4)`:

```
   c₁ + c₂       = 2
   c₁       + c₃ = 3
         c₂ + c₃ = 4
```

Adding all three: `2(c₁ + c₂ + c₃) = 9`, so `c₁ + c₂ + c₃ = 9/2`.

- `c₃ = 9/2 − 2 = 5/2`
- `c₂ = 9/2 − 3 = 3/2`
- `c₁ = 9/2 − 4 = 1/2`

**`[x]_𝓑 = (1/2, 3/2, 5/2)`.**

Check: `½ (1,1,0) + 3/2 (1,0,1) + 5/2 (0,1,1) = (½+3/2, ½+5/2, 3/2+5/2) = (2, 3, 4) ✓`.

---

### A7 — Change of basis

(a) `P = S_𝓒⁻¹ S_𝓑`. `S_𝓑 = ⎡1 1⎤/⎣0 1⎦`, `S_𝓒 = ⎡2 1⎤/⎣1 2⎦`. `det S_𝓒 = 3`, so `S_𝓒⁻¹ = (1/3)·⎡2 −1⎤/⎣−1 2⎦`.

```
   P  =  (1/3) · ⎡ 2  −1 ⎤ ⎡ 1   1 ⎤  =  (1/3) · ⎡  2   1 ⎤  =  ⎛  2/3    1/3 ⎞
                 ⎣−1   2 ⎦ ⎣ 0   1 ⎦              ⎣ −1   1 ⎦      ⎝ −1/3    1/3 ⎠
```

(b) `[x]_𝓒 = P · (1, 2) = ((2 + 2)/3, (−1 + 2)/3) = (4/3, 1/3)`.

(c) Rebuild. From `𝓑`: `x = 1·(1, 0) + 2·(1, 1) = (3, 2)`. From `𝓒`: `x = 4/3·(2, 1) + 1/3·(1, 2) = (8/3 + 1/3, 4/3 + 2/3) = (3, 2) ✓`.

---

### A8 — Rank from shape

(a) `nullity = 7 − 4 = 3`.

(b) `nullity = 4 − 4 = 0` (trivial kernel). But `im A ⊆ ℝ⁶` has `dim = 4 < 6`, so **no**, `Ax = b` is not solvable for every `b ∈ ℝ⁶` — only for `b ∈ im A`, a 4D subspace of ℝ⁶.

(c) **No.** A `5 × 5` invertible matrix has `rank = 5` (from the invertible matrix theorem, §5.8). Rank 4 makes it non-invertible.

---

### A9 — Subspace intersection

A vector `v ∈ U ∩ W` iff `v = a₁ u₁ + a₂ u₂ = b₁ w₁ + b₂ w₂` with `u₁, u₂` spanning `U` and `w₁, w₂` spanning `W`. Equivalently:

```
   a₁ u₁ + a₂ u₂  −  b₁ w₁ − b₂ w₂  =  0.
```

Build a matrix with these four vectors as columns:

```
         ⎡ 1   0  −1  −1 ⎤
   N  =  ⎢ 0   1  −1  −2 ⎥ .
         ⎣ 1   1   0  −1 ⎦
```

Row-reduce. `R₃ ← R₃ − R₁`:

```
         ⎡ 1   0  −1  −1 ⎤
         ⎢ 0   1  −1  −2 ⎥
         ⎣ 0   1   1   0 ⎦
```

`R₃ ← R₃ − R₂`:

```
         ⎡ 1   0  −1  −1 ⎤
         ⎢ 0   1  −1  −2 ⎥
         ⎣ 0   0   2   2 ⎦
```

`R₃ ← ½ R₃`, `R₁ ← R₁ + R₃`, `R₂ ← R₂ + R₃`:

```
         ⎡ 1   0   0   0 ⎤
         ⎢ 0   1   0  −1 ⎥   =  RREF(N).
         ⎣ 0   0   1   1 ⎦
```

Free variable `b₂ = t`. Then `b₁ = −t`, `a₁ = 0`, `a₂ = t`. So any `v ∈ U ∩ W` has `v = 0·u₁ + t·u₂ = t·(0, 1, 1)`. **Basis of `U ∩ W`:** `{(0, 1, 1)}`. `dim(U ∩ W) = 1`.

(Quick dimension sanity: `dim U + dim W − dim(U ∪ W) = 2 + 2 − 3 = 1` via Grassmann's identity, matching.)

---

### A10 — Polynomial subspace

Treat `p(x) = a₀ + a₁ x + a₂ x²` as `(a₀, a₁, a₂) ∈ ℝ³`.

(a) `V = {p : p(1) = 0} = {(a₀, a₁, a₂) : a₀ + a₁ + a₂ = 0}`. This is the solution set of a homogeneous linear equation in ℝ³ — a plane through `0`, hence a subspace (by the same argument as E1/A1(a)).

(b) From `a₀ = −a₁ − a₂`, parametrize: `(a₀, a₁, a₂) = a₁·(−1, 1, 0) + a₂·(−1, 0, 1)`. As polynomials, these are `−1 + x` and `−1 + x²`, i.e. `(x − 1)` and `(x² − 1) = (x − 1)(x + 1)`.

**Basis of `V`:**  `{x − 1,   x² − 1}`.  **`dim V = 2`.**

(Every polynomial that vanishes at `x = 1` has `(x − 1)` as a factor — this is the polynomial-algebra shadow of the subspace result.)
