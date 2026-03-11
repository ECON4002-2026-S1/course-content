# Week 3: Practice Problems — Calculus & Functions

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Instructions

Complete all problems showing your work. Verify analytical solutions using R where indicated.

---

## Part A: Differentiation Review

### Problem 1: Basic Derivatives

Find the derivative of each function:

a) $f(x) = 5x^4 - 3x^2 + 7x - 12$

b) $g(x) = \frac{1}{x^3} + \sqrt{x}$ (Hint: rewrite as powers)

c) $h(x) = e^{3x} + \ln(5x)$

d) $p(x) = x^2 \cdot e^x$ (product rule)

e) $q(x) = \frac{x^2 + 1}{x - 1}$ (quotient rule)

f) $r(x) = (3x^2 + 2)^4$ (chain rule)

---

### Problem 2: Economic Derivatives

a) **Total Revenue**: $TR(Q) = 100Q - 2Q^2$
   - Find Marginal Revenue $MR = \frac{dTR}{dQ}$
   - At what quantity is MR = 0?
   - What is the economic interpretation?

b) **Cost Function**: $C(Q) = 500 + 20Q + 0.5Q^2$
   - Find Marginal Cost $MC = \frac{dC}{dQ}$
   - Find Average Cost $AC = \frac{C}{Q}$
   - Find $\frac{dAC}{dQ}$ and determine where AC is minimized

c) **Production Function**: $Q(L) = 100L^{0.5}$
   - Find the Marginal Product of Labor $MP_L$
   - Is there diminishing marginal returns? How do you know?

---

## Part B: Partial Derivatives

### Problem 3: Computing Partial Derivatives

For each function, find all first-order and second-order partial derivatives:

a) $f(x, y) = 3x^2y + 2xy^2 - 5y$

b) $g(L, K) = 50L^{0.4}K^{0.6}$ (Cobb-Douglas production)

c) $u(x_1, x_2) = x_1^{0.5}x_2^{0.5}$ (Cobb-Douglas utility)

For (b) and (c), verify that $\frac{\partial^2 f}{\partial x \partial y} = \frac{\partial^2 f}{\partial y \partial x}$ (Young's Theorem)

---

### Problem 4: Marginal Products

A farm's production function is:
$$Q = 20L^{0.3}K^{0.5}W^{0.2}$$

where L = labor, K = capital, W = water.

a) Find $MP_L$, $MP_K$, and $MP_W$

b) If L = 100, K = 50, W = 200, calculate the numerical value of each marginal product

c) Which input has the highest marginal product? What does this suggest about production decisions?

d) What are the returns to scale? (Hint: Sum the exponents)

---

## Part C: Elasticity

### Problem 5: Price Elasticity of Demand

Given the demand function: $Q = 200 - 4P$

a) Derive the general formula for price elasticity $\varepsilon_d = \frac{dQ}{dP} \cdot \frac{P}{Q}$

b) Calculate elasticity at:
   - P = 10
   - P = 25 (midpoint)
   - P = 40

c) At what price is demand unit elastic?

d) **Revenue Maximization**: At which prices should a firm raise price to increase revenue? Lower price?

e) Verify your answers using R:
```r
demand <- function(P) { 200 - 4*P }
# Write code to calculate elasticity at each price
```

---

### Problem 6: Log-Linear Demand

A econometric study estimates the following demand relationship:
$$\ln Q = 5.2 - 0.8 \ln P + 0.5 \ln M$$

where Q = quantity, P = price, M = income.

a) What is the price elasticity of demand?

b) What is the income elasticity of demand?

c) Is this good a normal good or inferior good? Luxury or necessity?

d) If price increases by 10%, by how much does quantity demanded change?

e) Convert this to the non-log form: $Q = f(P, M)$

---

### Problem 7: Cross-Price Elasticity

The demand for beef is:
$$Q_B = 500 - 3P_B + 2P_C - 0.5P_F + 0.01M$$

where $P_B$ = beef price, $P_C$ = chicken price, $P_F$ = fish price, M = income.

At current prices: $P_B = 50$, $P_C = 30$, $P_F = 40$, $M = 50000$

a) Calculate the quantity demanded

b) Calculate the own-price elasticity of demand for beef

c) Calculate the cross-price elasticity with respect to chicken price

d) Calculate the cross-price elasticity with respect to fish price

