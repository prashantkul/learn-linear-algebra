# Chapter 7 — Worked Examples

Ten problems with full solutions. Each illustrates one of the chapter's main skills: ONB coordinates, projections, orthogonal complements, Gram–Schmidt, QR, orthogonal matrices, least squares (line and curve), and the L² inner product on functions.

---

## E1. Coordinates in an ONB

**Problem.** Verify that `q₁ = (2, 2, 1)/3`, `q₂ = (2, −1, −2)/3`, `q₃ = (1, −2, 2)/3` form an ONB of ℝ³. Then find the coordinates of `v = (5, 0, 4)` in this basis.

**Solution.**

*Lengths.* `‖(2, 2, 1)‖² = 4 + 4 + 1 = 9`, so `‖q₁‖ = 3/3 = 1`. Same for `q₂, q₃`. ✓

*Pairwise orthogonality.*

- `q₁ · q₂ = (4 − 2 − 2)/9 = 0`. ✓
- `q₁ · q₃ = (2 − 4 + 2)/9 = 0`. ✓
- `q₂ · q₃ = (2 + 2 − 4)/9 = 0`. ✓

So `(q₁, q₂, q₃)` is an ONB.

*Coordinates of `v = (5, 0, 4)`.* By §7.4, just take dot products:

- `v · q₁ = (10 + 0 + 4)/3 = 14/3`.
- `v · q₂ = (10 + 0 − 8)/3 = 2/3`.
- `v · q₃ = (5 + 0 + 8)/3 = 13/3`.

> **`[v]_𝓠 = (14/3, 2/3, 13/3)`.**

*Verify.* `(14/3) q₁ + (2/3) q₂ + (13/3) q₃` = `(14/3)(2, 2, 1)/3 + (2/3)(2, −1, −2)/3 + (13/3)(1, −2, 2)/3`. Compute the first component: `(14·2 + 2·2 + 13·1)/9 = (28 + 4 + 13)/9 = 45/9 = 5`. ✓ Second: `(14·2 + 2·(−1) + 13·(−2))/9 = (28 − 2 − 26)/9 = 0`. ✓ Third: `(14·1 + 2·(−2) + 13·2)/9 = (14 − 4 + 26)/9 = 36/9 = 4`. ✓

---

## E2. Projection onto a line

**Problem.** Project `b = (3, 5, 7)` onto the line through the origin in direction `u = (1, 2, 2)`.

**Solution.** `u · u = 1 + 4 + 4 = 9`. `b · u = 3 + 10 + 14 = 27`. Then

```
   proj_u(b)  =  ((b · u) / (u · u)) · u  =  (27/9)(1, 2, 2)  =  3 · (1, 2, 2)  =  (3, 6, 6).
```

*Residual:* `b − proj_u(b) = (3 − 3, 5 − 6, 7 − 6) = (0, −1, 1)`. Verify `⊥ u`: `(0)(1) + (−1)(2) + (1)(2) = 0`. ✓

*Distance from `b` to the line:* `‖(0, −1, 1)‖ = √2`.

---

## E3. Projection onto a plane

**Problem.** Let `V = span((1, 1, 0), (0, 1, 1))` (a plane through 0 in ℝ³). Project `b = (1, 0, 0)` onto `V`. Use the §7.7 ONB.

**Solution.** From the §7.7 worked example, an ONB of `V` (note: `V` here uses `v₁ = (1, 1, 0)` and `v₃ = (0, 1, 1)`, the *first and third* vectors from §7.7 — and span only that plane, not all of ℝ³). Re-run Gram–Schmidt on these two:

- `u₁ = v₁ = (1, 1, 0)`, `q₁ = (1, 1, 0)/√2`.
- `v₂ · q₁ = (0 + 1 + 0)/√2 = 1/√2`. `proj_{q₁}(v₂) = (1/√2)(1, 1, 0)/√2 = (1/2, 1/2, 0)`. So `u₂ = (0, 1, 1) − (1/2, 1/2, 0) = (−1/2, 1/2, 1)`. `‖u₂‖ = √(1/4 + 1/4 + 1) = √(3/2)`. `q₂ = (−1, 1, 2)/√6`.

Now project `b = (1, 0, 0)`:

- `b · q₁ = 1/√2`.
- `b · q₂ = −1/√6`.

