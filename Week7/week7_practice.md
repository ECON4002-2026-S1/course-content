# Week 7: Practice Problems

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Instructions

Complete all problems. Show your analytical work step by step and include R code for computational questions. You may use the AI tutor for guidance, but ensure you understand the solutions.

---

## Part A: Production Technology

### Problem 1: Marginal and Average Products *(Easy)*

For the production function $f(L, K) = 20L^{0.5}K^{0.5}$:

a) Calculate $MP_L$ and $MP_K$.

b) Calculate $AP_L$.

c) Show that $MP_L < AP_L$ for this function.

---

### Problem 2: Returns to Scale *(Easy)*

Determine the returns to scale for each production function:

a) $f(L, K) = 3L^{0.6}K^{0.5}$

b) $f(L, K) = L^{0.3}K^{0.7}$

c) $f(L, K) = \min\{2L,\ 3K\}$

---

### Problem 3: Marginal Rate of Technical Substitution *(Medium)*

For $f(L, K) = L^{0.4}K^{0.6}$:

a) Derive $MRTS_{LK}$.

b) Calculate $MRTS_{LK}$ when $L = 10$, $K = 20$.

c) Interpret this value in economic terms.

---

### Problem 4: Isoquants *(Medium)*

A farm produces corn using $f(L, K) = 100L^{0.5}K^{0.5}$.

a) Write the equation for the isoquant at $y = 500$.

b) At what combination $(L, K)$ does the isoquant have slope $-1$?

c) What is the capital–labour ratio at that point?

---

## Part B: Cost Minimisation

### Problem 5: Cost Minimisation Problem *(Medium)*

A firm has $f(L, K) = L^{0.5}K^{0.5}$, $w = 10$, $r = 20$.

a) Set up the cost minimisation problem for $y = 100$.

b) Find the optimal inputs $L^*$ and $K^*$.

c) Calculate minimum cost $C^*$.

---

### Problem 6: Cost Function Derivation *(Hard)*

For $f(L, K) = L^{0.5}K^{0.5}$ with general input prices $w$ and $r$:

a) Derive the conditional input demands $L^*(w, r, y)$ and $K^*(w, r, y)$.

b) Derive the cost function $C(w, r, y)$.

c) Verify Shephard's Lemma: confirm $\partial C / \partial w = L^*$ and $\partial C / \partial r = K^*$.

---

### Problem 7: Short-Run vs Long-Run Costs *(Medium)*

A dairy farm has $f(L, K) = 10L^{0.5}K^{0.5}$, $w = 20$, $r = 10$. Capital is fixed at $\bar{K} = 100$ in the short run.

a) Derive the short-run cost function $SC(y)$.

b) Find $AVC$, $AFC$, and $AC$.

c) At what output level does $MC = AC$?

---

### Problem 8: Properties of Cost Functions *(Medium)*

Explain intuitively and formally why the cost function $C(w, r, y)$ must satisfy:

a) Homogeneity of degree 1 in $(w, r)$.

b) Concavity in $(w, r)$.

c) Non-decreasing in $y$.

---

## Part C: Applied and Advanced Problems

### Problem 9: Agricultural Technology Choice *(Hard)*

A wheat farm can choose between two technologies:
- **Traditional:** $f_T(L, K) = L^{0.7}K^{0.3}$
- **Modern:** $f_M(L, K) = 2L^{0.4}K^{0.6}$

With $w = 15$, $r = 30$:

a) Which technology is more labour-intensive? Justify by comparing optimal $K/L$ ratios.

b) For $y = 100$, which technology minimises cost?

c) How does your answer change if the rental rate doubles to $r = 60$?

---

### Problem 10: Leontief Production *(Medium)*

A processing plant has $f(L, K) = \min\left\{\dfrac{L}{2},\ \dfrac{K}{3}\right\}$ with $w = 12$, $r = 8$.

a) What input combination produces $y = 10$?

b) Derive the cost function $C(w, r, y)$.

c) Why is there no substitution effect for a Leontief technology?

---

### Problem 11: Shephard's Lemma — Proof *(Hard)*

Prove Shephard's Lemma using the Envelope Theorem. That is, show that

$$\frac{\partial C(w, r, y)}{\partial w} = L^*(w, r, y)$$

*Hint: Write the Lagrangian for cost minimisation and apply the Envelope Theorem. Note that the indirect effect through the optimal inputs vanishes at the optimum.*

---

### Problem 12: Precision Agriculture *(Hard)*

A technological upgrade changes production from $f_1(L, K) = L^{0.5}K^{0.5}$ to $f_2(L, K) = 1.2L^{0.5}K^{0.5}$ (a 20% productivity boost).

For $y = 1000$, $w = 20$, $r = 30$:

a) Calculate the cost saving from adopting the new technology.

b) Is the technology worth adopting if it costs \$500 per period?

c) Does the optimal $K/L$ ratio change? Explain.

---

## R Exercises

### Problem 13: Cost Minimisation in R

Solve Problem 5 computationally:

```r
# Define production function and constraint
f <- function(L, K) L^0.5 * K^0.5
w <- 10; r <- 20; y_target <- 100

# Use optim() or the MRTS = w/r condition to find L*, K*
# Plot the isoquant and isocost line at the optimum
```

### Problem 14: Technology Comparison

Using the two technologies from Problem 9:

```r
# Define cost functions for each technology
# Plot cost as a function of output for each technology
# Find the output level at which they cross (if any)
# Show how the crossover shifts when r doubles
```
