# Week 4: R Code Snippets — Optimization

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Overview

This document provides R implementations for:
- Single and multi-variable unconstrained optimization
- Hessian computation and definiteness checking
- Constrained optimization with Lagrangian method (via `nloptr`)
- **Bordered Hessian construction and SOC verification** ⭐
- Linear programming with shadow prices

---

## 1. Single Variable Optimization

### 1.1 Using `optimize()`

```r
# Profit function: π(Q) = 100Q - 3Q²
profit <- function(Q) 100 * Q - 3 * Q^2

# Find maximum (optimize uses interval search)
result <- optimize(profit, interval = c(0, 50), maximum = TRUE)

cat("Q* =", result$maximum, "\n")
cat("π* =", result$objective, "\n")

# Verify with calculus: dπ/dQ = 100 - 6Q = 0 → Q* = 16.67
```

**Output:**
```
Q* = 16.66667
π* = 833.3333
```

> **Note:** `optimize()` minimizes by default. Use `maximum = TRUE` for maximization.

### 1.2 Verifying FOC and SOC Numerically

```r
profit <- function(Q) 100 * Q - 3 * Q^2

# First derivative (numerical)
marginal <- function(Q, h = 1e-6) {
  (profit(Q + h) - profit(Q - h)) / (2 * h)
}

# Second derivative
second_deriv <- function(Q, h = 1e-5) {
  (profit(Q + h) - 2*profit(Q) + profit(Q - h)) / h^2
}

Q_star <- 100/6

cat("At Q* =", round(Q_star, 2), ":\n")
cat("FOC: dπ/dQ =", round(marginal(Q_star), 6), "(should be ≈ 0)\n")
cat("SOC: d²π/dQ² =", round(second_deriv(Q_star), 2), "(should be < 0 for max)\n")
```

---

## 2. Multi-Variable Unconstrained Optimization

### 2.1 Using `optim()`

```r
# Profit: π(L,K) = 50L^0.3 K^0.5 - 2L - 3K
# optim() minimizes, so we minimize negative profit

neg_profit <- function(x) {
  L <- x[1]
  K <- x[2]
  -(50 * L^0.3 * K^0.5 - 2*L - 3*K)
}

result <- optim(
  par = c(10, 10),      # Initial guess
  fn = neg_profit,
  method = "BFGS"       # Quasi-Newton method
)

L_star <- result$par[1]
K_star <- result$par[2]
profit_star <- -result$value

cat("Optimal: L* =", round(L_star, 2), ", K* =", round(K_star, 2), "\n")
cat("Max profit: π* =", round(profit_star, 2))
```

### 2.2 Computing the Gradient

```r
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

# Example
f <- function(x) x[1]^2 + 2*x[1]*x[2] + 3*x[2]^2
gradient(f, c(1, 1))  # Should be (4, 8)
```

---

## 3. The Hessian Matrix

### 3.1 Computing the Hessian Numerically

```r
hessian <- function(f, x, h = 1e-5) {
  n <- length(x)
  H <- matrix(0, n, n)
  for (i in 1:n) {
    for (j in 1:n) {
      x_pp <- x_pm <- x_mp <- x_mm <- x
      x_pp[i] <- x_pp[i] + h; x_pp[j] <- x_pp[j] + h
      x_pm[i] <- x_pm[i] + h; x_pm[j] <- x_pm[j] - h
      x_mp[i] <- x_mp[i] - h; x_mp[j] <- x_mp[j] + h
      x_mm[i] <- x_mm[i] - h; x_mm[j] <- x_mm[j] - h
      H[i, j] <- (f(x_pp) - f(x_pm) - f(x_mp) + f(x_mm)) / (4 * h^2)
    }
  }
  return(H)
}
```

### 3.2 Checking Definiteness

```r
check_definiteness <- function(H) {
  eig <- eigen(H)$values
  cat("Eigenvalues:", round(eig, 4), "\n")
  
  if (all(eig > 0)) {
    return("Positive definite → MINIMUM")
  } else if (all(eig < 0)) {
    return("Negative definite → MAXIMUM")
  } else {
    return("Indefinite → SADDLE POINT")
  }
}

# Using leading principal minors
check_minors <- function(H) {
  n <- nrow(H)
  minors <- numeric(n)
  for (k in 1:n) {
    minors[k] <- det(H[1:k, 1:k])
  }
  cat("Leading principal minors:", round(minors, 4), "\n")
  return(minors)
}

# Test
H <- matrix(c(-4, 4, 4, -6), nrow = 2)
cat(check_definiteness(H), "\n")
```

