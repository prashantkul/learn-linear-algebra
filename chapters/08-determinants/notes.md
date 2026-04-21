# Chapter 8 — Determinants: Algebra and Geometry

> *"The determinant is one number attached to a square matrix that simultaneously answers three different questions — Is `A` invertible? By how much does `A` stretch volumes? How does `A` flip orientation? — and every computation in this chapter is a different way of squeezing that one number out."*

## 8.0 A problem to anchor everything else

Suppose I hand you

```
        ⎡ 2   1   3 ⎤
   A =  ⎢ 1   4   2 ⎥ ,
        ⎣ 3   2   5 ⎦
```

and ask three questions at once:

1. **Is `A` invertible?** Can I solve `Ax = b` uniquely for every `b`? Equivalently: are the columns of `A` linearly independent?
2. **What is the volume of the parallelepiped** whose edges are the three columns of `A`?
3. **Does `A` preserve orientation** (right-hand rule) or reverse it?

In Chapters 3–5 we could answer (1) by row-reducing `A` and checking for a zero row, or by computing `rank A`. But we had no *single number* to attach to `A` that told us the answer at a glance — let alone a number that also decided (2) and (3). That number is the **determinant**, `det A` (also written `|A|`), and it exists for every square matrix.

For the `A` above, it turns out `det A = 3`, which tells us three things simultaneously:

- **`3 ≠ 0`, so `A` is invertible.** (That's the algebra.)
- **The parallelepiped spanned by `A`'s columns has volume `3`.** (That's the geometry.)
- **`3 > 0`, so `A` preserves orientation** — it's an orientation-preserving deformation of ℝ³. (That's the *signed* geometry.)

This chapter answers six tightly linked questions:

