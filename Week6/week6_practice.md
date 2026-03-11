# Week 6: Practice Problems — Consumer Theory II: Duality & Welfare

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Learning Objectives

- Derive indirect utility and apply Roy's Identity
- Solve expenditure minimization problems
- Derive expenditure function and apply Shephard's Lemma
- Connect Marshallian and Hicksian demands
- Perform Slutsky decomposition
- Calculate CV and EV welfare measures

---

## Problem W6-P1: Indirect Utility (Basic)

**Topic:** Indirect Utility

For $U = x_1^{0.3}x_2^{0.7}$:
- (a) Find Marshallian demands
- (b) Derive $v(p_1, p_2, m)$
- (c) Calculate $v$ when $p_1=2$, $p_2=5$, $m=100$

**Hints:**
- $x_1 = \alpha m/p_1$ for Cobb-Douglas
- Substitute demands into $U$ to get $v$

**Solution:**

**(a) Marshallian Demands:**
$$x_1^m = \frac{0.3m}{p_1}, \quad x_2^m = \frac{0.7m}{p_2}$$

**(b) Indirect Utility:**
$$v = \left(\frac{0.3m}{p_1}\right)^{0.3}\left(\frac{0.7m}{p_2}\right)^{0.7} = 0.3^{0.3} \times 0.7^{0.7} \times \frac{m}{p_1^{0.3}p_2^{0.7}}$$

$$v(p_1, p_2, m) = \frac{km}{p_1^{0.3}p_2^{0.7}} \quad \text{where } k = 0.3^{0.3} \times 0.7^{0.7} \approx 0.591$$

**(c) Calculation:**
$$v = \frac{0.591 \times 100}{2^{0.3} \times 5^{0.7}} = \frac{59.1}{1.231 \times 3.089} = 15.55$$

---

## Problem W6-P2: Roy's Identity (Intermediate)

**Topic:** Roy's Identity

Given $v(p_1, p_2, m) = \frac{m^2}{4p_1p_2}$, use Roy's Identity to find Marshallian demands.

**Hints:**
- Roy's Identity: $x_i = -\frac{\partial v/\partial p_i}{\partial v/\partial m}$
- Take partial derivatives carefully

**Solution:**

**Partial Derivatives:**
$$\frac{\partial v}{\partial p_1} = -\frac{m^2}{4p_1^2 p_2}$$
$$\frac{\partial v}{\partial p_2} = -\frac{m^2}{4p_1 p_2^2}$$
$$\frac{\partial v}{\partial m} = \frac{2m}{4p_1p_2} = \frac{m}{2p_1p_2}$$

**Apply Roy's Identity:**
$$x_1^m = -\frac{-m^2/(4p_1^2 p_2)}{m/(2p_1p_2)} = \frac{m}{2p_1}$$
$$x_2^m = -\frac{-m^2/(4p_1 p_2^2)}{m/(2p_1p_2)} = \frac{m}{2p_2}$$

**Verification:** These are Cobb-Douglas demands with $\alpha = 0.5$

---

## Problem W6-P3: Expenditure Minimization (Intermediate)

**Topic:** Expenditure Minimization

$U = x_1^{0.5}x_2^{0.5}$. Find minimum expenditure to achieve $\bar{u}=10$ when $p_1=4$, $p_2=1$.

**Hints:**
- Set up Lagrangian for $\min p \cdot x$ s.t. $U \geq \bar{u}$
- Same tangency condition: $MRS = p_1/p_2$
- Solve for $x^h$ then calculate expenditure

**Solution:**

**Tangency Condition:**
$$MRS = \frac{x_2}{x_1} = \frac{p_1}{p_2} = 4 \quad \Rightarrow \quad x_2 = 4x_1$$

**Utility Constraint:**
$$x_1^{0.5}(4x_1)^{0.5} = 10 \quad \Rightarrow \quad 2x_1 = 10 \quad \Rightarrow \quad x_1 = 5$$

**Hicksian Demands:** $x_1^h = 5$, $x_2^h = 20$

**Minimum Expenditure:**
$$e = 4(5) + 1(20) = 40$$

---

## Problem W6-P4: Expenditure Function (Intermediate)

**Topic:** Expenditure Function Properties

For $U = x_1^{0.5}x_2^{0.5}$:
- (a) Derive $e(p_1, p_2, \bar{u})$
- (b) Verify properties: homogeneous degree 1 in prices, increasing in $\bar{u}$

