# Chapter 7 — Orthogonality, Projections, Gram–Schmidt, QR, Least Squares

## Learning objectives

- Compute coordinates in an orthonormal basis by single dot products (no system to solve).
- Project a vector onto a line and onto a general subspace; recognize the orthogonal complement.
- Build an orthonormal basis from any basis using Gram–Schmidt.
- Factor a matrix as `A = QR` and use it to solve `Ax = b`.
- Recognize an orthogonal matrix and its preserving properties (length, angle, det = ±1).
- Solve overdetermined systems via least squares; set up and solve the normal equations.
- Define an inner product abstractly; use the L² inner product to project functions and produce Legendre polynomials.

## Prerequisites

- Chapters 1–6.

## Estimated time

8–10 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through dot product, orthonormal bases, projections, the orthogonal complement, Gram–Schmidt, QR factorization, orthogonal matrices, least squares with normal equations + QR, and abstract inner product spaces (L² on functions, Legendre polynomials, Fourier preview). Includes the four fundamental subspaces and a worked least-squares fit on a noisy 8-point dataset.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems: ONB coordinate verification, line/plane projections in ℝ³, orthogonal complement, Gram–Schmidt + QR in ℝ⁴, rotation matrix verification, line and quadratic least-squares fits, and L²-projection of `x³` onto degree-≤ 2 polynomials (with the `(3/5)x` answer derived from Legendre orthogonality).
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers, including projection matrices, orthogonal-matrix tests, Vandermonde least squares, L² inner products on `[0, 1]`, and Fourier-basis orthogonality on `[−π, π]`.
- **Python notebook:** [`code/python/07_orthogonality.ipynb`](code/python/07_orthogonality.ipynb) — NumPy + matplotlib. Gram–Schmidt from scratch, QR cross-checked against `numpy.linalg.qr`, 3D plots of line and plane projections, line/cubic least-squares fits with plots, normal equations vs QR conditioning demo, and Legendre polynomials computed numerically with the L² projection of `sin(πx/2)` onto `P_3`.
- **SageMath notebook:** [`code/sage/07_orthogonality.ipynb`](code/sage/07_orthogonality.ipynb) — exact arithmetic. Symbolic ONB verification, projection matrices in `Matrix(QQ)`, Gram–Schmidt with manual normalization, QR factorization in `Matrix(AA)`, exact least-squares via `solve_right`, and the L² inner product on `PolynomialRing(QQ)` producing the orthogonal Legendre polynomials `L_n` (rational coefficients) and the exact projection of `x³` onto `P_2`. Includes 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
