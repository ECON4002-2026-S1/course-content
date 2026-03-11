# Week 11: R Code Snippets — Welfare Economics

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## 1. Consumer Surplus Calculation

```r
# Calculate consumer surplus for linear demand
# Inverse demand: P = a - b*Q

consumer_surplus <- function(a, b, p_star, Q_star = NULL) {
  # If Q_star not provided, calculate from demand
  if (is.null(Q_star)) {
    Q_star <- (a - p_star) / b
  }
  
  # CS = triangle area below demand, above price
  CS <- 0.5 * (a - p_star) * Q_star
  
  cat("=== Consumer Surplus ===\n")
  cat("Demand intercept: P_max =", a, "\n")
  cat("Market price: p* =", p_star, "\n")
  cat("Quantity: Q* =", Q_star, "\n")
  cat("CS = ½ ×", (a - p_star), "×", Q_star, "=", CS, "\n")
  
  return(CS)
}

# Example: P = 10 - Q, p* = 6, Q* = 4
CS <- consumer_surplus(a = 10, b = 1, p_star = 6)
```

---

## 2. Producer Surplus Calculation

```r
# Calculate producer surplus for linear supply
# Inverse supply: P = c + d*Q

producer_surplus <- function(c, d, p_star, Q_star = NULL) {
  # If Q_star not provided, calculate from supply
  if (is.null(Q_star)) {
    Q_star <- (p_star - c) / d
  }
  
  # PS = triangle area above supply, below price
  PS <- 0.5 * (p_star - c) * Q_star
  
  cat("=== Producer Surplus ===\n")
  cat("Supply intercept: P_min =", c, "\n")
  cat("Market price: p* =", p_star, "\n")
  cat("Quantity: Q* =", Q_star, "\n")
  cat("PS = ½ ×", (p_star - c), "×", Q_star, "=", PS, "\n")
  
  return(PS)
}

# Example: P = 2 + Q, p* = 6, Q* = 4
PS <- producer_surplus(c = 2, d = 1, p_star = 6)
```

---

## 3. Market Equilibrium and Total Welfare

```r
# Complete welfare analysis at market equilibrium
# Inverse demand: P = a - b*Q
# Inverse supply: P = c + d*Q

market_welfare <- function(a, b, c, d) {
  # Equilibrium: a - b*Q = c + d*Q
  Q_star <- (a - c) / (b + d)
  p_star <- a - b * Q_star
  
  # Welfare measures
  CS <- 0.5 * (a - p_star) * Q_star
  PS <- 0.5 * (p_star - c) * Q_star
  W <- CS + PS
  
  cat("=== Market Equilibrium Welfare ===\n")
  cat("Equilibrium: p* =", round(p_star, 2), ", Q* =", round(Q_star, 2), "\n\n")
  cat("Consumer Surplus: CS =", round(CS, 2), "\n")
  cat("Producer Surplus: PS =", round(PS, 2), "\n")
  cat("Total Welfare: W =", round(W, 2), "\n")
  
  return(list(p = p_star, Q = Q_star, CS = CS, PS = PS, W = W))
}

# Example: Demand P = 7 - Q, Supply P = 1 + Q
eq <- market_welfare(a = 7, b = 1, c = 1, d = 1)
```

---

## 4. Visualize Consumer and Producer Surplus

```r
plot_welfare <- function(a, b, c, d) {
  eq <- market_welfare(a, b, c, d)
  
  Q_max <- eq$Q * 1.5
  Q_range <- seq(0, Q_max, length = 200)
  P_d <- a - b * Q_range
  P_s <- c + d * Q_range
  
  plot(Q_range, P_d, type = 'l', col = 'blue', lwd = 2,
       ylim = c(0, max(a, eq$p * 1.3)),
       xlab = 'Quantity', ylab = 'Price',
       main = 'Consumer and Producer Surplus')
  lines(Q_range, P_s, col = 'red', lwd = 2)
  
  # Shade CS
  Q_cs <- seq(0, eq$Q, length = 100)
  polygon(c(Q_cs, rev(Q_cs)),
          c(a - b * Q_cs, rep(eq$p, 100)),
          col = rgb(0, 0, 1, 0.3), border = NA)
  
  # Shade PS
  polygon(c(Q_cs, rev(Q_cs)),
          c(rep(eq$p, 100), rev(c + d * Q_cs)),
          col = rgb(1, 0, 0, 0.3), border = NA)
  
  # Equilibrium point
  points(eq$Q, eq$p, pch = 19, cex = 1.5)
  abline(h = eq$p, lty = 2, col = 'gray')
  
  legend('topright', c('Demand', 'Supply', 'CS', 'PS'),
         col = c('blue', 'red', rgb(0,0,1,0.3), rgb(1,0,0,0.3)),
         lwd = c(2, 2, NA, NA), pch = c(NA, NA, 15, 15))
  
  text(eq$Q/2, (a + eq$p)/2, paste('CS =', round(eq$CS, 1)))
  text(eq$Q/2, (c + eq$p)/2, paste('PS =', round(eq$PS, 1)))
  grid()
}

plot_welfare(a = 7, b = 1, c = 1, d = 1)
```

