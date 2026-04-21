# Chapter 8 — Worked Examples

Ten fully solved problems covering 2×2 and 3×3 determinants, row-reduction computation, multiplicativity, geometric volume, Cramer's Rule, the adjugate formula, and a Vandermonde closed-form. Every numerical answer here has been cross-checked in exact rational arithmetic (see `code/sage/`).

---

## E1. Determinant of a 2×2 matrix and the signed area of a parallelogram

**Problem.** Let

```
   A = ⎡ 3   1 ⎤ .
       ⎣ 1   2 ⎦
```

(a) Compute `det A`. (b) What is the area of the parallelogram spanned by the columns of `A`? (c) Is the orientation of that ordered basis the same as `(e_1, e_2)`?

**Solution.**

(a) `det A = (3)(2) − (1)(1) = 6 − 1 = 5`.

(b) The parallelogram spanned by `u = (3, 1)` and `v = (1, 2)` has signed area equal to `det A`, so its **unsigned area** is `|det A| = 5`.

(c) `det A = 5 > 0`, so `(u, v)` has the same orientation as `(e_1, e_2)` — it's a *right-handed* pair in ℝ².

---

## E2. 3×3 determinant three ways (Sarrus, cofactor, row reduction)

**Problem.** Let

```
       ⎡ 2   1   3 ⎤
   A = ⎢ 1   4   2 ⎥ .
       ⎣ 3   2   5 ⎦
```

Compute `det A` by (a) Sarrus rule, (b) cofactor expansion along the first row, (c) row reduction to upper triangular.

**Solution.**

(a) Sarrus rule:

```
   det A  =  (2)(4)(5) + (1)(2)(3) + (3)(1)(2)
           − (3)(4)(3) − (2)(2)(2) − (1)(1)(5)
         =  40 + 6 + 6  −  36 − 8 − 5
         =  52 − 49  =  3.
```

(b) Cofactor expansion along row 1:

```
   det A  =  2 · det⎡4  2⎤  −  1 · det⎡1  2⎤  +  3 · det⎡1  4⎤
                   ⎣2  5⎦            ⎣3  5⎦            ⎣3  2⎦
         =  2 (20 − 4) − 1 (5 − 6) + 3 (2 − 12)
         =  2 · 16 − (−1) + 3 · (−10)
         =  32 + 1 − 30  =  3.
```

(c) Row reduction. Use pure row-add operations (no effect on `det`):

```
   R₂ ← R₂ − ½ R₁:    [0,  7/2,   1/2]
   R₃ ← R₃ − 3/2 R₁:  [0,  1/2,   1/2]
   R₃ ← R₃ − 1/7 R₂:  [0,   0,    3/7]
```

(`1/2 − (1/7)(1/2) = 1/2 − 1/14 = 6/14 = 3/7`.)

The upper-triangular form has diagonal `(2, 7/2, 3/7)`. `det A = 2 · (7/2) · (3/7) = 3`. ✓

All three methods agree: `det A = 3`.

---

## E3. Row-reduction shortcut: a sparse 4×4

**Problem.** Compute

```
          ⎡ 1   2   0   0 ⎤
   det B = ⎢ 0   3   0   0 ⎥ .
          ⎢ 4   5   6   0 ⎥
          ⎣ 7   8   9   2 ⎦
```

**Solution.** The matrix is lower-triangular in the first two rows and has a zero above the diagonal everywhere else — it's already **upper-triangular** after relabeling rows (but notice it's actually *lower* triangular as given, except rows 1–2 are already zero above). Let's be careful: the matrix is **lower triangular** in the usual sense — all entries *above* the main diagonal are zero. (Check: the upper-right triangle has entries `B₁₂ = 2` … wait, `B₁₂ = 2 ≠ 0`.)

Let me re-examine. The entry `B₁₂ = 2` is on the first superdiagonal, so `B` is **not** triangular. But **column 4** has only one nonzero entry (`B₄₄ = 2`), and **column 3** has just two nonzeros. Expand along column 4:

```
   det B  =  2 · (−1)^{4+4} · det⎡ 1  2  0 ⎤
                                 ⎢ 0  3  0 ⎥
                                 ⎣ 4  5  6 ⎦.
```

The 3×3 minor: expand along column 3. Only `C₃₃ = 6` is nonzero:

```
   det⎡ 1  2  0 ⎤
      ⎢ 0  3  0 ⎥  =  6 · (−1)^{3+3} · det⎡ 1  2 ⎤  =  6 · (1·3 − 2·0)  =  18.
      ⎣ 4  5  6 ⎦                        ⎣ 0  3 ⎦
```

So `det B = 2 · 18 = 36`.

**Moral.** Don't expand blindly along row 1. Pick the row or column with the most zeros.

---

## E4. A Vandermonde closed form (3×3)

