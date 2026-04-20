# Chapter 5 — Subspaces, Image, Kernel, Basis, Dimension

## Learning objectives

- Define subspace and check whether a given subset is a subspace.
- Compute the image (column space) and kernel (null space) of a matrix.
- Test a list of vectors for linear independence; build a basis for a subspace.
- Compute the dimension of a subspace; understand the rank–nullity theorem.
- Express a vector in coordinates relative to a chosen basis.

## Prerequisites

- Chapters 1–4.

## Estimated time

8–10 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through subspaces, image/kernel, linear independence, basis, dimension, rank–nullity, coordinates, and change of basis. Includes the extended invertible-matrix theorem and a Ch 6 preview.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems: subspace axiom checks, image/kernel from RREF, independence tests, basis extraction, rank–nullity from shape, non-standard coordinates, change of basis, and a network-flow/kernel application.
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers, including a subspace-intersection problem and a polynomial-subspace preview of Chapter 6.
- **Python notebook:** [`code/python/05_subspaces.ipynb`](code/python/05_subspaces.ipynb) — NumPy + matplotlib. From-scratch RREF, 3D visualization of the motivating matrix's image (plane) and kernel (line), rank–nullity verification on random rank-controlled matrices, coordinate conversions, change-of-basis, and a polynomial-fit application.
- **SageMath notebook:** [`code/sage/05_subspaces.ipynb`](code/sage/05_subspaces.ipynb) — exact arithmetic. Symbolic subspace axiom verification, hand-computed vs. built-in image/kernel, all 10 conditions of the invertible-matrix theorem checked on a random rational matrix, polynomial subspace with `PolynomialRing(QQ)`, plus 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
