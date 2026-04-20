# Chapter 5 — Worked Examples

Ten fully worked problems, in roughly the order the ideas appear in `notes.md`. Every answer shows the *steps*, not just the final number.

---

## E1 — Subspace check (positive)

**Problem.** Let `V = {(x, y, z) ∈ ℝ³ : x + 2y − z = 0}`. Show that `V` is a subspace of ℝ³.

**Solution.** Check the three axioms.

1. **Zero.** `0 + 2·0 − 0 = 0`, so `(0, 0, 0) ∈ V`.  ✓
2. **Closed under `+`.** Let `u = (u₁, u₂, u₃)` and `v = (v₁, v₂, v₃)` be in `V`, i.e. `u₁ + 2u₂ − u₃ = 0` and `v₁ + 2v₂ − v₃ = 0`. Then
   ```
      (u₁ + v₁) + 2(u₂ + v₂) − (u₃ + v₃)
      = (u₁ + 2u₂ − u₃) + (v₁ + 2v₂ − v₃)
      = 0 + 0
      = 0,
   ```
   so `u + v ∈ V`.  ✓
3. **Closed under scalar `·`.** For `c ∈ ℝ` and `u ∈ V`:
   ```
      (c u₁) + 2(c u₂) − (c u₃)  =  c · (u₁ + 2u₂ − u₃)  =  c · 0  =  0.
   ```
   So `c u ∈ V`.  ✓

All three pass, so `V` is a subspace. Geometrically, `V` is the plane through `0` in ℝ³ with normal vector `(1, 2, −1)`.

---

## E2 — Subspace check (negative)

**Problem.** Is `W = {(x, y) ∈ ℝ² : y = x²}` a subspace of ℝ²?

**Solution.** Try the three axioms.

1. **Zero.** `0 = 0²`, so `(0, 0) ∈ W`. ✓
2. **Addition.** Try `u = (1, 1)`, `v = (2, 4)`. Both are in `W` (`1 = 1²`, `4 = 2²`). But `u + v = (3, 5)`, and `5 ≠ 3² = 9`. So `u + v ∉ W`.  ✗

