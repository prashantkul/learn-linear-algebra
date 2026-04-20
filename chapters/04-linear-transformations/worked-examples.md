# Chapter 4 — Worked Examples

Ten problems, all solved completely. Each one builds one habit from §§4.3–4.9.

---

## Example 1 — Is this function linear?

**Problem.** Is `T: ℝ² → ℝ²` defined by `T(x, y) = (3x − y, 2x + 5y)` a linear transformation?

**Solution.** Check both laws.

*Additivity.* Let `u = (u₁, u₂)` and `v = (v₁, v₂)`.
```
   T(u + v)  =  T(u₁ + v₁, u₂ + v₂)
            =  ( 3(u₁+v₁) − (u₂+v₂),  2(u₁+v₁) + 5(u₂+v₂) )
            =  ( 3u₁ − u₂, 2u₁ + 5u₂ )  +  ( 3v₁ − v₂, 2v₁ + 5v₂ )
            =  T(u)  +  T(v).     ✓
```

*Homogeneity.* For any scalar `c`,
```
   T(c · u)  =  T(c u₁, c u₂)
           =  ( 3(c u₁) − (c u₂),  2(c u₁) + 5(c u₂) )
           =  c · ( 3u₁ − u₂,  2u₁ + 5u₂ )
           =  c · T(u).          ✓
```

**Answer.** Yes. `T` is linear. Its standard matrix (by §4.4) is
```
   A = [T(e₁) | T(e₂)]  =  ⎡ 3   −1 ⎤
                         ⎣ 2    5 ⎦.
```

---

## Example 2 — Quick rejection using `T(0) ≠ 0`

**Problem.** Is `T(x, y) = (x + 2, y − 1)` linear?

**Solution.** `T(0, 0) = (2, −1) ≠ (0, 0)`. Every linear map fixes the origin, so `T` cannot be linear.

**Answer.** No.

---

## Example 3 — Build the standard matrix from a geometric description

**Problem.** Let `T: ℝ² → ℝ²` be the **reflection across the line `y = x`**. Find its standard matrix.

**Solution.** By §4.4, we only need `T(e₁)` and `T(e₂)`.

Reflection across `y = x` swaps `x` and `y` coordinates. So:
```
   T(e₁) = T(1, 0) = (0, 1)
   T(e₂) = T(0, 1) = (1, 0)
```

Stack them as columns:
```
   A  =  ⎡ 0   1 ⎤
        ⎣ 1   0 ⎦.
```

**Answer.** `⎡0 1⎤ / ⎣1 0⎦`.

**Quick check.** `A · (3, 7) = (7, 3)`. Swap confirmed. ✓

---

## Example 4 — Apply a rotation matrix

**Problem.** Rotate the point `(2, 1)` by `90°` anticlockwise.

**Solution.** At `θ = 90°`, `cos θ = 0` and `sin θ = 1`, so
```
   R_{90°}  =  ⎡ cos 90°   − sin 90° ⎤   =   ⎡ 0   −1 ⎤
             ⎣ sin 90°     cos 90° ⎦        ⎣ 1    0 ⎦.
```

Apply to `(2, 1)`:
```
   R · (2, 1)  =  ⎡0 · 2 + (−1) · 1⎤  =  ⎡ −1 ⎤
                 ⎣1 · 2 +    0 · 1⎦     ⎣  2 ⎦.
```

**Answer.** `(−1, 2)`.

**Picture check.** `(2, 1)` lies in the first quadrant; rotating 90° anticlockwise should land in the second quadrant. `(−1, 2)` — second quadrant. ✓

---

## Example 5 — Composition — rotate, then reflect

**Problem.** `T` is the transformation "first rotate by 90° anticlockwise, then reflect across the x-axis." Find its matrix.

**Solution.** Composition "first `B`, then `A`" ⇒ matrix `A B` (the outer map acts second).

Let `B = R_{90°} = ⎡0 −1⎤ / ⎣1  0⎦` (rotation) and `A = ⎡1 0⎤ / ⎣0 −1⎦` (reflection across x-axis).

