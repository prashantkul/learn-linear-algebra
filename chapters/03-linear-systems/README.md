# Chapter 3 — Linear Systems and Gauss–Jordan Elimination

## Learning objectives

- Translate a real-world problem into a system of linear equations.
- Carry out Gauss–Jordan elimination by hand and recognize the three possible outcomes (unique, none, infinitely many).
- Read the rank and the structure of solutions off a reduced row-echelon form (RREF).
- Express a system in matrix–vector form A**x** = **b** and switch fluidly between row-picture and column-picture.

## Prerequisites

- Chapters 1–2.

## Estimated time

6–8 hours.

## Files

- **Notes:** [`notes.md`](notes.md) — first-principles walk through linear equations, EROs, Gauss–Jordan, RREF, the three outcomes, rank, and the row/column pictures.
- **Worked examples:** [`worked-examples.md`](worked-examples.md) — 10 fully solved problems including the coffee-blend setup, an inconsistent system, parametric solutions, and a symbolic consistency analysis.
- **Exercises:** [`exercises.md`](exercises.md) — 10 problems with answers.
- **Python notebook:** [`code/python/03_linear_systems.ipynb`](code/python/03_linear_systems.ipynb) — NumPy + matplotlib. From-scratch RREF with traced steps, the three outcomes plotted, the column picture, three planes in ℝ³, parametric line of solutions, ill-conditioning warning, Vandermonde quadratic fit.
- **SageMath notebook:** [`code/sage/03_linear_systems.ipynb`](code/sage/03_linear_systems.ipynb) — exact ℚ arithmetic. Step-by-step trace, `right_kernel()` for parametric solutions, symbolic systems with parameters, exact Vandermonde fit, balancing chemical equations, plus 5 exercises with solutions.
- **Sources & PDF extracts:** [`sources.md`](sources.md).