---

## 5. Price Ceiling Analysis

```r
price_ceiling_analysis <- function(a, b, c, d, p_ceil) {
  eq <- market_welfare(a, b, c, d)
  
  if (p_ceil >= eq$p) {
    cat("Price ceiling", p_ceil, "is not binding (above equilibrium", eq$p, ")\n")
    return(NULL)
  }
  
  # Quantities at ceiling
  Q_d <- (a - p_ceil) / b
  Q_s <- (p_ceil - c) / d
  Q_traded <- min(Q_d, Q_s)  # Short side of market
  
  # Welfare at ceiling
  # Consumers get Q_traded at price p_ceil
  # Value of Q_traded to consumers = area under demand up to Q_traded
  P_d_at_Q <- a - b * Q_traded  # Demand price at Q_traded
  
  # CS = triangle above p_ceil + rectangle (if Q_traded < Q_d)
  CS_new <- 0.5 * (a - P_d_at_Q) * Q_traded + (P_d_at_Q - p_ceil) * Q_traded
  PS_new <- 0.5 * (p_ceil - c) * Q_traded
  W_new <- CS_new + PS_new
  
  DWL <- eq$W - W_new
  
  cat("\n=== Price Ceiling Analysis (p^c =", p_ceil, ") ===\n\n")
  cat("Free market: p* =", round(eq$p, 2), ", Q* =", round(eq$Q, 2), "\n")
  cat("With ceiling:\n")
  cat("  Q demanded:", round(Q_d, 2), "\n")
  cat("  Q supplied:", round(Q_s, 2), "\n")
  cat("  Shortage:", round(Q_d - Q_s, 2), "\n")
  cat("  Q traded:", round(Q_traded, 2), "\n\n")
  
  cat("Welfare:\n")
  cat("  Original: CS =", round(eq$CS, 2), ", PS =", round(eq$PS, 2), ", W =", round(eq$W, 2), "\n")
  cat("  Ceiling:  CS =", round(CS_new, 2), ", PS =", round(PS_new, 2), ", W =", round(W_new, 2), "\n")
  cat("  DWL =", round(DWL, 2), "\n")
  
  return(list(Q_traded = Q_traded, shortage = Q_d - Q_s,
              CS = CS_new, PS = PS_new, W = W_new, DWL = DWL))
}

# Example: ceiling at p = 2
ceiling <- price_ceiling_analysis(a = 7, b = 1, c = 1, d = 1, p_ceil = 2)
```

---

## 6. Price Floor Analysis

```r
price_floor_analysis <- function(a, b, c, d, p_floor) {
  eq <- market_welfare(a, b, c, d)
  
  if (p_floor <= eq$p) {
    cat("Price floor", p_floor, "is not binding (below equilibrium", eq$p, ")\n")
    return(NULL)
  }
  
  # Quantities at floor
  Q_d <- (a - p_floor) / b
  Q_s <- (p_floor - c) / d
  Q_traded <- Q_d  # Demand is the short side
  surplus <- Q_s - Q_d
  
  # Welfare (only Q_d is traded)
  CS_new <- 0.5 * (a - p_floor) * Q_traded
  PS_new <- 0.5 * (p_floor - c) * Q_traded + 0.5 * (p_floor - c) * Q_traded
  # Actually: PS from units sold
  P_s_at_Q <- c + d * Q_traded
  PS_new <- p_floor * Q_traded - 0.5 * (c + P_s_at_Q) * Q_traded
  
  W_new <- CS_new + PS_new
  DWL <- eq$W - W_new
  
  cat("\n=== Price Floor Analysis (p^f =", p_floor, ") ===\n\n")
  cat("Free market: p* =", round(eq$p, 2), ", Q* =", round(eq$Q, 2), "\n")
  cat("With floor:\n")
  cat("  Q demanded:", round(Q_d, 2), "\n")
  cat("  Q supplied:", round(Q_s, 2), "\n")
  cat("  Surplus:", round(surplus, 2), "\n")
  cat("  Q traded:", round(Q_traded, 2), "\n\n")
  
  cat("If government buys surplus at p_floor:\n")
  cat("  Government cost:", round(p_floor * surplus, 2), "\n")
  
  return(list(Q_traded = Q_traded, surplus = surplus,
              CS = CS_new, PS = PS_new, DWL = DWL))
}

# Example: floor at p = 5
floor_result <- price_floor_analysis(a = 7, b = 1, c = 1, d = 1, p_floor = 5)
```

