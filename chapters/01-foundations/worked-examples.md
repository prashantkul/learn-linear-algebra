# Chapter 1 — Worked Examples

Each example is solved in full. Try the problem yourself first; the solution is below the prompt.

---

## Example 1.1 — Domain, codomain, image

Consider `f: ℝ → ℝ` defined by `f(x) = x²`.

**(a)** What is the domain? Codomain? Image?
**(b)** Is f injective? Surjective?

### Solution

**(a)** Domain = ℝ (all real inputs are valid). Codomain = ℝ (we declared the outputs to live in ℝ). Image = `{x² : x ∈ ℝ} = [0, ∞)`. The image is a *strict* subset of the codomain; not every real number is the square of some real number.

**(b)** *Not* injective: `f(2) = f(−2) = 4`, so two different inputs share an output.
*Not* surjective: −1 is in the codomain but no real input gives `f(x) = −1`.

> **Lesson.** Codomain ≠ image in general. The codomain is what you *declare*; the image is what you actually *hit*.

---

## Example 1.2 — Linearity test

Decide whether each function `f: ℝ → ℝ` is linear.

**(a)** `f(x) = 5x`
**(b)** `f(x) = 5x + 2`
**(c)** `f(x) = x²`
**(d)** `f(x) = |x|`

### Solution

The cleanest test is the single equation `f(c₁x₁ + c₂x₂) = c₁f(x₁) + c₂f(x₂)`.

**(a)** Linear. `f(c₁x₁ + c₂x₂) = 5(c₁x₁ + c₂x₂) = c₁(5x₁) + c₂(5x₂) = c₁f(x₁) + c₂f(x₂)`. ✓

**(b)** Not linear. Quick disqualifier: `f(0) = 2 ≠ 0`. Any linear function must satisfy `f(0) = 0`.

**(c)** Not linear. `f(1 + 1) = 4`, but `f(1) + f(1) = 2`. Additivity fails.

**(d)** Not linear. `f(−1 · 2) = |−2| = 2`, but `−1 · f(2) = −2`. Homogeneity fails for negative scalars.

> **Pattern.** A linear function `ℝ → ℝ` *must* be of the form `f(x) = mx`. Any constant term, exponent, absolute value, or other nonlinearity disqualifies it.

---

## Example 1.3 — Vector addition, geometrically

Let `u = (3, 1)` and `v = (1, 2)` in ℝ².

**(a)** Compute `u + v`.
**(b)** Compute `2u − v`.
**(c)** Sketch all three vectors and the parallelogram formed by u, v, and u + v.

### Solution

**(a)** `u + v = (3 + 1, 1 + 2) = (4, 3)`.

**(b)** `2u = (6, 2)`. `2u − v = (6 − 1, 2 − 2) = (5, 0)`.

**(c)** The arrows from the origin to (3, 1), (1, 2), and (4, 3) form a parallelogram. The sum (4, 3) is the diagonal opposite the origin.

```python
# See code/01_foundations.ipynb for the matplotlib version of this picture.
```

---

## Example 1.4 — Functions of two variables, linearity

Decide whether each function `f: ℝ² → ℝ` is linear.

**(a)** `f(x, y) = 3x + 4y`
**(b)** `f(x, y) = 3x + 4y + 7`
**(c)** `f(x, y) = xy`
**(d)** `f(x, y) = max(x, y)`

### Solution

**(a)** Linear. Check additivity: `f((x₁,y₁) + (x₂,y₂)) = f(x₁+x₂, y₁+y₂) = 3(x₁+x₂) + 4(y₁+y₂) = (3x₁+4y₁) + (3x₂+4y₂) = f(x₁,y₁) + f(x₂,y₂)`. ✓ Homogeneity is similar.

**(b)** Not linear. `f(0, 0) = 7 ≠ 0`.

**(c)** Not linear. `f(1, 1) = 1`, but `f(2, 2) = 4`, while if linear we'd need `f(2·(1,1)) = 2·f(1,1) = 2`. Homogeneity fails.

**(d)** Not linear. `f(1, 0) + f(0, 1) = 1 + 1 = 2`, but `f((1,0) + (0,1)) = f(1, 1) = 1`. Additivity fails.

> **Pattern.** Every linear function `ℝⁿ → ℝ` is of the form `f(x₁, …, xₙ) = a₁x₁ + … + aₙxₙ` for some constants `a₁, …, aₙ`. We will see in Chapter 4 that this list of constants is the **row** of a matrix.

---

## Example 1.5 — Composition

Let `f(x) = 2x + 1` and `g(x) = x²`.

**(a)** Compute `(g ∘ f)(x)` and `(f ∘ g)(x)`.
**(b)** Are they equal?

### Solution

**(a)** `(g ∘ f)(x) = g(f(x)) = g(2x + 1) = (2x + 1)² = 4x² + 4x + 1`.
`(f ∘ g)(x) = f(g(x)) = f(x²) = 2x² + 1`.

**(b)** No: `(g ∘ f)(1) = 9` but `(f ∘ g)(1) = 3`.

> **Lesson.** Function composition is **not commutative**. Foreshadowing: matrix multiplication is composition of linear maps, and that is also not commutative.

---

## Example 1.6 — A linear function ℝ³ → ℝ²

Let `T: ℝ³ → ℝ²` be defined by `T(x, y, z) = (x + 2y, y − z)`.

**(a)** Verify T is linear.
**(b)** Compute `T(1, 0, 0)`, `T(0, 1, 0)`, `T(0, 0, 1)`.
**(c)** Express `T(2, 3, −1)` as a linear combination of the three vectors in (b).

### Solution

**(a)** Each component of the output is of the form `aᵢx + bᵢy + cᵢz` with no constants — so each is linear, and a function whose components are all linear is itself linear. (We'll formalize this in Chapter 4.)

**(b)**
- `T(1, 0, 0) = (1, 0)`
- `T(0, 1, 0) = (2, 1)`
- `T(0, 0, 1) = (0, −1)`

**(c)** `(2, 3, −1) = 2·(1,0,0) + 3·(0,1,0) + (−1)·(0,0,1)`. Since T is linear:
`T(2, 3, −1) = 2·T(1,0,0) + 3·T(0,1,0) + (−1)·T(0,0,1) = 2(1,0) + 3(2,1) + (−1)(0,−1) = (2+6+0, 0+3+1) = (8, 4)`.

Direct check: `T(2, 3, −1) = (2 + 2·3, 3 − (−1)) = (8, 4)`. ✓

> **Lesson preview.** Knowing T's value on the three "standard basis vectors" `(1,0,0), (0,1,0), (0,0,1)` is enough to compute T on *every* vector. Those three values, written as columns, form the **matrix of T**. This is the bridge from "function" to "matrix" we'll cross in Chapter 4.