1. What *is* the determinant, defined from first principles so that everything above comes out?
2. How do we **compute** it efficiently (not by the textbook formula, which is exponential)?
3. How does `det` interact with the four elementary operations (row swaps, scalings, row additions, transpose)?
4. Why is `det(AB) = det(A) · det(B)` — the **multiplicativity** miracle?
5. How do we read `det A` **geometrically** as a signed volume scaling factor?
6. What does it buy us? (Cramer's Rule, the adjugate inverse formula, and the setup for characteristic polynomials in Ch 9.)

**Why this chapter, right after orthogonality?** Chapter 7 taught us to project; this chapter teaches us to *measure volume*. The two are the classical "algebraic" and "geometric" companion tools that make eigenvalue theory (Ch 9) work. You can't state "`det(A − λI) = 0`" without knowing what `det` means.

---

## 8.1 Quick recap and notation

From Ch 3: elementary row operations (swap rows, scale a row, add a multiple of one row to another) and the fact that every square matrix reduces to an upper-triangular matrix by a sequence of such operations.

From Ch 4: the composition of linear transformations is matrix multiplication; invertibility of a linear map corresponds to invertibility of its matrix.

From Ch 5: a matrix has full rank iff its columns are linearly independent iff `ker A = {0}`.

New vocabulary for this chapter:

| Notation / term | Meaning |
|---|---|
| `det A` or `\|A\|` | The **determinant** of the square matrix `A`. |
| `n!` | `n` **factorial**: `n · (n−1) · … · 2 · 1`. The number of permutations of `{1, …, n}`. |
| `S_n` | The **symmetric group**: all permutations `σ: {1,…,n} → {1,…,n}`. `\|S_n\| = n!`. |
| `sgn(σ)` | The **sign** of a permutation: `+1` if `σ` is a product of an even number of swaps, `−1` if odd. |
| `A_{ij}` | The **(i, j)-minor**: `det` of the `(n−1) × (n−1)` submatrix obtained by deleting row `i` and column `j`. |
| `C_{ij} = (−1)^{i+j} A_{ij}` | The **(i, j)-cofactor** of `A`. |
| `adj(A)` | The **adjugate** (classical adjoint) of `A`: the transpose of the cofactor matrix. |
| `vol(P)` | The `n`-dimensional **volume** of the parallelepiped `P`. |

> **Convention.** `det` is defined for *square* matrices only. Throughout this chapter, `A` is `n × n` unless stated otherwise.

---

## 8.2 Determinant of a 2×2 matrix: area of a parallelogram

Let's start small. Given

```
   A = ⎡ a   b ⎤ ,
       ⎣ c   d ⎦
```

define

> ```
>    det A  :=  ad − bc.
> ```

Why this formula? Look at the picture. The columns `u = (a, c)` and `v = (b, d)` span a parallelogram in ℝ². A calculation (drop a perpendicular, compute base times height) shows its area is exactly `|ad − bc|`. The **sign** distinguishes the two ways you can order `(u, v)`:

- If `v` is counterclockwise from `u` (the "standard" orientation of ℝ²), `ad − bc > 0`.
- If `v` is clockwise from `u`, `ad − bc < 0`.

So for 2×2, `det A` is the **signed area** of the parallelogram spanned by the columns.

**Three quick sanity checks.**

1. **Identity.** `det I_2 = 1·1 − 0·0 = 1`. ✓ (The unit square has area 1.)
2. **Rotation.** For `R(θ) = [[cos θ, −sin θ], [sin θ, cos θ]]`,  `det R = cos²θ + sin²θ = 1`. ✓ (Rotations preserve area.)
3. **Reflection.** For `F = [[1, 0], [0, −1]]` (flip across x-axis),  `det F = −1`. ✓ (Area preserved, orientation flipped.)

**Degeneracy test.** `det A = 0` iff `(a, c)` and `(b, d)` are linearly dependent — the "parallelogram" collapses to a line segment with zero area. This is our first glimpse of **"`det A = 0` ⇔ not invertible."**

---

## 8.3 Permutations and their sign

To generalize beyond 2×2 we need a combinatorial tool.

A **permutation** of `{1, 2, …, n}` is a bijection `σ: {1,…,n} → {1,…,n}`. We write it in "two-line" form,

```
       1  2  3  4
   σ = 2  4  1  3
```

meaning `σ(1) = 2, σ(2) = 4, σ(3) = 1, σ(4) = 3`. The set of all such `σ` is `S_n`, with `|S_n| = n!`.

### 8.3.1 Cycles and transpositions

A **transposition** (or swap) is a permutation that exchanges two elements and fixes the rest: `τ = (i  j)`. Any permutation can be written as a product of transpositions (possibly in many ways).

> **Theorem (parity).** If `σ = τ_1 τ_2 ⋯ τ_k = τ'_1 τ'_2 ⋯ τ'_ℓ` are two decompositions of the same `σ` into transpositions, then `k` and `ℓ` have the same **parity** (both even, or both odd).

This lets us define

> ```
>    sgn(σ)  :=  (−1)^k  =  ⎧ +1  if σ is a product of an even number of swaps,
>                            ⎩ −1  if σ is a product of an odd number of swaps.
> ```

The sign is a group homomorphism: `sgn(σ ∘ τ) = sgn(σ) · sgn(τ)`.

### 8.3.2 Counting inversions (a practical way to find the sign)

An **inversion** of `σ` is a pair `(i, j)` with `i < j` but `σ(i) > σ(j)`. The sign of `σ` equals `(−1)^{(number of inversions)}`.

**Example.** `σ = (2, 4, 1, 3)`. Inversions: `(1,3)` because `2 > 1`; `(2,3)` because `4 > 1`; `(2,4)` because `4 > 3`. Three inversions → `sgn(σ) = −1`.

---

## 8.4 The Leibniz formula: a first-principles definition of det

With `sgn` in hand we can *define* the determinant of any `n × n` matrix by a single formula:

> **Definition (Leibniz).** For an `n × n` matrix `A = (a_{ij})`,
>
> ```
>    det A  :=  Σ_{σ ∈ S_n}  sgn(σ) · a_{1, σ(1)} · a_{2, σ(2)} · ⋯ · a_{n, σ(n)}.
> ```

**In words.** Pick one entry from each row, with the column indices forming a permutation `σ`; multiply those `n` entries; attach the sign of `σ`; sum over all `n!` such choices.

### 8.4.1 Sanity check: 2×2 and 3×3

For `n = 2`, `S_2 = {id, (1 2)}` with signs `+1, −1`. The formula gives

```
   det A  =  a_{11} a_{22}  −  a_{12} a_{21}  =  ad − bc.  ✓
```

For `n = 3`, there are `3! = 6` terms. Writing them out by listing the six permutations and their signs yields the familiar **"Sarrus rule"**:

```
   det A  =  a_{11} a_{22} a_{33}  +  a_{12} a_{23} a_{31}  +  a_{13} a_{21} a_{32}
         −  a_{13} a_{22} a_{31}  −  a_{11} a_{23} a_{32}  −  a_{12} a_{21} a_{33}.
```

### 8.4.2 Why Leibniz is a *bad* way to compute

The sum has `n!` terms. For `n = 10` that's already `3.6 × 10⁶`; for `n = 20` it's `2.4 × 10¹⁸`. We'll use Leibniz only to **prove theorems**, never to compute. The practical algorithm is row reduction (§8.7), which costs `O(n³)`.

### 8.4.3 First consequences (all follow from staring at the formula)

- **Linearity in each row.** If you scale row `k` by `c`, every term picks up exactly one factor of `c` (the one from row `k`). So `det` is linear in each row separately (it is multilinear as a function of the rows).
- **Alternating.** If two rows are equal, every term `a_{1,σ(1)} ⋯ a_{n,σ(n)}` appears twice — once with a `+` sign and once with a `−` sign, paired by swapping the column images of those two rows. They cancel, so `det A = 0`.
- **`det I = 1`.** Only the identity permutation contributes; all others hit a zero somewhere.

These three properties — **multilinear, alternating, normalized** — uniquely determine `det`. (Any function `f: M_n(ℝ) → ℝ` that is multilinear in the rows, alternating, and satisfies `f(I) = 1` must equal `det`.) This **axiomatic** characterization is a useful shortcut in proofs.

---

## 8.5 Cofactor (Laplace) expansion

The Leibniz formula is a sum; the **cofactor expansion** is a recursion. Both compute the same number.

### 8.5.1 Minors and cofactors

Given an `n × n` matrix `A`, delete row `i` and column `j`. What's left is an `(n−1) × (n−1)` matrix. Its determinant is the **(i, j)-minor** `A_{ij}`. Weight it by a sign:

> ```
>    C_{ij}  :=  (−1)^{i+j}  A_{ij}           (the (i, j)-cofactor).
> ```

The sign pattern `(−1)^{i+j}` is the **checkerboard**:

```
   ⎡ +  −  +  −  ⎤
   ⎢ −  +  −  +  ⎥
   ⎢ +  −  +  −  ⎥
   ⎣ −  +  −  +  ⎦
```

### 8.5.2 The Laplace expansion theorem

> **Theorem.** For each fixed row `i`,
>
> ```
>    det A  =  a_{i1} C_{i1}  +  a_{i2} C_{i2}  +  ⋯  +  a_{in} C_{in}.
> ```
>
> For each fixed column `j`,
>
> ```
>    det A  =  a_{1j} C_{1j}  +  a_{2j} C_{2j}  +  ⋯  +  a_{nj} C_{nj}.
> ```

**Proof sketch.** Group the `n!` terms in the Leibniz sum by the value of `σ(i)`: for each choice `σ(i) = j`, the remaining factors form a Leibniz sum over permutations of the remaining `n−1` columns — that's exactly `A_{ij}`. The sign bookkeeping produces the `(−1)^{i+j}`.

### 8.5.3 Strategic choice of row/column

Since you can expand along **any** row or column, pick one with many zeros. Expanding along a row with `k` zeros removes `k` of the `n` terms, turning an `n`-term sum into an `(n − k)`-term sum.

**Worked example.** Let

```
       ⎡ 1   2   0   0 ⎤
   A = ⎢ 0   3   0   0 ⎥ .
       ⎢ 4   5   6   0 ⎥
       ⎣ 7   8   9   2 ⎦
```

Column 4 has three zeros. Expand:

```
   det A  =  2 · (−1)^{4+4} · det⎡ 1  2  0 ⎤
                                 ⎢ 0  3  0 ⎥
                                 ⎣ 4  5  6 ⎦
         =  2 · (1 · 3 · 6)   =  36.
```

The inner `3×3` was upper-triangular in the useful way, so its determinant is just the product of its diagonal. We'll formalize that next.

---

## 8.6 Elementary row operations and the determinant

This is the **working rulebook** for computing determinants by hand. Each of the three elementary row operations has a predictable effect.

| Operation | Effect on `det` |
|---|---|
| **Swap rows `i` and `j`** (`i ≠ j`) | Multiplies `det` by `−1`. |
| **Scale row `i` by `c`** (`c ≠ 0`) | Multiplies `det` by `c`. |
| **Add `c · (row j)` to row `i`** (`i ≠ j`) | Leaves `det` unchanged. |

**Why.** Multilinearity gives the scaling rule directly. Alternating gives the swap rule: expand `det([rows with `i, j` swapped])` by multilinearity of the sum of the two rows — the cross terms vanish because they duplicate a row. The row-addition rule follows: adding `c · (row j)` to row `i` changes `det` by `c · det([row j in place of row i]) = c · 0 = 0`.

### 8.6.1 Zero-determinant diagnostics

These three together give several "instant zero" conditions:

- **Two equal rows** → `det = 0` (alternating).
- **A zero row** → `det = 0` (scale that row by `0`, which leaves it the same, so `det = 0 · det = 0`).
- **Rows linearly dependent** → `det = 0` (some row is a combination of the others; subtract that combination to get a zero row).

**Bottom line:**

> **`det A ≠ 0` ⇔ rows of `A` are linearly independent ⇔ `A` is invertible.**

This is the single most useful fact in the chapter. Every appearance of `det` in Ch 9 (characteristic polynomial) is really a disguised invertibility test.

---

## 8.7 Computing det by row reduction (the practical algorithm)

Row-reduce `A` to an upper-triangular matrix `U`, keeping track of the scalar factors you accumulate. Then read off `det U` trivially.

### 8.7.1 Upper-triangular means easy

> **Lemma.** If `U` is upper-triangular, `det U` is the product of its diagonal entries:
>
> ```
>    det U  =  u_{11} · u_{22} · ⋯ · u_{nn}.
> ```

**Proof.** In the Leibniz sum, the only `σ` with a nonzero contribution is the identity: if `σ(k) < k` for some `k`, then `a_{k, σ(k)} = 0` (below the diagonal). So the non-identity terms all vanish, and the identity term is `a_{11} a_{22} ⋯ a_{nn}`.

### 8.7.2 The algorithm

1. **Forward elimination.** Use row additions (which don't change `det`) to zero out entries below the diagonal. If you need to swap rows to avoid a zero pivot, swap — and remember each swap flips the sign.
2. **If you rescale** a row to get a nicer pivot, divide `det` by that scale (or just avoid scaling — row additions alone suffice).
3. When `A` has become upper-triangular `U`, compute the diagonal product and correct for the accumulated sign/scale:

   ```
      det A  =  (−1)^{(# swaps)}  ·  (product of diagonal of U)  /  (product of any scalings applied).
   ```

### 8.7.3 Worked example

Compute `det A` for

```
       ⎡ 2   1   3 ⎤
   A = ⎢ 1   4   2 ⎥ .
       ⎣ 3   2   5 ⎦
```

Step 1: `R_2 ← R_2 − (1/2) R_1`, then `R_3 ← R_3 − (3/2) R_1`. These are pure row additions, no effect on `det`.

```
   ⎡ 2     1      3    ⎤
   ⎢ 0    7/2   1/2    ⎥
   ⎣ 0    1/2   1/2    ⎦
```

Step 2: `R_3 ← R_3 − (1/7) R_2`.

```
   ⎡ 2     1        3      ⎤
   ⎢ 0    7/2     1/2      ⎥
   ⎣ 0     0      3/7      ⎦
```

`det A = 2 · (7/2) · (3/7) = 3`.

**No swaps, no scalings** — so `det A` is just the product of the pivots. The invertibility, the volume, and the orientation of `A` are all read off this one number: `3 ≠ 0` (invertible), `|3| = 3` (volume), `3 > 0` (orientation preserved).

### 8.7.4 LU as the compressed version of this story

If `A = LU` (an LU factorization with `L` lower-unit-triangular and `U` upper-triangular), then `det A = det L · det U = 1 · (u_{11} ⋯ u_{nn})`. Partial pivoting may insert a permutation matrix `P` on the left, giving `PA = LU`, and then `det A = (−1)^{(# swaps in P)} · det U`. This is what `numpy.linalg.det` does under the hood.

---

## 8.8 Multiplicativity: `det(AB) = det(A) · det(B)`

The single most useful algebraic property of `det`.

> **Theorem (multiplicativity).** For any two `n × n` matrices `A, B`,
>
> ```
>    det(AB)  =  det(A) · det(B).
> ```

**Proof sketch.** Fix `B` and define `f(A) := det(AB) / det(B)` when `det B ≠ 0`. Check that `f` is multilinear and alternating in the rows of `A` and `f(I) = 1`. By the uniqueness theorem (§8.4.3), `f(A) = det(A)`, giving `det(AB) = det(A) det(B)`. If `det B = 0` then `B` is not invertible, so `AB` isn't either, so `det(AB) = 0 = det(A) · 0`.

### 8.8.1 Consequences

- **`det(A⁻¹) = 1 / det(A)`** when `A` is invertible. (From `A A⁻¹ = I` apply `det`.)
- **`det(A^k) = (det A)^k`** for integer `k`.
- **`det(PAP⁻¹) = det(A)`** — similar matrices have the same determinant. (Proof: `det P · det A · det P⁻¹ = det A`.) This is why `det(A − λI)` is a well-defined invariant of a linear transformation in Ch 9, not just of a specific matrix.

### 8.8.2 Determinant of block triangular matrices

A useful structural corollary of multiplicativity: if

```
        ⎡ A   C ⎤
   M =  ⎣ 0   D ⎦   (block upper-triangular, A and D square),
```

then `det M = det A · det D`. (Row-reduce the `D` block to upper-triangular, then the whole thing is upper-triangular; or argue directly via Leibniz.) The same holds for block lower-triangular matrices.

**Warning.** This does **not** generalize to general `2 × 2` block matrices: `det ⎡A B; C D⎤` is not `det(A) det(D) − det(B) det(C)` unless the blocks commute in specific ways. Don't guess.

---

## 8.9 Determinant of the transpose

> **Theorem.** For any square matrix, `det(Aᵀ) = det(A)`.

**Proof.** In the Leibniz sum, each term of `det A` is `sgn(σ) · ∏ a_{i, σ(i)}`. Rewriting with `j = σ(i)` (so `i = σ⁻¹(j)`) gives `sgn(σ) · ∏ a_{σ⁻¹(j), j}`. Since `sgn(σ⁻¹) = sgn(σ)` and the sum over `σ` is the same as the sum over `σ⁻¹`, this rearranges exactly to `det(Aᵀ)`.

### 8.9.1 Consequence: row operations ⇔ column operations

Everything in §8.6 applies equally to **column** operations. Swap two columns → `det` flips sign. Scale a column by `c` → `det` scales by `c`. Add a multiple of one column to another → `det` unchanged. This gives you twice as many tools when computing by hand.

---

## 8.10 Geometric interpretation: signed n-volume

### 8.10.1 Parallelepipeds in ℝⁿ

Given vectors `v_1, …, v_n ∈ ℝⁿ`, the **parallelepiped** they span is

```
   P(v_1, …, v_n)  =  { c_1 v_1 + ⋯ + c_n v_n : 0 ≤ c_i ≤ 1 }.
```

It's the `n`-dimensional solid generalization of a parallelogram.

> **Theorem (determinant as signed volume).** Let `A` be the `n × n` matrix whose columns are `v_1, …, v_n`. Then
>
> ```
>    vol P(v_1, …, v_n)  =  | det A |,
> ```
>
> and `det A` is **positive** exactly when `(v_1, …, v_n)` is an **oriented basis** (right-handed, matching the standard orientation of ℝⁿ).

**Sketch.** Volume is multilinear and alternating in the columns (stretch a column by `c`, volume scales by `|c|`; swap two columns, same parallelepiped so volume unchanged but orientation flips). Since signed volume and `det` agree on the standard basis (both equal 1), the uniqueness theorem forces them to agree on every basis.

### 8.10.2 Linear transformations scale volumes by `|det|`

> **Corollary.** If `T: ℝⁿ → ℝⁿ` is the linear transformation with matrix `A`, then for **any** measurable region `R ⊂ ℝⁿ`,
>
> ```
>    vol(T(R))  =  | det A | · vol(R).
> ```

**Why.** A region can be approximated by a union of small cubes; each cube maps to a parallelepiped of volume `|det A| · (cube volume)`; take the limit.

This is the statement that multivariable calculus uses (the Jacobian `|J|` in change-of-variables is exactly `|det(J)|`). It's also the single sentence that explains *every* geometric application of the determinant you'll ever see.

### 8.10.3 Orientation and the sign

- `det A > 0`: `T` preserves orientation (a right-handed frame stays right-handed).
- `det A < 0`: `T` reverses orientation (reflections, odd number of coordinate swaps).
- `det A = 0`: `T` collapses ℝⁿ into a lower-dimensional subspace — volume flattens to zero.

### 8.10.4 A 2×2 example to keep in mind

```
       ⎡ 3   1 ⎤
   A = ⎣ 1   2 ⎦ .
```

`det A = 6 − 1 = 5`. So the unit square `[0,1]²` maps under `A` to a parallelogram of area `5`, with orientation preserved. The columns `(3, 1)` and `(1, 2)` span that parallelogram; you can verify the area by any of (i) the formula `|ad − bc|`, (ii) the cross-product magnitude, or (iii) integrating directly.

---

## 8.11 Cramer's Rule

For an invertible `A`, the solution `x = A⁻¹ b` to `Ax = b` has a closed-form expression component-by-component.

> **Theorem (Cramer).** If `det A ≠ 0`, then the unique solution of `Ax = b` satisfies
>
> ```
>    x_i  =  det A_i  /  det A,
> ```
>
> where `A_i` is `A` with its `i`-th column replaced by `b`.

**Proof.** Consider the matrix `X_i` obtained from `I` by replacing its `i`-th column with the unknown vector `x`. Compute `A · X_i`: this replaces the `i`-th column of `A` with `A x = b`, giving `A_i`. Taking determinants, `det A · det X_i = det A_i`. But `X_i` is upper-triangular except for the `i`-th column, so `det X_i = x_i`. Hence `x_i · det A = det A_i`.

### 8.11.1 Example: Cramer on a 2×2

Solve `2x + y = 5`, `x + 3y = 4`.

```
   det A = det⎡2  1⎤ = 5,   det A_1 = det⎡5  1⎤ = 11,   det A_2 = det⎡2  5⎤ = 3.
              ⎣1  3⎦                    ⎣4  3⎦                    ⎣1  4⎦

   x = 11/5,   y = 3/5.
```

### 8.11.2 When to use Cramer, and when not to

- **Use it** when you need a single component `x_i` of the solution and `n` is small, or when you need a *symbolic* formula (`x` as a rational function of the matrix entries — useful in proofs).
- **Don't use it for numerical work.** Cramer's Rule computes `n + 1` determinants and is `O(n · n!)` in naive form or `O(n⁴)` even with clever row-reduction — much worse than `O(n³)` Gaussian elimination, and numerically less stable.

---

## 8.12 The adjugate and the inverse formula

A companion theorem to Cramer's. Define the **cofactor matrix** `C = (C_{ij})` and the **adjugate**

> ```
>    adj(A)  :=  Cᵀ    (transpose of the cofactor matrix).
> ```

> **Theorem.** For any `n × n` matrix `A`,
>
> ```
>    A · adj(A)  =  adj(A) · A  =  (det A) · I.
> ```
>
> Hence, if `det A ≠ 0`,
>
> ```
>    A⁻¹  =  (1 / det A) · adj(A).
> ```

**Proof sketch.** Entry `(i, j)` of `A · adj(A)` is `Σ_k a_{ik} C_{jk}`. If `i = j`, this is the cofactor expansion of `det A` along row `i`, giving `det A`. If `i ≠ j`, this is the cofactor expansion (along row `j`) of the matrix obtained from `A` by replacing row `j` with row `i` — which has two equal rows, so its determinant is `0`.

### 8.12.1 Example: inverse of a 2×2 by adjugate

```
   A = ⎡ a   b ⎤ ,   adj(A) = ⎡  d   −b ⎤ ,   A⁻¹ = (1/(ad−bc))⎡  d   −b ⎤ .
       ⎣ c   d ⎦               ⎣ −c    a ⎦                     ⎣ −c    a ⎦
```

This is the inverse formula you've been using since high school, derived in one line.

### 8.12.2 Why this is a theoretical tool, not a computational one

The adjugate has `n²` entries, each an `(n−1) × (n−1)` determinant — so computing `A⁻¹` via adjugate costs `O(n² · (n−1)!)`. Don't. Use Gaussian elimination. But the **formula** is invaluable in proofs: it shows `A⁻¹`'s entries are rational functions of `A`'s entries, with denominator `det A`.

---

## 8.13 Looking ahead: eigenvalues and change of variables

Two applications the determinant is secretly the foundation of.

### 8.13.1 Eigenvalues (preview of Ch 9)

An **eigenvalue** of `A` is a scalar `λ` for which `A − λI` is **not invertible** — equivalently, `det(A − λI) = 0`. The polynomial `p_A(λ) := det(A − λI)` is the **characteristic polynomial** of `A`; its roots are the eigenvalues. The next chapter is built on this single fact.

### 8.13.2 Change of variables in multivariable calculus

If `Φ: U → V` is a smooth invertible map between open regions of ℝⁿ, and `f: V → ℝ` is integrable, then

```
   ∫_V f(y) dy  =  ∫_U f(Φ(x)) · |det(JΦ(x))| dx,
```

where `JΦ(x)` is the **Jacobian matrix** of partial derivatives. The factor `|det(JΦ)|` is the local volume scaling factor — exactly the content of §8.10, applied infinitesimally.

---

## 8.14 Summary

- `det A` is the unique multilinear, alternating function of the rows (or columns) of `A` with `det I = 1`.
- Computed directly: Leibniz (exponential, theoretical), cofactor/Laplace expansion (quadratic recursion, handy for small or sparse matrices), or row reduction to upper-triangular (the practical `O(n³)` algorithm).
- Behaves under operations: swap rows → flip sign; scale row by `c` → multiply by `c`; add multiple of row → unchanged; transpose → unchanged.
- **Multiplicative:** `det(AB) = det(A) · det(B)`, giving `det(A⁻¹) = 1/det(A)` and similarity invariance `det(PAP⁻¹) = det A`.
- **Geometric:** `|det A|` is the volume scaling factor of `A` as a linear map; `sign(det A)` is orientation.
- **Invertibility test:** `det A ≠ 0` ⇔ `A` invertible ⇔ columns linearly independent ⇔ `ker A = 0`.
- **Applications:** Cramer's Rule (closed-form solution components), adjugate (closed-form inverse formula), Jacobian in change-of-variables integrals, characteristic polynomial `det(A − λI)` (Ch 9).

The determinant is a *single number* carrying a lot of information. Most of what you'll do with it downstream — eigenvalues, volume, orientation, the Jacobian — is an application of one of the properties above.