**Solution:**

**(a) Derivation:**

From tangency: $x_2^h/x_1^h = p_1/p_2$

With constraint: $x_1^{0.5}x_2^{0.5} = \bar{u}$ and $x_2 = (p_1/p_2)x_1$

Solving: $x_1(p_1/p_2)^{0.5} = \bar{u} \Rightarrow x_1^h = \bar{u}(p_2/p_1)^{0.5}$

Similarly: $x_2^h = \bar{u}(p_1/p_2)^{0.5}$

**Expenditure Function:**
$$e = p_1 x_1^h + p_2 x_2^h = 2\bar{u}\sqrt{p_1 p_2}$$

**(b) Verify Properties:**

**Homogeneity:**
$$e(tp_1, tp_2, \bar{u}) = 2\bar{u}\sqrt{tp_1 \cdot tp_2} = 2\bar{u} \cdot t \cdot \sqrt{p_1 p_2} = t \cdot e(p_1, p_2, \bar{u}) \quad \checkmark$$

**Increasing in $\bar{u}$:**
$$\frac{\partial e}{\partial \bar{u}} = 2\sqrt{p_1 p_2} > 0 \quad \checkmark$$

---

## Problem W6-P5: Shephard's Lemma (Intermediate)

**Topic:** Shephard's Lemma

Given $e(p_1, p_2, \bar{u}) = \bar{u} \cdot p_1^{0.4} p_2^{0.6}$, use Shephard's Lemma to find Hicksian demands.

**Solution:**

**Apply Shephard's Lemma:** $x_i^h = \partial e / \partial p_i$

$$x_1^h = \frac{\partial e}{\partial p_1} = 0.4 \bar{u} \cdot p_1^{-0.6} p_2^{0.6} = 0.4\bar{u}\left(\frac{p_2}{p_1}\right)^{0.6}$$

$$x_2^h = \frac{\partial e}{\partial p_2} = 0.6 \bar{u} \cdot p_1^{0.4} p_2^{-0.4} = 0.6\bar{u}\left(\frac{p_1}{p_2}\right)^{0.4}$$

**At $p_1=2$, $p_2=3$, $\bar{u}=10$:**
$$x_1^h = 0.4(10)(3/2)^{0.6} = 4(1.176) = 4.70$$
$$x_2^h = 0.6(10)(2/3)^{0.4} = 6(0.850) = 5.10$$

---

## Problem W6-P6: Duality Verification (Intermediate)

**Topic:** Duality Identities

For $U = x_1^{0.5}x_2^{0.5}$, verify: $v(p, e(p,\bar{u})) = \bar{u}$ and $e(p, v(p,m)) = m$.

**Solution:**

**Functions:**
$$v(p_1, p_2, m) = \frac{0.5m}{\sqrt{p_1 p_2}}, \quad e(p_1, p_2, \bar{u}) = 2\bar{u}\sqrt{p_1 p_2}$$

**Identity 1:** $v(p, e(p, \bar{u})) = \bar{u}$

$$v(p_1, p_2, e(p_1, p_2, \bar{u})) = v(p_1, p_2, 2\bar{u}\sqrt{p_1 p_2})$$
$$= \frac{0.5(2\bar{u}\sqrt{p_1 p_2})}{\sqrt{p_1 p_2}} = \bar{u} \quad \checkmark$$

**Identity 2:** $e(p, v(p,m)) = m$

$$e(p_1, p_2, v(p_1, p_2, m)) = e\left(p_1, p_2, \frac{0.5m}{\sqrt{p_1 p_2}}\right)$$
$$= 2\left(\frac{0.5m}{\sqrt{p_1 p_2}}\right)\sqrt{p_1 p_2} = m \quad \checkmark$$

---

## Problem W6-P7: Slutsky Decomposition (Advanced)

**Topic:** Slutsky Decomposition

$U = x_1^{0.5}x_2^{0.5}$, $m=200$, $p_2=4$. Price $p_1$ rises from 2 to 8. Decompose into substitution and income effects.

**Hints:**
- Find demands before and after
- Find Hicksian demand at new prices, old utility
- Substitution = $x^h - x^m_{old}$; Income = $x^m_{new} - x^h$

**Solution:**

