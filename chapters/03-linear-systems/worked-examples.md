# Chapter 3 — Worked Examples

Ten fully-solved problems covering modeling, Gauss–Jordan, the three outcomes, parametric solutions, rank, and the column picture. Read with pencil and paper — re-doing each step yourself is the only way the algorithm stops feeling clumsy.

---

## Example 1 — Building a system from a story

> A school cafeteria sells two lunch combos. Combo A has 1 sandwich and 2 cookies and costs $7. Combo B has 2 sandwiches and 1 cookie and costs $8. What is the per-item price of a sandwich and a cookie (assuming pricing is purely per-item)?

**Setup.** Let `s` = sandwich price, `c` = cookie price. The two combos give:

```
   1·s  +  2·c  =  7
   2·s  +  1·c  =  8
```

A 2×2 system.

**Solve by Gauss–Jordan.** Augmented matrix:

```
   ⎡ 1   2 │ 7 ⎤
   ⎣ 2   1 │ 8 ⎦
```

Zero column 1 below pivot:
```
   R2 ← R2 − 2·R1
   ⎡ 1    2 │  7 ⎤
   ⎣ 0   −3 │ −6 ⎦
```

Make pivot in row 2:
```
   R2 ← (−1/3)·R2
   ⎡ 1   2 │ 7 ⎤
   ⎣ 0   1 │ 2 ⎦
```

Zero above pivot in column 2:
```
   R1 ← R1 − 2·R2
   ⎡ 1   0 │ 3 ⎤
   ⎣ 0   1 │ 2 ⎦
```

**Answer:** `s = $3`, `c = $2`. Verify: `3 + 4 = 7` ✓, `6 + 2 = 8` ✓.

---

## Example 2 — A 3×3 unique solution

Solve

```
   x  +  y  +  z  =  6
   2x  +  y  +  3z  =  14
   x  +  4y  +  9z  =  36
```

**Augmented matrix.**
```
   ⎡ 1   1   1 │  6 ⎤
   ⎢ 2   1   3 │ 14 ⎥
   ⎣ 1   4   9 │ 36 ⎦
```

**Step 1.** Zero column 1 below row 1.
```
   R2 ← R2 − 2·R1     R3 ← R3 − R1
   ⎡ 1   1    1 │  6 ⎤
   ⎢ 0  −1    1 │  2 ⎥
   ⎣ 0   3    8 │ 30 ⎦
```

**Step 2.** Make pivot in row 2 equal `1`.
```
   R2 ← (−1)·R2
   ⎡ 1   1    1 │  6 ⎤
   ⎢ 0   1   −1 │ −2 ⎥
   ⎣ 0   3    8 │ 30 ⎦
```

Zero column 2 in row 3:
```
   R3 ← R3 − 3·R2
   ⎡ 1   1    1 │  6 ⎤
   ⎢ 0   1   −1 │ −2 ⎥
   ⎣ 0   0   11 │ 36 ⎦
```

**Step 3.** Make pivot in row 3 equal `1`.
```
   R3 ← (1/11)·R3
   ⎡ 1   1    1  │   6   ⎤
   ⎢ 0   1   −1  │  −2   ⎥
   ⎣ 0   0    1  │ 36/11 ⎦
```

**Step 4.** Zero column 3 above row 3.
```
   R2 ← R2 + R3      R1 ← R1 − R3
   ⎡ 1   1   0 │  6 − 36/11 ⎤   →  ⎡ 1   1   0 │ 30/11 ⎤
   ⎢ 0   1   0 │ −2 + 36/11 ⎥   →  ⎢ 0   1   0 │ 14/11 ⎥
   ⎣ 0   0   1 │ 36/11      ⎦      ⎣ 0   0   1 │ 36/11 ⎦
```

**Step 5.** Zero column 2 above row 2.
```
   R1 ← R1 − R2
   ⎡ 1   0   0 │ 16/11 ⎤
   ⎢ 0   1   0 │ 14/11 ⎥
   ⎣ 0   0   1 │ 36/11 ⎦
```