---

## 7. Visualize Price Ceiling Effects

```r
plot_ceiling <- function(a, b, c, d, p_ceil) {
  eq <- market_welfare(a, b, c, d)
  
  Q_max <- max(eq$Q, (a - p_ceil)/b) * 1.3
  Q_range <- seq(0, Q_max, length = 200)
  P_d <- a - b * Q_range
  P_s <- c + d * Q_range
  
  Q_s <- (p_ceil - c) / d
  Q_d <- (a - p_ceil) / b
  
  plot(Q_range, P_d, type = 'l', col = 'blue', lwd = 2,
       ylim = c(0, a * 1.1),
       xlab = 'Quantity', ylab = 'Price',
       main = paste('Price Ceiling at p =', p_ceil))
  lines(Q_range, P_s, col = 'red', lwd = 2)
  
  # Ceiling line
  abline(h = p_ceil, col = 'darkgreen', lwd = 2, lty = 2)
  
  # DWL triangle
  polygon(c(Q_s, eq$Q, Q_s),
          c(p_ceil, eq$p, a - b * Q_s),
          col = rgb(1, 1, 0, 0.5), border = 'orange', lwd = 2)
  
  # Mark points
  points(c(Q_s, Q_d, eq$Q), c(p_ceil, p_ceil, eq$p), pch = 19, cex = 1.5)
  
  # Shortage arrow
  arrows(Q_s, p_ceil - 0.3, Q_d, p_ceil - 0.3, code = 3, col = 'purple', lwd = 2)
  text((Q_s + Q_d)/2, p_ceil - 0.6, 'Shortage', col = 'purple')
  
  legend('topright', c('Demand', 'Supply', 'Ceiling', 'DWL'),
         col = c('blue', 'red', 'darkgreen', rgb(1,1,0,0.5)),
         lwd = c(2, 2, 2, NA), lty = c(1, 1, 2, NA), pch = c(NA, NA, NA, 15))
  grid()
}

plot_ceiling(a = 7, b = 1, c = 1, d = 1, p_ceil = 2)
```

---

## 8. CV and EV Calculation for Cobb-Douglas

