# Week 6: Consumer Theory II — Duality & Welfare

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Derive and interpret the indirect utility function
2. Apply Roy's Identity to obtain Marshallian demands
3. Set up and solve the expenditure minimization problem
4. Derive and interpret the expenditure function
5. Apply Shephard's Lemma to obtain Hicksian demands
6. Decompose price effects using the Slutsky equation
7. Calculate Compensating and Equivalent Variation

---

## 1. The Duality Framework

### 1.1 Two Approaches to Consumer Choice

Last week we solved the **utility maximization** problem:
$$\max_{x} U(x) \quad \text{s.t.} \quad p \cdot x = m$$

This week we introduce the **dual** problem—**expenditure minimization**:
$$\min_{x} p \cdot x \quad \text{s.t.} \quad U(x) \geq \bar{u}$$

These are two sides of the same coin:

```
┌─────────────────────────────────────────────────────────────────┐
│                    DUALITY FRAMEWORK                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   UTILITY MAX                    EXPENDITURE MIN                 │
│   max U(x) s.t. p·x = m          min p·x s.t. U(x) ≥ ū         │
│         ↓                              ↓                         │
│   Marshallian Demand             Hicksian Demand                 │
│   x^m(p, m)                      x^h(p, ū)                       │
│         ↓                              ↓                         │
│   Indirect Utility               Expenditure Function            │
│   v(p, m)                        e(p, ū)                         │
│         ↓                              ↓                         │
│   Roy's Identity                 Shephard's Lemma                │
│                                                                  │
│              v(p, e(p,ū)) = ū    e(p, v(p,m)) = m               │
│                     ↖         ↗                                  │
│                       INVERSE                                    │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Indirect Utility Function

### 2.1 Definition

The **indirect utility function** gives the maximum utility achievable at prices $p$ and income $m$:

$$v(p, m) = \max_{x} \{U(x) : p \cdot x \leq m\} = U(x^m(p, m))$$

**Intuition**: Substitute the optimal Marshallian demands back into the utility function.

### 2.2 Cobb-Douglas Example

For $U = x_1^\alpha x_2^{1-\alpha}$, we derived:
$$x_1^m = \frac{\alpha m}{p_1}, \quad x_2^m = \frac{(1-\alpha)m}{p_2}$$

Substituting into $U$:
$$v(p_1, p_2, m) = \left(\frac{\alpha m}{p_1}\right)^\alpha \left(\frac{(1-\alpha)m}{p_2}\right)^{1-\alpha}$$

Simplifying:
$$\boxed{v(p_1, p_2, m) = \frac{\alpha^\alpha (1-\alpha)^{1-\alpha} \cdot m}{p_1^\alpha p_2^{1-\alpha}} = k \cdot \frac{m}{p_1^\alpha p_2^{1-\alpha}}}$$

where $k = \alpha^\alpha (1-\alpha)^{1-\alpha}$.

### 2.3 Properties of $v(p, m)$

| Property | Statement | Intuition |
|----------|-----------|-----------|
| Non-increasing in $p$ | $\frac{\partial v}{\partial p_i} \leq 0$ | Higher prices → lower utility |
| Increasing in $m$ | $\frac{\partial v}{\partial m} > 0$ | More income → more utility |
| Homogeneous degree 0 | $v(tp, tm) = v(p, m)$ | Only real purchasing power matters |
| Quasi-convex in $p$ | Level sets convex | Technical property for welfare |

### 2.4 Roy's Identity

**Roy's Identity** lets us recover Marshallian demands from the indirect utility function:

$$\boxed{x_i^m(p, m) = -\frac{\partial v / \partial p_i}{\partial v / \partial m}}$$

**Derivation sketch**: By the envelope theorem, $\frac{\partial v}{\partial p_i} = -\lambda x_i^m$ and $\frac{\partial v}{\partial m} = \lambda$.

**Verification for Cobb-Douglas**:
$$\frac{\partial v}{\partial p_1} = -\alpha \cdot k \cdot \frac{m}{p_1^{\alpha+1} p_2^{1-\alpha}}$$
$$\frac{\partial v}{\partial m} = k \cdot \frac{1}{p_1^\alpha p_2^{1-\alpha}}$$

$$x_1^m = -\frac{\partial v/\partial p_1}{\partial v/\partial m} = \frac{\alpha m}{p_1} \quad \checkmark$$

---

## 3. Expenditure Minimization

### 3.1 The Dual Problem

**Problem**: Find the minimum expenditure needed to achieve utility $\bar{u}$:
$$\min_{x_1, x_2} p_1 x_1 + p_2 x_2 \quad \text{s.t.} \quad U(x_1, x_2) \geq \bar{u}$$

**Lagrangian**:
$$\mathcal{L} = p_1 x_1 + p_2 x_2 + \mu(\bar{u} - U(x_1, x_2))$$

**FOCs**:
$$p_1 = \mu \frac{\partial U}{\partial x_1}, \quad p_2 = \mu \frac{\partial U}{\partial x_2}$$

Dividing: $\frac{p_1}{p_2} = \frac{MU_1}{MU_2} = MRS$

**Same tangency condition as utility maximization!**

### 3.2 Hicksian (Compensated) Demand

The solution to expenditure minimization gives **Hicksian demand**:
$$x^h(p, \bar{u}) = \arg\min_{x} \{p \cdot x : U(x) \geq \bar{u}\}$$

**Key difference from Marshallian**:
- Marshallian $x^m(p, m)$: holds income constant
- Hicksian $x^h(p, \bar{u})$: holds **utility** constant

### 3.3 Cobb-Douglas Hicksian Demand

For $U = x_1^\alpha x_2^{1-\alpha}$:

From the tangency condition and constraint $x_1^\alpha x_2^{1-\alpha} = \bar{u}$:

$$\boxed{x_1^h = \bar{u} \left(\frac{\alpha p_2}{(1-\alpha) p_1}\right)^{1-\alpha}, \quad x_2^h = \bar{u} \left(\frac{(1-\alpha) p_1}{\alpha p_2}\right)^{\alpha}}$$

---

## 4. Expenditure Function

### 4.1 Definition

The **expenditure function** gives the minimum cost to achieve utility $\bar{u}$:

$$e(p, \bar{u}) = \min_{x} \{p \cdot x : U(x) \geq \bar{u}\} = p \cdot x^h(p, \bar{u})$$

### 4.2 Cobb-Douglas Example

Substituting Hicksian demands into expenditure:
$$e(p_1, p_2, \bar{u}) = p_1 x_1^h + p_2 x_2^h$$

After simplification:
$$\boxed{e(p_1, p_2, \bar{u}) = \frac{\bar{u}}{k} \cdot p_1^\alpha p_2^{1-\alpha}}$$

where $k = \alpha^\alpha (1-\alpha)^{1-\alpha}$.

**Notice**: $e$ and $v$ are inverses:
- $v = k \cdot m / p_1^\alpha p_2^{1-\alpha}$
- $e = \bar{u} \cdot p_1^\alpha p_2^{1-\alpha} / k$

### 4.3 Properties of $e(p, \bar{u})$

| Property | Statement | Intuition |
|----------|-----------|-----------|
| Homogeneous degree 1 in $p$ | $e(tp, \bar{u}) = t \cdot e(p, \bar{u})$ | Double prices → double cost |
| Non-decreasing in $p$ | $\frac{\partial e}{\partial p_i} \geq 0$ | Higher prices → higher cost |
| Increasing in $\bar{u}$ | $\frac{\partial e}{\partial \bar{u}} > 0$ | More utility → more cost |
| Concave in $p$ | $e(p', \bar{u}) \leq \frac{1}{2}[e(p'',\bar{u}) + e(p''',\bar{u})]$ | Can substitute away from expensive goods |

### 4.4 Shephard's Lemma

**Shephard's Lemma** lets us recover Hicksian demands from the expenditure function:

$$\boxed{x_i^h(p, \bar{u}) = \frac{\partial e(p, \bar{u})}{\partial p_i}}$$

**Verification for Cobb-Douglas**:
$$\frac{\partial e}{\partial p_1} = \frac{\bar{u}}{k} \cdot \alpha \cdot p_1^{\alpha-1} p_2^{1-\alpha} = x_1^h \quad \checkmark$$

---

## 5. Connecting the Four Functions

### 5.1 Fundamental Identities

$$v(p, e(p, \bar{u})) = \bar{u}$$
$$e(p, v(p, m)) = m$$
$$x^m(p, e(p, \bar{u})) = x^h(p, \bar{u})$$
$$x^h(p, v(p, m)) = x^m(p, m)$$

**Key insight**: If you know any one of $\{v, e, x^m, x^h\}$, you can derive the other three.

### 5.2 Summary Table

| Function | Arguments | Derivative Results |
|----------|-----------|-------------------|
| $v(p, m)$ | prices, income | Roy's Identity → $x^m$ |
| $e(p, \bar{u})$ | prices, utility | Shephard's Lemma → $x^h$ |
| $x^m(p, m)$ | prices, income | Into $U$ → $v$ |
| $x^h(p, \bar{u})$ | prices, utility | Into expenditure → $e$ |

---

## 6. Slutsky Decomposition

### 6.1 The Slutsky Equation

When price $p_j$ changes, demand $x_i$ changes due to two effects:

$$\boxed{\frac{\partial x_i^m}{\partial p_j} = \frac{\partial x_i^h}{\partial p_j} - x_j \cdot \frac{\partial x_i^m}{\partial m}}$$

| Term | Name | Interpretation |
|------|------|----------------|
| $\frac{\partial x_i^m}{\partial p_j}$ | Total effect | Observed demand change |
| $\frac{\partial x_i^h}{\partial p_j}$ | Substitution effect | Change holding utility constant |
| $-x_j \cdot \frac{\partial x_i^m}{\partial m}$ | Income effect | Change due to real income change |

### 6.2 Properties of Effects

**Substitution Effect** ($\partial x_i^h / \partial p_i$):
- **Always ≤ 0** for own-price (compensated demand slopes down)
- Measures pure relative price effect
- Symmetric: $\frac{\partial x_i^h}{\partial p_j} = \frac{\partial x_j^h}{\partial p_i}$

**Income Effect** ($-x_i \cdot \frac{\partial x_i^m}{\partial m}$):
- Sign depends on whether good is normal or inferior
- Normal good: negative (reinforces substitution)
- Inferior good: positive (opposes substitution)

### 6.3 Graphical Decomposition

For a price increase in $p_1$:

```
         x₂
          │
          │    A = Original optimum
          │    B = Hypothetical (same utility, new prices)
          │    C = New optimum
          │
     x₂ᴬ ┼──────●A
          │      ╲
          │       ╲  IC₀
     x₂ᴮ ┼─────────●B
          │         ╲
          │          ╲
     x₂ᶜ ┼────────────●C
          │            ╲  IC₁
          │             ╲
          └──────────────┼────────── x₁
               x₁ᶜ  x₁ᴮ  x₁ᴬ
          
    A→B: Substitution effect (along IC₀)
    B→C: Income effect (between ICs)
    A→C: Total effect
