# Week 3: R Code Snippets — Calculus & Functions

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Overview

Essential R code for differentiation, elasticity calculation, and economic functional forms.

---

## 1. Numerical Differentiation

### 1.1 First Derivative (Central Difference)

```r
# Central difference formula: f'(x) ≈ [f(x+h) - f(x-h)] / 2h
numerical_derivative <- function(f, x, h = 1e-6) {
  (f(x + h) - f(x - h)) / (2 * h)
}

# Test: f(x) = x³, f'(x) = 3x²
f <- function(x) x^3
numerical_derivative(f, x = 2)   # 12.0000
3 * 2^2                          # Analytical: 12

# Test: f(x) = eˣ, f'(x) = eˣ
g <- function(x) exp(x)
numerical_derivative(g, x = 1)   # 2.7183
exp(1)                           # Analytical: 2.7183
```

### 1.2 Partial Derivatives

```r
# Partial derivative with respect to first variable
partial_x <- function(f, x, y, h = 1e-6) {
  (f(x + h, y) - f(x - h, y)) / (2 * h)
}

# Partial derivative with respect to second variable
partial_y <- function(f, x, y, h = 1e-6) {
  (f(x, y + h) - f(x, y - h)) / (2 * h)
}

# Example: f(x,y) = 3x² + 2xy + y³
f <- function(x, y) 3*x^2 + 2*x*y + y^3

# At (x=1, y=2):
partial_x(f, 1, 2)  # 6(1) + 2(2) = 10
partial_y(f, 1, 2)  # 2(1) + 3(4) = 14
```

### 1.3 Gradient Vector

```r
# Gradient: vector of all partial derivatives
gradient <- function(f, x, h = 1e-6) {
  n <- length(x)
  grad <- numeric(n)
  
  for (i in 1:n) {
    x_plus <- x_minus <- x
    x_plus[i] <- x[i] + h
    x_minus[i] <- x[i] - h
    grad[i] <- (f(x_plus) - f(x_minus)) / (2 * h)
  }
  return(grad)
}

# Example: f(x₁, x₂) = x₁² + 3x₁x₂ + x₂²
f <- function(x) x[1]^2 + 3*x[1]*x[2] + x[2]^2

gradient(f, c(1, 2))  # [2(1)+3(2), 3(1)+2(2)] = [8, 7]
```

### 1.4 Second Derivative

```r
# Second derivative using central difference
second_derivative <- function(f, x, h = 1e-5) {
  (f(x + h) - 2*f(x) + f(x - h)) / h^2
}

# Test: f(x) = x³, f''(x) = 6x
f <- function(x) x^3
second_derivative(f, x = 2)  # Should be 12
6 * 2                        # Analytical: 12
```

---

## 2. Elasticity Calculations

### 2.1 Point Elasticity

```r
# Elasticity: ε = (dQ/dP) × (P/Q)
elasticity <- function(demand_fn, P, h = 1e-6) {
  Q <- demand_fn(P)
  dQ_dP <- (demand_fn(P + h) - demand_fn(P - h)) / (2 * h)
  return(dQ_dP * P / Q)
}

# Linear demand: Q = 200 - 4P
demand_linear <- function(P) 200 - 4*P

# Elasticity at different prices
prices <- c(10, 25, 40)
for (P in prices) {
  e <- elasticity(demand_linear, P)
  cat("P =", P, ": Q =", demand_linear(P), 
      ", ε =", round(e, 3), "\n")
}
# P = 10 : Q = 160 , ε = -0.25  (inelastic)
# P = 25 : Q = 100 , ε = -1     (unit elastic)
# P = 40 : Q = 40 , ε = -4      (elastic)
```

### 2.2 Constant Elasticity Demand

```r
# Q = aP^b has constant elasticity = b
demand_ce <- function(P, a = 100, b = -0.8) {
  a * P^b
}

# Verify elasticity is constant
for (P in c(5, 10, 20, 50)) {
  e <- elasticity(function(p) demand_ce(p), P)
  cat("P =", P, ": ε =", round(e, 3), "\n")
}
# All should be -0.8
```

