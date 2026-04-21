# Chapter 8 — Exercises

Ten problems with full answers. Every numerical result has been checked in exact rational arithmetic (see `code/sage/`).

---

## X1. 2×2 determinant and signed area

**Problem.** For `A = ⎡5  3⎤ ⎣2  4⎦`, compute `det A`. What is the (unsigned) area of the parallelogram spanned by the columns of `A`? Is the ordered pair of columns right-handed?

**Answer.**

`det A = 5·4 − 3·2 = 20 − 6 = 14`. Area = 14. Right-handed (`det > 0`).

---

## X2. 3×3 by cofactor expansion

**Problem.** Let

```
       ⎡ 1   2   3 ⎤
   A = ⎢ 0   4   5 ⎥ .
       ⎣ 1   0   6 ⎦
```

Compute `det A` by cofactor expansion along (a) row 1 and (b) column 1, verifying they agree.

**Answer.**

(a) Along row 1:

```
   det A = 1·det⎡4  5⎤ − 2·det⎡0  5⎤ + 3·det⎡0  4⎤
                ⎣0  6⎦        ⎣1  6⎦        ⎣1  0⎦
         = 1·(24 − 0) − 2·(0 − 5) + 3·(0 − 4)
         = 24 + 10 − 12 = 22.
```

(b) Along column 1:

```
   det A = 1·det⎡4  5⎤ − 0 + 1·det⎡2  3⎤
                ⎣0  6⎦            ⎣4  5⎦
         = (24 − 0) + (10 − 12) = 24 − 2 = 22.   ✓
```

---

## X3. Sparse 4×4 via clever expansion

**Problem.** Compute

```
       ⎡ 0   0   2   0 ⎤
   B = ⎢ 3   0   0   0 ⎥ .
       ⎢ 0   5   0   0 ⎥
       ⎣ 0   0   0   7 ⎦
```

**Answer.** Column 4 has only one nonzero entry: `B₄₄ = 7`. Expand along column 4:

```
   det B = 7·(−1)^{4+4} · det⎡ 0   0   2 ⎤
                              ⎢ 3   0   0 ⎥ .
                              ⎣ 0   5   0 ⎦
```

The 3×3 has exactly one nonzero per row/column — it's a scaled permutation matrix. Expand along row 1:

```
   det⎡0  0  2⎤ = 2·(−1)^{1+3}·det⎡3  0⎤ = 2·(3·5 − 0·0) = 30.
      ⎢3  0  0⎥                   ⎣0  5⎦
      ⎣0  5  0⎦
```

So `det B = 7 · 30 = 210`.

---

## X4. Row operations affect `det` predictably

**Problem.** Let `A` be an `n × n` matrix. Suppose `det A = 4`. For each operation, state the determinant of the resulting matrix.

(a) Swap rows 2 and 4 of `A`.
(b) Multiply row 3 by `1/2`.
(c) Add `2 × (row 1)` to row 3.
(d) Transpose: `Aᵀ`.
(e) `A²`.
(f) `3A`, where `A` is `3 × 3`.

**Answer.**

(a) One swap: `det = −4`.
(b) Scale row by `1/2`: `det = 2`.
(c) Row addition: `det = 4` (unchanged).
(d) `det(Aᵀ) = det A = 4`.
(e) `det(A²) = (det A)² = 16`.
(f) `det(3A) = 3³ · det A = 27 · 4 = 108` (for `3 × 3`; in general `n × n` gives `3ⁿ · 4`).

---

## X5. Multiplicativity and inverse

**Problem.** Let

```
   A = ⎡ 1   2 ⎤ ,   B = ⎡ 2   1 ⎤ .
       ⎣ 3   4 ⎦         ⎣ 1   3 ⎦
```

(a) Compute `det A` and `det B`.
(b) Compute `AB` and then `det(AB)`. Confirm multiplicativity.
(c) Compute `det(A⁻¹)` without computing `A⁻¹`.

**Answer.**

(a) `det A = 1·4 − 2·3 = −2`. `det B = 2·3 − 1·1 = 5`.

(b)

```
   AB = ⎡ 1·2 + 2·1     1·1 + 2·3 ⎤  =  ⎡  4    7 ⎤ .
        ⎣ 3·2 + 4·1     3·1 + 4·3 ⎦      ⎣ 10   15 ⎦
```

`det(AB) = 4·15 − 7·10 = 60 − 70 = −10`. And `det A · det B = (−2)·5 = −10`. ✓

(c) `det(A⁻¹) = 1 / det A = −1/2`.

---

## X6. Cramer's Rule on a 2×2 system

