# Chapter 4 — Linear Transformations and Matrix Algebra

## Learning objectives

- Define a linear transformation and check whether a given map is linear.
- Identify a linear transformation with its matrix (and back).
- Compose linear transformations via matrix multiplication.
- Recognize and build the standard 2D linear transformations: rotations, reflections, scalings, shears, projections.
- Decide whether a linear transformation is invertible, and compute the inverse matrix.

## Prerequisites

- Chapters 1–3.

## Estimated time

7–9 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through linearity, the standard matrix, the 2D geometric catalog, composition = matrix multiplication, the identity and inverse, invertibility criteria, and a preview of image/kernel.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems including linearity checks, building rotation/reflection matrices, composition with non-commutativity, `2 × 2` inverse formula, `3 × 3` inverse via Gauss–Jordan, a rank-deficient matrix, and `(AB)⁻¹ = B⁻¹ A⁻¹`.
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers, including a graphics-pipeline word problem (rotate around an arbitrary pivot).
- **Python notebook:** [`code/python/04_linear_transformations.ipynb`](code/python/04_linear_transformations.ipynb) — NumPy + matplotlib. Linearity by random sampling, standard-matrix builder, the 2D catalog visualized on the unit square, rotation animation frames, composition and non-commutativity, Gauss–Jordan inverse, rank-deficient projection showing information loss, socks-and-shoes verification.
- **SageMath notebook:** [`code/sage/04_linear_transformations.ipynb`](code/sage/04_linear_transformations.ipynb) — exact symbolic arithmetic. Symbolic linearity check, derived `2 × 2` inverse formula via `solve`, symbolic angle-addition via matrix multiplication, proof of `(AB)⁻¹ = B⁻¹ A⁻¹`, plus 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
