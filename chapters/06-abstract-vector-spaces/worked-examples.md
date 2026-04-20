# Chapter 6 — Worked Examples

Ten problems with full solutions, in the same flavor as Ch 5. Each illustrates one of the chapter's main skills: axioms, subspace tests in non-ℝⁿ spaces, coordinates, matrix of a linear transformation, change of basis, isomorphisms, and the ODE-solution-space connection.

---

## E1. Verify that `M_{2×2}` is a vector space

**Problem.** Let `V = M_{2×2}` (real `2 × 2` matrices) with entrywise `+` and entrywise scalar `·`. Verify all eight axioms.

**Solution.** Pick generic `A, B, C ∈ V` and `c, d ∈ ℝ`. Write `A = (aᵢⱼ)`, etc.

1. `(A + B) + C = ((aᵢⱼ + bᵢⱼ) + cᵢⱼ) = (aᵢⱼ + (bᵢⱼ + cᵢⱼ)) = A + (B + C)`. (Real addition is associative.)
2. `A + B = (aᵢⱼ + bᵢⱼ) = (bᵢⱼ + aᵢⱼ) = B + A`.
3. The matrix `0 = ((0))` (all entries zero) satisfies `A + 0 = A`.
4. `−A = (−aᵢⱼ)` satisfies `A + (−A) = 0`.
5. `c(dA) = c · (d · aᵢⱼ) = ((cd) aᵢⱼ) = (cd) A`.
6. `1 · A = (1 · aᵢⱼ) = A`.
7. `c (A + B) = (c (aᵢⱼ + bᵢⱼ)) = (c aᵢⱼ + c bᵢⱼ) = cA + cB`.
8. `(c + d) A = ((c + d) aᵢⱼ) = (c aᵢⱼ + d aᵢⱼ) = cA + dA`.

All eight axioms inherited entrywise from ℝ. ✓ `M_{2×2}` is a vector space, dimension `2 · 2 = 4`. Standard basis: `E₁₁, E₁₂, E₂₁, E₂₂`.

---

## E2. Subspace test in `P₃`

**Problem.** Let `W = {p ∈ P₃ : p(1) = 0}`. Show `W` is a subspace of `P₃`. Find a basis and `dim W`.

**Solution.**

*Subspace check.* Define `eval₁: P₃ → ℝ` by `eval₁(p) = p(1)`. This is a linear map (Ch 6 §6.7.2). Then `W = ker eval₁`, which is automatically a subspace. (Or check the three axioms by hand — same answer.)

*Basis.* `p ∈ P₃` means `p = a + bx + cx² + dx³`; `p(1) = 0` means `a + b + c + d = 0`, i.e. `a = −(b + c + d)`. Parametrize:

```
   p(x)  =  −(b + c + d)  +  bx  +  cx²  +  dx³
         =  b(x − 1)  +  c(x² − 1)  +  d(x³ − 1).
```

So `W = span(x − 1,  x² − 1,  x³ − 1)`. These three are independent (their coordinates in `𝓑 = (1, x, x², x³)` are `(−1, 1, 0, 0)`, `(−1, 0, 1, 0)`, `(−1, 0, 0, 1)` — stack as a `4 × 3` matrix; the bottom three rows are `Iₘ`, so rank 3).

> **Basis of `W`:**  `(x − 1,  x² − 1,  x³ − 1)`. **`dim W = 3`.**