**Original Situation ($p_1 = 2$):**
$$x_1 = \frac{0.5(200)}{2} = 50, \quad x_2 = \frac{0.5(200)}{4} = 25$$
$$u_0 = \sqrt{50 \times 25} = 35.36$$

**New Situation ($p_1 = 8$):**
$$x_1 = \frac{0.5(200)}{8} = 12.5, \quad x_2 = \frac{0.5(200)}{4} = 25$$

**Hicksian at New Prices, Old Utility:**
$$x_1^h = \bar{u}\left(\frac{p_2}{p_1}\right)^{0.5} = 35.36\left(\frac{4}{8}\right)^{0.5} = 35.36(0.707) = 25$$

**Decomposition:**
| Effect | Calculation | Value |
|--------|-------------|-------|
| **Total** | $12.5 - 50$ | $-37.5$ |
| **Substitution** | $25 - 50$ | $-25$ |
| **Income** | $12.5 - 25$ | $-12.5$ |
| **Check** | $-25 + (-12.5)$ | $-37.5$ ✓ |

**Interpretation:** Of the 37.5 unit decrease: 25 due to substitution toward relatively cheaper $x_2$, and 12.5 due to lower real income.

---

## Problem W6-P8: CV and EV (Advanced)

**Topic:** Welfare Measures

$U = x_1^{0.5}x_2^{0.5}$, $m=100$, $p_2=2$. Price $p_1$ increases from 2 to 4. Calculate CV and EV.

**Hints:**
- $CV = e(p^1, u^0) - m$
- $EV = m - e(p^0, u^1)$
- Use $e = 2\bar{u}\sqrt{p_1 p_2}$

**Solution:**

**Original Utility:**
$$u^0 = \frac{0.5(100)}{\sqrt{2 \times 2}} = 25$$

**New Utility:**
$$u^1 = \frac{0.5(100)}{\sqrt{4 \times 2}} = 17.68$$

**Compensating Variation:**
$$CV = e(4, 2, 25) - 100 = 2(25)\sqrt{4 \times 2} - 100 = 50 \times 2.83 - 100 = 41.4$$

**Equivalent Variation:**
$$EV = 100 - e(2, 2, 17.68) = 100 - 2(17.68)\sqrt{2 \times 2} = 100 - 70.7 = 29.3$$

**Interpretation:**
- **CV = $41.40:** Consumer needs $41.40 extra at new prices to achieve original utility
- **EV = $29.30:** At original prices, losing $29.30 would be equivalent to the price increase
- **Why different:** CV > EV because CV uses higher reference utility

---

## Problem W6-P9: Giffen Goods (Conceptual)

**Topic:** Giffen Goods

Explain mathematically why Giffen goods must be inferior. Use the Slutsky equation.

**Solution:**

**Slutsky Equation:**
$$\frac{\partial x_i^m}{\partial p_i} = \frac{\partial x_i^h}{\partial p_i} - x_i \frac{\partial x_i^m}{\partial m}$$

**Giffen Condition:** $\frac{\partial x_i^m}{\partial p_i} > 0$ (upward sloping demand)

**Substitution Effect:** $\frac{\partial x_i^h}{\partial p_i} < 0$ always (negative)

**Implication:** For the total effect to be positive:
$$-x_i \frac{\partial x_i^m}{\partial m} > \left|\frac{\partial x_i^h}{\partial p_i}\right|$$

Since $x_i > 0$, we need $\frac{\partial x_i^m}{\partial m} < 0$, which defines an **inferior good**.

**Conclusion:** Giffen goods must be inferior with an income effect large enough to dominate the substitution effect.

---

## Problem W6-P10: Quasi-Linear Special Case (Intermediate)

**Topic:** Quasi-Linear Preferences

For quasi-linear $U = x_1 + 2\sqrt{x_2}$, show that $CV = EV = \Delta CS$.

**Hints:**
- Quasi-linear has zero income effect for $x_2$
- This makes Marshallian = Hicksian for $x_2$

**Solution:**

**Demand for $x_2$:**
From FOC: $\frac{1}{\sqrt{x_2}} = p_2 \Rightarrow x_2 = \frac{1}{p_2^2}$

**Key Property:** $x_2$ is independent of income → Marshallian = Hicksian

**Consumer Surplus:**
$$CS = \int_{p_2}^{\infty} x_2(p) dp = \int_{p_2}^{\infty} \frac{1}{p^2} dp = \frac{1}{p_2}$$

