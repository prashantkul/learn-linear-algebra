# Chapter 2 — Worked Examples

These are read-along problems. Cover the right column (the solution), try it yourself, then check.

---

## Example 1 — Displacement vector between two points

> Points `A = (1, 2)` and `B = (4, 6)` in ℝ². Find the displacement vector `**AB**` and its magnitude.

**Solution.**

Displacement is "tip minus tail":

```
   **AB**  =  B − A  =  (4 − 1,  6 − 2)  =  (3, 4).
```

Magnitude (length) by Pythagoras:

```
   ‖**AB**‖  =  √(3² + 4²)  =  √(9 + 16)  =  √25  =  5.
```

So you'd walk **5 units** from A to reach B, in the direction `(3, 4)`.

---

## Example 2 — Linear, affine, convex: same vectors, three combinations

> Let `u = (2, 0)` and `v = (0, 3)` in ℝ². Classify each combination.
>
> (a) `3u − v`         (b) `0.4 u + 0.6 v`         (c) `2u − v`         (d) `u + v`

**Solution.**

| Combo | Coefficients | Sum of coeffs | All ≥ 0? | Type |
|---|---|---|---|---|
| (a) `3u − v` | `(3, −1)` | `2` | no | **Linear only** (no constraint matched) |
| (b) `0.4u + 0.6v` | `(0.4, 0.6)` | `1` | yes | **Convex** (and therefore also affine, also linear) |
| (c) `2u − v` | `(2, −1)` | `1` | no | **Affine** but not convex |
| (d) `u + v` | `(1, 1)` | `2` | yes | **Linear only** |

The actual vectors:

- (a) `(6, 0) + (0, −3) = (6, −3)`.
- (b) `(0.8, 0) + (0, 1.8) = (0.8, 1.8)` — lies on the segment from u to v.
- (c) `(4, 0) + (0, −3) = (4, −3)` — on the line through u and v, beyond u.
- (d) `(2, 0) + (0, 3) = (2, 3)`.

**Reading:** convex ⊂ affine ⊂ linear (each is a subset of the next, with stricter constraints).

---

## Example 3 — Dot product, angle, perpendicularity

> Compute `u · v`, `‖u‖`, `‖v‖`, and the angle between `u = (3, 4)` and `v = (4, −3)`.

**Solution.**

Dot product:

```
   u · v  =  3·4  +  4·(−3)  =  12  −  12  =  0.
```

Magnitudes:

```
   ‖u‖  =  √(9 + 16)  =  5.
   ‖v‖  =  √(16 + 9)  =  5.
```

Angle via `cos θ = (u·v)/(‖u‖·‖v‖) = 0/(5·5) = 0`, so

```
   θ  =  arccos(0)  =  π/2  =  90°.
```

The vectors are **perpendicular** (orthogonal). The dot product equalling zero was already a giveaway — if `u · v = 0` and both vectors are nonzero, they meet at a right angle.

---

## Example 4 — Cosine similarity (the embedding intuition)

> Three "documents" represented as ℝ³ vectors of word counts:
>
> ```
>    a = (3, 0, 1),     b = (6, 0, 2),     c = (0, 4, 0).
> ```
>
> Which two are most similar?

**Solution.**

Compute the cosine similarity between each pair:

```
   cos_sim(a, b)  =  (a·b) / (‖a‖ ‖b‖)
                  =  (18 + 0 + 2) / (√10 · √40)
                  =  20 / √400  =  20 / 20  =  1.
```

So `a` and `b` are perfectly aligned — `b = 2a`, same direction, just twice as long. They represent the **same direction in topic-space**, even though the raw counts differ.

```
   cos_sim(a, c)  =  (0 + 0 + 0) / (√10 · √16)  =  0.
   cos_sim(b, c)  =  0   (same reason).
```

So `c` is orthogonal to both — its words don't overlap at all with a's or b's. This is why information retrieval and embedding-based search use *cosine similarity* rather than raw distances: it's invariant to how "loud" each document is.

---

## Example 5 — Project u onto v and decompose

> Let `u = (4, 3)` and `v = (1, 0)`. Compute `proj_v u` and the perpendicular remainder.

**Solution.**

By the projection formula:

```
   proj_v u  =  ( (u·v) / (v·v) ) · v
            =  ( (4·1 + 3·0) / (1·1 + 0·0) ) · (1, 0)
            =  (4 / 1) · (1, 0)
            =  (4, 0).
```

That's the "shadow of u on the x-axis," which makes sense: u's x-component is 4.

Perpendicular remainder:

```
   u  −  proj_v u  =  (4, 3)  −  (4, 0)  =  (0, 3).
```

Sanity check — is `(0, 3)` perpendicular to v? `(0, 3) · (1, 0) = 0`. ✓

So we've decomposed:

```
   u  =  (4, 3)  =  (4, 0)  +  (0, 3)
                    ⎵⎵⎵⎵      ⎵⎵⎵⎵
                  along v    perp. to v
```

This is the simplest possible projection — onto an axis. The general case (projecting onto an arbitrary direction) uses the same formula; only the arithmetic is messier.

---

## Example 6 — Project onto a non-axis direction

> `u = (5, 1)`, `v = (3, 4)`. Compute `proj_v u`.

**Solution.**

