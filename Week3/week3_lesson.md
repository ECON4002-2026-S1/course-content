# Week 3: Mathematical Methods II — Calculus & Functions

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Differentiate common economic functions (polynomial, logarithmic, exponential)
2. Calculate partial derivatives for multivariate functions
3. Compute and interpret economic elasticities
4. Apply the chain rule and product rule in economic contexts
5. Understand functional forms commonly used in economics (Cobb-Douglas, CES, Translog)
6. Implement numerical differentiation in R

---

## 1. Why Calculus in Economics?

### 1.1 The Centrality of Marginal Analysis

Economics is fundamentally about **optimization** and **change**. Calculus provides the tools to analyze:

| Concept | Calculus Tool | Economic Application |
|---------|---------------|---------------------|
| **Marginal** values | Derivative | Marginal cost, marginal utility, marginal product |
| **Optimization** | Setting derivative = 0 | Profit maximization, utility maximization |
| **Responsiveness** | Elasticity | Price elasticity of demand, income elasticity |
| **Rates of change** | Derivatives | Growth rates, depreciation |
| **Total effects** | Integration | Consumer surplus, total cost from marginal cost |

### 1.2 From Discrete to Continuous

In Week 1, we computed changes discretely:
$$\text{Average change} = \frac{\Delta Q}{\Delta P} = \frac{Q_2 - Q_1}{P_2 - P_1}$$

Calculus gives us the **instantaneous** rate of change:
$$\text{Marginal change} = \frac{dQ}{dP} = \lim_{\Delta P \to 0} \frac{\Delta Q}{\Delta P}$$

---

## 2. Review of Differentiation Rules

### 2.1 Basic Rules

| Rule | Formula | Example |
|------|---------|---------|
| **Constant** | $\frac{d}{dx}(c) = 0$ | $\frac{d}{dx}(5) = 0$ |
| **Power** | $\frac{d}{dx}(x^n) = nx^{n-1}$ | $\frac{d}{dx}(x^3) = 3x^2$ |
| **Constant multiple** | $\frac{d}{dx}(cf) = c\frac{df}{dx}$ | $\frac{d}{dx}(5x^2) = 10x$ |
| **Sum** | $\frac{d}{dx}(f + g) = \frac{df}{dx} + \frac{dg}{dx}$ | $\frac{d}{dx}(x^2 + 3x) = 2x + 3$ |
| **Product** | $\frac{d}{dx}(fg) = f\frac{dg}{dx} + g\frac{df}{dx}$ | See below |
| **Quotient** | $\frac{d}{dx}\left(\frac{f}{g}\right) = \frac{g\frac{df}{dx} - f\frac{dg}{dx}}{g^2}$ | See below |
| **Chain** | $\frac{d}{dx}f(g(x)) = f'(g(x)) \cdot g'(x)$ | See below |

### 2.2 Special Functions

| Function | Derivative | Example |
|----------|------------|---------|
| $e^x$ | $e^x$ | $\frac{d}{dx}(e^{2x}) = 2e^{2x}$ |
| $\ln(x)$ | $\frac{1}{x}$ | $\frac{d}{dx}(\ln(3x)) = \frac{1}{x}$ |
| $a^x$ | $a^x \ln(a)$ | $\frac{d}{dx}(2^x) = 2^x \ln(2)$ |
| $\log_a(x)$ | $\frac{1}{x \ln(a)}$ | $\frac{d}{dx}(\log_{10}(x)) = \frac{1}{x \ln(10)}$ |

### 2.3 Product Rule Example

**Total Revenue**: $TR(Q) = P(Q) \cdot Q$ where $P(Q) = 100 - 2Q$

$$\frac{dTR}{dQ} = P(Q) \cdot \frac{dQ}{dQ} + Q \cdot \frac{dP}{dQ} = (100 - 2Q)(1) + Q(-2) = 100 - 4Q$$

This is **Marginal Revenue**.

### 2.4 Chain Rule Example

**Cost function**: $C(Q) = 50 + 10Q + 0.5Q^2$

**Output function**: $Q(L) = 10\sqrt{L} = 10L^{0.5}$

What is $\frac{dC}{dL}$? (Cost change with respect to labor)