**Problem.** Compute

```
   V(a, b, c)  =  det⎡ 1    1    1   ⎤
                     ⎢ a    b    c   ⎥
                     ⎣ a²   b²   c²  ⎦,
```

and verify the identity `V(a, b, c) = (b − a)(c − a)(c − b)`.

**Solution.** Expand along row 1:

```
   V  =  1 · det⎡ b    c  ⎤   −  1 · det⎡ a    c  ⎤  +  1 · det⎡ a    b  ⎤
               ⎣ b²   c² ⎦              ⎣ a²   c² ⎦              ⎣ a²   b² ⎦
     =  (bc² − b²c) − (ac² − a²c) + (ab² − a²b)
     =  bc(c − b) − ac(c − a) + ab(b − a).
```

Rearrange:

```
   V  =  c²(b − a)  −  c(b² − a²)  +  ab(b − a)
      =  (b − a) [c² − c(b + a) + ab]
      =  (b − a) (c − a)(c − b).    ✓
```

(Using `c² − c(a + b) + ab = (c − a)(c − b)`.)

**Why this matters.** `V = 0` iff two of `{a, b, c}` are equal — exactly the condition under which polynomial interpolation at those three x-coordinates fails. The Vandermonde appears again in Ch 9 and in numerical-analysis applications.

---

## E5. Multiplicativity check on 2×2

**Problem.** Let

```
   A = ⎡ 2   1 ⎤ ,   B = ⎡ 3   0 ⎤ .
       ⎣ 0   3 ⎦         ⎣ 1   2 ⎦
```

Compute `det A`, `det B`, and `det(AB)`; verify `det(AB) = det(A) · det(B)`.

**Solution.**

```
   det A = (2)(3) − (1)(0) = 6,   det B = (3)(2) − (0)(1) = 6.

   AB = ⎡ 2   1 ⎤ · ⎡ 3   0 ⎤  =  ⎡ 7   2 ⎤ .
        ⎣ 0   3 ⎦   ⎣ 1   2 ⎦      ⎣ 3   6 ⎦

   det(AB) = (7)(6) − (2)(3) = 42 − 6 = 36.
```

`det A · det B = 6 · 6 = 36 = det(AB)`. ✓

---

## E6. Cramer's Rule on a 3×3 system

**Problem.** Solve

```
   2x  +  y  +  z  =  4,
    x  + 3y  +  z  =  6,
    x  +  y  + 2z  =  5.
```

**Solution.** Let

```
       ⎡ 2   1   1 ⎤        ⎡ 4 ⎤
   A = ⎢ 1   3   1 ⎥ ,  b = ⎢ 6 ⎥ .
       ⎣ 1   1   2 ⎦        ⎣ 5 ⎦
```

First, `det A`. Cofactor expansion along row 1:

```
   det A  =  2·(3·2 − 1·1) − 1·(1·2 − 1·1) + 1·(1·1 − 3·1)
         =  2·5 − 1·1 + 1·(−2)  =  10 − 1 − 2  =  7.
```

So `A` is invertible (`det A = 7 ≠ 0`), and Cramer's Rule applies. Compute the three column-replacement determinants.

**`A_1`** (replace column 1 by `b`):

```
   det⎡ 4   1   1 ⎤ = 4(6−1) − 1(12−5) + 1(6−15) = 20 − 7 − 9 = 4.
      ⎢ 6   3   1 ⎥
      ⎣ 5   1   2 ⎦
```

**`A_2`** (replace column 2 by `b`):

```
   det⎡ 2   4   1 ⎤ = 2(12−5) − 4(2−1) + 1(5−6) = 14 − 4 − 1 = 9.
      ⎢ 1   6   1 ⎥
      ⎣ 1   5   2 ⎦
```

**`A_3`** (replace column 3 by `b`):

```
   det⎡ 2   1   4 ⎤ = 2(15−6) − 1(5−6) + 4(1−3) = 18 + 1 − 8 = 11.
      ⎢ 1   3   6 ⎥
      ⎣ 1   1   5 ⎦
```

Therefore `x = 4/7`, `y = 9/7`, `z = 11/7`.

**Check.** `2(4/7) + 1(9/7) + 1(11/7) = (8 + 9 + 11)/7 = 28/7 = 4`. ✓ (The other two equations check similarly.)

---

## E7. Inverse via the adjugate formula

**Problem.** Use the adjugate formula `A⁻¹ = (1/det A) · adj(A)` to compute the inverse of

```
       ⎡ 1   2   0 ⎤
   A = ⎢ 0   1   3 ⎥ .
       ⎣ 2   0   1 ⎦
```

**Solution.**

**Step 1: `det A`.** Expand along column 1:

