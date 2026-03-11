# Week 5: R Code Snippets — Consumer Theory I

## CS01: Plot Cobb-Douglas Indifference Curves
```r
plot_IC_CD <- function(alpha = 0.5, u_levels = c(5, 10, 15, 20)) {
  x1 <- seq(0.1, 30, length = 200)
  
  plot(NULL, xlim = c(0, 30), ylim = c(0, 30),
       xlab = expression(x[1]), ylab = expression(x[2]),
       main = paste('Cobb-Douglas IC (α =', alpha, ')'))
  
  colors <- rainbow(length(u_levels))
  for (i in seq_along(u_levels)) {
    u <- u_levels[i]
    x2 <- (u / x1^alpha)^(1/(1-alpha))
    x2[x2 > 30] <- NA
    lines(x1, x2, col = colors[i], lwd = 2)
  }
  legend('topright', legend = paste('U =', u_levels), col = colors, lwd = 2)
  grid()
}
```

---

## CS02: Calculate MRS
```r
# Analytical MRS for Cobb-Douglas
MRS_CD <- function(x1, x2, alpha = 0.5) {
  (alpha / (1 - alpha)) * (x2 / x1)
}

# Numerical MRS for any utility function
MRS_numerical <- function(U_fn, x1, x2, h = 1e-6) {
  MU1 <- (U_fn(x1 + h, x2) - U_fn(x1 - h, x2)) / (2 * h)
  MU2 <- (U_fn(x1, x2 + h) - U_fn(x1, x2 - h)) / (2 * h)
  return(MU1 / MU2)
}
```

---

## CS03: Plot Budget Constraint
```r
plot_budget <- function(p1, p2, m, col = 'black') {
  x1_max <- m / p1
  x2_max <- m / p2
  
  plot(NULL, xlim = c(0, x1_max * 1.1), ylim = c(0, x2_max * 1.1),
       xlab = expression(x[1]), ylab = expression(x[2]),
       main = 'Budget Constraint')
  
  segments(0, x2_max, x1_max, 0, col = col, lwd = 2)
  polygon(c(0, 0, x1_max), c(0, x2_max, 0),
          col = rgb(0.5, 0.5, 0.5, 0.2), border = NA)
  grid()
}
```

---

## CS04: Cobb-Douglas Demand Function ⭐
```r
cobb_douglas_demand <- function(p1, p2, m, alpha = 0.5) {
  x1 <- alpha * m / p1
  x2 <- (1 - alpha) * m / p2
  utility <- x1^alpha * x2^(1 - alpha)
  lambda <- alpha * utility / (x1 * p1)
  
  return(list(
    x1 = x1, x2 = x2,
    utility = utility,
    lambda = lambda,
    exp_share_1 = alpha,
    exp_share_2 = 1 - alpha
  ))
}

# Usage
result <- cobb_douglas_demand(p1 = 2, p2 = 3, m = 120, alpha = 0.4)
```

---

## CS05: Complete Consumer Choice Visualization
```r
plot_consumer_choice <- function(p1, p2, m, alpha = 0.5) {
  result <- cobb_douglas_demand(p1, p2, m, alpha)
  x1_star <- result$x1
  x2_star <- result$x2
  u_star <- result$utility
  
  x1_max <- m / p1 * 1.2
  x2_max <- m / p2 * 1.2
  
  plot(NULL, xlim = c(0, x1_max), ylim = c(0, x2_max),
       xlab = expression(x[1]), ylab = expression(x[2]),
       main = 'Utility Maximization')
  
  # Budget line
  segments(0, m/p2, m/p1, 0, col = 'blue', lwd = 2)
  
  # Indifference curves
  x1_seq <- seq(0.1, x1_max, length = 200)
  for (u in c(u_star * 0.7, u_star, u_star * 1.3)) {
    x2_seq <- (u / x1_seq^alpha)^(1/(1-alpha))
    x2_seq[x2_seq > x2_max] <- NA
    lines(x1_seq, x2_seq, col = 'red')
  }
  
  points(x1_star, x2_star, pch = 19, cex = 1.5, col = 'darkgreen')
  grid()
}
```