**Key rules for 2×2 Hessian:**
| Condition | $H_{11}$ | $\det(H)$ |
|-----------|----------|-----------|
| Negative definite (max) | $< 0$ | $> 0$ |
| Positive definite (min) | $> 0$ | $> 0$ |
| Indefinite (saddle) | any | $< 0$ |

---

## 4. Constrained Optimization with `nloptr`

### 4.1 Cost Minimization Example

```r
library(nloptr)

# Minimize cost C = 3L + 4K
# Subject to: 2L^0.5 K^0.5 = 160

cost <- function(x) {
  L <- x[1]; K <- x[2]
  return(3*L + 4*K)
}

production_constraint <- function(x) {
  L <- x[1]; K <- x[2]
  return(2 * L^0.5 * K^0.5 - 160)
}

result <- nloptr(
  x0 = c(50, 50),
  eval_f = cost,
  eval_g_eq = production_constraint,
  lb = c(0, 0),
  opts = list(algorithm = "NLOPT_LN_COBYLA", xtol_rel = 1e-8)
)

cat("L* =", round(result$solution[1], 2), "\n")
cat("K* =", round(result$solution[2], 2), "\n")
cat("Min cost =", round(result$objective, 2))
```

### 4.2 Utility Maximization Example

```r
library(nloptr)

# Maximize u = x^0.4 y^0.6 subject to 2x + 3y = 120

neg_utility <- function(x) {
  -(x[1]^0.4 * x[2]^0.6)
}

budget <- function(x) {
  2*x[1] + 3*x[2] - 120
}

result <- nloptr(
  x0 = c(20, 20),
  eval_f = neg_utility,
  eval_g_eq = budget,
  lb = c(0.001, 0.001),
  opts = list(algorithm = "NLOPT_LN_COBYLA", xtol_rel = 1e-8)
)

cat("x* =", round(result$solution[1], 2), "\n")
cat("y* =", round(result$solution[2], 2), "\n")

# Verify with Cobb-Douglas formula
alpha <- 0.4; m <- 120; p1 <- 2; p2 <- 3
cat("\nAnalytical: x* =", alpha * m / p1, ", y* =", (1-alpha) * m / p2)
```

---

## 5. The Bordered Hessian ⭐

### 5.1 Constructing the Bordered Hessian

For a problem with **1 constraint** and **2 variables**, the bordered Hessian is:

$$\bar{H} = \begin{bmatrix} 0 & g_x & g_y \\ g_x & \mathcal{L}_{xx} & \mathcal{L}_{xy} \\ g_y & \mathcal{L}_{xy} & \mathcal{L}_{yy} \end{bmatrix}$$

```r
bordered_hessian <- function(g_grad, L_hess) {
  # g_grad: gradient of constraint [g_x, g_y]
  # L_hess: Hessian of Lagrangian (2x2)
  
  n <- length(g_grad)
  H_bar <- matrix(0, n + 1, n + 1)
  
  # First row/column: constraint gradient
  H_bar[1, 1] <- 0
  H_bar[1, 2:(n+1)] <- g_grad
  H_bar[2:(n+1), 1] <- g_grad
  
  # Lower-right: Lagrangian Hessian
  H_bar[2:(n+1), 2:(n+1)] <- L_hess
  
  return(H_bar)
}
```

### 5.2 SOC Conditions

| Problem Type | Constraint(s) | Vars | Condition |
|--------------|---------------|------|-----------|
| **Maximum** | 1 | 2 | $\|\bar{H}\| > 0$ |
| **Minimum** | 1 | 2 | $\|\bar{H}\| < 0$ |

### 5.3 Complete SOC Check Function