```r
# CV and EV for Cobb-Douglas utility U = x1^α * x2^(1-α)

cv_ev_cobb_douglas <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  # Marshallian demands
  x1_old <- alpha * m / p1_old
  x2_old <- (1 - alpha) * m / p2
  x1_new <- alpha * m / p1_new
  x2_new <- (1 - alpha) * m / p2
  
  # Utility levels
  u_old <- x1_old^alpha * x2_old^(1 - alpha)
  u_new <- x1_new^alpha * x2_new^(1 - alpha)
  
  # Expenditure function: e(p1, p2, u) = u / k * p1^α * p2^(1-α)
  k <- alpha^alpha * (1 - alpha)^(1 - alpha)
  e_fn <- function(p1, p2, u) u / k * p1^alpha * p2^(1 - alpha)
  
  # CV: expenditure at new prices for old utility - income
  CV <- e_fn(p1_new, p2, u_old) - m
  
  # EV: expenditure at old prices for new utility - income
  EV <- e_fn(p1_old, p2, u_new) - m
  
  # Marshallian CS (integral of demand from p1_new to p1_old)
  # x1 = α*m/p1, so ΔCS = ∫ α*m/p dp = α*m * ln(p1_old/p1_new)
  delta_CS <- alpha * m * log(p1_old / p1_new)
  
  cat("=== CV and EV Analysis ===\n\n")
  cat("Price change: p1 from", p1_old, "to", p1_new, "\n")
  cat("Income:", m, ", α =", alpha, "\n\n")
  
  cat("Old bundle: (", round(x1_old, 2), ",", round(x2_old, 2), "), u =", round(u_old, 2), "\n")
  cat("New bundle: (", round(x1_new, 2), ",", round(x2_new, 2), "), u =", round(u_new, 2), "\n\n")
  
  cat("Welfare Measures:\n")
  cat("  CV =", round(CV, 2), "\n")
  cat("  ΔCS =", round(delta_CS, 2), "\n")
  cat("  EV =", round(EV, 2), "\n\n")
  
  if (p1_new < p1_old) {
    cat("Price decrease: |CV| < ΔCS < EV\n")
    cat("  ", round(abs(CV), 2), "<", round(delta_CS, 2), "<", round(EV, 2), "\n")
  } else {
    cat("Price increase: EV < ΔCS < CV\n")
  }
  
  return(list(CV = CV, EV = EV, delta_CS = delta_CS,
              u_old = u_old, u_new = u_new))
}

# Example: price decrease
result <- cv_ev_cobb_douglas(p1_old = 10, p1_new = 5, p2 = 5, m = 100, alpha = 0.5)
```

---

## 9. Visualize CV and EV

```r
plot_cv_ev <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  # Calculate bundles and utilities
  x1_old <- alpha * m / p1_old
  x2_old <- (1 - alpha) * m / p2
  x1_new <- alpha * m / p1_new
  x2_new <- (1 - alpha) * m / p2
  
  u_old <- x1_old^alpha * x2_old^(1 - alpha)
  u_new <- x1_new^alpha * x2_new^(1 - alpha)
  
  # Plot range
  x1_max <- max(x1_old, x1_new) * 1.5
  x2_max <- max(x2_old, x2_new) * 1.5
  
  x1_range <- seq(0.1, x1_max, length = 200)
  
  # Indifference curves
  IC_old <- (u_old / x1_range^alpha)^(1/(1-alpha))
  IC_new <- (u_new / x1_range^alpha)^(1/(1-alpha))
  
  # Budget lines
  BL_old <- (m - p1_old * x1_range) / p2
  BL_new <- (m - p1_new * x1_range) / p2
  
  plot(NULL, xlim = c(0, x1_max), ylim = c(0, x2_max),
       xlab = expression(x[1]), ylab = expression(x[2]),
       main = 'CV and EV Diagram')
  
  # ICs
  lines(x1_range, IC_old, col = 'blue', lwd = 2)
  lines(x1_range, IC_new, col = 'red', lwd = 2)
  
  # Budget lines
  lines(x1_range, pmax(0, BL_old), col = 'blue', lty = 2)
  lines(x1_range, pmax(0, BL_new), col = 'red', lty = 2)
  
  # Points
  points(x1_old, x2_old, pch = 19, cex = 1.5, col = 'blue')
  points(x1_new, x2_new, pch = 19, cex = 1.5, col = 'red')
  
  text(x1_old, x2_old, 'A (old)', pos = 4)
  text(x1_new, x2_new, 'B (new)', pos = 4)
  
  legend('topright', 
         c(paste('IC at u⁰ =', round(u_old, 1)),
           paste('IC at u¹ =', round(u_new, 1)),
           'Old budget', 'New budget'),
         col = c('blue', 'red', 'blue', 'red'),
         lwd = 2, lty = c(1, 1, 2, 2))
  grid()
}

plot_cv_ev(p1_old = 10, p1_new = 5, p2 = 5, m = 100, alpha = 0.5)
```

---

## 10. Welfare from Discrete Data

