# Chapter 3 — Sources

## Bretscher (5e)

- **Chapter 1: Linear Equations** — pp. 1–40.
  - §1.1 Introduction to Linear Systems (pp. 1–7).
  - §1.2 Matrices, Vectors, and Gauss–Jordan Elimination (pp. 8–24).
  - §1.3 On the Solutions of Linear Systems; Matrix Algebra (pp. 25–40).

## Saveliev

- **§1.1 Introduction to linear algebra** — pp. 7–11. The same coffee-blend motivating example, with a geometric (line-intersection) view.

## External companions

- MIT OCW 18.06, Lecture 2 — "Elimination with Matrices."
- 3Blue1Brown, *Essence of Linear Algebra*, Ch. 7 — "Inverse matrices, column space, null space."

## TODO

- [x] Write `notes.md`, `worked-examples.md`, `exercises.md`
- [x] Build Python notebook (`code/python/03_linear_systems.ipynb`) — RREF from scratch + visualisations
- [x] Build SageMath notebook (`code/sage/03_linear_systems.ipynb`) — exact arithmetic + parametric solutions + chemistry application
- [ ] **Add LU factorization appendix** — reinterpret Gaussian elimination as A = LU (and PA = LU with partial pivoting). Cover: how forward elimination builds L while reducing A to U, solving Ax = b via forward-sub (Ly = b) then back-sub (Ux = y), why LU is faster than GJ when solving Ax = b for many right-hand sides, and connection to Cholesky (Ch 10). Extend Python + Sage notebooks with a from-scratch `lu_decompose` and compare against `scipy.linalg.lu` / Sage's `A.LU()`.