```r
check_constrained_SOC <- function(f, g, x_star, lambda_star, type = "max") {
  h <- 1e-5
  n <- length(x_star)
  
  # Compute gradient of constraint
  g_grad <- numeric(n)
  for (i in 1:n) {
    x_plus <- x_minus <- x_star
    x_plus[i] <- x_plus[i] + h
    x_minus[i] <- x_minus[i] - h
    g_grad[i] <- (g(x_plus) - g(x_minus)) / (2 * h)
  }
  
  # Lagrangian: L = f - λg (our sign convention)
  L <- function(x) f(x) - lambda_star * g(x)
  
  # Compute Hessian of Lagrangian
  H_L <- matrix(0, n, n)
  for (i in 1:n) {
    for (j in 1:n) {
      x_pp <- x_pm <- x_mp <- x_mm <- x_star
      x_pp[i] <- x_pp[i] + h; x_pp[j] <- x_pp[j] + h
      x_pm[i] <- x_pm[i] + h; x_pm[j] <- x_pm[j] - h
      x_mp[i] <- x_mp[i] - h; x_mp[j] <- x_mp[j] + h
      x_mm[i] <- x_mm[i] - h; x_mm[j] <- x_mm[j] - h
      H_L[i, j] <- (L(x_pp) - L(x_pm) - L(x_mp) + L(x_mm)) / (4 * h^2)
    }
  }
  
  # Construct bordered Hessian
  H_bar <- matrix(0, n + 1, n + 1)
  H_bar[1, 1] <- 0
  H_bar[1, 2:(n+1)] <- g_grad
  H_bar[2:(n+1), 1] <- g_grad
  H_bar[2:(n+1), 2:(n+1)] <- H_L
  
  det_H_bar <- det(H_bar)
  
  cat("Bordered Hessian:\n")
  print(round(H_bar, 6))
  cat("\nDeterminant:", round(det_H_bar, 6), "\n")
  
  # Check condition
  if (type == "max" && det_H_bar > 0) {
    cat("✓ SOC satisfied for MAXIMUM\n")
  } else if (type == "min" && det_H_bar < 0) {
    cat("✓ SOC satisfied for MINIMUM\n")
  } else {
    cat("✗ SOC NOT satisfied\n")
  }
  
  return(list(H_bar = H_bar, det = det_H_bar))
}

# Example: max u = x^0.5 y^0.5 s.t. 2x + y = 60
f <- function(x) x[1]^0.5 * x[2]^0.5
g <- function(x) 2*x[1] + x[2] - 60

check_constrained_SOC(f, g, c(15, 30), lambda_star = 0.177, type = "max")
```

---

## 6. Linear Programming

### 6.1 Basic LP with `lpSolve`

```r
library(lpSolve)

# Max: 50x + 80y
# s.t. x + y ≤ 100, 2x + 3y ≤ 240

f.obj <- c(50, 80)
f.con <- matrix(c(1, 1, 2, 3), nrow = 2, byrow = TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(100, 240)

result <- lp("max", f.obj, f.con, f.dir, f.rhs)

cat("Optimal: x =", result$solution[1], ", y =", result$solution[2], "\n")
cat("Max profit:", result$objval)
```

### 6.2 Shadow Prices

```r
result <- lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)

cat("Shadow prices:\n")
cat("  Land:", result$duals[1], "(marginal value of extra hectare)\n")
cat("  Water:", round(result$duals[2], 2), "(marginal value of extra water)\n")
```

---

## 7. Visualization

### 7.1 Contour Plot with Constraint

```r
f <- function(x, y) -(x - 3)^2 - (y - 2)^2

x_seq <- seq(0, 6, length = 50)
y_seq <- seq(0, 4, length = 50)
z <- outer(x_seq, y_seq, f)

contour(x_seq, y_seq, z, nlevels = 15,
        xlab = "x", ylab = "y",
        main = "Contour Plot with Constraint")

# Unconstrained optimum
points(3, 2, pch = 19, col = "red", cex = 1.5)

# Constraint line: x + y = 4
abline(a = 4, b = -1, col = "blue", lwd = 2, lty = 2)

# Constrained optimum
points(2.33, 1.67, pch = 17, col = "green", cex = 1.5)

legend("topright", 
       legend = c("Unconstrained max", "Constraint", "Constrained max"),
       col = c("red", "blue", "green"), 
       pch = c(19, NA, 17), lty = c(NA, 2, NA))
```

---

## Quick Reference

| Task | R Code |
|------|--------|
| Single var max | `optimize(f, c(a,b), maximum=TRUE)` |
| Multi var max | `optim(x0, function(x) -f(x), method="BFGS")` |
| Constrained | `nloptr(x0, eval_f=f, eval_g_eq=g, opts=...)` |
| Hessian | `hessian(f, x)` (custom function above) |
| Eigenvalues | `eigen(H)$values` |
| Determinant | `det(H)` |
| LP | `lp("max", c, A, dir, b)` |

---

## Common Errors and Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| `function cannot be evaluated` | Starting point invalid | Use `lb` bounds, better initial guess |
| Wrong optimum | Local vs global | Try multiple starts; check concavity |
| `NaN` in Hessian | Boundary evaluation | Add small epsilon, use interior point |
| `lpSolve` returns 0 | Infeasible/unbounded | Check constraint compatibility |