```
   proj_V(b)  =  (1/√2)(1, 1, 0)/√2  +  (−1/√6)(−1, 1, 2)/√6
              =  (1/2, 1/2, 0)        +  (1/6, −1/6, −2/6)
              =  (2/3, 1/3, −1/3).
```

*Residual:* `b − proj_V(b) = (1 − 2/3, 0 − 1/3, 0 + 1/3) = (1/3, −1/3, 1/3)`.

*Verify residual ⊥ V:* dot with `(1, 1, 0)`: `1/3 − 1/3 + 0 = 0`. ✓ Dot with `(0, 1, 1)`: `0 − 1/3 + 1/3 = 0`. ✓

---

## E4. Orthogonal complement

**Problem.** `V = span((1, 1, 0, 1), (0, 1, 1, 0))` ⊂ ℝ⁴. Find a basis of `V⊥`.

**Solution.** `V⊥ = {(w₁, w₂, w₃, w₄) : w · v = 0 for both basis vectors of V}` = solutions of

```
   w₁ + w₂      + w₄ = 0
        w₂ + w₃      = 0
```

Stack as `Aw = 0` with `A = [[1, 1, 0, 1], [0, 1, 1, 0]]`. RREF is already reduced — pivots in columns 1 and 2; free variables `w₃` and `w₄`.

From row 2: `w₂ = −w₃`. From row 1: `w₁ = −w₂ − w₄ = w₃ − w₄`.

Set `w₃ = 1, w₄ = 0`: `(1, −1, 1, 0)`. Set `w₃ = 0, w₄ = 1`: `(−1, 0, 0, 1)`.

> **Basis of `V⊥`:** `((1, −1, 1, 0), (−1, 0, 0, 1))`. **`dim V⊥ = 2`** (matches `n − dim V = 4 − 2 = 2`).

*Verify orthogonality of `V⊥` basis to `V` basis:* dot products are `(1)(1) + (−1)(1) + (1)(0) + (0)(1) = 0` ✓, `(1)(0) + (−1)(1) + (1)(1) + (0)(0) = 0` ✓, etc. (four checks total — all zero).

---

## E5. Gram–Schmidt on three vectors in ℝ⁴

**Problem.** Apply Gram–Schmidt to `v₁ = (1, 1, 0, 0)`, `v₂ = (1, 0, 1, 0)`, `v₃ = (0, 0, 1, 1)` (a basis of a 3-dim subspace of ℝ⁴).

**Solution.**

**Step 1.** `u₁ = (1, 1, 0, 0)`, `‖u₁‖ = √2`, `q₁ = (1, 1, 0, 0)/√2`.

**Step 2.** `v₂ · q₁ = (1 + 0 + 0 + 0)/√2 = 1/√2`. `proj_{q₁}(v₂) = (1/√2)(1, 1, 0, 0)/√2 = (1/2, 1/2, 0, 0)`. `u₂ = (1, 0, 1, 0) − (1/2, 1/2, 0, 0) = (1/2, −1/2, 1, 0)`. `‖u₂‖² = 1/4 + 1/4 + 1 + 0 = 3/2`, `‖u₂‖ = √6/2`. `q₂ = (1, −1, 2, 0)/√6`.

**Step 3.** `v₃ · q₁ = (0 + 0 + 0 + 0)/√2 = 0`. `v₃ · q₂ = (0 − 0 + 2 + 0)/√6 = 2/√6`. `proj_{q₁}(v₃) = 0`, `proj_{q₂}(v₃) = (2/√6)(1, −1, 2, 0)/√6 = (2/6, −2/6, 4/6, 0) = (1/3, −1/3, 2/3, 0)`. `u₃ = (0, 0, 1, 1) − 0 − (1/3, −1/3, 2/3, 0) = (−1/3, 1/3, 1/3, 1)`. `‖u₃‖² = 1/9 + 1/9 + 1/9 + 1 = 12/9 = 4/3`, `‖u₃‖ = 2/√3`. `q₃ = (−1, 1, 1, 3)/(2√3) · 1/(?)` — let me recompute: `u₃ = (−1/3, 1/3, 1/3, 1)`. Multiply by `3` to clear denominators: `(−1, 1, 1, 3)`. Length: `√(1 + 1 + 1 + 9) = √12 = 2√3`. So `q₃ = (−1, 1, 1, 3) / (2√3)`.