**Change in CS:**
$$\Delta CS = \frac{1}{p_2^0} - \frac{1}{p_2^1}$$

**Why CV = EV:** With no income effect, compensating the consumer at any utility level gives the same answer.

**Conclusion:** For quasi-linear preferences: $CV = EV = \Delta CS$ (exact welfare measure from demand curve)

---

## Problem W6-P11: R Implementation (Intermediate)

**Topic:** Computational Implementation

Write R functions for: (a) Cobb-Douglas indirect utility, (b) expenditure function, (c) Slutsky decomposition.

**Solution:**

```r
# Cobb-Douglas duality toolkit
CD <- list(
  # Indirect utility: v(p1, p2, m)
  v = function(p1, p2, m, alpha = 0.5) {
    k <- alpha^alpha * (1-alpha)^(1-alpha)
    k * m / (p1^alpha * p2^(1-alpha))
  },
  
  # Expenditure function: e(p1, p2, u)
  e = function(p1, p2, u, alpha = 0.5) {
    k <- alpha^alpha * (1-alpha)^(1-alpha)
    u / k * p1^alpha * p2^(1-alpha)
  },
  
  # Marshallian demand
  x_m = function(p1, p2, m, alpha = 0.5) {
    c(x1 = alpha * m / p1, x2 = (1-alpha) * m / p2)
  },
  
  # Hicksian demand
  x_h = function(p1, p2, u, alpha = 0.5) {
    c(x1 = u * (alpha * p2 / ((1-alpha) * p1))^(1-alpha),
      x2 = u * ((1-alpha) * p1 / (alpha * p2))^alpha)
  }
)

# Slutsky decomposition
slutsky <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  x_old <- CD$x_m(p1_old, p2, m, alpha)
  x_new <- CD$x_m(p1_new, p2, m, alpha)
  u_old <- CD$v(p1_old, p2, m, alpha)
  x_hick <- CD$x_h(p1_new, p2, u_old, alpha)
  
  list(total = x_new[1] - x_old[1],
       substitution = x_hick[1] - x_old[1],
       income = x_new[1] - x_hick[1])
}
```

---

## Problem W6-P12: Food Subsidy Evaluation (Advanced)

**Topic:** Policy Analysis

Household with $U = F^{0.6}N^{0.4}$ (Food, Non-food), $m=1000$, $p_F=10$, $p_N=20$. Government subsidizes food to $p_F=5$. Calculate:
- (a) CV of subsidy
- (b) Cost to government
- (c) Is subsidy efficient?

**Solution:**

**(a) Original Consumption:**
$$F = \frac{0.6(1000)}{10} = 60, \quad N = \frac{0.4(1000)}{20} = 20$$
$$u^0 = 60^{0.6} \times 20^{0.4} = 14.35 \times 4.47 = 64.2$$

**With Subsidy:**
$$F = \frac{0.6(1000)}{5} = 120, \quad N = \frac{0.4(1000)}{20} = 20$$
$$u^1 = 120^{0.6} \times 20^{0.4} = 23.37 \times 4.47 = 104.5$$

**(b) Compensating Variation:**
$$CV = m - e(p_{new}, u^0)$$

This represents the income the consumer would give up for the subsidy.

**(c) Government Cost:**
$$\text{Subsidy per unit} = 10 - 5 = \$5$$
$$\text{Food consumed} = 120 \text{ units}$$
$$\text{Total cost} = 5 \times 120 = \$600$$

**(d) Efficiency:**
- If $CV > \text{cost}$: Efficient (consumer values subsidy more than cost)
- If $CV < \text{cost}$: Inefficient (deadweight loss)
- In-kind subsidies are often less efficient than cash transfers

---

## AI Tutor Guidance

### Common Errors
1. Confusing $v$ and $e$ (one uses income, other uses utility)
2. Wrong sign in Roy's Identity (negative in numerator)
3. Forgetting to use old vs new utility in CV/EV
4. Adding instead of subtracting effects in Slutsky
5. Computing Hicksian at wrong reference utility

### Socratic Prompts
- "What's held constant in Marshallian vs Hicksian demand?"
- "Why is the substitution effect always negative?"
- "What makes CV and EV different?"
- "How do $v$ and $e$ relate to each other mathematically?"

### Extension Questions
- How would you estimate CV empirically?
- Why do economists use the expenditure function for welfare analysis?
- What's the relationship between Slutsky symmetry and integrability?