**Answer:** `(x, y, z) = (16/11, 14/11, 36/11)`. (Three rationals — your Sage notebook will print exactly this. NumPy would show `1.4545…, 1.2727…, 3.2727…`.)

---

## Example 3 — Inconsistent system (no solution)

Solve

```
   x  +  y  =  3
   2x  +  2y  =  5
```

**Augmented matrix.**
```
   ⎡ 1   1 │ 3 ⎤
   ⎣ 2   2 │ 5 ⎦
```

**One step.**
```
   R2 ← R2 − 2·R1
   ⎡ 1   1 │  3 ⎤
   ⎣ 0   0 │ −1 ⎦
```

The bottom row says `0·x + 0·y = −1`, i.e. `0 = −1`. **Contradiction**, so the system has **no solution**.

**Geometric reading (row picture):** the two lines `x + y = 3` and `2x + 2y = 5` (i.e. `x + y = 5/2`) are parallel and distinct — they never intersect.

**Algebraic reading (rank test):** `rank(A) = 1`, but `rank([A|b]) = 2` because the augmented matrix has a pivot in the last column. Since `rank(A) < rank([A|b])`, **inconsistent** by Rouché–Capelli (§3.10).

---

## Example 4 — Infinitely many solutions; write the parametric form

Solve

```
   x  +  2y  −    z  =  4
   2x  +  4y  +  3z  =  18
   x  +  2y  +  4z  =  14
```

**Augmented matrix.**
```
   ⎡ 1   2  −1 │  4 ⎤
   ⎢ 2   4   3 │ 18 ⎥
   ⎣ 1   2   4 │ 14 ⎦
```

**Eliminate column 1.**
```
   R2 ← R2 − 2·R1     R3 ← R3 − R1
   ⎡ 1   2  −1 │  4 ⎤
   ⎢ 0   0   5 │ 10 ⎥
   ⎣ 0   0   5 │ 10 ⎦
```

**Eliminate column 3.**
```
   R3 ← R3 − R2      R2 ← (1/5)·R2
   ⎡ 1   2  −1 │  4 ⎤
   ⎢ 0   0   1 │  2 ⎥
   ⎣ 0   0   0 │  0 ⎦
```

**Final clean-up:** zero column 3 in row 1.
```
   R1 ← R1 + R2
   ⎡ 1   2   0 │ 6 ⎤
   ⎢ 0   0   1 │ 2 ⎥
   ⎣ 0   0   0 │ 0 ⎦
```

That's RREF. **Pivots in columns 1 and 3** → leading variables `x, z`. **Column 2 has no pivot** → `y` is **free**. Read:

```
   x  +  2y  =  6      →   x = 6 − 2y
                z = 2
```

Let `y = t`. The full solution set is

```
   (x, y, z)  =  (6 − 2t,  t,  2)
              =  (6, 0, 2)  +  t · (−2, 1, 0)
```

A **line in ℝ³** through `(6, 0, 2)` in direction `(−2, 1, 0)`.

**Sanity check at `t = 0`:** `(6, 0, 2)` → `6 + 0 − 2 = 4` ✓, `12 + 0 + 6 = 18` ✓, `6 + 0 + 8 = 14` ✓.

**Sanity check at `t = 1`:** `(4, 1, 2)` → `4 + 2 − 2 = 4` ✓, `8 + 4 + 6 = 18` ✓, `4 + 2 + 8 = 14` ✓.

**Particular + homogeneous decomposition:**
- Particular: `x_p = (6, 0, 2)`.
- Homogeneous direction: `h = (−2, 1, 0)`. (You can verify `Ah = 0` directly: `−2 + 2 − 0 = 0`, `−4 + 4 + 0 = 0`, `−2 + 2 + 0 = 0`.)

---

## Example 5 — Two free variables; a plane of solutions

