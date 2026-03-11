# Week 5: Consumer Theory I — Utility & Marshallian Demand

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Describe the axioms of consumer preferences
2. Represent preferences using utility functions
3. Calculate and interpret the Marginal Rate of Substitution (MRS)
4. Set up and solve the utility maximization problem using the Lagrangian method
5. Derive Marshallian (ordinary) demand functions
6. Analyze special cases: Cobb-Douglas, perfect substitutes, perfect complements
7. Implement consumer choice problems in R

---

## 1. The Consumer's Problem: Overview

### 1.1 The Big Picture

The consumer's problem is fundamentally about **constrained optimization**:

$$\max_{x_1, x_2} U(x_1, x_2) \quad \text{subject to} \quad p_1 x_1 + p_2 x_2 = m$$

This week builds directly on Week 4's optimization tools. We now apply them to a central economic problem.

```
┌─────────────────────────────────────────────────────────────┐
│                  CONSUMER CHOICE ROADMAP                     │
├─────────────────────────────────────────────────────────────┤
│  PREFERENCES → UTILITY → OPTIMIZATION → DEMAND               │
│       ↓            ↓           ↓            ↓               │
│   Axioms      U(x₁,x₂)    Lagrangian    x^m(p,m)            │
│   MRS         IC curves    FOC, SOC     Demand curves        │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Consumer Preferences

### 2.1 Preference Relations

Let $x = (x_1, x_2)$ and $y = (y_1, y_2)$ be two consumption bundles.

- $x \succ y$: "$x$ is strictly preferred to $y$"
- $x \sim y$: "$x$ is indifferent to $y$"
- $x \succsim y$: "$x$ is at least as good as $y$" (weakly preferred)

### 2.2 Axioms of Rational Preferences

| Axiom | Statement | Economic Meaning |
|-------|-----------|------------------|
| **Completeness** | For any $x, y$: either $x \succsim y$ or $y \succsim x$ (or both) | Consumer can always compare bundles |
| **Transitivity** | If $x \succsim y$ and $y \succsim z$, then $x \succsim z$ | Consistent rankings |
| **Continuity** | Small changes in bundles lead to small changes in preference | No sudden jumps in preferences |
| **Monotonicity** | More is better: if $x \geq y$ (with at least one strict), then $x \succ y$ | Goods are desirable |
| **Convexity** | Mixtures are preferred: if $x \sim y$, then $\frac{1}{2}x + \frac{1}{2}y \succsim x$ | Variety is good |

### 2.3 Why Convexity Matters

Convexity of preferences means **diminishing marginal rate of substitution**—as you get more of good 1, you're willing to give up less of good 2 for another unit of good 1.

**Agricultural example**: A farmer values both wheat production and livestock. Having some of each is better than specializing entirely, due to risk diversification and resource utilization.

---

## 3. Utility Functions

### 3.1 Definition

A **utility function** $U(x_1, x_2)$ represents preferences if:
$$x \succsim y \iff U(x) \geq U(y)$$

### 3.2 Ordinal vs Cardinal Utility

**Critical insight**: Utility is **ordinal**, not cardinal.

| Aspect | Ordinal | Cardinal |
|--------|---------|----------|
| Meaning | Rankings only | Actual magnitudes matter |
| Example | "I prefer A to B" | "A gives me twice the satisfaction" |
| In economics | ✓ Used | ✗ Not meaningful |

**Implication**: Any monotonic transformation of utility represents the same preferences.

If $U(x)$ represents preferences and $f$ is strictly increasing, then $V(x) = f(U(x))$ represents the **same preferences**.

**Example**: If $U = x_1^{0.5} x_2^{0.5}$, then $V = \ln U = 0.5\ln x_1 + 0.5\ln x_2$ represents identical preferences.

### 3.3 Common Utility Functions

| Type | Function | Key Property |
|------|----------|--------------|
| **Cobb-Douglas** | $U = x_1^\alpha x_2^{1-\alpha}$ | Constant expenditure shares |
| **Perfect Substitutes** | $U = ax_1 + bx_2$ | Linear indifference curves |
| **Perfect Complements** | $U = \min\{ax_1, bx_2\}$ | L-shaped indifference curves |
| **Quasi-linear** | $U = x_1 + v(x_2)$ | Zero income effect for $x_2$ |
| **CES** | $U = (x_1^\rho + x_2^\rho)^{1/\rho}$ | Constant elasticity of substitution |

---

## 4. Indifference Curves and MRS

### 4.1 Indifference Curves

An **indifference curve** connects all bundles giving the same utility:
$$\text{IC}_{\bar{u}} = \{(x_1, x_2) : U(x_1, x_2) = \bar{u}\}$$

**Properties** (given monotonicity and convexity):
1. Downward sloping (more of one good requires less of other for same utility)
2. Higher curves = higher utility
3. Curves cannot cross
4. Convex to the origin (bowed inward)

### 4.2 Marginal Rate of Substitution

The **MRS** is the slope of the indifference curve—how much $x_2$ the consumer will give up for one more unit of $x_1$, staying on the same IC.

$$MRS_{12} = -\frac{dx_2}{dx_1}\bigg|_{U=\bar{u}} = \frac{MU_1}{MU_2} = \frac{\partial U/\partial x_1}{\partial U/\partial x_2}$$

**Derivation via total differential**:
Along an IC: $dU = 0$
$$dU = \frac{\partial U}{\partial x_1}dx_1 + \frac{\partial U}{\partial x_2}dx_2 = 0$$
$$\Rightarrow \frac{dx_2}{dx_1} = -\frac{\partial U/\partial x_1}{\partial U/\partial x_2}$$

### 4.3 MRS for Common Utility Functions

| Utility | MRS Formula | At $(x_1, x_2)$ |
|---------|-------------|-----------------|
| $x_1^\alpha x_2^{1-\alpha}$ | $\frac{\alpha}{1-\alpha} \cdot \frac{x_2}{x_1}$ | Depends on ratio |
| $ax_1 + bx_2$ | $\frac{a}{b}$ | Constant |
| $\min\{ax_1, bx_2\}$ | Undefined at kink; 0 or $\infty$ elsewhere | — |
| $x_1 + v(x_2)$ | $\frac{1}{v'(x_2)}$ | Depends only on $x_2$ |

---

## 5. Budget Constraint

### 5.1 The Budget Line

The consumer's affordable set:
$$p_1 x_1 + p_2 x_2 \leq m$$

The **budget line** (boundary):
$$p_1 x_1 + p_2 x_2 = m \quad \Rightarrow \quad x_2 = \frac{m}{p_2} - \frac{p_1}{p_2}x_1$$

- **Slope**: $-p_1/p_2$ (opportunity cost of $x_1$ in terms of $x_2$)
- **Intercepts**: $m/p_1$ (horizontal), $m/p_2$ (vertical)

### 5.2 Changes in Budget Constraint

| Change | Effect on Budget Line |
|--------|----------------------|
| Income $m$ increases | Parallel shift outward |
| $p_1$ increases | Pivots inward around vertical intercept |
| $p_2$ increases | Pivots inward around horizontal intercept |
| All prices and income double | No change (homogeneity) |

---

## 6. Utility Maximization

### 6.1 The Lagrangian Approach

**Problem**:
$$\max_{x_1, x_2} U(x_1, x_2) \quad \text{s.t.} \quad p_1 x_1 + p_2 x_2 = m$$

**Lagrangian**:
$$\mathcal{L} = U(x_1, x_2) + \lambda(m - p_1 x_1 - p_2 x_2)$$

**First-Order Conditions (FOC)**:
$$\frac{\partial \mathcal{L}}{\partial x_1} = \frac{\partial U}{\partial x_1} - \lambda p_1 = 0 \quad \Rightarrow \quad MU_1 = \lambda p_1$$
$$\frac{\partial \mathcal{L}}{\partial x_2} = \frac{\partial U}{\partial x_2} - \lambda p_2 = 0 \quad \Rightarrow \quad MU_2 = \lambda p_2$$
$$\frac{\partial \mathcal{L}}{\partial \lambda} = m - p_1 x_1 - p_2 x_2 = 0$$

### 6.2 The Optimality Condition

Dividing the first two FOCs:
$$\frac{MU_1}{MU_2} = \frac{p_1}{p_2} \quad \Leftrightarrow \quad MRS = \frac{p_1}{p_2}$$

**Economic interpretation**: At the optimum, the rate at which the consumer is *willing* to trade (MRS) equals the rate at which the market *allows* them to trade (price ratio).

**Alternative form** (bang-per-buck):
$$\frac{MU_1}{p_1} = \frac{MU_2}{p_2} = \lambda$$

Marginal utility per dollar is equal across all goods, and equals $\lambda$ (marginal utility of income).

### 6.3 Graphical Interpretation

At the optimum:
- Indifference curve is **tangent** to the budget line
- Slope of IC = slope of budget line
- $MRS = p_1/p_2$

---

## 7. Marshallian Demand Functions

### 7.1 Definition

**Marshallian (ordinary) demand** gives optimal consumption as a function of prices and income:
$$x_i^m = x_i^m(p_1, p_2, m)$$

**Properties**:
1. **Homogeneous of degree 0**: $x_i^m(tp_1, tp_2, tm) = x_i^m(p_1, p_2, m)$
2. **Budget exhaustion**: $p_1 x_1^m + p_2 x_2^m = m$ (with monotonic preferences)
3. **Usually downward sloping** in own price

### 7.2 Cobb-Douglas Example

**Utility**: $U = x_1^\alpha x_2^{1-\alpha}$, where $0 < \alpha < 1$

**Step 1**: Set up Lagrangian
$$\mathcal{L} = x_1^\alpha x_2^{1-\alpha} + \lambda(m - p_1 x_1 - p_2 x_2)$$

**Step 2**: FOCs
$$\alpha x_1^{\alpha-1} x_2^{1-\alpha} = \lambda p_1$$
$$(1-\alpha) x_1^\alpha x_2^{-\alpha} = \lambda p_2$$

**Step 3**: Divide to eliminate $\lambda$
$$\frac{\alpha x_2}{(1-\alpha) x_1} = \frac{p_1}{p_2}$$

**Step 4**: Solve for $x_2$ in terms of $x_1$
$$x_2 = \frac{(1-\alpha) p_1 x_1}{\alpha p_2}$$

**Step 5**: Substitute into budget constraint
$$p_1 x_1 + p_2 \cdot \frac{(1-\alpha) p_1 x_1}{\alpha p_2} = m$$
$$p_1 x_1 \left(1 + \frac{1-\alpha}{\alpha}\right) = m$$
$$p_1 x_1 \cdot \frac{1}{\alpha} = m$$

**Marshallian demands**:
$$\boxed{x_1^m = \frac{\alpha m}{p_1}, \quad x_2^m = \frac{(1-\alpha) m}{p_2}}$$

**Key insight**: Expenditure shares are constant and equal the exponents:
- Spend $\alpha \cdot 100\%$ of income on good 1
- Spend $(1-\alpha) \cdot 100\%$ on good 2

---

## 8. Special Cases

### 8.1 Perfect Substitutes: $U = ax_1 + bx_2$

**MRS** = $a/b$ (constant)

**Optimal solution** depends on comparing MRS with price ratio:

| Condition | Optimal Bundle |
|-----------|----------------|
| $\frac{a}{b} > \frac{p_1}{p_2}$ | Corner: $x_1 = m/p_1$, $x_2 = 0$ |
| $\frac{a}{b} < \frac{p_1}{p_2}$ | Corner: $x_1 = 0$, $x_2 = m/p_2$ |
| $\frac{a}{b} = \frac{p_1}{p_2}$ | Any point on budget line |

**Intuition**: Buy whichever good gives more utility per dollar.

### 8.2 Perfect Complements: $U = \min\{ax_1, bx_2\}$

**Optimal solution**: Always consume at the "kink" where $ax_1 = bx_2$

From $ax_1 = bx_2$ and $p_1 x_1 + p_2 x_2 = m$:
$$x_1^m = \frac{bm}{bp_1 + ap_2}, \quad x_2^m = \frac{am}{bp_1 + ap_2}$$

**Example**: Left and right shoes ($a = b = 1$):
$$x_1^m = x_2^m = \frac{m}{p_1 + p_2}$$

### 8.3 Quasi-Linear: $U = x_1 + v(x_2)$

**FOC**: $v'(x_2) = p_2/p_1$

- Demand for $x_2$ depends only on prices, not income
- All additional income goes to $x_1$
- Zero income effect for $x_2$

---

## 9. Income and Substitution Effects (Preview)

When price changes, two effects occur:

1. **Substitution effect**: Relative prices change → substitute toward cheaper good
2. **Income effect**: Real purchasing power changes → affects demand for all goods

**Classification of goods**:

| Type | Income Effect | Example |
|------|---------------|---------|
| **Normal good** | $\frac{\partial x_i}{\partial m} > 0$ | Restaurant meals |
| **Inferior good** | $\frac{\partial x_i}{\partial m} < 0$ | Instant noodles |
| **Luxury** | Income elasticity > 1 | Organic produce |
| **Necessity** | Income elasticity < 1 | Basic grains |

We'll analyze this formally in Week 6 using the Slutsky equation.

---

## 10. R Implementation

```r
# Cobb-Douglas utility maximization
cobb_douglas_demand <- function(p1, p2, m, alpha = 0.5) {
  x1 <- alpha * m / p1
  x2 <- (1 - alpha) * m / p2
  utility <- x1^alpha * x2^(1-alpha)
  lambda <- alpha * x1^(alpha-1) * x2^(1-alpha) / p1
  
  return(list(x1 = x1, x2 = x2, utility = utility, lambda = lambda))
}