```
   A B  =  ⎡1  0⎤ ⎡0  −1⎤
          ⎣0 −1⎦ ⎣1   0⎦

         =  ⎡ 1·0 + 0·1     1·(−1) + 0·0 ⎤
           ⎣ 0·0 + (−1)·1  0·(−1) + (−1)·0 ⎦

         =  ⎡ 0   −1 ⎤
           ⎣ −1   0 ⎦.
```

**Answer.** `⎡0 −1⎤ / ⎣−1 0⎦`.

**Sanity check.** Applied to `e₁ = (1, 0)`: rotate → `(0, 1)`, then reflect across x-axis → `(0, −1)`. The first column of our matrix is `(0, −1)`. ✓

---

## Example 6 — Non-commutativity in one picture

**Problem.** With `A` and `B` as in Example 5, compute `B A` and verify `A B ≠ B A`.

**Solution.**
```
   B A  =  ⎡0  −1⎤ ⎡1   0⎤
          ⎣1   0⎦ ⎣0  −1⎦

         =  ⎡ 0·1 + (−1)·0    0·0 + (−1)·(−1) ⎤
           ⎣ 1·1 +   0 ·0     1·0 +  0 ·(−1) ⎦

         =  ⎡ 0    1 ⎤
           ⎣ 1    0 ⎦.
```

So `B A = ⎡0 1⎤ / ⎣1 0⎦`, which is **reflection across `y = x`** (Example 3). That is:

- `A B` (rotate, then reflect across x-axis) = reflection across `y = −x`.
- `B A` (reflect across x-axis, then rotate) = reflection across `y = x`.

Different maps. Different matrices. Order matters.

**Answer.** `A B ≠ B A`; they're reflections across different lines.

---

## Example 7 — Invert a `2 × 2` matrix by formula

**Problem.** Invert `A = ⎡2 5⎤ / ⎣1 3⎦`.

**Solution.** `det A = 2·3 − 5·1 = 6 − 5 = 1`. Nonzero, so invertible.

Apply the formula from §4.8.2:
```
   A⁻¹  =  (1/1) · ⎡  3   −5 ⎤   =   ⎡  3   −5 ⎤
                  ⎣ −1    2 ⎦        ⎣ −1    2 ⎦.
```

**Check.**
```
   A A⁻¹  =  ⎡2 5⎤ ⎡ 3 −5⎤  =  ⎡ 2·3+5·(−1)   2·(−5)+5·2 ⎤  =  ⎡1 0⎤. ✓
            ⎣1 3⎦ ⎣−1  2⎦     ⎣ 1·3+3·(−1)   1·(−5)+3·2 ⎦     ⎣0 1⎦
```

**Answer.** `A⁻¹ = ⎡3 −5⎤ / ⎣−1 2⎦`.

---

## Example 8 — Invert a `3 × 3` matrix by Gauss–Jordan

**Problem.** Invert
```
   A  =  ⎡ 1   0   2 ⎤
        ⎢ 2   1   3 ⎥
        ⎣ 1   0   1 ⎦.
```

**Solution.** Augment with `I` and run Gauss–Jordan.

```
   [ A | I ]  =  ⎡ 1   0   2 │ 1   0   0 ⎤
                ⎢ 2   1   3 │ 0   1   0 ⎥
                ⎣ 1   0   1 │ 0   0   1 ⎦
```

*Zero out column 1 below the pivot.*
```
   R2 ← R2 − 2 R1      R3 ← R3 − R1

   ⎡ 1   0    2 │  1   0   0 ⎤
   ⎢ 0   1   −1 │ −2   1   0 ⎥
   ⎣ 0   0   −1 │ −1   0   1 ⎦
```

*Scale R3 to make its pivot `1`.*
```
   R3 ← (−1) · R3

   ⎡ 1   0   2 │  1   0    0 ⎤
   ⎢ 0   1  −1 │ −2   1    0 ⎥
   ⎣ 0   0   1 │  1   0   −1 ⎦
```

*Zero out above the R3 pivot.*
```
   R2 ← R2 + R3      R1 ← R1 − 2 R3

   ⎡ 1   0   0 │ −1   0   2 ⎤
   ⎢ 0   1   0 │ −1   1  −1 ⎥
   ⎣ 0   0   1 │  1   0  −1 ⎦
```

Left block is `I`. Right block is `A⁻¹`.