$$\frac{dC}{dL} = \frac{dC}{dQ} \cdot \frac{dQ}{dL} = (10 + Q) \cdot (5L^{-0.5})$$

---

## 3. Functions of Multiple Variables

### 3.1 Partial Derivatives

For $f(x, y)$, the **partial derivative** with respect to $x$ treats $y$ as constant:

$$\frac{\partial f}{\partial x} = \lim_{\Delta x \to 0} \frac{f(x + \Delta x, y) - f(x, y)}{\Delta x}$$

**Example**: $f(x, y) = 3x^2 + 2xy + y^3$

$$\frac{\partial f}{\partial x} = 6x + 2y \quad \text{(treat } y \text{ as constant)}$$

$$\frac{\partial f}{\partial y} = 2x + 3y^2 \quad \text{(treat } x \text{ as constant)}$$

### 3.2 Economic Interpretation

For a production function $Q = f(L, K)$:

- $\frac{\partial Q}{\partial L} = MP_L$ (Marginal Product of Labor)
- $\frac{\partial Q}{\partial K} = MP_K$ (Marginal Product of Capital)

These measure how output changes when we increase one input, holding the other constant.

### 3.3 Second-Order Partial Derivatives

$$\frac{\partial^2 f}{\partial x^2} = \frac{\partial}{\partial x}\left(\frac{\partial f}{\partial x}\right)$$

$$\frac{\partial^2 f}{\partial x \partial y} = \frac{\partial}{\partial y}\left(\frac{\partial f}{\partial x}\right)$$

**Young's Theorem**: For well-behaved functions:
$$\frac{\partial^2 f}{\partial x \partial y} = \frac{\partial^2 f}{\partial y \partial x}$$

### 3.4 The Gradient

The **gradient** is a vector of all partial derivatives:

$$\nabla f = \begin{bmatrix} \frac{\partial f}{\partial x_1} \\ \frac{\partial f}{\partial x_2} \\ \vdots \\ \frac{\partial f}{\partial x_n} \end{bmatrix}$$

At an optimum (max or min), the gradient equals zero: $\nabla f = \mathbf{0}$

---

## 4. Elasticity

### 4.1 Definition and Interpretation

**Elasticity** measures the percentage change in one variable in response to a percentage change in another:

$$\varepsilon = \frac{\% \Delta Q}{\% \Delta P} = \frac{\Delta Q / Q}{\Delta P / P} = \frac{\Delta Q}{\Delta P} \cdot \frac{P}{Q} = \frac{dQ}{dP} \cdot \frac{P}{Q}$$

**Interpretation**: If $\varepsilon = -2$, a 1% increase in price leads to a 2% decrease in quantity.

### 4.2 Types of Elasticity

| Elasticity | Formula | Measures |
|------------|---------|----------|
| **Price elasticity of demand** | $\varepsilon_d = \frac{dQ}{dP} \cdot \frac{P}{Q}$ | Responsiveness to own price |
| **Income elasticity** | $\varepsilon_m = \frac{dQ}{dm} \cdot \frac{m}{Q}$ | Responsiveness to income |
| **Cross-price elasticity** | $\varepsilon_{xy} = \frac{dQ_x}{dP_y} \cdot \frac{P_y}{Q_x}$ | Responsiveness to other good's price |
| **Output elasticity** | $\varepsilon_L = \frac{\partial Q}{\partial L} \cdot \frac{L}{Q}$ | Output responsiveness to input |

### 4.3 Elasticity Classifications

| Value | Classification | Economic Meaning |
|-------|----------------|------------------|
| $\|\varepsilon\| > 1$ | Elastic | Quantity very responsive to price |
| $\|\varepsilon\| = 1$ | Unit elastic | Proportional response |
| $\|\varepsilon\| < 1$ | Inelastic | Quantity not very responsive |
| $\varepsilon > 0$ | Positive | Variables move together (complements/normal goods) |
| $\varepsilon < 0$ | Negative | Variables move opposite (substitutes/demand) |

### 4.4 Elasticity and Revenue

For a demand curve $Q = f(P)$:

$$\frac{dTR}{dP} = Q\left(1 + \varepsilon_d\right)$$

$$MR = \frac{dTR}{dQ} = P\left(1 + \frac{1}{\varepsilon_d}\right)$$

