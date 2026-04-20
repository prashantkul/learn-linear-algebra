# Chapter 3 — Exercises

Ten problems to drill the algorithm and the concepts. Try each one with paper before peeking. Answers at the bottom.

---

### 1. Solve by Gauss–Jordan

```
   2x  +    y  =  5
    x  +  3y  =  10
```

### 2. Solve a 3×3 with a clean answer

```
   x  +    y  +    z  =  6
    x  +  2y  +  3z  =  14
    x  +  4y  +  9z  =  36
```

### 3. Detect inconsistency

Without finding a numerical solution, decide whether the system below has a solution. If yes, find it; if no, justify with the rank test.

```
   x  +  y  +  z  =  3
   2x  +  2y  +  2z  =  7
```

### 4. Parametric solution — one free variable

Solve and write the answer in particular + parameter form:

```
   x  +  2y  −    z  =  3
   2x  +  4y  +    z  =  9
```

### 5. Two free variables

Find every solution of the homogeneous system `Ax = 0` for

```
   A  =  ⎡ 1   2   0   3 ⎤
         ⎣ 0   0   1   1 ⎦
```

Express the answer as a linear combination of two homogeneous direction vectors.

### 6. Consistency test in symbolic form

For which values of `k` does the system

```
   x  +    y  +    z  =  1
    x  +  2y  +  4z  =  k
   3x  +  5y  +  9z  =  k + 2
```

have **at least one** solution? When it does, give the general solution.

### 7. Rank from RREF

Compute `rank(A)` for

```
   A  =  ⎡ 1   2   3 ⎤
         ⎢ 2   4   6 ⎥
         ⎣ 3   6   9 ⎦
```

Without doing any further work, what is the dimension of the null space of `A`? (i.e., how many free variables does `Ax = 0` have?)

### 8. Build the system, then solve

> Three friends pool money. Alice puts in twice what Bob does. Carol puts in $5 more than Bob. Together they have $35. How much does each contribute?

Set up the linear system (3 unknowns) and solve.

### 9. Column-picture verification

For

```
   A  =  ⎡ 1   2 ⎤      b  =  ⎡ 5  ⎤
         ⎣ 3   4 ⎦              ⎣ 11 ⎦
```

Find scalars `x, y` such that `x · (1, 3) + y · (2, 4) = (5, 11)`. Confirm that this is the same `(x, y)` you would get from solving `Ax = b` by Gauss–Jordan.

### 10. When can `Ax = b` be solved no matter what `b` is?

Suppose `A` is `m × n`. Argue (in words, no calculation) that **`Ax = b` has at least one solution for every `b ∈ ℝᵐ`** if and only if `rank(A) = m`. (Hint: think about the column picture and where the right-hand sides live.)

---

## Answers

### 1.  `(x, y) = (1, 3)`.

Augmented matrix `[ 2 1 | 5 ; 1 3 | 10 ]`. Swap rows to get a `1` on top, eliminate column 1 in row 2 (`R2 ← R2 − 2·R1`), scale, back-clear column 2.

### 2.  `(x, y, z) = (16/11, 14/11, 36/11)`.

Worked example 2 in `worked-examples.md` shows every step.

### 3.  **No solution.**

`R2 ← R2 − 2·R1` gives `[ 0 0 0 | 1 ]` — a contradiction row. `rank(A) = 1`, `rank([A|b]) = 2`. By Rouché–Capelli, inconsistent.

### 4.  `(x, y, z) = (4, 0, 1) + t · (−2, 1, 0)`.

Augmented matrix `[ 1 2 −1 | 3 ; 2 4 1 | 9 ]`. `R2 ← R2 − 2·R1` → `[ 1 2 −1 | 3 ; 0 0 3 | 3 ]`. Scale `R2 ← (1/3)R2`, then `R1 ← R1 + R2` → RREF `[ 1 2 0 | 4 ; 0 0 1 | 1 ]`. `y` is free; `x = 4 − 2y`, `z = 1`. Particular at `t = 0`: `(4, 0, 1)`. Verify: `4 + 0 − 1 = 3` ✓, `8 + 0 + 1 = 9` ✓.

### 5.  `x = s · (−2, 1, 0, 0) + t · (−3, 0, −1, 1)`.

The matrix is already in RREF (pivots in columns 1, 3). Free: `x₂, x₄`. Equations: `x₁ + 2 x₂ + 3 x₄ = 0`, `x₃ + x₄ = 0` → `x₁ = −2 x₂ − 3 x₄`, `x₃ = −x₄`. Set `x₂ = s`, `x₄ = t`:

```
   (x₁, x₂, x₃, x₄)  =  s · (−2, 1, 0, 0)  +  t · (−3, 0, −1, 1).
```

A 2-dim plane through origin in ℝ⁴.

### 6.  Consistent **only for `k = 1`**.

Eliminate column 1 from rows 2, 3 (`R2 ← R2 − R1`, `R3 ← R3 − 3·R1`):
```
   ⎡ 1   1   1 │  1     ⎤
   ⎢ 0   1   3 │ k − 1  ⎥
   ⎣ 0   2   6 │ k − 1  ⎦
```

`R3 ← R3 − 2·R2`:
```
   ⎡ 1   1   1 │       1     ⎤
   ⎢ 0   1   3 │     k − 1   ⎥
   ⎣ 0   0   0 │ −(k − 1)   ⎦
```

The bottom row needs `−(k − 1) = 0`, i.e. `k = 1`. When `k = 1`:
```
   ⎡ 1   1   1 │ 1 ⎤
   ⎢ 0   1   3 │ 0 ⎥
   ⎣ 0   0   0 │ 0 ⎦
```

Free: `z`. `y = −3z`, `x = 1 − y − z = 1 + 3z − z = 1 + 2z`. So

```
   (x, y, z)  =  (1, 0, 0)  +  t · (2, −3, 1).
```

### 7.  `rank(A) = 1`. Null space dimension = `3 − 1 = 2`.

Rows 2 and 3 are scalar multiples of row 1, so RREF is `[ 1 2 3 ; 0 0 0 ; 0 0 0 ]`. One pivot.

### 8.  `(Alice, Bob, Carol) = (15, 7.5, 12.5)`.

Let `a, b, c` be contributions. System:
```
   a − 2b      = 0
       c − b   = 5
   a + b + c   = 35
```
Solve to get `b = 7.5`, `a = 15`, `c = 12.5`. Check: `15 + 7.5 + 12.5 = 35` ✓.

### 9.  `(x, y) = (1, 2)`. `1·(1, 3) + 2·(2, 4) = (1 + 4, 3 + 8) = (5, 11)` ✓.

Solving `Ax = b` by Gauss–Jordan on `[ 1 2 | 5 ; 3 4 | 11 ]` gives the same `(1, 2)`. Two pictures, one answer.

### 10.  *Sketch.*

`Ax` is always a **linear combination of A's columns**, so the set of all possible right-hand sides — `{Ax : x ∈ ℝⁿ}` — is exactly the **span of A's columns** (a subspace of ℝᵐ). For `Ax = b` to have a solution *for every `b ∈ ℝᵐ`*, the column span must be **all of ℝᵐ**. That happens iff there are `m` linearly independent columns, i.e. `rank(A) = m`. (We'll formalize "linearly independent" in Ch 5.) Equivalent rephrasing: every row in the RREF of A has a pivot — no all-zero rows — so the rank test never produces a contradiction row, no matter what `b` is.

---

> **Pro tip.** Re-verify each parametric answer by plugging the particular solution (set `t = 0`) AND a second value (say `t = 1`) into the original equations. Two checks catch nearly all arithmetic slips.
