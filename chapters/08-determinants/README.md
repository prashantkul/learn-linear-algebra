# Chapter 8 — Determinants: Algebra and Geometry

## Learning objectives

- Compute determinants of small matrices by Sarrus rule, by cofactor (Laplace) expansion along any row or column, and by row reduction to upper triangular.
- State and apply the three elementary-row-operation rules: swap flips sign, row scaling multiplies, row addition leaves `det` unchanged.
- Prove and apply multiplicativity: `det(AB) = det(A) · det(B)`; deduce `det(A⁻¹) = 1/det(A)` and `det(PAP⁻¹) = det(A)`.
- Interpret `det A` geometrically as the signed `n`-volume scaling factor of `A` as a linear transformation — the foundation of the Jacobian in change-of-variables.
- Use Cramer's Rule (and know when not to) and the adjugate formula for `A⁻¹`.
- Read `det(A − λI)` as the gateway to eigenvalues (Ch 9).

## Prerequisites

- Chapters 1–7.

## Estimated time

5–7 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through the determinant: motivating invertibility/volume/orientation problem, 2×2 area, permutations and sign, Leibniz formula, cofactor expansion, elementary row operations, practical row-reduction algorithm, multiplicativity, `det(Aᵀ)=det(A)`, signed-volume geometry, Cramer's Rule, adjugate and closed-form inverse, and the preview of `det(A − λI)` for Ch 9.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems: 2×2 signed area, 3×3 three ways (Sarrus, cofactor, row reduction), sparse 4×4 via clever expansion, symbolic Vandermonde, multiplicativity check, Cramer on a 3×3, adjugate-inverse of a 3×3, parallelepiped volume in ℝ³, row-operation predictions, and `det(A − λI)` for a 2×2.
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers: 2×2 area, 3×3 two-way cofactor cross-check, a 4×4 permutation-matrix determinant, row-operation ledger, multiplicativity and `det(A⁻¹)`, Cramer 2×2, adjugate inverse of a 2×2, closed-form Vandermonde `V(1, 2, 3, 4)`, parallelepiped volume and orientation, and `det(A − λI)` for a 3×3 (eigenvalues `{2, 2, 5}`).
- **Python notebook:** [`code/python/08_determinants.ipynb`](code/python/08_determinants.ipynb) — NumPy + matplotlib. Cofactor recursion from scratch, LU-based `det`, timing comparison, 2×2 transformations visualized on the unit square (area scaling, orientation flip), 3×3 on the unit cube, row-operation verification, Vandermonde closed-form, Cramer's Rule cross-checked against `numpy.linalg.solve`, adjugate computation with `A · adj(A) = (det A) · I`, and a plot of the characteristic polynomial with its roots marked.
- **SageMath notebook:** [`code/sage/08_determinants.ipynb`](code/sage/08_determinants.ipynb) — exact arithmetic. Three `det` methods cross-checked over `QQ`, cofactor recursion from scratch, elementary-row-operation rules verified symbolically, multiplicativity over random invertible matrices, `det(Aᵀ) = det(A)` and block-triangular determinants, **symbolic** Vandermonde identity derived in `SR`, Cramer's Rule over `QQ`, adjugate formula, characteristic polynomial in `PolynomialRing(QQ)` with factoring and root extraction over `AA`. Includes 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