```

### 6.4 Numerical Example

**Setup**: $U = x_1^{0.5} x_2^{0.5}$, $m = 100$, $p_2 = 2$. Price $p_1$ rises from 2 to 4.

**Original** ($p_1 = 2$):
$$x_1^A = \frac{0.5 \times 100}{2} = 25, \quad x_2^A = \frac{0.5 \times 100}{2} = 25$$
$$u^0 = 25^{0.5} \times 25^{0.5} = 25$$

**New** ($p_1 = 4$):
$$x_1^C = \frac{0.5 \times 100}{4} = 12.5, \quad x_2^C = 25$$

**Hicksian at new prices, old utility** ($p_1 = 4$, $u = 25$):
$$x_1^B = 25 \left(\frac{0.5 \times 2}{0.5 \times 4}\right)^{0.5} = 25 \times (0.5)^{0.5} = 17.68$$

**Decomposition**:
- **Total effect**: $12.5 - 25 = -12.5$
- **Substitution effect**: $17.68 - 25 = -7.32$
- **Income effect**: $12.5 - 17.68 = -5.18$

Check: $-7.32 + (-5.18) = -12.5$ ✓

---

## 7. Welfare Measures: CV and EV

### 7.1 Compensating Variation (CV)

**CV** = income change needed to **compensate** for a price change (restore original utility):

$$\boxed{CV = e(p^1, u^0) - m}$$

- Uses **original utility** $u^0$ as reference
- Evaluated at **new prices** $p^1$
- Answers: "How much income would restore your original satisfaction?"

For a price increase: CV > 0 (need extra income to compensate)

### 7.2 Equivalent Variation (EV)

**EV** = income change at original prices that would be **equivalent** to the price change:

$$\boxed{EV = m - e(p^0, u^1)}$$

- Uses **new utility** $u^1$ as reference
- Evaluated at **original prices** $p^0$
- Answers: "What income change would have the same effect?"

For a price increase: EV > 0 (would need to lose this much income for same effect)

### 7.3 CV vs EV: Which to Use?

| Situation | Preferred Measure | Reason |
|-----------|-------------------|--------|
| Consumer has right to old prices | CV | Compensation for loss |
| Evaluating proposed policy | EV | Current prices as baseline |
| No prior claim | Either; report both | They bracket true welfare change |

For **quasi-linear preferences**: CV = EV = ΔCS (consumer surplus change)

### 7.4 Numerical Example

Using previous example ($p_1: 2 \to 4$, $m = 100$, $u^0 = 25$):

**New utility**: $u^1 = (12.5)^{0.5} \times (25)^{0.5} = 17.68$

**CV** = $e(p^1, u^0) - m$:
$$e(4, 2, 25) = \frac{25}{0.5} \times 4^{0.5} \times 2^{0.5} = 50 \times 2.83 = 141.4$$
$$CV = 141.4 - 100 = 41.4$$

**EV** = $m - e(p^0, u^1)$:
$$e(2, 2, 17.68) = \frac{17.68}{0.5} \times 2^{0.5} \times 2^{0.5} = 35.36 \times 2 = 70.7$$
$$EV = 100 - 70.7 = 29.3$$

**Note**: CV > EV when price increases for a normal good (different reference utilities).

---

## 8. Agricultural Applications

### 8.1 Food Demand Systems

Duality provides the foundation for estimating demand systems:
- **AIDS (Almost Ideal Demand System)**: derives from expenditure function
- **LES (Linear Expenditure System)**: imposes specific structure
- Allows consistent estimation of own-price, cross-price, and income elasticities

### 8.2 Policy Evaluation

For agricultural policies (subsidies, taxes, trade restrictions):
- CV/EV measure welfare effects on consumers
- Hicksian demand isolates pure price response
- Income effects matter for food security analysis

---

## 9. R Implementation

```r
# Cobb-Douglas duality functions
CD_duality <- function(alpha = 0.5) {
  k <- alpha^alpha * (1-alpha)^(1-alpha)
  
  list(
    # Indirect utility
    v = function(p1, p2, m) k * m / (p1^alpha * p2^(1-alpha)),
    
    # Expenditure function
    e = function(p1, p2, u) u / k * p1^alpha * p2^(1-alpha),
    
    # Marshallian demand
    x_m = function(p1, p2, m) c(alpha * m / p1, (1-alpha) * m / p2),
    
    # Hicksian demand
    x_h = function(p1, p2, u) {
      c(u * (alpha * p2 / ((1-alpha) * p1))^(1-alpha),
        u * ((1-alpha) * p1 / (alpha * p2))^alpha)
    }
  )
}