> **ONB:**  `q₁ = (1, 1, 0, 0)/√2`, `q₂ = (1, −1, 2, 0)/√6`, `q₃ = (−1, 1, 1, 3)/(2√3)`.

(Verify pairwise orthogonality and unit length — all check out.)

---

## E6. QR factorization from E5

**Problem.** Read off the `R` matrix for `A = [v₁ | v₂ | v₃]` from the E5 calculation, and verify `A = QR`.

**Solution.** Recall `R_{ij} = vⱼ · qᵢ` for `i ≤ j`, with `R_{ii} = ‖uᵢ‖`.

From E5:

- `R_{11} = ‖u₁‖ = √2`.
- `R_{12} = v₂ · q₁ = 1/√2`.
- `R_{13} = v₃ · q₁ = 0`.
- `R_{22} = ‖u₂‖ = √6/2`.
- `R_{23} = v₃ · q₂ = 2/√6`.
- `R_{33} = ‖u₃‖ = 2/√3`.

```
        ⎡ √2     1/√2    0     ⎤
   R =  ⎢  0    √6/2    2/√6   ⎥ .
        ⎣  0     0      2/√3   ⎦
```

```
        ⎡  1/√2     1/√6    −1/(2√3) ⎤
        ⎢  1/√2    −1/√6     1/(2√3) ⎥
   Q =  ⎢   0       2/√6     1/(2√3) ⎥ .
        ⎣   0        0       3/(2√3) ⎦
```

*Spot-check the first column of `QR`:* `Q[:, 0] · R_{11} = √2 · q₁ = √2 · (1, 1, 0, 0)/√2 = (1, 1, 0, 0) = v₁`. ✓

*Second column:* `R_{12} · q₁ + R_{22} · q₂ = (1/√2)(1, 1, 0, 0)/√2 + (√6/2)(1, −1, 2, 0)/√6 = (1/2, 1/2, 0, 0) + (1/2, −1/2, 1, 0) = (1, 0, 1, 0) = v₂`. ✓

(The Python and Sage notebooks do the full check numerically/symbolically.)

---

## E7. Orthogonal matrix verification — rotation by 30°

**Problem.** Show that `R = [[cos 30°, −sin 30°], [sin 30°, cos 30°]] = [[√3/2, −1/2], [1/2, √3/2]]` is orthogonal. Compute `R⁻¹`. Verify length-preservation on `v = (3, 4)`.

**Solution.**

*`RᵀR = I`:*

```
         ⎡ √3/2   1/2  ⎤   ⎡ √3/2  −1/2 ⎤   ⎡ 3/4 + 1/4    −√3/4 + √3/4 ⎤   ⎡ 1   0 ⎤
   RᵀR = ⎢            ⎥ · ⎢            ⎥ = ⎢                            ⎥ = ⎢       ⎥. ✓
         ⎣ −1/2   √3/2 ⎦   ⎣ 1/2    √3/2 ⎦   ⎣ −√3/4 + √3/4    1/4 + 3/4 ⎦   ⎣ 0   1 ⎦
```

*Inverse:* `R⁻¹ = Rᵀ = [[√3/2, 1/2], [−1/2, √3/2]]`. Sanity: `Rᵀ` is rotation by `−30°`, which undoes a rotation by `+30°`. ✓

*Length-preservation:* `‖v‖ = √(9 + 16) = 5`. `Rv = (3·√3/2 − 4·1/2, 3·1/2 + 4·√3/2) = ((3√3 − 4)/2, (3 + 4√3)/2)`. `‖Rv‖² = (3√3 − 4)²/4 + (3 + 4√3)²/4 = ((27 − 24√3 + 16) + (9 + 24√3 + 48))/4 = (43 − 24√3 + 57 + 24√3)/4 = 100/4 = 25`. So `‖Rv‖ = 5 = ‖v‖`. ✓

---

## E8. Least-squares line fit

**Problem.** Fit `y = a + bx` to the four data points `(0, 1), (1, 3), (2, 4), (3, 4)` by least squares. Use the normal equations.

**Solution.**