Solve `Ax = 0` for

```
   A  =  ⎡ 1   2   3   4 ⎤
         ⎢ 2   4   6   8 ⎥
         ⎣ 1   2   3   5 ⎦
```

**Augmented `[A | 0]`.** (`b` is zero, so we'll just track `A`; the `b`-column stays `0` throughout.)

Eliminate column 1:
```
   R2 ← R2 − 2·R1     R3 ← R3 − R1
   ⎡ 1   2   3   4 ⎤
   ⎢ 0   0   0   0 ⎥
   ⎣ 0   0   0   1 ⎦
```

Swap rows 2, 3 (so the all-zero row goes to bottom):
```
   ⎡ 1   2   3   4 ⎤
   ⎢ 0   0   0   1 ⎥
   ⎣ 0   0   0   0 ⎦
```

Zero column 4 in row 1: `R1 ← R1 − 4·R2`.
```
   ⎡ 1   2   3   0 ⎤
   ⎢ 0   0   0   1 ⎥
   ⎣ 0   0   0   0 ⎦
```

RREF. **Pivots in columns 1 and 4.** **Free: `x₂` and `x₃`.** Read equations:

```
   x₁ + 2 x₂ + 3 x₃  =  0      →   x₁ = −2 x₂ − 3 x₃
                          x₄  =  0
```

Let `x₂ = s`, `x₃ = t`. Solution set:

```
   (x₁, x₂, x₃, x₄)  =  s · (−2, 1, 0, 0)  +  t · (−3, 0, 1, 0)
```

A **plane through the origin** in ℝ⁴, spanned by two homogeneous direction vectors. Because `b = 0`, no particular term is needed (the origin itself is a solution).

`rank(A) = 2`, free variables = `4 − 2 = 2`. ✓ Consistent with §3.10.

---

## Example 6 — The coffee-blend problem from §3.0

> 30 kg Brazil, 25 kg Ethiopia, 20 kg Colombia. Recipes:
> - Morning: 0.5 / 0.3 / 0.2
> - Afternoon: 0.4 / 0.4 / 0.2
> - Evening: 0.3 / 0.3 / 0.4

System (multiply both sides by 10 to clear decimals):

```
   5x  +  4y  +  3z  =  300
   3x  +  4y  +  3z  =  250
   2x  +  2y  +  4z  =  200
```

**Augmented matrix.**
```
   ⎡ 5   4   3 │ 300 ⎤
   ⎢ 3   4   3 │ 250 ⎥
   ⎣ 2   2   4 │ 200 ⎦
```

Make pivot in column 1 equal 1: `R1 ← (1/5)·R1`.
```
   ⎡ 1   4/5   3/5 │ 60 ⎤
   ⎢ 3    4     3  │ 250 ⎥
   ⎣ 2    2     4  │ 200 ⎦
```

Eliminate column 1 below: `R2 ← R2 − 3·R1`, `R3 ← R3 − 2·R1`.
```
   ⎡ 1   4/5    3/5  │  60  ⎤
   ⎢ 0   8/5    6/5  │  70  ⎥
   ⎣ 0   2/5   14/5  │  80  ⎦
```

Pivot row 2: `R2 ← (5/8)·R2`.
```
   ⎡ 1   4/5    3/5  │  60   ⎤
   ⎢ 0    1     3/4  │ 175/4 ⎥
   ⎣ 0   2/5   14/5  │  80   ⎦
```

Eliminate column 2 in row 3: `R3 ← R3 − (2/5)·R2`.

Compute: `14/5 − (2/5)(3/4) = 14/5 − 6/20 = 56/20 − 6/20 = 50/20 = 5/2`. RHS: `80 − (2/5)(175/4) = 80 − 350/20 = 80 − 35/2 = 160/2 − 35/2 = 125/2`.
```
   ⎡ 1   4/5   3/5  │  60   ⎤
   ⎢ 0    1    3/4  │ 175/4 ⎥
   ⎣ 0    0    5/2  │ 125/2 ⎦
```

Pivot row 3: `R3 ← (2/5)·R3`. RHS becomes `(2/5)(125/2) = 25`.
```
   ⎡ 1   4/5   3/5 │  60   ⎤
   ⎢ 0    1   3/4  │ 175/4 ⎥
   ⎣ 0    0    1   │   25  ⎦
```

Zero above pivot in column 3:

`R2 ← R2 − (3/4)·R3` → RHS `175/4 − 75/4 = 100/4 = 25`.
`R1 ← R1 − (3/5)·R3` → RHS `60 − 15 = 45`.
```
   ⎡ 1   4/5   0 │ 45 ⎤
   ⎢ 0    1    0 │ 25 ⎥
   ⎣ 0    0    1 │ 25 ⎦
```

Zero above pivot in column 2: `R1 ← R1 − (4/5)·R2` → RHS `45 − 20 = 25`.
```
   ⎡ 1   0   0 │ 25 ⎤
   ⎢ 0   1   0 │ 25 ⎥
   ⎣ 0   0   1 │ 25 ⎦
```

**Answer:** 25 bags of each blend. (Verify: `5·25 + 4·25 + 3·25 = 125+100+75 = 300` ✓, etc.)

A satisfying answer — the bookkeeping says the recipes balance the inventory perfectly when you make 25 of each.

---

## Example 7 — Row picture vs column picture for the same 2×2

Take the system

```
   2x  +    y  =  4
    x  +  3y  =  7
```

**Row picture.** Two lines:
- `2x + y = 4` — passes through `(0, 4)` and `(2, 0)`, slope `−2`.
- `x + 3y = 7` — passes through `(0, 7/3)` and `(7, 0)`, slope `−1/3`.

They cross at `(1, 2)` (you can solve by elimination — try it).

**Column picture.** Rewrite as a vector equation:

```
   x · ⎡ 2 ⎤  +  y · ⎡ 1 ⎤  =  ⎡ 4 ⎤
       ⎣ 1 ⎦         ⎣ 3 ⎦      ⎣ 7 ⎦
```

We're asking: *what scalars `x, y` combine the columns `(2, 1)` and `(1, 3)` to land on `(4, 7)`?*

With `x = 1, y = 2`: `1·(2,1) + 2·(1,3) = (2+2, 1+6) = (4, 7)` ✓.

Same answer, completely different picture: rather than two lines crossing, we're tip-to-tailing two scaled column vectors and asking which scalars produce the target.

The column picture will be the only one that survives into ℝ¹⁰⁰. Get fluent with both now.

---

## Example 8 — Detect inconsistency with the rank test

Without computing a solution, decide whether

```
   x  +  y  +  z  =  1
   2x  +  3y  +  z  =  4
   3x  +  4y  +  2z  =  6
```

is consistent.

**Compute `rank(A)`.** Reduce just `A`:
```
   ⎡ 1   1   1 ⎤      R2 ← R2 − 2R1     ⎡ 1   1    1 ⎤
   ⎢ 2   3   1 ⎥  →   R3 ← R3 − 3R1  →  ⎢ 0   1   −1 ⎥
   ⎣ 3   4   2 ⎦                         ⎣ 0   1   −1 ⎦

                       R3 ← R3 − R2     ⎡ 1   1    1 ⎤
                                     →  ⎢ 0   1   −1 ⎥
                                        ⎣ 0   0    0 ⎦
```

`rank(A) = 2`.

**Compute `rank([A | b])`.** Same row operations on the augmented matrix:
```
   ⎡ 1   1   1 │ 1 ⎤    →    ⎡ 1   1    1 │  1 ⎤
   ⎢ 0   1  −1 │ 2 ⎥         ⎢ 0   1   −1 │  2 ⎥
   ⎣ 0   1  −1 │ 3 ⎦         ⎣ 0   0    0 │  1 ⎦
```

`rank([A | b]) = 3`. Since `rank(A) < rank([A | b])`, **inconsistent** — no solution. The bottom row screams `0 = 1`.

---

## Example 9 — Find all solutions of a homogeneous system

Find every solution of `Ax = 0` for

```
   A  =  ⎡ 1   3   1   2 ⎤
         ⎣ 2   6   3   5 ⎦
```

**Reduce A.**
```
   R2 ← R2 − 2 R1
   ⎡ 1   3   1   2 ⎤
   ⎣ 0   0   1   1 ⎦
```

Zero above pivot in column 3: `R1 ← R1 − R2`.
```
   ⎡ 1   3   0   1 ⎤
   ⎣ 0   0   1   1 ⎦
```

RREF. **Pivots in columns 1 and 3.** **Free: `x₂` and `x₄`.** Read:

```
   x₁ + 3 x₂ + x₄  =  0    →   x₁ = −3 x₂ − x₄
            x₃ + x₄  =  0    →   x₃ = −x₄
```

Let `x₂ = s`, `x₄ = t`:

```
   (x₁, x₂, x₃, x₄)  =  s · (−3, 1, 0, 0)  +  t · (−1, 0, −1, 1)
```

A **2-dimensional plane through origin** in ℝ⁴ — the **null space** (kernel) of A. We'll meet this concept formally in Ch 5.

`rank(A) = 2`, free variables = `4 − 2 = 2`. Matches §3.10.

---

## Example 10 — Mixed: existence + parametric form together

For which `b = (b₁, b₂, b₃)` does the system

```
   x  +  y  +  z  =  b₁
   x  +  2y  +  3z  =  b₂
   2x  +  3y  +  4z  =  b₃
```

have a solution? When it does, describe all solutions.

**Reduce the augmented matrix.**
```
   ⎡ 1   1   1 │ b₁ ⎤
   ⎢ 1   2   3 │ b₂ ⎥
   ⎣ 2   3   4 │ b₃ ⎦
```

Eliminate column 1: `R2 ← R2 − R1`, `R3 ← R3 − 2 R1`.
```
   ⎡ 1   1   1 │       b₁     ⎤
   ⎢ 0   1   2 │   b₂ − b₁    ⎥
   ⎣ 0   1   2 │  b₃ − 2 b₁  ⎦
```

`R3 ← R3 − R2`:
```
   ⎡ 1   1   1 │      b₁         ⎤
   ⎢ 0   1   2 │   b₂ − b₁       ⎥
   ⎣ 0   0   0 │ b₃ − b₁ − b₂   ⎦
```

The bottom row reads `0 = b₃ − b₁ − b₂`. So the system is **consistent iff** `b₁ + b₂ = b₃`. Otherwise: contradiction → no solution.

**When consistent, finish RREF.** Set `b₃ = b₁ + b₂` so the bottom row is all zeros.

`R1 ← R1 − R2`:
```
   ⎡ 1   0   −1 │  2 b₁ − b₂  ⎤
   ⎢ 0   1    2 │   b₂ − b₁    ⎥
   ⎣ 0   0    0 │       0       ⎦
```

`x₃` is **free**. Read:
```
   x  −  z  =  2 b₁ − b₂      →   x = (2 b₁ − b₂) + z
   y  +  2z  =  b₂ − b₁       →   y = (b₂ − b₁) − 2z
```

Let `z = t`. Solution set:

```
   (x, y, z)  =  (2 b₁ − b₂,  b₂ − b₁,  0)  +  t · (1, −2, 1)
```

A line in ℝ³, *as long as `b` lies on the plane `b₁ + b₂ = b₃`*.

**Geometric punchline.** The set of right-hand sides for which `Ax = b` is solvable is the **column space** of A — here, the plane `b₁ + b₂ = b₃` in ℝ³. Off that plane, no solution exists. On that plane, infinitely many. We are looking, in advance, at the image/kernel structure of Ch 5.