One failure is enough. **`W` is not a subspace.** (It's a parabola — curved, not flat — and linear combinations leave the curve.)

---

## E3 — Image of a matrix (column space + basis)

**Problem.** Let

```
         ⎡ 1   2   0   1 ⎤
   A  =  ⎢ 2   4   1   3 ⎥ .
         ⎣ 1   2   1   2 ⎦
```

Find a basis for `im A` and state `rank A`.

**Solution.** Row-reduce `A`:

```
   R₂ ← R₂ − 2R₁,   R₃ ← R₃ − R₁:

         ⎡ 1   2   0   1 ⎤
         ⎢ 0   0   1   1 ⎥
         ⎣ 0   0   1   1 ⎦

   R₃ ← R₃ − R₂:

         ⎡ 1   2   0   1 ⎤
         ⎢ 0   0   1   1 ⎥   =  RREF(A).
         ⎣ 0   0   0   0 ⎦
```

Pivots are in columns 1 and 3. Columns 2 and 4 are free. Per §5.6.4, a basis of `im A` consists of the **original** columns 1 and 3 of `A`:

> **Basis of `im A`:**  `{(1, 2, 1), (0, 1, 1)}`.

`rank A = 2`. Geometrically, `im A` is a plane through `0` in ℝ³.

*Sanity check.* Column 2 of `A` is `(2, 4, 2) = 2 · (1, 2, 1)` — a multiple of column 1. Column 4 is `(1, 3, 2) = (1, 2, 1) + (0, 1, 1)` — sum of columns 1 and 3. Both dependencies confirm the basis choice.

---

## E4 — Kernel of a matrix (null space + basis)

**Problem.** For the same `A` as E3, find a basis of `ker A` and state `nullity A`.

**Solution.** RREF of `A` (from E3):

```
         ⎡ 1   2   0   1 ⎤
         ⎢ 0   0   1   1 ⎥
         ⎣ 0   0   0   0 ⎦
```

Variables: `x₁` (pivot), `x₂` (free), `x₃` (pivot), `x₄` (free). Set each free variable to 1 in turn, others to 0:

- **Free vars `(x₂, x₄) = (1, 0)`.** Row 1: `x₁ + 2·1 + 0·0 + 1·0 = 0`, so `x₁ = −2`. Row 2: `x₃ + 1·0 = 0`, so `x₃ = 0`. Vector: `(−2, 1, 0, 0)`.
- **Free vars `(x₂, x₄) = (0, 1)`.** Row 1: `x₁ + 2·0 + 0·0 + 1·1 = 0`, so `x₁ = −1`. Row 2: `x₃ + 1·1 = 0`, so `x₃ = −1`. Vector: `(−1, 0, −1, 1)`.

> **Basis of `ker A`:**  `{(−2, 1, 0, 0), (−1, 0, −1, 1)}`.

`nullity A = 2`. Geometrically, `ker A` is a plane through `0` in ℝ⁴.

**Rank–nullity check:** `rank + nullity = 2 + 2 = 4 = n` (number of columns). ✓

---

## E5 — Linear independence test

**Problem.** Are `v₁ = (1, 1, 2)`, `v₂ = (2, 3, 5)`, `v₃ = (1, 0, 1)` linearly independent in ℝ³?

**Solution.** Stack them as columns:

```
         ⎡ 1   2   1 ⎤
   M  =  ⎢ 1   3   0 ⎥ .
         ⎣ 2   5   1 ⎦
```

Row-reduce:

```
   R₂ ← R₂ − R₁,   R₃ ← R₃ − 2R₁:

         ⎡ 1   2   1 ⎤
         ⎢ 0   1  −1 ⎥
         ⎣ 0   1  −1 ⎦

   R₃ ← R₃ − R₂:

         ⎡ 1   2   1 ⎤
         ⎢ 0   1  −1 ⎥   =  row echelon form.
         ⎣ 0   0   0 ⎦
```

Only 2 pivots (in columns 1 and 2), but we have 3 columns. **`v₁, v₂, v₃` are linearly dependent.**

*Find the dependency.* Continue to RREF:

```
   R₁ ← R₁ − 2R₂:

         ⎡ 1   0   3 ⎤
         ⎢ 0   1  −1 ⎥ .
         ⎣ 0   0   0 ⎦
```

Free variable `x₃ = t`: `x₁ = −3t`, `x₂ = t`. So `(−3, 1, 1)` is in `ker M`. That means `−3 v₁ + v₂ + v₃ = 0`, i.e. `v₃ = 3 v₁ − v₂`. Check: `3·(1, 1, 2) − (2, 3, 5) = (1, 0, 1) ✓`.

---

## E6 — Extract a basis from a spanning set

**Problem.** Let `V = span(w₁, w₂, w₃, w₄)` in ℝ⁴ with

```
   w₁ = (1, 0, 1, 0),   w₂ = (2, 1, 2, 1),   w₃ = (1, 1, 1, 1),   w₄ = (3, 1, 3, 1).
```

Find a basis of `V` from among the `wᵢ`'s and state `dim V`.

**Solution.** Stack as columns of `M`:

```
         ⎡ 1   2   1   3 ⎤
         ⎢ 0   1   1   1 ⎥
   M  =  ⎢ 1   2   1   3 ⎥ .
         ⎣ 0   1   1   1 ⎦
```

Row-reduce. `R₃ ← R₃ − R₁` kills row 3; `R₄ ← R₄ − R₂` kills row 4:

```
         ⎡ 1   2   1   3 ⎤
         ⎢ 0   1   1   1 ⎥
         ⎢ 0   0   0   0 ⎥
         ⎣ 0   0   0   0 ⎦
```

Then `R₁ ← R₁ − 2R₂`:

```
         ⎡ 1   0  −1   1 ⎤
         ⎢ 0   1   1   1 ⎥   =  RREF(M).
         ⎢ 0   0   0   0 ⎥
         ⎣ 0   0   0   0 ⎦
```

Pivots in columns 1, 2. So the **pivot columns of the original `M`** — namely `w₁` and `w₂` — are a basis of `V`:

> **Basis of `V`:**  `{w₁, w₂} = {(1, 0, 1, 0), (2, 1, 2, 1)}`.

`dim V = 2`. (Check: is `w₃ = w₂ − w₁`? `(2−1, 1−0, 2−1, 1−0) = (1, 1, 1, 1) ✓`. Is `w₄ = w₁ + w₂`? `(1+2, 0+1, 1+2, 0+1) = (3, 1, 3, 1) ✓`. Both confirm redundancy.)

---

## E7 — Rank–nullity from shape alone

**Problem.** Suppose `A` is a `5 × 8` matrix of rank 3. How large is `ker A`? Can `Ax = b` be solvable for every `b ∈ ℝ⁵`?

**Solution.**

- **Kernel size.** Rank–nullity: `rank A + nullity A = n = 8`, so `nullity A = 8 − 3 = 5`. `ker A` is a 5D subspace of ℝ⁸.
- **Image.** `im A` has dimension 3, living in ℝ⁵. Since `3 < 5`, `im A ⊊ ℝ⁵`. So **there exist `b`'s for which `Ax = b` is inconsistent** — namely any `b` outside the 3D `im A`.

**Summary.** A short, wide matrix of low rank: lots of kernel, not onto.

---

## E8 — Coordinates in a non-standard basis

**Problem.** In ℝ³, the vectors

```
   v₁ = (1, 0, 0),   v₂ = (1, 1, 0),   v₃ = (1, 1, 1)
```

form a basis `𝓑` of ℝ³. (You can check: the matrix `[v₁ | v₂ | v₃]` is upper-triangular with 1's on the diagonal, hence invertible.) Find `[x]_𝓑` for `x = (4, 3, 2)`.

**Solution.** Solve `c₁ v₁ + c₂ v₂ + c₃ v₃ = x`:

```
   c₁ · (1, 0, 0) + c₂ · (1, 1, 0) + c₃ · (1, 1, 1) = (4, 3, 2)
```

Component by component:

```
   c₁ + c₂ + c₃ = 4        (from row 1)
          c₂ + c₃ = 3      (from row 2)
                 c₃ = 2    (from row 3)
```

Back-substitute: `c₃ = 2`; `c₂ = 3 − 2 = 1`; `c₁ = 4 − 1 − 2 = 1`.

> **`[x]_𝓑 = (1, 1, 2)`.**

*Sanity check.* Rebuild: `1·(1,0,0) + 1·(1,1,0) + 2·(1,1,1) = (1+1+2, 0+1+2, 0+0+2) = (4, 3, 2) ✓`.

*Matrix form.* `S_𝓑 = [v₁ | v₂ | v₃]` is upper-triangular. `[x]_𝓑 = S_𝓑⁻¹ x`, which is exactly the back-substitution we just did.

---

## E9 — Change-of-basis matrix

**Problem.** In ℝ², the two bases

```
   𝓑 = (b₁, b₂) = ((1, 2), (0, 1)),        𝓒 = (c₁, c₂) = ((1, 1), (−1, 1)).
```

Build the change-of-basis matrix `P_{𝓑 → 𝓒}` that converts 𝓑-coordinates to 𝓒-coordinates. Then convert `[x]_𝓑 = (3, 4)` to 𝓒-coordinates.

**Solution.** Per §5.10.1, `P = S_𝓒⁻¹ S_𝓑` where `S_𝓑 = [b₁ | b₂]` and `S_𝓒 = [c₁ | c₂]`.

```
            ⎡ 1   0 ⎤                ⎡ 1  −1 ⎤
   S_𝓑  =  ⎣ 2   1 ⎦ ,      S_𝓒  =  ⎣ 1   1 ⎦.
```

Compute `S_𝓒⁻¹`. Determinant `= 1·1 − (−1)·1 = 2`. So

```
               1     ⎡  1    1 ⎤        ⎛  1/2    1/2 ⎞
   S_𝓒⁻¹  =  ─── ·  ⎣ −1    1 ⎦    =   ⎜               ⎟.
               2                        ⎝ −1/2    1/2  ⎠
```

Multiply:

```
                     ⎛  1/2    1/2 ⎞ ⎡ 1   0 ⎤    ⎛  3/2    1/2 ⎞
   P = S_𝓒⁻¹ S_𝓑 = ⎜               ⎟ ⎢       ⎥ = ⎜              ⎟.
                     ⎝ −1/2    1/2  ⎠ ⎣ 2   1 ⎦    ⎝  1/2    1/2  ⎠
```

Convert `[x]_𝓑 = (3, 4)`:

```
   [x]_𝓒  =  P · (3, 4)  =  (3/2 · 3 + 1/2 · 4,   1/2 · 3 + 1/2 · 4)
                          =  (9/2 + 2,   3/2 + 2)
                          =  (13/2,   7/2).
```

**Check.** Rebuild `x` from each basis and compare.

- From `𝓑`: `x = 3·(1, 2) + 4·(0, 1) = (3, 10)`.
- From `𝓒`: `x = 13/2 · (1, 1) + 7/2 · (−1, 1) = (13/2 − 7/2, 13/2 + 7/2) = (3, 10) ✓`.

---

## E10 — Network flow and the kernel

**Problem.** A small junction has 4 nodes connected by 5 directed pipes. Let `xᵢ` = flow rate in pipe `i`. **Conservation** at each node (flow in = flow out) gives the `4 × 5` system `A x = 0` with

```
         ⎡  1   1   0   0   0 ⎤       (node 1: pipes 1 and 2 leave)
         ⎢ −1   0   1   1   0 ⎥       (node 2: pipe 1 arrives; pipes 3, 4 leave)
   A  =  ⎢  0  −1  −1   0   1 ⎥       (node 3: pipes 2, 3 arrive; pipe 5 leaves)
         ⎣  0   0   0  −1  −1 ⎦ .     (node 4: pipes 4, 5 arrive)
```

Find all flow patterns compatible with conservation (i.e. a basis of `ker A`) and discuss what it says about the network.

**Solution.** The compatible patterns are exactly `ker A`. Row-reduce `A`:

```
   R₂ ← R₂ + R₁:

         ⎡  1   1   0   0   0 ⎤
         ⎢  0   1   1   1   0 ⎥
         ⎢  0  −1  −1   0   1 ⎥
         ⎣  0   0   0  −1  −1 ⎦

   R₃ ← R₃ + R₂:

         ⎡  1   1   0   0   0 ⎤
         ⎢  0   1   1   1   0 ⎥
         ⎢  0   0   0   1   1 ⎥
         ⎣  0   0   0  −1  −1 ⎦

   R₄ ← R₄ + R₃:

         ⎡  1   1   0   0   0 ⎤
         ⎢  0   1   1   1   0 ⎥
         ⎢  0   0   0   1   1 ⎥
         ⎣  0   0   0   0   0 ⎦

   R₁ ← R₁ − R₂,   R₂ ← R₂ − R₃:

         ⎡  1   0  −1  −1   0 ⎤
         ⎢  0   1   1   0  −1 ⎥   =  RREF(A).
         ⎢  0   0   0   1   1 ⎥
         ⎣  0   0   0   0   0 ⎦
```

Pivots in columns 1, 2, 4. Free variables `x₃ = s`, `x₅ = t`. Back-substitute:

```
   x₄ = −t
   x₂ = −s + t
   x₁ = s + t.
```

So

```
   x  =  s · (1, −1, 1, 0, 0)  +  t · (1, 1, 0, −1, 1).
```

> `ker A = span((1, −1, 1, 0, 0), (1, 1, 0, −1, 1))`, `dim ker A = 2`.

**Rank–nullity check.** Three pivots ⇒ `rank A = 3`. `rank + nullity = 3 + 2 = 5 = n` ✓.

**Interpretation.** Two independent "circulation patterns" exhaust the space of conservation-compatible flows. Any feasible flow is a linear combination of these two basis patterns. The dimension of the kernel is a structural property of the network's graph — no amount of boundary data can change it. In Chapter 7 you'll see that this kernel dimension equals the number of independent *cycles* in the underlying graph.
