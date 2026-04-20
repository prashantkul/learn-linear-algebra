# Chapter 6 — Sources

## Bretscher (5e)

- **Chapter 4: Linear Spaces** — pp. 166–201. (Bretscher uses "linear space" instead of "vector space" to avoid the confusion that "vectors" must be arrows.)
  - §4.1 Introduction to Linear Spaces (pp. 166–177).
  - §4.2 Linear Transformations and Isomorphisms (pp. 178–185).
  - §4.3 The Matrix of a Linear Transformation (pp. 186–201).

## Saveliev

- This abstraction step is Bretscher's territory; Saveliev focuses on geometric ℝⁿ.

## External companions

- Sheldon Axler, *Linear Algebra Done Right*, Ch. 1 — for a proof-first take if you want a second perspective.

## TODO

- [x] Write `notes.md`, `worked-examples.md`, `exercises.md`
- [x] Build Python notebook (`code/python/06_abstract_spaces.ipynb`) — polynomials as coefficient vectors, differentiation / integration / multiplication-by-`x` as matrices, similarity check for `T(p) = p + p'`, derivative on a 5-dim Fourier-like subspace, polynomial interpolation as basis change
- [x] Build SageMath notebook (`code/sage/06_abstract_spaces.ipynb`) — symbolic axiom verification, `PolynomialRing(QQ)`, derivative matrix via coefficients, `D ∘ M_x` as matrix product, similarity in Lagrange basis, trace-zero subspace, 5 exercises with solutions