# Test
result <- cobb_douglas_demand(p1 = 2, p2 = 3, m = 120, alpha = 0.4)
cat("x1* =", result$x1, ", x2* =", result$x2, "\n")
cat("Utility =", result$utility, ", λ =", result$lambda, "\n")
```

---

## 11. Summary

### Key Formulas

| Concept | Formula |
|---------|---------|
| MRS | $\frac{MU_1}{MU_2} = \frac{\partial U/\partial x_1}{\partial U/\partial x_2}$ |
| Optimality condition | $MRS = \frac{p_1}{p_2}$ or $\frac{MU_1}{p_1} = \frac{MU_2}{p_2}$ |
| Cobb-Douglas demand | $x_1^m = \frac{\alpha m}{p_1}$, $x_2^m = \frac{(1-\alpha)m}{p_2}$ |
| Budget exhaustion | $p_1 x_1 + p_2 x_2 = m$ |

### Key Insights

1. Utility is ordinal—only rankings matter
2. At optimum, MRS equals price ratio (tangency condition)
3. $\lambda$ = marginal utility of income
4. Cobb-Douglas: constant expenditure shares = exponents
5. Perfect substitutes → corner solutions; perfect complements → fixed proportions

---

## 12. Preparation for Week 6

**Week 6: Consumer Theory II — Duality & Welfare**

Topics:
- Indirect utility function and Roy's Identity
- Expenditure minimization
- Expenditure function and Shephard's Lemma
- Hicksian (compensated) demand
- Slutsky decomposition
- Compensating and Equivalent Variation

---

## References

- Varian, H. (2014). *Intermediate Microeconomics*, Chapters 2-6.
- Nicholson, W. & Snyder, C. (2017). *Microeconomic Theory*, Chapters 3-5.
- Chiang, A.C. & Wainwright, K. (2005). *Fundamental Methods*, Chapter 12.