```
        ⎡ 1   0 ⎤        ⎡ 1 ⎤
        ⎢ 1   1 ⎥        ⎢ 3 ⎥
   A =  ⎢ 1   2 ⎥ ,  b = ⎢ 4 ⎥ ,    x̂ = (a, b)ᵀ.
        ⎣ 1   3 ⎦        ⎣ 4 ⎦
```

Compute the entries:

- `Σ 1 = 4`, `Σ xᵢ = 0 + 1 + 2 + 3 = 6`, `Σ xᵢ² = 0 + 1 + 4 + 9 = 14`.
- `Σ yᵢ = 1 + 3 + 4 + 4 = 12`, `Σ xᵢ yᵢ = 0·1 + 1·3 + 2·4 + 3·4 = 23`.

```
   AᵀA  =  ⎡ 4    6 ⎤,    Aᵀ b  =  ⎡ 12 ⎤ .
            ⎣ 6   14 ⎦              ⎣ 23 ⎦
```

`det(AᵀA) = 4·14 − 36 = 56 − 36 = 20`. `(AᵀA)⁻¹ = (1/20) · [[14, −6], [−6, 4]]`.

```
   x̂  =  (1/20)·⎡ 14·12 − 6·23 ⎤  =  (1/20)·⎡ 168 − 138 ⎤  =  (1/20)·⎡ 30 ⎤  =  ⎡ 3/2 ⎤.
                ⎣ −6·12 + 4·23 ⎦              ⎣ −72 + 92  ⎦            ⎣ 20 ⎦      ⎣  1  ⎦
```

> **Best-fit line:** `y = 3/2 + x = 1.5 + x`.

*Sanity check via residuals.* Predicted `y` at `x = 0, 1, 2, 3`: `1.5, 2.5, 3.5, 4.5`. Residuals: `1 − 1.5 = −0.5`, `3 − 2.5 = 0.5`, `4 − 3.5 = 0.5`, `4 − 4.5 = −0.5`. Sum of residuals = `0` ✓ (this is the consequence of `Aᵀ` having a row of `1`s — it forces the residuals to sum to zero, exactly as expected from `Aᵀ(b − Ax̂) = 0`).

---

## E9. Least-squares quadratic fit

**Problem.** Fit `y = a + bx + cx²` to data `(−1, 1), (0, 0), (1, 0), (2, −2)` by least squares.

**Solution.**

```
        ⎡ 1  −1   1 ⎤        ⎡  1 ⎤
        ⎢ 1   0   0 ⎥        ⎢  0 ⎥
   A =  ⎢ 1   1   1 ⎥ ,  b = ⎢  0 ⎥ ,    x̂ = (a, b, c)ᵀ.
        ⎣ 1   2   4 ⎦        ⎣ −2 ⎦
```

```
              ⎡ 4    2     6 ⎤              ⎡ −1 ⎤
   AᵀA  =  ⎢ 2    6     8 ⎥ ,    Aᵀb =  ⎢ −5 ⎥ .
              ⎣ 6    8    18 ⎦              ⎣ −7 ⎦
```

(Computed entrywise. E.g. `(AᵀA)_{11} = 1+1+1+1 = 4`, `(AᵀA)_{12} = −1+0+1+2 = 2`, etc. `(Aᵀb)_3 = 1·1 + 0·0 + 1·0 + 4·(−2) = 1 − 8 = −7`, etc.)

Solve `AᵀA x̂ = Aᵀb` (Gaussian elimination — or, in practice, `np.linalg.solve`). The solution is

```
   x̂  =  (1/20) · (9, −13, −5)  =  (9/20, −13/20, −1/4).
```

> **Best-fit quadratic:** `y = 9/20 − (13/20) x − (1/4) x² = 0.45 − 0.65 x − 0.25 x²`.

*Spot-check.* Predicted at `x = −1, 0, 1, 2`:

- `x = −1`: `9/20 + 13/20 − 1/4 = 22/20 − 5/20 = 17/20 = 0.85`. Residual `1 − 0.85 = 0.15`.
- `x = 0`:  `9/20 = 0.45`. Residual `0 − 0.45 = −0.45`.
- `x = 1`:  `9/20 − 13/20 − 1/4 = −4/20 − 5/20 = −9/20 = −0.45`. Residual `0 − (−0.45) = 0.45`.
- `x = 2`:  `9/20 − 26/20 − 1 = −17/20 − 20/20 = −37/20 = −1.85`. Residual `−2 − (−1.85) = −0.15`.