# Slutsky decomposition
slutsky <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  fns <- CD_duality(alpha)
  
  # Original and new demands
  x_old <- fns$x_m(p1_old, p2, m)
  x_new <- fns$x_m(p1_new, p2, m)
  u_old <- fns$v(p1_old, p2, m)
  
  # Hicksian at new prices, old utility
  x_hicks <- fns$x_h(p1_new, p2, u_old)
  
  total <- x_new[1] - x_old[1]
  substitution <- x_hicks[1] - x_old[1]
  income <- total - substitution
  
  list(total = total, substitution = substitution, income = income)
}
```

---

## 10. Summary

### Key Formulas

| Concept | Formula |
|---------|---------|
| Indirect utility | $v(p,m) = U(x^m(p,m))$ |
| Roy's Identity | $x_i^m = -\frac{\partial v/\partial p_i}{\partial v/\partial m}$ |
| Expenditure function | $e(p,\bar{u}) = p \cdot x^h(p,\bar{u})$ |
| Shephard's Lemma | $x_i^h = \frac{\partial e}{\partial p_i}$ |
| Slutsky equation | $\frac{\partial x_i^m}{\partial p_j} = \frac{\partial x_i^h}{\partial p_j} - x_j \frac{\partial x_i^m}{\partial m}$ |
| CV | $e(p^1, u^0) - m$ |
| EV | $m - e(p^0, u^1)$ |

### Key Insights

1. Utility max and expenditure min give **same tangency condition**
2. $v$ and $e$ are **inverses**
3. Substitution effect **always negative** for own-price
4. Income effect sign depends on **normal vs inferior**
5. CV and EV differ due to **different reference utilities**

---

## 11. Preparation for Week 7

**Week 7: Producer Theory I — Technology & Costs**

Topics:
- Production functions
- Isoquants and MRTS
- Cost minimization
- Cost functions
- Producer duality (parallels consumer duality)

---

## References

- Varian, H. (2014). *Intermediate Microeconomics*, Chapters 7-8, 14-15.
- Nicholson, W. & Snyder, C. (2017). *Microeconomic Theory*, Chapters 4-5.
- Deaton, A. & Muellbauer, J. (1980). *Economics and Consumer Behavior*.