### 2.3 Arc Elasticity (Midpoint Method)

```r
# Arc elasticity between two points
arc_elasticity <- function(P1, Q1, P2, Q2) {
  delta_Q <- Q2 - Q1
  delta_P <- P2 - P1
  avg_Q <- (Q1 + Q2) / 2
  avg_P <- (P1 + P2) / 2
  
  return((delta_Q / delta_P) * (avg_P / avg_Q))
}

# Example
arc_elasticity(10, 160, 15, 140)  # -0.417
```

---

## 3. Economic Functions

### 3.1 Cost Functions

```r
# Total cost: TC = F + aQ + bQ²
total_cost <- function(Q, F = 100, a = 20, b = 0.5) {
  F + a*Q + b*Q^2
}

# Marginal cost: MC = dTC/dQ = a + 2bQ
marginal_cost <- function(Q, a = 20, b = 0.5) {
  a + 2*b*Q
}

# Average cost: AC = TC/Q
average_cost <- function(Q, F = 100, a = 20, b = 0.5) {
  total_cost(Q, F, a, b) / Q
}

# Average variable cost: AVC = (TC - F)/Q
avg_variable_cost <- function(Q, a = 20, b = 0.5) {
  a + b*Q
}

# Plot cost curves
Q_range <- 1:50
plot(Q_range, average_cost(Q_range), type = 'l', col = 'blue', lwd = 2,
     ylim = c(0, 80), xlab = 'Quantity', ylab = 'Cost',
     main = 'Cost Curves')
lines(Q_range, marginal_cost(Q_range), col = 'red', lwd = 2)
lines(Q_range, avg_variable_cost(Q_range), col = 'green', lwd = 2)
legend('topright', c('AC', 'MC', 'AVC'), 
       col = c('blue', 'red', 'green'), lwd = 2)

# MC crosses AC at minimum AC
Q_min_AC <- sqrt(100 / 0.5)  # Q where AC is minimized
abline(v = Q_min_AC, lty = 2)
```

### 3.2 Revenue Functions

```r
# Inverse demand: P = a - bQ
inverse_demand <- function(Q, a = 100, b = 2) {
  a - b*Q
}

# Total revenue: TR = P×Q = aQ - bQ²
total_revenue <- function(Q, a = 100, b = 2) {
  Q * inverse_demand(Q, a, b)
}

# Marginal revenue: MR = dTR/dQ = a - 2bQ
marginal_revenue <- function(Q, a = 100, b = 2) {
  a - 2*b*Q
}

# Revenue-maximizing quantity: MR = 0
Q_max_rev <- 100 / (2 * 2)  # 25

# Plot
Q_range <- 0:50
plot(Q_range, total_revenue(Q_range), type = 'l', col = 'purple', lwd = 2,
     xlab = 'Quantity', ylab = 'Revenue', main = 'Total Revenue')
abline(v = Q_max_rev, lty = 2)
```

### 3.3 Profit Maximization

```r
# Profit = TR - TC
profit <- function(Q, P_intercept = 100, P_slope = 2, 
                   FC = 100, VC_linear = 20, VC_quad = 0.5) {
  TR <- Q * (P_intercept - P_slope * Q)
  TC <- FC + VC_linear * Q + VC_quad * Q^2
  return(TR - TC)
}

# Find profit-maximizing Q
result <- optimize(profit, interval = c(0, 50), maximum = TRUE)
Q_star <- result$maximum
pi_star <- result$objective

cat("Optimal Q:", round(Q_star, 2), "\n")
cat("Maximum profit:", round(pi_star, 2), "\n")

# Verify: MR = MC
# MR = 100 - 4Q, MC = 20 + Q
# 100 - 4Q = 20 + Q → 80 = 5Q → Q = 16
```

---

## 4. Cobb-Douglas Functions

### 4.1 Production Function

