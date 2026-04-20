# Chapter 4 — Exercises

Ten problems. Try each before checking the answer. Work them by hand; use the Python or Sage notebook only to verify numerics once you have a candidate answer.

---

## Exercises

**E1.** Decide which of the following `T: ℝ² → ℝ²` are linear. Give a short reason for each.

(a) `T(x, y) = (x − y, 2x)`
(b) `T(x, y) = (x + 3, y)`
(c) `T(x, y) = (xy, y)`
(d) `T(x, y) = (0, 0)`

---

**E2.** Find the standard matrix of the linear transformation `T: ℝ³ → ℝ²` defined by
```
   T(x, y, z) = (x + 2y − z,  3y + 4z).
```

---

**E3.** Write down the matrix for **rotation by `45°` anticlockwise** about the origin in ℝ², using exact values (no decimals).

---

**E4.** Find the matrix of the composition "first reflect across the y-axis, then rotate by `90°` anticlockwise." Apply your matrix to the point `(3, 2)` and check the result geometrically.

---

**E5.** Invert each `2 × 2` matrix using the formula, or state that the matrix is not invertible.

(a) `⎡4 7⎤ / ⎣2 6⎦`
(b) `⎡3 6⎤ / ⎣1 2⎦`
(c) `⎡1 2⎤ / ⎣3 5⎦`

---

**E6.** Use Gauss–Jordan on `[A | I]` to invert
```
   A  =  ⎡ 1   1   0 ⎤
        ⎢ 0   2   1 ⎥
        ⎣ 1   0   1 ⎦.
```

---

**E7.** Let `A = ⎡1 2⎤ / ⎣0 1⎦` (horizontal shear) and `B = ⎡1 0⎤ / ⎣3 1⎦` (vertical shear). Compute both `AB` and `BA` and confirm they differ.

---