| If demand is... | Then raising price... |
|-----------------|----------------------|
| Elastic ($\|\varepsilon\| > 1$) | Decreases revenue |
| Inelastic ($\|\varepsilon\| < 1$) | Increases revenue |
| Unit elastic ($\|\varepsilon\| = 1$) | No change in revenue |

### 4.5 Logarithms and Elasticity

**Key insight**: For $\ln Q = a + b \ln P$:

$$\frac{d \ln Q}{d \ln P} = b = \varepsilon$$

The coefficient on log-price IS the elasticity! This is why economists often use log-linear models.

**Proof**:
$$\frac{d \ln Q}{d \ln P} = \frac{d \ln Q}{dQ} \cdot \frac{dQ}{dP} \cdot \frac{dP}{d \ln P} = \frac{1}{Q} \cdot \frac{dQ}{dP} \cdot P = \frac{dQ}{dP} \cdot \frac{P}{Q} = \varepsilon$$

---

## 5. Common Functional Forms in Economics

### 5.1 Linear Function

$$y = a + bx$$

- Constant slope: $\frac{dy}{dx} = b$
- Variable elasticity: $\varepsilon = b \cdot \frac{x}{y}$ (depends on point)

### 5.2 Cobb-Douglas Function

$$Q = A L^\alpha K^\beta$$

**Properties**:
- Marginal products: $MP_L = \alpha \frac{Q}{L}$, $MP_K = \beta \frac{Q}{K}$
- Output elasticities: $\varepsilon_L = \alpha$, $\varepsilon_K = \beta$ (constant!)
- Returns to scale: $\alpha + \beta$ (= 1 is CRS, > 1 is IRS, < 1 is DRS)

**Log-linear form**:
$$\ln Q = \ln A + \alpha \ln L + \beta \ln K$$

### 5.3 CES (Constant Elasticity of Substitution)

$$Q = A[\delta L^\rho + (1-\delta) K^\rho]^{1/\rho}$$

- Elasticity of substitution: $\sigma = \frac{1}{1-\rho}$
- Special cases:
  - $\rho \to 0$: Cobb-Douglas
  - $\rho \to -\infty$: Leontief (fixed proportions)
  - $\rho = 1$: Perfect substitutes

### 5.4 Translog Function

$$\ln Q = \alpha_0 + \alpha_L \ln L + \alpha_K \ln K + \frac{1}{2}\beta_{LL}(\ln L)^2 + \frac{1}{2}\beta_{KK}(\ln K)^2 + \beta_{LK} \ln L \ln K$$

- Flexible functional form
- Output elasticities vary with input levels
- Can test restrictions (e.g., $\beta_{LL} = \beta_{KK} = \beta_{LK} = 0$ gives Cobb-Douglas)

---

## 6. The Total Differential

### 6.1 Definition

For $y = f(x_1, x_2, \ldots, x_n)$, the **total differential** is:

$$dy = \frac{\partial f}{\partial x_1}dx_1 + \frac{\partial f}{\partial x_2}dx_2 + \cdots + \frac{\partial f}{\partial x_n}dx_n$$

This approximates the total change in $y$ when all $x_i$ change simultaneously.

### 6.2 Economic Application: Isoquants

For a production function $Q = f(L, K)$, along an **isoquant** (constant output):

$$dQ = 0 = \frac{\partial Q}{\partial L}dL + \frac{\partial Q}{\partial K}dK$$

Solving for the slope:

$$\frac{dK}{dL}\bigg|_{Q=\bar{Q}} = -\frac{\partial Q/\partial L}{\partial Q/\partial K} = -\frac{MP_L}{MP_K}$$

This is the **Marginal Rate of Technical Substitution (MRTS)**.

### 6.3 Implicit Differentiation

If $F(x, y) = 0$ defines $y$ implicitly as a function of $x$:

$$\frac{dy}{dx} = -\frac{\partial F/\partial x}{\partial F/\partial y} = -\frac{F_x}{F_y}$$

---

## 7. Growth Rates and Logarithms

### 7.1 Continuous Growth

If $y = y_0 e^{gt}$, then:

$$\frac{dy}{dt} = g y_0 e^{gt} = gy$$

The growth rate is:
$$\frac{1}{y}\frac{dy}{dt} = g = \frac{d \ln y}{dt}$$