```
   u · v   =  5·3 + 1·4  =  15 + 4  =  19.
   v · v   =  3² + 4²  =  9 + 16  =  25.
   α       =  19 / 25  =  0.76.
   proj_v u  =  0.76 · (3, 4)  =  (2.28, 3.04).
```

Perpendicular remainder:

```
   u − proj_v u  =  (5 − 2.28,  1 − 3.04)  =  (2.72, −2.04).
```

Sanity check (perpendicularity): `(2.72)(3) + (−2.04)(4) = 8.16 − 8.16 = 0`. ✓

Another sanity check (Pythagoras for the decomposition):

```
   ‖u‖²  =  25 + 1  =  26.
   ‖proj‖² + ‖perp‖²  =  (2.28² + 3.04²) + (2.72² + 2.04²)
                      =  (5.20 + 9.24) + (7.40 + 4.16)
                      ≈  14.44 + 11.56  =  26.   ✓
```

The two pieces are perpendicular, so their squared lengths add to the squared length of u (Pythagoras in any dimension).

---

## Example 7 — Parametric line through two points

> Find a parametric form for the line through `A = (1, 2)` and `B = (4, 8)` in ℝ².

**Solution.**

Take the direction vector `v = B − A = (3, 6)`. The line is

```
   L(t)  =  A  +  t · v  =  (1, 2) + t · (3, 6)
        =  (1 + 3t,  2 + 6t).
```

Sanity checks:

- `L(0) = (1, 2) = A`. ✓
- `L(1) = (4, 8) = B`. ✓
- `L(0.5) = (2.5, 5)` — the midpoint of A and B (a *convex combination* with both coefficients = 0.5).
- `L(−1) = (−2, −4)` — extrapolated beyond A.

**Equivalent form via convex combinations.** Since `L(t) = A + t(B − A) = (1 − t) A + t B`, the line is also

```
   L(t)  =  (1 − t)·A  +  t·B.
```

For `t ∈ [0, 1]` this traces the **segment** from A to B (convex). For `t ∈ ℝ` it's the whole **line** (affine).

---

## Example 8 — Distance from a point to a line

> Find the (perpendicular) distance from point `P = (5, 1)` to the line through origin in direction `v = (3, 4)`.

**Solution.**

The line is `L(t) = t · (3, 4)`. The closest point on L to P is the projection of P onto v:

```
   p · v  =  5·3 + 1·4  =  19.
   v · v  =  9 + 16  =  25.
   proj_v P  =  (19/25) · (3, 4)  =  (2.28, 3.04).
```

The displacement from the line to P is `P − proj_v P = (5 − 2.28, 1 − 3.04) = (2.72, −2.04)`.

Distance is the magnitude of that displacement:

```
   d  =  √(2.72² + 2.04²)  =  √(7.40 + 4.16)  =  √11.56  ≈  3.40.
```

So P sits about **3.40 units off** the line.

> Generalizes immediately to ℝⁿ: distance from a point to a line through origin is `‖P − proj_v P‖`. The same idea, in higher dimensions and onto whole subspaces, becomes the **least-squares** machinery of Chapter 7.

---

## Example 9 — A linearity-flavoured calculation

> Show that the dot product is linear in its first slot. Specifically, prove that for all `u, w, v ∈ ℝⁿ` and all scalars `c`,
>
> ```
>    (c u + w) · v  =  c (u · v)  +  (w · v).
> ```

**Solution.**

Write everything in components. Let `u = (u₁, …, uₙ)`, `w = (w₁, …, wₙ)`, `v = (v₁, …, vₙ)`. Then:

```
   (c u + w) · v   =   ∑ᵢ (c uᵢ + wᵢ) vᵢ                  (by definition of ·)
                  =   ∑ᵢ ( c uᵢ vᵢ  +  wᵢ vᵢ )            (distribute)
                  =   c · ∑ᵢ uᵢ vᵢ   +   ∑ᵢ wᵢ vᵢ          (pull c out, split sum)
                  =   c (u · v)  +  (w · v).               (definition of ·)
```

QED. The dot product is "linear in each slot" — exactly the property that will let us think of it as a **linear function** itself in Chapter 4.

---

## Example 10 — A high-dimensional sanity check

> Two random vectors in ℝ¹⁰⁰⁰ have components drawn independently from the standard normal distribution. What's the expected dot product? What's the expected angle?

**Solution.**

By independence and zero mean of each component,

```
   E[u · v]  =  E[ ∑ᵢ uᵢ vᵢ ]  =  ∑ᵢ E[uᵢ] E[vᵢ]  =  ∑ᵢ 0 · 0  =  0.
```

So the *expected* dot product is zero. With magnitudes `‖u‖, ‖v‖ ≈ √n ≈ 31.6` and a dot-product whose standard deviation is also ~√n,

```
   E[ cos θ ]  ≈  E[u·v] / (‖u‖ ‖v‖)  ≈  0 / (31.6 · 31.6)  ≈  0,
```

with very small variance. So in high dimensions, **two random vectors are almost always nearly perpendicular** (`θ ≈ 90°`).

This is the geometric reason embeddings work: when you project random "noise" vectors into ℝ³⁰⁰, almost everything is orthogonal to almost everything else, so true semantic neighbours stand out by *not* being orthogonal. We'll see this empirically in the Python notebook.