e) Are chicken and beef substitutes or complements? What about fish and beef?

f) Calculate the income elasticity. Is beef a normal good?

---

## Part D: Functional Forms

### Problem 8: Cobb-Douglas Production

A wheat farm has the production function:
$$Q = 10L^{0.4}K^{0.6}$$

a) Calculate output when L = 100 and K = 200

b) Calculate $MP_L$ and $MP_K$ at this point

c) Calculate the MRTS (Marginal Rate of Technical Substitution)

d) What does the MRTS tell us about substituting capital for labor?

e) Verify that the output elasticities equal the exponents:
   - Show that $\varepsilon_L = \frac{\partial Q}{\partial L} \cdot \frac{L}{Q} = 0.4$

f) If both inputs double, what happens to output? What type of returns to scale?

---

### Problem 9: Growth Rates

a) Agricultural GDP grows according to: $Y(t) = 100e^{0.03t}$
   - What is the annual growth rate?
   - How long until GDP doubles? (Hint: Rule of 70)

b) A commodity price follows: $P(t) = 50 \cdot 1.05^t$
   - Convert to continuous growth: $P(t) = 50e^{gt}$. What is g?

c) If yield (Y) = Technology (T) × Land (A): $Y = T \cdot A$
   - Technology grows at 2% per year
   - Land grows at 0.5% per year
   - What is the growth rate of yield?

d) If output per worker (y = Y/L) and L grows at 1%, what must Y's growth rate be to keep y constant?

---

## Part E: Total Differential and MRTS

### Problem 10: Isoquant Analysis

For the production function $Q = L^{0.5}K^{0.5}$:

a) Write the total differential $dQ$

b) Along an isoquant (dQ = 0), derive the MRTS: $\frac{dK}{dL}$

c) At L = 25, K = 100, calculate:
   - The output level
   - The MRTS
   - Interpret: How much K can be given up for one more unit of L while maintaining output?

d) Plot the isoquant for Q = 50 in R:
```r
# Hint: Solve K as a function of L from Q = L^0.5 * K^0.5
# K = (Q/L^0.5)^2 = Q^2/L
```

---

### Problem 11: Comparative Statics Preview

A firm's profit is: $\pi(Q, P, w) = PQ - wL(Q) - rK$

where $L(Q) = Q^2/100$ (labor requirement), and K is fixed.

a) Find $\frac{\partial \pi}{\partial Q}$ (marginal profit with respect to output)

b) Find $\frac{\partial \pi}{\partial P}$ (how profit changes with price)

c) Find $\frac{\partial \pi}{\partial w}$ (how profit changes with wage)

d) If P = 10, w = 5, r = 2, K = 100, and Q = 50:
   - Calculate profit
   - Calculate all three partial derivatives at this point
   - Interpret each result economically

---

## Part F: R Programming

### Problem 12: Numerical Differentiation

Write R code to:

a) Create a function `numerical_derivative(f, x, h = 1e-6)` using the central difference formula

b) Test it on $f(x) = x^3$ at x = 2 (analytical answer: 12)

c) Create a function `elasticity(demand_fn, P)` that calculates price elasticity

d) For demand $Q = 500P^{-0.8}$:
   - Calculate elasticity at P = 10, 20, 30
   - What do you notice? Why?

---

### Problem 13: Production Function Analysis

Using the Cobb-Douglas function $Q = 10L^{0.3}K^{0.7}$:

a) Write R functions for Q, MP_L, and MP_K

b) Create a table showing Q, MP_L, MP_K for L = 50, 100, 150, 200 (holding K = 100)

c) Plot MP_L against L. Does it show diminishing marginal returns?

d) Calculate the output elasticity with respect to L at each point. Is it constant?

---

## Submission Guidelines

- Show analytical derivations for all problems
- Include R code and output where requested
- Provide economic interpretations
- Due: Before Week 4 class

---

## Self-Assessment Checklist

Before submitting, ensure you can:

- [ ] Apply power, product, quotient, and chain rules
- [ ] Calculate partial derivatives
- [ ] Compute and interpret elasticities
- [ ] Work with Cobb-Douglas functions
- [ ] Derive MRTS from a production function
- [ ] Implement numerical differentiation in R
- [ ] Interpret marginal products and returns to scale
- [ ] Use logarithms to find growth rates