### 7.2 Approximation for Small Changes

For small changes:
$$\frac{\Delta y}{y} \approx \Delta \ln y$$

**Example**: If price rises from 100 to 105:
- Exact: $\frac{105-100}{100} = 5\%$
- Log approximation: $\ln(105) - \ln(100) = 4.88\%$

For small changes, these are nearly identical.

### 7.3 Growth Rate Rules

| If... | Then growth rate of... |
|-------|----------------------|
| $z = xy$ | $\hat{z} = \hat{x} + \hat{y}$ |
| $z = x/y$ | $\hat{z} = \hat{x} - \hat{y}$ |
| $z = x^n$ | $\hat{z} = n\hat{x}$ |

where $\hat{x} = \frac{d \ln x}{dt}$ denotes growth rate.

---

## 8. Numerical Differentiation in R

### 8.1 Central Difference Approximation

$$f'(x) \approx \frac{f(x+h) - f(x-h)}{2h}$$

```r
# Numerical derivative function
numerical_derivative <- function(f, x, h = 1e-6) {
  (f(x + h) - f(x - h)) / (2 * h)
}

# Example: f(x) = x^3, f'(x) = 3x^2
f <- function(x) x^3
numerical_derivative(f, x = 2)   # Should be 12
3 * 2^2                          # Analytical: 12
```

### 8.2 Partial Derivatives

```r
# Function of two variables
f <- function(x, y) { 3*x^2 + 2*x*y + y^3 }

# Partial derivative with respect to x
partial_x <- function(f, x, y, h = 1e-6) {
  (f(x + h, y) - f(x - h, y)) / (2 * h)
}

# Partial derivative with respect to y
partial_y <- function(f, x, y, h = 1e-6) {
  (f(x, y + h) - f(x, y - h)) / (2 * h)
}

# Test at (x=1, y=2)
partial_x(f, 1, 2)   # Should be 6(1) + 2(2) = 10
partial_y(f, 1, 2)   # Should be 2(1) + 3(2)^2 = 14
```

### 8.3 Elasticity Calculation

```r
# Elasticity at a point
elasticity <- function(f, x, h = 1e-6) {
  df_dx <- numerical_derivative(f, x, h)
  return(df_dx * x / f(x))
}

# Example: Linear demand Q = 100 - 2P
demand <- function(P) { 100 - 2*P }

# Elasticity at different prices
for (P in c(10, 25, 40)) {
  e <- elasticity(demand, P)
  cat("At P =", P, ": ε =", round(e, 3), "\n")
}
```

---

## 9. Summary

### Key Concepts

1. **Derivatives** measure instantaneous rates of change
2. **Partial derivatives** hold other variables constant
3. **Elasticity** measures percentage responsiveness: $\varepsilon = \frac{dQ}{dP} \cdot \frac{P}{Q}$
4. **Log-linear models** give constant elasticities
5. **Cobb-Douglas** has constant output elasticities equal to exponents
6. **Total differential** shows combined effect of multiple changes
7. **MRTS** is the ratio of marginal products

### Key Formulas

| Concept | Formula |
|---------|---------|
| Price elasticity | $\varepsilon_d = \frac{dQ}{dP} \cdot \frac{P}{Q}$ |
| Marginal product | $MP_L = \frac{\partial Q}{\partial L}$ |
| MRTS | $-\frac{MP_L}{MP_K}$ |
| Cobb-Douglas MP | $MP_L = \alpha \frac{Q}{L}$ |
| Growth rate | $g = \frac{d \ln y}{dt}$ |

---

## 10. Preparation for Next Week

**Week 4: Optimization**

Before class:
- Read Chiang & Wainwright, Chapters 9-11
- Review second-order conditions
- Practice finding critical points

Key concepts to preview:
- First-order conditions (FOC)
- Second-order conditions (SOC)
- Hessian matrix
- Constrained optimization (Lagrangian)
- Bordered Hessian

---

## References

- Chiang, A.C. & Wainwright, K. (2005). *Fundamental Methods of Mathematical Economics*, 4th ed., Chapters 6-8.
- Varian, H. (2014). *Intermediate Microeconomics*, Appendix on Calculus.
- Simon, C.P. & Blume, L. (1994). *Mathematics for Economists*, Chapters 2-5.