Sum of residuals: `0.15 − 0.45 + 0.45 − 0.15 = 0`. ✓ (forced by the constant column of `A`.) Verify in the Python notebook with `np.polyfit(xs, ys, 2)`.

---

## E10. L² inner product — orthogonality of Legendre polynomials and a function projection

**Problem.** Let `⟨f, g⟩ := ∫_{−1}^{1} f(x) g(x) dx` (the L² inner product on `[−1, 1]`).

(a) Show the Legendre polynomials `P₀(x) = 1`, `P₁(x) = x`, `P₂(x) = (3x² − 1)/2` are pairwise orthogonal under `⟨·, ·⟩`.

(b) Project `f(x) = x³` onto `V = span(P₀, P₁, P₂)` and write down the projection.

**Solution.**

(a) Compute three integrals:

- `⟨P₀, P₁⟩ = ∫_{−1}^{1} x dx = 0` (odd integrand on a symmetric interval). ✓
- `⟨P₀, P₂⟩ = ∫_{−1}^{1} (3x² − 1)/2 dx = (1/2)[x³ − x]_{−1}^{1} = (1/2)(0) = 0`. ✓
- `⟨P₁, P₂⟩ = ∫_{−1}^{1} x · (3x² − 1)/2 dx = (1/2) ∫_{−1}^{1} (3x³ − x) dx = 0` (odd). ✓

(b) Need normalized Legendre polynomials. Compute `⟨Pₙ, Pₙ⟩`:

- `⟨P₀, P₀⟩ = ∫_{−1}^{1} 1 dx = 2`. So `‖P₀‖ = √2`, `q₀ = 1/√2`.
- `⟨P₁, P₁⟩ = ∫_{−1}^{1} x² dx = 2/3`. So `‖P₁‖ = √(2/3)`, `q₁ = x · √(3/2)`.
- `⟨P₂, P₂⟩ = ∫_{−1}^{1} ((3x² − 1)/2)² dx = (1/4) ∫_{−1}^{1} (9x⁴ − 6x² + 1) dx = (1/4)(18/5 − 4 + 2) = (1/4)(8/5) = 2/5`. So `‖P₂‖ = √(2/5)`, `q₂ = ((3x² − 1)/2) · √(5/2)`.

Now project `f(x) = x³` onto `V = span(P₀, P₁, P₂)` using §7.5.2:

- `⟨x³, P₀⟩ = ∫_{−1}^{1} x³ dx = 0` (odd). So coordinate along `P₀` is 0.
- `⟨x³, P₁⟩ = ∫_{−1}^{1} x⁴ dx = 2/5`. Coordinate along the *normalized* `q₁ = x√(3/2)`: `⟨x³, q₁⟩ = √(3/2) · 2/5`.
- `⟨x³, P₂⟩ = ∫_{−1}^{1} x³ · (3x² − 1)/2 dx = (1/2) ∫ (3x⁵ − x³) dx = 0` (both odd). So coordinate along `q₂` is 0.

So

```
   proj_V(x³)  =  ⟨x³, q₁⟩ · q₁  =  (√(3/2) · 2/5) · (x · √(3/2))  =  (3/2) · (2/5) · x  =  (3/5) x.
```

> **`proj_V(x³) = (3/5) x`.**

*Sanity.* `x³ − (3/5) x` should be orthogonal to `1`, `x`, and `x²`. Compute:

- `∫_{−1}^{1} (x³ − 3x/5) dx = 0 − 0 = 0`. ✓
- `∫_{−1}^{1} x · (x³ − 3x/5) dx = ∫(x⁴ − 3x²/5) = 2/5 − (3/5)(2/3) = 2/5 − 2/5 = 0`. ✓
- `∫_{−1}^{1} x² · (x³ − 3x/5) dx = 0 − 0 = 0` (both terms odd). ✓

So `(3/5) x` is genuinely the **best degree-≤ 2 polynomial approximation to `x³` on `[−1, 1]` in the L² sense**. The "error polynomial" `x³ − (3/5) x = (1/5)(5x³ − 3x) = (2/5) P₃(x)` is exactly the next Legendre polynomial — that's not a coincidence. It's the Ch 7 way of saying: *the L² projection of `x³` onto degree-≤ 2 polynomials kills exactly the `P₃` component.*