```r
# Q = A × L^α × K^β
cobb_douglas <- function(L, K, A = 10, alpha = 0.3, beta = 0.7) {
  A * L^alpha * K^beta
}

# Marginal product of labor: MP_L = α × Q/L
MP_L <- function(L, K, A = 10, alpha = 0.3, beta = 0.7) {
  alpha * cobb_douglas(L, K, A, alpha, beta) / L
}

# Marginal product of capital: MP_K = β × Q/K
MP_K <- function(L, K, A = 10, alpha = 0.3, beta = 0.7) {
  beta * cobb_douglas(L, K, A, alpha, beta) / K
}

# Test
L <- 100; K <- 50
cat("Q =", round(cobb_douglas(L, K), 2), "\n")
cat("MP_L =", round(MP_L(L, K), 4), "\n")
cat("MP_K =", round(MP_K(L, K), 4), "\n")
```

### 4.2 MRTS (Marginal Rate of Technical Substitution)

```r
# MRTS = -MP_L / MP_K = -(α/β) × (K/L)
MRTS <- function(L, K, alpha = 0.3, beta = 0.7) {
  -MP_L(L, K, alpha = alpha, beta = beta) / 
   MP_K(L, K, alpha = alpha, beta = beta)
}

# Alternative formula
MRTS_formula <- function(L, K, alpha = 0.3, beta = 0.7) {
  -(alpha / beta) * (K / L)
}

# Verify
L <- 100; K <- 50
MRTS(L, K)          # Using MP ratio
MRTS_formula(L, K)  # Using formula (should match)
```

### 4.3 Output Elasticities

```r
# Output elasticity w.r.t. L: ε_L = (∂Q/∂L) × (L/Q)
# For Cobb-Douglas, this equals α

output_elasticity_L <- function(L, K, alpha = 0.3, beta = 0.7) {
  Q <- cobb_douglas(L, K, alpha = alpha, beta = beta)
  dQ_dL <- MP_L(L, K, alpha = alpha, beta = beta)
  return(dQ_dL * L / Q)
}

# Should always equal alpha
output_elasticity_L(100, 50)  # 0.3
output_elasticity_L(200, 100) # 0.3 (constant!)
```

### 4.4 Returns to Scale

```r
# Test returns to scale: scale all inputs by t
test_returns <- function(t, L = 100, K = 50, alpha = 0.3, beta = 0.7) {
  Q_original <- cobb_douglas(L, K, alpha = alpha, beta = beta)
  Q_scaled <- cobb_douglas(t*L, t*K, alpha = alpha, beta = beta)
  return(Q_scaled / Q_original)
}

# If ratio = t: CRS
# If ratio > t: IRS
# If ratio < t: DRS

t <- 2
ratio <- test_returns(t)
cat("Scaling factor:", t, "\n")
cat("Output ratio:", ratio, "\n")
cat("Returns to scale:", 
    ifelse(abs(ratio - t) < 0.01, "Constant",
           ifelse(ratio > t, "Increasing", "Decreasing")), "\n")
```

### 4.5 Isoquant Plotting

```r
# For Q = L^α × K^β, isoquant is: K = (Q/L^α)^(1/β)
isoquant <- function(L, Q_target, alpha = 0.3, beta = 0.7, A = 10) {
  (Q_target / (A * L^alpha))^(1/beta)
}

# Plot isoquants for different output levels
L_range <- seq(10, 200, by = 1)
Q_levels <- c(50, 100, 150)
colors <- c('blue', 'red', 'green')

plot(NULL, xlim = c(0, 200), ylim = c(0, 200),
     xlab = 'Labor (L)', ylab = 'Capital (K)',
     main = 'Isoquant Map')

for (i in seq_along(Q_levels)) {
  K_values <- isoquant(L_range, Q_levels[i])
  K_values[K_values > 200] <- NA
  lines(L_range, K_values, col = colors[i], lwd = 2)
}

legend('topright', paste('Q =', Q_levels), col = colors, lwd = 2)
grid()
```

---

## 5. Growth Rate Calculations

### 5.1 Continuous Growth

