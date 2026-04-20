# Chapter 2 — Exercises

Try them with paper first. Then verify in the Python or SageMath notebook. Answers (not full solutions) at the bottom.

---

### 1. Displacements

Given points `A = (2, −1)` and `B = (5, 3)`:

(a) Find the displacement vector `**AB**`.
(b) Find `‖**AB**‖`.
(c) Find the displacement `**BA**` and compare to `**AB**`.

---

### 2. Combinations

Let `u = (1, 1)` and `v = (3, −1)`.

(a) Compute `2u + v`.
(b) Is `0.5 u + 0.5 v` a convex combination? Where does it sit relative to u and v?
(c) Find scalars `a, b` such that `a u + b v = (5, 1)`.

---

### 3. Magnitude and normalization

Let `v = (1, 2, 2)` in ℝ³.

(a) Compute `‖v‖`.
(b) Compute the unit vector `v̂ = v / ‖v‖`.
(c) Verify `‖v̂‖ = 1` (up to rounding).

---

### 4. Dot product, by hand

Compute `u · v` for each pair, and classify the angle as acute, right, or obtuse:

(a) `u = (1, 2),  v = (3, 4)`.
(b) `u = (2, −1, 1),  v = (1, 1, −1)`.
(c) `u = (1, 0),  v = (0, 1)`.
(d) `u = (−1, −2),  v = (1, 2)`.

---

### 5. Find the angle

Compute the angle (in degrees) between `u = (1, 0, 0)` and `v = (1, 1, 0)`. Then between `u` and `w = (1, 1, 1)`. (Use `cos θ = (u·v)/(‖u‖ ‖v‖)` and a calculator for `arccos`.)

---

### 6. Perpendicularity

Find a vector in ℝ² perpendicular to `(3, 4)` of magnitude 1.

*Hint.* In ℝ², swap the components and negate one of them — then normalize.

---

### 7. Projection

Let `u = (3, 4)` and `v = (1, 1)`.

(a) Compute `proj_v u`.
(b) Compute the perpendicular remainder `u − proj_v u`.
(c) Verify the remainder is perpendicular to v.
(d) Verify Pythagoras: `‖proj‖² + ‖perp‖² = ‖u‖²`.

---

### 8. Parametric line

Write a parametric form `L(t) = P + t v` for the line through `(2, −1)` and `(4, 5)` in ℝ². Then find `L(0.5)` and verify it's the midpoint of the two given points.

---

### 9. Distance from point to line

Find the perpendicular distance from `(7, 0)` to the line through origin in direction `(2, 1)`.

---

### 10. Cauchy–Schwarz, in numbers

Pick any two non-collinear vectors in ℝ³. Compute `|u · v|` and `‖u‖ · ‖v‖`. Confirm `|u · v| < ‖u‖ · ‖v‖`. Then pick a vector that *is* a scalar multiple of the first and check that equality holds.

---

## Answers

1. (a) `(3, 4)`. (b) `5`. (c) `(−3, −4) = −**AB**`.

2. (a) `(5, 1)`. (b) Yes — coefficients are 0.5, 0.5, both ≥ 0 and sum to 1. It is the **midpoint** of u and v: `(2, 0)`. (c) `a = 2, b = 1`.

3. (a) `‖v‖ = 3`. (b) `v̂ = (1/3, 2/3, 2/3)`. (c) `‖v̂‖² = 1/9 + 4/9 + 4/9 = 1`. ✓

4. (a) `u·v = 11`, acute. (b) `u·v = 0`, right (perpendicular). (c) `u·v = 0`, right. (d) `u·v = −5`, obtuse (in fact, antiparallel — u = −v).

5. `cos θ = 1/√2`, so `θ = 45°`. For w: `cos θ = 1/√3`, so `θ ≈ 54.74°`.

6. `(−4/5, 3/5)` (or `(4/5, −3/5)`). Either points 90° from `(3, 4)`.

7. (a) `proj_v u = (7/2, 7/2)`. (b) Remainder `= (−1/2, 1/2)`. (c) `(−1/2)(1) + (1/2)(1) = 0`. ✓ (d) `‖proj‖² = 49/2`, `‖perp‖² = 1/2`, sum = 25 = `‖u‖²`. ✓

8. `L(t) = (2, −1) + t · (2, 6)`. `L(0.5) = (3, 2)`, which equals the midpoint `((2+4)/2, (−1+5)/2) = (3, 2)`. ✓

9. `proj_v P = (14/5)(2, 1) = (28/5, 14/5)`. Remainder: `(7 − 28/5, −14/5) = (7/5, −14/5)`. Distance `= √(49/25 + 196/25) = √(245/25) = 7/√5 ≈ 3.13`.

10. Numbers will vary. Cauchy–Schwarz `|u · v| ≤ ‖u‖ · ‖v‖` always holds, with equality iff one vector is a scalar multiple of the other.