**Answer.**
```
   A⁻¹  =  ⎡ −1   0    2 ⎤
          ⎢ −1   1   −1 ⎥
          ⎣  1   0   −1 ⎦.
```

**Spot-check with one column.** `A · (first column of A⁻¹) = A · (−1, −1, 1)`:
```
   row 1:  1·(−1) + 0·(−1) + 2·1   = 1      ✓ (first column of I)
   row 2:  2·(−1) + 1·(−1) + 3·1   = 0      ✓
   row 3:  1·(−1) + 0·(−1) + 1·1   = 0      ✓
```

---

## Example 9 — A non-invertible matrix

**Problem.** Is `P = ⎡1 2⎤ / ⎣2 4⎦` invertible?

**Solution.** `det P = 1·4 − 2·2 = 0`. Formula fails.

Check geometrically: the two columns `(1, 2)` and `(2, 4) = 2·(1, 2)` are **parallel**. So every output `P x = x₁ (1, 2) + x₂ (2, 4)` lies on the single line through the origin in direction `(1, 2)`. The map collapses all of ℝ² onto a line — no way to recover `x` from `P x` (infinitely many `x`'s give the same image).

**Answer.** Not invertible. Any such "rank-deficient" matrix — with collinear or zero columns — has `det = 0` and collapses information.

---

## Example 10 — `(AB)⁻¹ = B⁻¹ A⁻¹` (socks and shoes)

**Problem.** Given `A = ⎡2 1⎤ / ⎣0 1⎦` and `B = ⎡1 3⎤ / ⎣0 1⎦`, verify the rule `(A B)⁻¹ = B⁻¹ A⁻¹`.

**Solution.**

*Compute `A B` first.*
```
   A B  =  ⎡2·1 + 1·0   2·3 + 1·1⎤  =  ⎡2 7⎤
          ⎣0·1 + 1·0   0·3 + 1·1⎦     ⎣0 1⎦.
```

*Invert `A B` directly.* `det (A B) = 2·1 − 7·0 = 2`.
```
   (A B)⁻¹  =  (1/2) · ⎡ 1  −7 ⎤  =  ⎡ 1/2   −7/2 ⎤
                      ⎣ 0   2 ⎦     ⎣ 0      1   ⎦.
```

*Compute `A⁻¹` and `B⁻¹` separately.* `det A = 2`, `det B = 1`.
```
   A⁻¹  =  (1/2) ⎡ 1  −1 ⎤   =  ⎡ 1/2   −1/2 ⎤
               ⎣ 0   2 ⎦     ⎣ 0      1   ⎦.

   B⁻¹  =  (1/1) ⎡ 1  −3 ⎤   =  ⎡ 1   −3 ⎤
               ⎣ 0   1 ⎦     ⎣ 0    1 ⎦.
```

*Compute `B⁻¹ A⁻¹`.*
```
   B⁻¹ A⁻¹  =  ⎡1  −3⎤ ⎡1/2   −1/2⎤
              ⎣0   1⎦ ⎣ 0       1  ⎦

            =  ⎡ 1·(1/2) + (−3)·0     1·(−1/2) + (−3)·1 ⎤
              ⎣ 0·(1/2) +   1 ·0     0·(−1/2) +   1  ·1 ⎦

            =  ⎡ 1/2   −7/2 ⎤
              ⎣ 0      1   ⎦.
```

Identical to `(AB)⁻¹`. ✓

*Now compute `A⁻¹ B⁻¹` for comparison (to confirm it's **different**).*
```
   A⁻¹ B⁻¹  =  ⎡1/2  −1/2⎤ ⎡1  −3⎤
              ⎣ 0     1  ⎦ ⎣0   1⎦

            =  ⎡ 1/2   −3/2 + (−1/2) ⎤   =  ⎡ 1/2   −2 ⎤
              ⎣ 0      1            ⎦     ⎣ 0      1 ⎦.
```

Different. So `A⁻¹ B⁻¹ ≠ (A B)⁻¹` — only the **reversed** order `B⁻¹ A⁻¹` does the job.

**Answer.** `(A B)⁻¹ = B⁻¹ A⁻¹ = ⎡1/2 −7/2⎤ / ⎣0 1⎦`; the reversed order is essential.