This matches rank–nullity for `eval₁: P₃ → ℝ`: `dim P₃ = 4`, `dim(im eval₁) = 1` (it's onto ℝ), so `dim ker = 3`.

---

## E3. Trace-zero matrices form a subspace

**Problem.** Let `W = {A ∈ M_{2×2} : tr A = 0}`. Show `W` is a subspace. Find a basis and `dim W`.

**Solution.**

*Subspace check.* `tr` is a linear map `M_{2×2} → ℝ`, so `W = ker tr` is a subspace.

*Basis.* `A = [[a, b], [c, d]]`, `tr A = a + d = 0` ⇒ `d = −a`. Parametrize:

```
   A  =  [[a,  b],
          [c, −a]]
       =  a · [[1, 0], [0, −1]]  +  b · [[0, 1], [0, 0]]  +  c · [[0, 0], [1, 0]].
```

The three matrices `H = [[1,0],[0,−1]]`, `E_{12} = [[0,1],[0,0]]`, `E_{21} = [[0,0],[1,0]]` span `W` and are independent (their coordinates in the standard basis `(E_{11}, E_{12}, E_{21}, E_{22})` are `(1,0,0,−1)`, `(0,1,0,0)`, `(0,0,1,0)` — stack as a `4 × 3` matrix and observe rank 3).

> **Basis of `W`:**  `H, E_{12}, E_{21}`. **`dim W = 3`.**

(Rank–nullity check: `tr` is onto ℝ, so `dim ker = 4 − 1 = 3`. ✓)

---

## E4. Linear independence in `P₃` via coordinates

**Problem.** Are `p₁ = 1 + x + x²`, `p₂ = x + x² + x³`, `p₃ = 1 + x³` linearly independent in `P₃`?

**Solution.** Coordinates in `𝓑 = (1, x, x², x³)`:

```
   [p₁]_𝓑 = (1, 1, 1, 0),
   [p₂]_𝓑 = (0, 1, 1, 1),
   [p₃]_𝓑 = (1, 0, 0, 1).
```

Stack as columns:

```
         ⎡ 1   0   1 ⎤
   M  =  ⎢ 1   1   0 ⎥ .
         ⎢ 1   1   0 ⎥
         ⎣ 0   1   1 ⎦
```

Row 2 = Row 3, so rank ≤ 2. After eliminating the duplicate, the three vectors

```
   (1, 0, 1),  (1, 1, 0),  (0, 1, 1)
```

(read as the distinct rows) span a 2D subspace if dependent and ℝ³ if not. Determinant: `1·(1·1 − 0·1) − 0 + 1·(1·1 − 1·0) = 1 + 1 = 2 ≠ 0`. So those are independent — but we need column rank, not row. The column space of `M` is spanned by three columns living in ℝ⁴.

Easier: row-reduce `M`.

```
   R2 ← R2 − R1 :   ⎡ 1   0   1 ⎤
                     ⎢ 0   1  −1 ⎥
                     ⎢ 1   1   0 ⎥
                     ⎣ 0   1   1 ⎦

   R3 ← R3 − R1 :   ⎡ 1   0   1 ⎤
                     ⎢ 0   1  −1 ⎥
                     ⎢ 0   1  −1 ⎥
                     ⎣ 0   1   1 ⎦

   R3 ← R3 − R2,
   R4 ← R4 − R2 :   ⎡ 1   0   1 ⎤
                     ⎢ 0   1  −1 ⎥
                     ⎢ 0   0   0 ⎥
                     ⎣ 0   0   2 ⎦

   Swap, scale :    ⎡ 1   0   0 ⎤
                     ⎢ 0   1   0 ⎥
                     ⎢ 0   0   1 ⎥
                     ⎣ 0   0   0 ⎦
```

Three pivots, three columns, so columns are independent.

> **`p₁, p₂, p₃` are linearly independent.**

---

## E5. Coordinates in a non-standard basis of `P₂`

**Problem.** Let `𝓒 = (1,  1 + x,  1 + x + x²)`. Find `[3 + 2x − x²]_𝓒`.

**Solution.** Set `3 + 2x − x² = a · 1 + b (1 + x) + c (1 + x + x²)`. RHS = `(a + b + c) + (b + c) x + c x²`. Match:

- `c = −1`.
- `b + c = 2` ⇒ `b = 3`.
- `a + b + c = 3` ⇒ `a + 3 − 1 = 3` ⇒ `a = 1`.

> **`[3 + 2x − x²]_𝓒 = (1, 3, −1)`.**

**Verify.** `1 · 1 + 3 · (1 + x) + (−1) · (1 + x + x²) = 1 + 3 + 3x − 1 − x − x² = 3 + 2x − x²`. ✓

---

## E6. Matrix of `M_x : P₂ → P₃` (multiplication by `x`)

**Problem.** Let `T: P₂ → P₃` be `T(p)(x) = x · p(x)`. Build `[T]_{𝓒 ← 𝓑}` for `𝓑 = (1, x, x²)` and `𝓒 = (1, x, x², x³)`. Use it to compute `T(2 + 5x − x²)`.

**Solution.** Apply `T` to each `𝓑`-basis vector and coordinatize in `𝓒`:

- `T(1) = x = 0·1 + 1·x + 0·x² + 0·x³` ⇒ column `(0, 1, 0, 0)`.
- `T(x) = x² = 0 + 0·x + 1·x² + 0·x³` ⇒ column `(0, 0, 1, 0)`.
- `T(x²) = x³ = 0 + 0 + 0 + 1·x³` ⇒ column `(0, 0, 0, 1)`.

```
                ⎡ 0   0   0 ⎤
                ⎢ 1   0   0 ⎥
   [T]_{𝓒←𝓑} = ⎢ 0   1   0 ⎥ .
                ⎣ 0   0   1 ⎦
```

This is the "shift-up by one" matrix.

**Sanity check.** `p = 2 + 5x − x²`, `[p]_𝓑 = (2, 5, −1)`. Multiply:

```
   ⎡ 0 0 0 ⎤   ⎡  2 ⎤     ⎡  0 ⎤
   ⎢ 1 0 0 ⎥ · ⎢  5 ⎥  =  ⎢  2 ⎥ .
   ⎢ 0 1 0 ⎥   ⎣ −1 ⎦     ⎢  5 ⎥
   ⎣ 0 0 1 ⎦              ⎣ −1 ⎦
```

So `[T(p)]_𝓒 = (0, 2, 5, −1)`, meaning `T(p) = 0 + 2x + 5x² − x³ = −x³ + 5x² + 2x`. Direct check: `x · (2 + 5x − x²) = 2x + 5x² − x³`. ✓

**Kernel and image.** `[T]_{𝓒 ← 𝓑}` has rank 3 (three pivot columns, three free rows on top), so `nullity = 0` and `dim(im T) = 3`. `ker T = {0}`. `im T` = polynomials in `P₃` with zero constant term — indeed, `x · p(x)` has no constant term.

---

## E7. Matrix of the "shift" `T(p)(x) = p(x + 1)` on `P₂`

**Problem.** Let `T: P₂ → P₂` be `T(p)(x) := p(x + 1)`. Build `[T]_𝓑` in `𝓑 = (1, x, x²)`, then check on `p(x) = 4 − 3x + 2x²`.

**Solution.**

- `T(1) = 1` ⇒ column `(1, 0, 0)`.
- `T(x) = x + 1 = 1 + x` ⇒ column `(1, 1, 0)`.
- `T(x²) = (x + 1)² = 1 + 2x + x²` ⇒ column `(1, 2, 1)`.

```
            ⎡ 1   1   1 ⎤
   [T]_𝓑 = ⎢ 0   1   2 ⎥ .
            ⎣ 0   0   1 ⎦
```

This is the **Pascal matrix** for the shift — its columns are rows of Pascal's triangle.

**Sanity check.** `[p]_𝓑 = (4, −3, 2)`. Multiply:

```
   ⎡ 1 1 1 ⎤   ⎡  4 ⎤     ⎡ 4 − 3 + 2 ⎤   ⎡ 3 ⎤
   ⎢ 0 1 2 ⎥ · ⎢ −3 ⎥  =  ⎢   −3 + 4   ⎥ = ⎢ 1 ⎥ .
   ⎣ 0 0 1 ⎦   ⎣  2 ⎦     ⎣      2     ⎦   ⎣ 2 ⎦
```

So `T(p) = 3 + x + 2x²`. Direct: `T(p)(x) = p(x + 1) = 4 − 3(x + 1) + 2(x + 1)² = 4 − 3x − 3 + 2(x² + 2x + 1) = 4 − 3x − 3 + 2x² + 4x + 2 = 3 + x + 2x²`. ✓

---

## E8. Matrix and rank–nullity of `tr: M_{2×2} → ℝ`

**Problem.** Let `T = tr: M_{2×2} → ℝ` (the trace). Standard basis of `M_{2×2}`: `𝓑 = (E_{11}, E_{12}, E_{21}, E_{22})`. Standard basis of ℝ: `𝓒 = (1)`. Build `[T]_{𝓒 ← 𝓑}`, identify kernel and image, and verify rank–nullity.

**Solution.** Apply `T` to each basis vector:

- `T(E_{11}) = 1`, `T(E_{12}) = 0`, `T(E_{21}) = 0`, `T(E_{22}) = 1`.

So `[T]_{𝓒 ← 𝓑} = [1  0  0  1]` (a `1 × 4` row matrix).

- `dim(im T) = rank = 1`. `im T = ℝ`.
- `dim(ker T) = 4 − 1 = 3`. By E3, `ker T` = trace-zero matrices, basis `(H, E_{12}, E_{21})`, dim 3. ✓

Rank–nullity: `1 + 3 = 4 = dim M_{2×2}`. ✓

---

## E9. Change of basis for `T(p) = p + p'` on `P₂`

**Problem.** Let `T: P₂ → P₂` be `T(p) = p + p'`. Standard basis `𝓑 = (1, x, x²)`. Alternate basis `𝓑' = (1,  1 + x,  1 + x + x²)`. Build `[T]_𝓑` and `[T]_{𝓑'}`, find the change-of-basis matrix `P = [id]_{𝓑' ← 𝓑}`, and verify `[T]_{𝓑'} = P [T]_𝓑 P⁻¹`.

**Solution.**

*`[T]_𝓑`:*

- `T(1) = 1 + 0 = 1` ⇒ column `(1, 0, 0)`.
- `T(x) = x + 1 = 1 + x` ⇒ column `(1, 1, 0)`.
- `T(x²) = x² + 2x = 0 + 2x + x²` ⇒ column `(0, 2, 1)`.

```
            ⎡ 1   1   0 ⎤
   [T]_𝓑 = ⎢ 0   1   2 ⎥ .
            ⎣ 0   0   1 ⎦
```

*`P = [id]_{𝓑' ← 𝓑}`:* coordinates of standard basis vectors in `𝓑'`. Need `1 = a · 1 + b (1 + x) + c (1 + x + x²)` etc.

- `1 = 1 · 1 + 0 + 0` ⇒ column `(1, 0, 0)`.
- `x = ?`. Set `x = a + b(1 + x) + c(1 + x + x²)` → matching coefficients (`x²`-coef: `c = 0`; `x`-coef: `b + c = 1` so `b = 1`; const: `a + b + c = 0` so `a = −1`). Column `(−1, 1, 0)`.
- `x² = ?`. Set `x² = a + b(1 + x) + c(1 + x + x²)` → `c = 1`; `b + c = 0` so `b = −1`; `a + b + c = 0` so `a = 0`. Column `(0, −1, 1)`.

```
        ⎡ 1  −1   0 ⎤
   P =  ⎢ 0   1  −1 ⎥ .
        ⎣ 0   0   1 ⎦
```

*`P⁻¹`:* this is `[id]_{𝓑 ← 𝓑'}`, whose columns are coordinates of `𝓑'`-vectors in `𝓑` — read off directly from `𝓑' = (1, 1 + x, 1 + x + x²)`:

```
        ⎡ 1   1   1 ⎤
   P⁻¹ = ⎢ 0   1   1 ⎥ .
        ⎣ 0   0   1 ⎦
```

Sanity check: `P · P⁻¹`:

```
   ⎡ 1 −1  0 ⎤   ⎡ 1  1  1 ⎤     ⎡ 1   0   0 ⎤
   ⎢ 0  1 −1 ⎥ · ⎢ 0  1  1 ⎥  =  ⎢ 0   1   0 ⎥ . ✓
   ⎣ 0  0  1 ⎦   ⎣ 0  0  1 ⎦     ⎣ 0   0   1 ⎦
```

*`[T]_{𝓑'}` directly:* compute `T` on `𝓑'`-vectors and coordinatize.

- `T(1) = 1 = 1 · 1 + 0 + 0` ⇒ column `(1, 0, 0)`.
- `T(1 + x) = (1 + x) + 1 = 2 + x`. Express in `𝓑'`: `2 + x = a + b(1 + x) + c(1 + x + x²)` → `c = 0`, `b = 1`, `a + 1 = 2` so `a = 1`. Column `(1, 1, 0)`.
- `T(1 + x + x²) = (1 + x + x²) + (1 + 2x) = 2 + 3x + x²`. In `𝓑'`: `c = 1`, `b + c = 3` so `b = 2`, `a + b + c = 2` so `a = −1`. Column `(−1, 2, 1)`.

```
              ⎡ 1   1  −1 ⎤
   [T]_{𝓑'} = ⎢ 0   1   2 ⎥ .
              ⎣ 0   0   1 ⎦
```

*Verify `[T]_{𝓑'} = P [T]_𝓑 P⁻¹`:* compute `[T]_𝓑 P⁻¹` first.

```
   ⎡ 1 1 0 ⎤   ⎡ 1 1 1 ⎤     ⎡ 1   2   2 ⎤
   ⎢ 0 1 2 ⎥ · ⎢ 0 1 1 ⎥  =  ⎢ 0   1   3 ⎥ .
   ⎣ 0 0 1 ⎦   ⎣ 0 0 1 ⎦     ⎣ 0   0   1 ⎦
```

Then `P · (above)`:

```
   ⎡ 1 −1  0 ⎤   ⎡ 1  2  2 ⎤     ⎡ 1   1  −1 ⎤
   ⎢ 0  1 −1 ⎥ · ⎢ 0  1  3 ⎥  =  ⎢ 0   1   2 ⎥ .
   ⎣ 0  0  1 ⎦   ⎣ 0  0  1 ⎦     ⎣ 0   0   1 ⎦
```

Matches `[T]_{𝓑'}`. ✓ So `[T]_𝓑` and `[T]_{𝓑'}` are similar — different matrix avatars of the same abstract operator `T`.

---

## E10. ODE solution space (preview of Ch 9)

**Problem.** Let `V = {y ∈ C^∞(ℝ) : y'' − 3y' + 2y = 0}`. Show:

(a) `V` is a subspace of `C^∞(ℝ)`.
(b) `e^t` and `e^{2t}` are in `V` and are linearly independent.
(c) `V = span(e^t, e^{2t})`. (Take this on faith from ODE theory: a 2nd-order linear ODE has a 2D solution space.)
(d) Find the coordinates of `y(t) = 5 e^t − 2 e^{2t}` in the basis `(e^t, e^{2t})`, and use them to compute `y(0)` and `y'(0)`.

**Solution.**

(a) Three subspace axioms:

- `y = 0` satisfies `0 − 0 + 0 = 0`. ✓
- If `y₁, y₂ ∈ V`, then `(y₁ + y₂)'' − 3(y₁ + y₂)' + 2(y₁ + y₂) = (y₁'' − 3y₁' + 2y₁) + (y₂'' − 3y₂' + 2y₂) = 0 + 0 = 0`. ✓
- If `y ∈ V`, `c ∈ ℝ`, then `(cy)'' − 3(cy)' + 2(cy) = c(y'' − 3y' + 2y) = 0`. ✓

(b) Plug in `e^t`: derivative `e^t`, second derivative `e^t`. So `e^t − 3 e^t + 2 e^t = 0`. ✓ Plug in `e^{2t}`: derivative `2 e^{2t}`, second `4 e^{2t}`. So `4 e^{2t} − 6 e^{2t} + 2 e^{2t} = 0`. ✓

*Independence.* Suppose `c₁ e^t + c₂ e^{2t} = 0` for all `t`. At `t = 0`: `c₁ + c₂ = 0`. Differentiate and evaluate at `t = 0`: `c₁ + 2 c₂ = 0`. Subtract: `c₂ = 0`, then `c₁ = 0`.

(c) ODE theory: the space of solutions of a 2nd-order linear homogeneous ODE with smooth coefficients is exactly 2-dimensional. We have two independent elements, so they're a basis.

(d) `[y]_{𝓑} = (5, −2)` in `𝓑 = (e^t, e^{2t})`.

*Computing values from coordinates.* The "evaluate at 0" map and "evaluate derivative at 0" map are both linear `V → ℝ`. Their matrices in `𝓑` are:

- `eval₀(e^t) = 1`, `eval₀(e^{2t}) = 1`. Matrix `[eval₀] = [1, 1]`.
- `eval₀ ∘ D (e^t) = 1`, `eval₀ ∘ D (e^{2t}) = 2`. Matrix `[eval₀ ∘ D] = [1, 2]`.

So:

```
   y(0)   =  [1, 1] · (5, −2)ᵀ   =  3.
   y'(0)  =  [1, 2] · (5, −2)ᵀ   =  1.
```

Direct check: `y(t) = 5 e^t − 2 e^{2t}`, so `y(0) = 5 − 2 = 3`. `y'(t) = 5 e^t − 4 e^{2t}`, `y'(0) = 5 − 4 = 1`. ✓

> **Big picture.** The "initial-conditions" map `V → ℝ²` sending `y → (y(0), y'(0))` has matrix `[[1, 1], [1, 2]]` in our chosen basis. Its determinant is `1`, nonzero — meaning every initial condition `(y(0), y'(0))` is realized by exactly one solution. That nonzero determinant is the **Wronskian**, and it's the linear-algebra reason existence-and-uniqueness theorems for linear ODEs work.
