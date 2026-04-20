# Chapter 7 — Exercises

Ten problems, each with a brief answer at the bottom of its section. Try them on paper before peeking.

---

## Exercise 1 — Cauchy–Schwarz and angle

For `u = (1, 2, 2, 0)` and `v = (3, 0, −1, 4)` in ℝ⁴, compute `u · v`, `‖u‖`, `‖v‖`, and the angle `θ` between them.

> **Answer.** `u · v = 3 + 0 − 2 + 0 = 1`. `‖u‖ = √(1 + 4 + 4 + 0) = 3`. `‖v‖ = √(9 + 0 + 1 + 16) = √26`. `cos θ = 1 / (3√26)`. So `θ = arccos(1/(3√26)) ≈ 1.5054` rad ≈ **86.27°**. (Almost orthogonal.)

---

## Exercise 2 — Coordinates in an ONB of ℝ²

Show that `q₁ = (3, 4)/5`, `q₂ = (4, −3)/5` is an ONB of ℝ². Find `[v]_𝓠` for `v = (10, 5)`.

> **Answer.** `‖q₁‖² = (9 + 16)/25 = 1` ✓. `‖q₂‖² = (16 + 9)/25 = 1` ✓. `q₁ · q₂ = (12 − 12)/25 = 0` ✓.
>
> `v · q₁ = (30 + 20)/5 = 10`. `v · q₂ = (40 − 15)/5 = 5`. **`[v]_𝓠 = (10, 5)`.** Verify: `10 q₁ + 5 q₂ = (6 + 4, 8 − 3) = (10, 5)`. ✓

---

## Exercise 3 — Orthogonal complement in ℝ³

Find a basis of `V⊥` where `V = span((1, 2, 3))` ⊂ ℝ³.

> **Answer.** `V⊥` is the plane `{w : w₁ + 2 w₂ + 3 w₃ = 0}`. Parametrize: `w₁ = −2 w₂ − 3 w₃`. Free `w₂, w₃`. Basis: `(−2, 1, 0)`, `(−3, 0, 1)`. **`dim V⊥ = 2`.**

---

## Exercise 4 — Project onto a line

Project `b = (4, 5, 6)` onto the line through 0 in direction `u = (1, 1, 1)`.

> **Answer.** `b · u = 15`. `u · u = 3`. `proj_u(b) = (15/3) (1, 1, 1) = (5, 5, 5)`. Residual `(−1, 0, 1)` (verify ⊥ `u`: `−1 + 0 + 1 = 0` ✓).

---

## Exercise 5 — Gram–Schmidt on three vectors in ℝ³

Apply Gram–Schmidt to `v₁ = (1, 0, 0)`, `v₂ = (1, 1, 0)`, `v₃ = (1, 1, 1)`. (Since `v₁` is already a unit vector and the next vectors are sums of previous ones, the answer is short.)

> **Answer.** `q₁ = v₁ = (1, 0, 0)`. `v₂ − (v₂ · q₁) q₁ = (1, 1, 0) − (1, 0, 0) = (0, 1, 0)`, length 1, so `q₂ = (0, 1, 0)`. `v₃ − (v₃ · q₁) q₁ − (v₃ · q₂) q₂ = (1, 1, 1) − (1, 0, 0) − (0, 1, 0) = (0, 0, 1)`, so `q₃ = (0, 0, 1)`. **The standard basis falls out** — that's because the upper-triangular structure of the input matrix makes Gram–Schmidt trivial. The QR factorization here has `R = upper-triangular all-ones` (`R = [[1,1,1],[0,1,1],[0,0,1]]`, `Q = I`).

---

## Exercise 6 — Identify orthogonal matrices

Which of the following are orthogonal?

(a) `A = [[1, 1], [1, −1]]`.

(b) `B = [[1, 1], [1, −1]] / √2`.

(c) `C = [[2, 1], [1, 2]] / 3`.

(d) Permutation matrix `P = [[0, 1, 0], [1, 0, 0], [0, 0, 1]]`.

> **Answer.**
> (a) Columns `(1, 1)` and `(1, −1)` are orthogonal but length `√2`, not 1. **Not orthogonal.**
> (b) Each column has length 1, orthogonal. **Orthogonal.** (`AᵀA = I`.)
> (c) Columns `(2, 1)/3` and `(1, 2)/3`. Lengths: `√5/3 ≠ 1`. **Not orthogonal.**
> (d) Each column is some `eᵢ`, columns are an ONB. **Orthogonal.** `det = −1`.

---

## Exercise 7 — Normal equations from data