```r
# Calculate welfare from discrete WTP/WTA data

welfare_discrete <- function(wtp, wta, price) {
  # wtp: vector of consumer willingness to pay for each unit
  # wta: vector of producer minimum acceptable prices
  # price: market price
  
  # Consumer side
  units_bought <- sum(wtp >= price)
  CS <- sum(pmax(0, wtp - price))
  
  # Producer side
  units_sold <- sum(wta <= price)
  PS <- sum(pmax(0, price - wta))
  
  cat("=== Discrete Welfare Analysis ===\n\n")
  cat("Market price:", price, "\n\n")
  
  cat("Consumers:\n")
  cat("  Units purchased:", units_bought, "\n")
  cat("  Consumer Surplus:", CS, "\n\n")
  
  cat("Producers:\n")
  cat("  Units sold:", units_sold, "\n")
  cat("  Producer Surplus:", PS, "\n\n")
  
  cat("Total Welfare:", CS + PS, "\n")
  
  return(list(CS = CS, PS = PS, W = CS + PS, 
              Q_demand = units_bought, Q_supply = units_sold))
}

# Example from table
wtp <- c(50, 40, 30, 20, 10)
wta <- c(8, 12, 16, 20, 24)
welfare_discrete(wtp, wta, price = 25)
```

---

## 11. Complete Welfare Toolkit

```r
welfare_toolkit <- function(a, b, c, d) {
  list(
    equilibrium = function() market_welfare(a, b, c, d),
    
    ceiling = function(p_ceil) {
      price_ceiling_analysis(a, b, c, d, p_ceil)
    },
    
    floor = function(p_floor) {
      price_floor_analysis(a, b, c, d, p_floor)
    },
    
    plot = function() plot_welfare(a, b, c, d),
    
    plot_ceiling = function(p_ceil) {
      plot_ceiling(a, b, c, d, p_ceil)
    }
  )
}

# Usage
market <- welfare_toolkit(a = 10, b = 1, c = 2, d = 1)
market$equilibrium()
market$ceiling(4)
market$plot()
```

---

## 12. Python Code for CV vs EV (from lecture)

```r
# R translation of the Python code from lectures

cv_ev_diagram_python_style <- function(M = 100, P1_0 = 10, P1_1 = 5, P2_0 = 5) {
  # For U = x1 * x2, optimal bundles are:
  x1_0 <- M / (2 * P1_0)
  x2_0 <- M / (2 * P2_0)
  x1_1 <- M / (2 * P1_1)
  x2_1 <- M / (2 * P2_0)
  
  # Utility levels
  u0 <- x1_0 * x2_0
  u1 <- x1_1 * x2_1
  
  cat("Initial bundle: (", x1_0, ",", x2_0, "), U =", u0, "\n")
  cat("New bundle: (", x1_1, ",", x2_1, "), U =", u1, "\n")
  
  # Plot
  x1_vals <- seq(0.5, 25, length = 400)
  
  # Indifference curves
  x2_u0 <- u0 / x1_vals
  x2_u1 <- u1 / x1_vals
  
  # Budget lines
  x2_bl0 <- (M - P1_0 * x1_vals) / P2_0
  x2_bl1 <- (M - P1_1 * x1_vals) / P2_0
  
  plot(x1_vals, x2_u0, type = 'l', col = 'blue', lwd = 2,
       xlim = c(0, 25), ylim = c(0, 25),
       xlab = 'Good 1 (X1)', ylab = 'Good 2 (X2)',
       main = 'CV vs EV Diagram')
  lines(x1_vals, x2_u1, col = 'red', lwd = 2)
  lines(x1_vals, pmax(0, x2_bl0), col = 'blue', lty = 2)
  lines(x1_vals, pmax(0, x2_bl1), col = 'red', lty = 2)
  
  points(x1_0, x2_0, pch = 19, cex = 1.5, col = 'blue')
  points(x1_1, x2_1, pch = 19, cex = 1.5, col = 'red')
  
  legend('topright',
         c(paste('U =', u0, '(Initial)'),
           paste('U =', u1, '(New)'),
           paste('Budget (P1 =', P1_0, ')'),
           paste('Budget (P1 =', P1_1, ')')),
         col = c('blue', 'red', 'blue', 'red'),
         lwd = 2, lty = c(1, 1, 2, 2))
  grid()
  
  # Calculate CV and EV
  # For U = x1*x2, expenditure function e = 2*sqrt(u*p1*p2)
  e_fn <- function(p1, p2, u) 2 * sqrt(u * p1 * p2)
  
  CV <- e_fn(P1_1, P2_0, u0) - M
  EV <- e_fn(P1_0, P2_0, u1) - M
  
  cat("\nCV =", round(CV, 2), "\n")
  cat("EV =", round(EV, 2), "\n")
  
  return(list(CV = CV, EV = EV))
}

cv_ev_diagram_python_style()
```