**Problem.** Solve `3x − y = 5`, `2x + 4y = 8` by Cramer's Rule.

**Answer.**

```
   A = ⎡ 3  −1 ⎤ ,    det A = 3·4 − (−1)·2 = 14.
       ⎣ 2   4 ⎦

   A_1 = ⎡ 5  −1 ⎤ ,  det A_1 = 5·4 − (−1)·8 = 20 + 8 = 28.
         ⎣ 8   4 ⎦

   A_2 = ⎡ 3   5 ⎤ ,  det A_2 = 3·8 − 5·2 = 24 − 10 = 14.
         ⎣ 2   8 ⎦
```

`x = 28/14 = 2`, `y = 14/14 = 1`. Check: `3·2 − 1 = 5` ✓, `2·2 + 4·1 = 8` ✓.

---

## X7. Inverse of a 2×2 via the adjugate

**Problem.** Compute the inverse of `A = ⎡ 2  3 ⎤ ⎣ 1  4 ⎦` using `A⁻¹ = (1/det A) · adj(A)`, and verify `A · A⁻¹ = I`.

**Answer.**

`det A = 2·4 − 3·1 = 5`.  `adj(A) = ⎡ 4  −3 ⎤ ⎣ −1  2 ⎦`.  So

```
   A⁻¹ = (1/5) · ⎡  4   −3 ⎤ .
                 ⎣ −1    2 ⎦
```

Check:

```
   A · A⁻¹ = (1/5) · ⎡ 2·4 + 3·(−1)     2·(−3) + 3·2 ⎤
                     ⎣ 1·4 + 4·(−1)     1·(−3) + 4·2 ⎦

           = (1/5) · ⎡  5    0 ⎤   =   I.   ✓
                     ⎣  0    5 ⎦
```

---

## X8. Vandermonde: 4×4 at `(1, 2, 3, 4)`

**Problem.** Using the general Vandermonde identity `V(x_1, …, x_n) = ∏_{i < j} (x_j − x_i)`, compute

```
   V(1, 2, 3, 4)  =  det⎡ 1    1    1    1 ⎤
                        ⎢ 1    2    3    4 ⎥ .
                        ⎢ 1    4    9   16 ⎥
                        ⎣ 1    8   27   64 ⎦
```

**Answer.**

```
   V(1,2,3,4)  =  (2−1)(3−1)(4−1)(3−2)(4−2)(4−3)
              =     1  ·   2  ·   3  ·   1  ·   2  ·   1
              =  12.
```

(Six factors; `n(n−1)/2 = 6` when `n = 4`.) Direct expansion of the 4×4 by cofactors also gives 12 — the closed form is just a lot faster.

---

## X9. Volume of a parallelepiped in ℝ³

**Problem.** Find the volume of the parallelepiped spanned by `u = (1, 0, 2)`, `v = (2, 3, 0)`, `w = (0, 1, 4)`. State the orientation of the ordered triple.

**Answer.** Put `u, v, w` as columns:

```
       ⎡ 1   2   0 ⎤
   A = ⎢ 0   3   1 ⎥ .
       ⎣ 2   0   4 ⎦
```

Expand along row 1:

```
   det A  =  1·(12 − 0) − 2·(0 − 2) + 0
          =  12 + 4  =  16.
```

Volume = `|16| = 16`. `det A = +16 > 0`, so `(u, v, w)` is **right-handed** (same orientation as `(e_1, e_2, e_3)`).

---

## X10. Characteristic polynomial preview (3×3)

**Problem.** Find all `λ` such that `det(A − λI) = 0` for

```
       ⎡ 3   1   1 ⎤
   A = ⎢ 1   3   1 ⎥ .
       ⎣ 1   1   3 ⎦
```

**Answer.** Let `a = 3 − λ`. Using Sarrus on

```
   A − λI = ⎡ a   1   1 ⎤ ,
            ⎢ 1   a   1 ⎥
            ⎣ 1   1   a ⎦
```

we get

```
   det(A − λI)  =  a³ + 1 + 1 − a − a − a
              =  a³ − 3a + 2
              =  (a − 1)² (a + 2).
```

Substituting back `a = 3 − λ`:

```
   (3 − λ − 1)² (3 − λ + 2)  =  (2 − λ)² (5 − λ).
```

Roots: `λ = 2` (multiplicity 2) and `λ = 5`.

These are the **eigenvalues** of `A`. The matrix `A = 2I + J` (where `J` is the all-ones matrix) is a standard example — `J` has eigenvalues `{3, 0, 0}`, so `A` has eigenvalues `{5, 2, 2}`. We'll develop the full picture in Ch 9.