---

## CS06: Perfect Substitutes Demand
```r
perfect_subs_demand <- function(a, b, p1, p2, m) {
  MU_per_dollar_1 <- a / p1
  MU_per_dollar_2 <- b / p2
  
  if (MU_per_dollar_1 > MU_per_dollar_2) {
    x1 <- m / p1; x2 <- 0
  } else if (MU_per_dollar_1 < MU_per_dollar_2) {
    x1 <- 0; x2 <- m / p2
  } else {
    x1 <- m / (2*p1); x2 <- m / (2*p2)
  }
  
  return(c(x1 = x1, x2 = x2))
}
```

---

## CS07: Perfect Complements Demand
```r
perfect_comp_demand <- function(a, b, p1, p2, m) {
  # U = min{a*x1, b*x2}
  x1 <- m / (p1 + p2 * a / b)
  x2 <- (a / b) * x1
  return(c(x1 = x1, x2 = x2))
}
```

---

## CS08: Quasi-Linear Demand
```r
# U = x1 + v(x2), where v(x2) = 4*sqrt(x2)
quasi_linear_demand <- function(p1, p2, m) {
  # FOC: v'(x2) = p2/p1 → 2/sqrt(x2) = p2/p1
  x2 <- (2 * p1 / p2)^2
  
  if (p2 * x2 > m) {
    x2 <- m / p2
    x1 <- 0
  } else {
    x1 <- (m - p2 * x2) / p1
  }
  
  return(c(x1 = x1, x2 = x2))
}
```

---

## CS09-10: Demand and Engel Curves
```r
# Demand curve (x1 vs p1)
plot_demand_curve <- function(p2, m, alpha = 0.5) {
  p1_range <- seq(0.5, 20, by = 0.5)
  x1_demand <- alpha * m / p1_range
  plot(x1_demand, p1_range, type = 'l', col = 'blue', lwd = 2,
       xlab = expression(x[1]), ylab = expression(p[1]))
}

# Engel curve (x1 vs m)
plot_engel_curve <- function(p1, p2, alpha = 0.5) {
  m_range <- seq(10, 200, by = 5)
  x1_engel <- alpha * m_range / p1
  plot(m_range, x1_engel, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Income', ylab = expression(x[1]))
}
```

---

## CS11: Numerical Utility Maximization
```r
library(nloptr)

utility_max_general <- function(U_fn, p1, p2, m) {
  eval_f <- function(x) -U_fn(x[1], x[2])
  eval_g_eq <- function(x) p1 * x[1] + p2 * x[2] - m
  eval_jac_g_eq <- function(x) c(p1, p2)
  
  result <- nloptr(
    x0 = c(m/(2*p1), m/(2*p2)),
    eval_f = eval_f,
    eval_g_eq = eval_g_eq,
    eval_jac_g_eq = eval_jac_g_eq,
    lb = c(0.001, 0.001),
    opts = list(algorithm = 'NLOPT_LD_SLSQP')
  )
  
  return(result$solution)
}
```

---

## CS12-13: Elasticity Calculations
```r
# Price elasticity
price_elasticity <- function(demand_fn, p, h = 0.001) {
  x <- demand_fn(p)
  dx_dp <- (demand_fn(p + h) - demand_fn(p - h)) / (2 * h)
  return(dx_dp * p / x)
}

# Income elasticity
income_elasticity <- function(demand_fn, m, h = 0.001) {
  x <- demand_fn(m)
  dx_dm <- (demand_fn(m + h) - demand_fn(m - h)) / (2 * h)
  return(dx_dm * m / x)
}
```

---

## Key Patterns

| Task | R Pattern |
|------|-----------|
| Cobb-Douglas demand | `x1 <- alpha * m / p1` |
| Perfect substitutes | `if (a/p1 > b/p2) x1 <- m/p1` |
| Perfect complements | `x1 <- m / (p1 + p2*a/b)` |
| Elasticity | `(df/dx) * (x/f)` |