**E8.** A matrix `A` satisfies `A² = A` (it's called **idempotent**). Show that if `A` is invertible, it must be the identity. *(Hint: multiply both sides by `A⁻¹`.)*

---

**E9.** A linear transformation `T: ℝ² → ℝ²` sends `(1, 0)` to `(2, 3)` and `(1, 1)` to `(5, 7)`. Find the standard matrix of `T`.

*(Hint: you're told `T(e₁)` already, but you're told `T(e₁ + e₂)`, not `T(e₂)`. Use linearity.)*

---

**E10.** In a 2D graphics engine you want to do the following in one step: shift the origin of the drawing to `(3, 1)`, rotate the whole picture by `90°` anticlockwise around that new origin, then shift back. The operation "shift then unshift" turns the non-linear "translate" into a linear operation about the original origin. Describe what the *net* transformation does to the point `(3, 2)`, and compute its coordinates after the combined operation.

*(You do not need to combine everything into one matrix — think of each step and apply in order.)*

---

## Answers

**E1.**

(a) **Linear.** Both coordinates are homogeneous degree-1 in `x, y`. Check additivity and homogeneity directly, or note the standard matrix `⎡1 −1⎤ / ⎣2  0⎦` exists.

(b) **Not linear.** `T(0, 0) = (3, 0) ≠ (0, 0)`.

(c) **Not linear.** The term `xy` is quadratic. For instance, `T(2·(1, 1)) = T(2, 2) = (4, 2)`, but `2 · T(1, 1) = 2·(1, 1) = (2, 2)`. They differ, so homogeneity fails.

(d) **Linear.** The zero map. `T(u+v) = 0 = 0 + 0 = T(u) + T(v)`, and `T(cu) = 0 = c · 0 = c T(u)`. Its standard matrix is the `2 × 2` zero matrix.

---

**E2.** Compute `T(e₁), T(e₂), T(e₃)`:

```
   T(e₁) = T(1, 0, 0) = (1, 0)
   T(e₂) = T(0, 1, 0) = (2, 3)
   T(e₃) = T(0, 0, 1) = (−1, 4)
```

So
```
   A  =  ⎡ 1   2   −1 ⎤       (2 × 3 matrix).
        ⎣ 0   3    4 ⎦
```

---

**E3.** At `θ = 45°`, `cos θ = sin θ = √2/2`, so
```
   R_{45°}  =  ⎡  √2/2   −√2/2 ⎤
             ⎣  √2/2    √2/2 ⎦
            =  (√2/2) · ⎡ 1   −1 ⎤
                       ⎣ 1    1 ⎦.
```

---

**E4.** Let `F = ⎡−1 0⎤ / ⎣0 1⎦` (reflect across y-axis) and `R = ⎡0 −1⎤ / ⎣1 0⎦` (rotate 90°). Composition "first `F`, then `R`" has matrix `R F`:
```
   R F  =  ⎡0 −1⎤ ⎡−1 0⎤
          ⎣1  0⎦ ⎣ 0 1⎦

         =  ⎡ 0·(−1) + (−1)·0    0·0 + (−1)·1 ⎤
           ⎣ 1·(−1) +   0 ·0    1·0 +   0 ·1 ⎦

         =  ⎡ 0   −1 ⎤
           ⎣ −1   0 ⎦.
```

Applied to `(3, 2)`:
```
   ⎡0  −1⎤ ⎡3⎤   =   ⎡0·3 + (−1)·2⎤   =   ⎡−2⎤
   ⎣−1  0⎦ ⎣2⎦       ⎣−1·3 +  0 ·2⎦       ⎣−3⎦.
```

**Sanity check.** `(3, 2)` reflects to `(−3, 2)`, then rotates `90°` anticlockwise to `(−2, −3)`. ✓

---

**E5.**

(a) `det = 4·6 − 7·2 = 24 − 14 = 10`. So `A⁻¹ = (1/10) · ⎡ 6  −7⎤ / ⎣−2   4⎦ = ⎡ 3/5  −7/10⎤ / ⎣−1/5   2/5⎦`.

(b) `det = 3·2 − 6·1 = 0`. **Not invertible.** (Second column is `2 ×` first column.)

(c) `det = 1·5 − 2·3 = −1`. So `A⁻¹ = (−1) · ⎡ 5  −2⎤ / ⎣−3   1⎦ = ⎡−5   2⎤ / ⎣ 3  −1⎦`.

---

**E6.** Augment and reduce.

```
   [ A | I ]  =  ⎡ 1   1   0 │ 1   0   0 ⎤
                ⎢ 0   2   1 │ 0   1   0 ⎥
                ⎣ 1   0   1 │ 0   0   1 ⎦
```

*Eliminate below R1 pivot:* `R3 ← R3 − R1`.
```
   ⎡ 1   1    0 │  1   0   0 ⎤
   ⎢ 0   2    1 │  0   1   0 ⎥
   ⎣ 0  −1    1 │ −1   0   1 ⎦
```

*Scale R2 to get a `1` pivot:* `R2 ← (1/2) R2`.
```
   ⎡ 1   1    0 │  1    0    0 ⎤
   ⎢ 0   1   1/2 │  0   1/2   0 ⎥
   ⎣ 0  −1    1 │ −1    0    1 ⎦
```

*Eliminate above and below R2 pivot:* `R1 ← R1 − R2`, `R3 ← R3 + R2`.
```
   ⎡ 1   0   −1/2 │  1   −1/2    0 ⎤
   ⎢ 0   1    1/2 │  0    1/2    0 ⎥
   ⎣ 0   0    3/2 │ −1    1/2    1 ⎦
```

*Scale R3:* `R3 ← (2/3) R3`.
```
   ⎡ 1   0   −1/2 │  1    −1/2    0   ⎤
   ⎢ 0   1    1/2 │  0     1/2    0   ⎥
   ⎣ 0   0    1   │ −2/3   1/3   2/3 ⎦
```

*Eliminate above R3 pivot:* `R1 ← R1 + (1/2) R3`, `R2 ← R2 − (1/2) R3`.
```
   R1:  entries  (1, 0, 0 |  1 + (1/2)(−2/3),  −1/2 + (1/2)(1/3),  0 + (1/2)(2/3))
                           = (2/3,  −1/3,  1/3).
   R2:  entries  (0, 1, 0 |  0 − (1/2)(−2/3),   1/2 − (1/2)(1/3),  0 − (1/2)(2/3))
                           = (1/3,   1/3, −1/3).
```

Final:
```
   ⎡ 1   0   0 │  2/3   −1/3    1/3 ⎤
   ⎢ 0   1   0 │  1/3    1/3   −1/3 ⎥
   ⎣ 0   0   1 │ −2/3    1/3    2/3 ⎦
```

So
```
   A⁻¹  =  ⎡  2/3   −1/3    1/3 ⎤
          ⎢  1/3    1/3   −1/3 ⎥
          ⎣ −2/3    1/3    2/3 ⎦
        =  (1/3) · ⎡  2   −1    1 ⎤
                  ⎢  1    1   −1 ⎥
                  ⎣ −2    1    2 ⎦.
```

*Spot-check.* First column of `A · A⁻¹`:
```
   row 1:  1·(2/3) + 1·(1/3) + 0·(−2/3) = 1.
   row 2:  0·(2/3) + 2·(1/3) + 1·(−2/3) = 0.
   row 3:  1·(2/3) + 0·(1/3) + 1·(−2/3) = 0.
```
First column of `I`. ✓

---

**E7.**
```
   A B  =  ⎡1 2⎤ ⎡1 0⎤  =  ⎡1·1+2·3   1·0+2·1⎤  =  ⎡7 2⎤.
          ⎣0 1⎦ ⎣3 1⎦     ⎣0·1+1·3   0·0+1·1⎦     ⎣3 1⎦

   B A  =  ⎡1 0⎤ ⎡1 2⎤  =  ⎡1·1+0·0   1·2+0·1⎤  =  ⎡1 2⎤.
          ⎣3 1⎦ ⎣0 1⎦     ⎣3·1+1·0   3·2+1·1⎦     ⎣3 7⎦
```

Different. Order of shearing matters.

---

**E8.** Suppose `A² = A` and `A` is invertible. Left-multiply both sides by `A⁻¹`:
```
   A⁻¹ (A²)  =  A⁻¹ A
   A         =  I.
```
So any invertible idempotent matrix is `I`. (The *non-invertible* idempotents are precisely the **projections** — e.g. `⎡1 0⎤ / ⎣0 0⎦` — which are plenty interesting, just not invertible.)

---

**E9.** We know `T(e₁) = (2, 3)`. By linearity,
```
   T(e₁ + e₂) = T(e₁) + T(e₂)
   (5, 7)      = (2, 3) + T(e₂)
   T(e₂)       = (5, 7) − (2, 3) = (3, 4).
```

So
```
   A  =  [ T(e₁) | T(e₂) ]  =  ⎡ 2   3 ⎤
                             ⎣ 3   4 ⎦.
```

*Check.* `A · (1, 0) = (2, 3)` ✓ and `A · (1, 1) = (2+3, 3+4) = (5, 7)` ✓.

---

**E10.** Three steps, applied in order to `p = (3, 2)`.

*Step 1 — shift origin to `(3, 1)`.* Subtract `(3, 1)`:
```
   p - (3, 1) = (0, 1).
```

*Step 2 — rotate `90°` anticlockwise.*
```
   R_{90°} · (0, 1) = (0·0 + (−1)·1,  1·0 + 0·1) = (−1, 0).
```

*Step 3 — shift back (add `(3, 1)`).*
```
   (−1, 0) + (3, 1) = (2, 1).
```

**Answer.** `(3, 2) ↦ (2, 1)`.

**Geometric check.** `(3, 2)` sits one unit directly above the pivot `(3, 1)`. Rotating it `90°` anticlockwise around that pivot should land it one unit to the left of the pivot, i.e. at `(2, 1)`. ✓

> **Footnote.** The middle step (rotation) *is* linear; the outer steps (translation) are **not** linear (they move the origin). But packaged together — shift, linear-map, unshift — the full "rotate around an arbitrary point" is an **affine** transformation. Affine maps are how computer-graphics pipelines actually operate, using a clever `3 × 3` trick called **homogeneous coordinates** that lets you write translation as a linear map by adding an extra dimension. That's a Ch 6 / Ch 7 aside.
