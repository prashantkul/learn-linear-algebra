# Chapter 6 — Abstract Linear (Vector) Spaces

## Learning objectives

- State the eight axioms of a vector space and verify them in concrete examples (polynomials, matrices, functions).
- Decide whether a given subset of `Pₙ`, `M_{m×n}`, or `F(ℝ, ℝ)` is a subspace.
- Compute coordinates of a vector in a non-standard basis; convert between bases.
- Build the matrix `[T]_{𝓒 ← 𝓑}` of a linear transformation in chosen bases.
- Recognize when two vector spaces are isomorphic.
- Use coordinates to reduce abstract problems to ℝⁿ problems.

## Prerequisites

- Chapters 1–5. This chapter is the first big leap into abstraction.

## Estimated time

6–8 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through the eight vector space axioms, examples (`Pₙ`, `M_{m×n}`, function spaces, ODE solution spaces), subspaces in abstract spaces, linear independence/span/basis/dimension via coordinates, linear transformations, isomorphisms, the matrix of an LT, and change of basis via similarity. Includes the commutative diagram bridging abstract `V` to `ℝⁿ` and a Ch 7–10 preview.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems: axiom verification for `M_{2×2}`, subspace checks in `P₃` and `M_{2×2}`, linear independence and coordinates via coefficient vectors, matrices of differentiation / multiplication-by-`x` / Pascal shift / trace, change of basis with full similarity verification, and the ODE solution space of `y'' − 3y' + 2y = 0` with a Wronskian sighting.
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers, including subspace tests across `P₃` / `M_{2×2}` / `C(ℝ)`, Lagrange basis coordinates ("coordinates are values"), isomorphism checks, and similarity in ℝ².
- **Python notebook:** [`code/python/06_abstract_spaces.ipynb`](code/python/06_abstract_spaces.ipynb) — NumPy + matplotlib. Polynomials as coefficient vectors, differentiation & truncated integration as 4×4 matrices, independence via rank, Lagrange-basis coordinate conversion, similarity verification for `T(p) = p + p'`, derivative matrix on a 5-dim Fourier-like subspace of `C^∞`, and polynomial interpolation as a single basis-change matrix (with plot).
- **SageMath notebook:** [`code/sage/06_abstract_spaces.ipynb`](code/sage/06_abstract_spaces.ipynb) — exact arithmetic. Symbolic verification of all eight axioms on `P₂`, `PolynomialRing(QQ)` for coefficient extraction, derivative and multiplication-by-`x` matrices with `D ∘ M_x` via matrix product, symbolic similarity check, trace-zero subspace of `M_{2×2}`, plus 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