Fit `y = a + bx` to `(1, 1), (2, 2), (3, 2), (4, 3)` by least squares.

> **Answer.**
>
> ```
>   A = [[1,1],[1,2],[1,3],[1,4]],   b = [1, 2, 2, 3].
>   AᵀA = [[4, 10], [10, 30]],   det = 120 − 100 = 20.
>   Aᵀb = [8, 22].
>   x̂ = (1/20) [[30, −10], [−10, 4]] · [8, 22]
>      = (1/20) [240 − 220, −80 + 88]
>      = (1/20) [20, 8] = [1, 0.4].
> ```
>
> **Best-fit line:** `y = 1 + 0.4 x`. (Predictions: `1.4, 1.8, 2.2, 2.6`. Residuals: `−0.4, 0.2, −0.2, 0.4` — sum to 0 as expected.)

---

## Exercise 8 — Projection matrix

Let `V = span((1, 1, 0), (1, 0, 1))` (a plane in ℝ³). Compute the projection matrix `P = A (AᵀA)⁻¹ Aᵀ` and use it to project `b = (3, 0, 0)`.

> **Answer.**
>
> ```
>   A = [[1, 1], [1, 0], [0, 1]],   AᵀA = [[2, 1], [1, 2]],   det = 3.
>   (AᵀA)⁻¹ = (1/3) [[2, −1], [−1, 2]].
>
>   A (AᵀA)⁻¹ = (1/3) [[1, 1], [1, 0], [0, 1]] · [[2, −1], [−1, 2]]
>             = (1/3) [[1,  1], [2, −1], [−1, 2]].
>
>   P = (above) · Aᵀ = (1/3) [[2, 1, 1], [1, 2, −1], [1, −1, 2]].
> ```
>
> `P b = (1/3) [[2,1,1],[1,2,−1],[1,−1,2]] · [3,0,0] = (1/3) [6, 3, 3] = (2, 1, 1)`.
>
> *Sanity:* `(2, 1, 1) = 1·(1,1,0) + 1·(1,0,1)` ∈ V ✓. Residual `(3,0,0) − (2,1,1) = (1, −1, −1)`. Check `⊥ V`: `(1)(1) + (−1)(1) + (−1)(0) = 0` ✓; `(1)(1) + (−1)(0) + (−1)(1) = 0` ✓.

---

## Exercise 9 — L² inner product

On `[0, 1]` with `⟨f, g⟩ = ∫₀¹ f g dx`, compute `‖x²‖`, `⟨1, x²⟩`, and the angle between `1` and `x²`.

> **Answer.** `‖x²‖² = ∫₀¹ x⁴ dx = 1/5`, so `‖x²‖ = 1/√5`. `⟨1, x²⟩ = ∫₀¹ x² dx = 1/3`. `‖1‖ = √(∫₀¹ 1 dx) = 1`. So `cos θ = (1/3) / (1 · 1/√5) = √5/3`. `θ = arccos(√5/3) ≈ 0.7297` rad ≈ **41.81°**.

---

## Exercise 10 — Orthogonality of `cos kx` and `sin kx`

Show that on `[−π, π]` with `⟨f, g⟩ = ∫_{−π}^{π} f g dx`,

(a) `⟨cos x, sin x⟩ = 0`.
(b) `⟨cos x, cos 2x⟩ = 0`.
(c) `⟨cos x, cos x⟩ = π`.

> **Answer.**
> (a) `∫_{−π}^{π} cos x sin x dx = (1/2) ∫ sin(2x) dx = 0` (odd). ✓
> (b) Use product-to-sum: `cos x cos 2x = (cos(3x) + cos(x))/2`. Hmm — wait, `cos A cos B = (cos(A+B) + cos(A−B))/2`, so `cos x cos 2x = (cos 3x + cos(−x))/2 = (cos 3x + cos x)/2`. Integrate over `[−π, π]`: `cos 3x` integrates to `sin(3x)/3` evaluated at ±π = 0, `cos x` similarly to 0. So `⟨cos x, cos 2x⟩ = 0`. ✓
> (c) `cos² x = (1 + cos 2x)/2`. `∫_{−π}^{π} (1 + cos 2x)/2 dx = π + 0 = π`. ✓
>
> *Bigger picture:* `1, cos x, sin x, cos 2x, sin 2x, cos 3x, sin 3x, …` is an **infinite orthogonal set** in `C([−π, π])`. After normalization (each has L² norm `√π` except `1` which has `√(2π)`), it's the **Fourier basis**, and decomposing `f` in this basis is its **Fourier series**. That's analysis built on Ch 7's ONB machinery.