```r
# Y(t) = Y₀ × e^(gt)
# Growth rate g = d(ln Y)/dt

continuous_growth <- function(Y0, g, t) {
  Y0 * exp(g * t)
}

# Example: 3% growth from Y0 = 100
Y0 <- 100; g <- 0.03
t_range <- 0:50
Y_values <- continuous_growth(Y0, g, t_range)

plot(t_range, Y_values, type = 'l', col = 'blue', lwd = 2,
     xlab = 'Time', ylab = 'Y', main = 'Continuous Growth (g = 3%)')

# Doubling time
T_double <- log(2) / g
cat("Doubling time:", round(T_double, 1), "periods\n")
abline(h = 2*Y0, lty = 2)
abline(v = T_double, lty = 2)
```

### 5.2 Log Differences as Growth Rates

```r
# For small changes: growth rate ≈ Δln(Y)
Y <- c(100, 103, 106.09, 109.27, 112.55)

# Method 1: Standard growth rate
growth_standard <- diff(Y) / head(Y, -1)

# Method 2: Log difference
growth_log <- diff(log(Y))

# Compare
cbind(Standard = growth_standard, Log_diff = growth_log)
# Nearly identical for small changes
```

### 5.3 Growth Rate Rules

```r
# If z = x × y, then ĝ_z = ĝ_x + ĝ_y
# If z = x / y, then ĝ_z = ĝ_x - ĝ_y
# If z = x^n, then ĝ_z = n × ĝ_x

# Example: GDP = Productivity × Hours
g_productivity <- 0.02  # 2% growth
g_hours <- 0.01         # 1% growth
g_GDP <- g_productivity + g_hours
cat("GDP growth rate:", g_GDP * 100, "%\n")  # 3%

# Example: GDP per capita = GDP / Population
g_GDP <- 0.03
g_population <- 0.01
g_per_capita <- g_GDP - g_population
cat("Per capita growth:", g_per_capita * 100, "%\n")  # 2%
```

---

## 6. Symbolic Differentiation

### 6.1 Using D() Function

```r
# R can do symbolic differentiation with D()
expr <- expression(3*x^2 + 2*x + 5)
D(expr, "x")  # 3 * (2 * x) + 2

# More complex
expr2 <- expression(x^2 * exp(x))
D(expr2, "x")  # Product rule applied

# Evaluate at a point
deriv_fn <- deriv(expression(x^3), "x", func = TRUE)
deriv_fn(2)  # Returns function value and gradient
```

### 6.2 Using Deriv Package

```r
# install.packages("Deriv")
library(Deriv)

# Derivative of a function
f <- function(x) x^3 + 2*x^2 - 5*x
Deriv(f, "x")  # Returns derivative function

# Partial derivatives
g <- function(x, y) x^2*y + x*y^2
Deriv(g, "x")  # Partial w.r.t. x
Deriv(g, "y")  # Partial w.r.t. y
```

---

## 7. Quick Reference

| Task | Code |
|------|------|
| Numerical derivative | `(f(x+h) - f(x-h)) / (2*h)` |
| Elasticity | `dQ_dP * P / Q` |
| Cobb-Douglas | `A * L^alpha * K^beta` |
| MP_L | `alpha * Q / L` |
| MRTS | `-MP_L / MP_K` |
| Returns to scale | Sum of exponents |
| Growth rate | `diff(log(Y))` |
| Symbolic derivative | `D(expression(...), "x")` |
| Optimize | `optimize(f, interval, maximum=TRUE)` |

---

## Key Formulas in R

```r
# Elasticity
elasticity <- function(f, x) {
  h <- 1e-6
  df_dx <- (f(x+h) - f(x-h)) / (2*h)
  df_dx * x / f(x)
}

# MRTS for Cobb-Douglas
MRTS_CD <- function(L, K, alpha, beta) {
  -(alpha/beta) * (K/L)
}

# Returns to scale
RTS <- function(alpha, beta) {
  sum_exp <- alpha + beta
  if (abs(sum_exp - 1) < 0.01) "CRS"
  else if (sum_exp > 1) "IRS"
  else "DRS"
}
```

---

*Week 3 Code Snippets — ECON4002*