```
   det A = 1·det⎡1  3⎤ − 0·(…) + 2·det⎡2  0⎤
                ⎣0  1⎦                ⎣1  3⎦
         = 1(1 − 0) + 2(6 − 0) = 1 + 12 = 13.
```

**Step 2: cofactor matrix.** Each `C_{ij} = (−1)^{i+j} · (minor)_{ij}`:

```
   C₁₁ = +det⎡1  3⎤ = 1,     C₁₂ = −det⎡0  3⎤ = −(0 − 6) = 6,    C₁₃ = +det⎡0  1⎤ = −2.
              ⎣0  1⎦                    ⎣2  1⎦                                ⎣2  0⎦

   C₂₁ = −det⎡2  0⎤ = −(2 − 0) = −2,   C₂₂ = +det⎡1  0⎤ = 1,     C₂₃ = −det⎡1  2⎤ = −(0 − 4) = 4.
              ⎣0  1⎦                             ⎣2  1⎦                      ⎣2  0⎦

   C₃₁ = +det⎡2  0⎤ = 6,      C₃₂ = −det⎡1  0⎤ = −3,    C₃₃ = +det⎡1  2⎤ = 1.
              ⎣1  3⎦                     ⎣0  3⎦                    ⎣0  1⎦
```

**Step 3: adjugate = transpose of cofactor matrix.**

```
           ⎡  1   −2    6 ⎤
   adj(A) = ⎢  6    1   −3 ⎥ .
           ⎣ −2    4    1 ⎦
```

**Step 4: inverse.**

```
   A⁻¹ = (1/13) · adj(A) = (1/13) · ⎡  1   −2    6 ⎤ .
                                    ⎢  6    1   −3 ⎥
                                    ⎣ −2    4    1 ⎦
```

**Verify.** Check one entry of `A · A⁻¹`: row 1 of `A` times column 1 of `A⁻¹` equals `(1·1 + 2·6 + 0·(−2))/13 = 13/13 = 1`. ✓

---

## E8. Geometric volume: parallelepiped in ℝ³

**Problem.** Find the volume of the parallelepiped spanned by `v_1 = (1, 2, 3)`, `v_2 = (0, 1, 4)`, `v_3 = (5, 6, 0)`. Does the ordered triple form a right-handed frame?

**Solution.** Volume equals `|det A|` where the columns of `A` are `v_1, v_2, v_3`:

```
       ⎡ 1   0   5 ⎤
   A = ⎢ 2   1   6 ⎥ .
       ⎣ 3   4   0 ⎦
```

Expand along row 1:

```
   det A  =  1·det⎡1  6⎤ − 0·(…) + 5·det⎡2  1⎤
                ⎣4  0⎦                ⎣3  4⎦
         =  1·(0 − 24) + 5·(8 − 3)
         =  −24 + 25  =  1.
```

**Volume = `|1| = 1`.** The sign `det A = +1 > 0` means `(v_1, v_2, v_3)` is a **right-handed** (positively oriented) frame — same orientation as `(e_1, e_2, e_3)`.

---

## E9. Row operations and their effect on det

**Problem.** Let `A` be a 4×4 matrix with `det A = 6`. Compute the determinants of the matrices `B, C, D, E` obtained from `A` by:

(a) `B`: swap rows 1 and 3.
(b) `C`: multiply row 2 by `5`.
(c) `D`: add `7 × (row 4)` to row 1.
(d) `E`: the full scaled matrix `2A` (every entry multiplied by 2).

**Solution.**

(a) One swap flips the sign: `det B = −det A = −6`.

(b) Scaling one row by `5` scales `det` by `5`: `det C = 5 · 6 = 30`.

(c) Adding a multiple of one row to another leaves `det` unchanged: `det D = 6`.

(d) Scaling **every** row (all four rows) by `2`: `det(2A) = 2⁴ · det A = 16 · 6 = 96`. More generally, for an `n × n` matrix, `det(cA) = cⁿ · det A`.

---

## E10. `det(A − λI)` — a first eigenvalue problem

**Problem.** For `A = ⎡4  1⎤ ⎣2  3⎦`, find all `λ` such that `det(A − λI) = 0`.

**Solution.**

```
   A − λI = ⎡ 4 − λ     1   ⎤ ,
            ⎣   2     3 − λ ⎦

   det(A − λI) = (4 − λ)(3 − λ) − 2·1
               = 12 − 4λ − 3λ + λ² − 2
               = λ² − 7λ + 10
               = (λ − 2)(λ − 5).
```

Roots: `λ = 2` and `λ = 5`.

**What this means.** These are the **eigenvalues** of `A` — the scalars for which `A − λI` fails to be invertible, and for which the equation `(A − λI)v = 0` has nonzero solutions. We'll unfold this in Ch 9. Notice that the setup — "`det(…) = 0`" as an invertibility test — is exactly the role `det` plays throughout the chapter.
