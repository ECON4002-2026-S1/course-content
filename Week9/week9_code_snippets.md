# Week 9: R Code Snippets — Market Equilibrium

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## 1. Market Equilibrium Solver

```r
# Find market equilibrium for linear supply and demand
# Demand: Q = a - b*p
# Supply: Q = c + d*p (where c may be negative for positive intercept)

market_equilibrium <- function(a, b, c, d) {
  # Equilibrium: a - b*p = c + d*p
  # (a - c) = (b + d)*p
  p_star <- (a - c) / (b + d)
  Q_star <- a - b * p_star
  
  cat("=== Market Equilibrium ===\n")
  cat("Demand: Q =", a, "-", b, "p\n")
  cat("Supply: Q =", c, "+", d, "p\n\n")
  cat("Equilibrium price: p* =", round(p_star, 3), "\n")
  cat("Equilibrium quantity: Q* =", round(Q_star, 3), "\n")
  
  return(list(price = p_star, quantity = Q_star))
}

# Example: Australian wheat market
eq <- market_equilibrium(a = 100, b = 2, c = -20, d = 3)
```

---

## 2. Graphical Market Equilibrium

```r
# Plot supply and demand with equilibrium point

plot_equilibrium <- function(a, b, c, d) {
  eq <- market_equilibrium(a, b, c, d)
  
  # Price range
  p_max <- max(a/b, -c/d) * 1.1
  p_range <- seq(0, p_max, length = 200)
  
  # Quantities
  Q_demand <- pmax(0, a - b * p_range)
  Q_supply <- pmax(0, c + d * p_range)
  
  Q_max <- max(Q_demand, Q_supply)
  
  # Plot (Q on x-axis, P on y-axis - standard economics convention)
  plot(Q_demand, p_range, type = 'l', col = 'blue', lwd = 2,
       xlim = c(0, Q_max * 1.1), ylim = c(0, p_max),
       xlab = 'Quantity', ylab = 'Price',
       main = 'Market Equilibrium')
  lines(Q_supply, p_range, col = 'red', lwd = 2)
  
  # Equilibrium point
  points(eq$quantity, eq$price, pch = 19, cex = 2, col = 'green')
  
  # Reference lines
  abline(h = eq$price, lty = 2, col = 'gray')
  abline(v = eq$quantity, lty = 2, col = 'gray')
  
  legend('topright', c('Demand', 'Supply', 'Equilibrium'),
         col = c('blue', 'red', 'green'), lwd = c(2, 2, NA), pch = c(NA, NA, 19))
  grid()
}

plot_equilibrium(a = 100, b = 2, c = -20, d = 3)
```

---

## 3. Consumer and Producer Surplus

```r
# Calculate CS and PS for linear supply/demand

calc_surplus <- function(a, b, c, d) {
  eq <- market_equilibrium(a, b, c, d)
  
  # Intercepts
  P_demand_intercept <- a / b     # Price where Q_d = 0
  P_supply_intercept <- -c / d    # Price where Q_s = 0 (assuming c < 0)
  
  # Consumer Surplus: triangle below demand, above p*
  CS <- 0.5 * (P_demand_intercept - eq$price) * eq$quantity
  
  # Producer Surplus: triangle above supply, below p*
  PS <- 0.5 * (eq$price - P_supply_intercept) * eq$quantity
  
  # Total Welfare
  W <- CS + PS
  
  cat("\n=== Welfare Analysis ===\n")
  cat("Consumer Surplus: CS =", round(CS, 2), "\n")
  cat("Producer Surplus: PS =", round(PS, 2), "\n")
  cat("Total Welfare: W =", round(W, 2), "\n")
  
  return(list(CS = CS, PS = PS, W = W))
}

surplus <- calc_surplus(a = 100, b = 2, c = -20, d = 3)
```

---

## 4. Visualize Surplus Areas

```r
# Plot equilibrium with shaded surplus areas

plot_surplus <- function(a, b, c, d) {
  eq <- market_equilibrium(a, b, c, d)
  
  P_d_int <- a / b
  P_s_int <- max(0, -c / d)
  
  p_max <- P_d_int * 1.1
  Q_max <- eq$quantity * 1.3
  
  # Create Q range
  Q_range <- seq(0, Q_max, length = 200)
  
  # Inverse demand and supply
  P_d <- a/b - Q_range/b
  P_s <- P_s_int + Q_range/d
  
  # Plot
  plot(NULL, xlim = c(0, Q_max), ylim = c(0, p_max),
       xlab = 'Quantity', ylab = 'Price',
       main = 'Consumer and Producer Surplus')
  
  # Shade CS (below demand, above p*)
  Q_cs <- seq(0, eq$quantity, length = 100)
  P_d_cs <- a/b - Q_cs/b
  polygon(c(Q_cs, rev(Q_cs)), 
          c(P_d_cs, rep(eq$price, length(Q_cs))),
          col = rgb(0, 0, 1, 0.3), border = NA)
  
  # Shade PS (above supply, below p*)
  Q_ps <- seq(0, eq$quantity, length = 100)
  P_s_ps <- P_s_int + Q_ps/d
  polygon(c(Q_ps, rev(Q_ps)),
          c(rep(eq$price, length(Q_ps)), rev(P_s_ps)),
          col = rgb(1, 0, 0, 0.3), border = NA)
  
  # Draw curves
  lines(Q_range, P_d, col = 'blue', lwd = 2)
  lines(Q_range, P_s, col = 'red', lwd = 2)
  
  # Equilibrium
  points(eq$quantity, eq$price, pch = 19, cex = 1.5)
  abline(h = eq$price, lty = 2, col = 'gray')
  
  legend('topright', c('Demand', 'Supply', 'CS', 'PS'),
         col = c('blue', 'red', rgb(0,0,1,0.3), rgb(1,0,0,0.3)),
         lwd = c(2, 2, NA, NA), pch = c(NA, NA, 15, 15))
  grid()
}

plot_surplus(a = 100, b = 2, c = -20, d = 3)
```

---

## 5. Per-Unit Tax Analysis

```r
# Analyze welfare effects of a per-unit tax

tax_analysis <- function(a, b, c, d, t) {
  # Original equilibrium
  orig <- market_equilibrium(a, b, c, d)
  orig_surplus <- calc_surplus(a, b, c, d)
  
  # With tax: supply effectively shifts up by t
  # Buyers see: Q = c + d*(p_b - t) = (c - d*t) + d*p_b
  # So new supply intercept is (c - d*t)
  
  p_buyer <- (a - (c - d*t)) / (b + d)  # = (a - c + d*t)/(b + d)
  p_seller <- p_buyer - t
  Q_tax <- a - b * p_buyer
  
  # Tax revenue
  revenue <- t * Q_tax
  
  # New surpluses
  P_d_int <- a / b
  P_s_int <- -c / d
  
  CS_new <- 0.5 * (P_d_int - p_buyer) * Q_tax
  PS_new <- 0.5 * (p_seller - P_s_int) * Q_tax
  
  # Deadweight loss
  DWL <- 0.5 * t * (orig$quantity - Q_tax)
  
  cat("\n=== Tax Analysis ===\n")
  cat("Tax per unit: t =", t, "\n\n")
  cat("Original: p* =", round(orig$price, 2), ", Q* =", round(orig$quantity, 2), "\n")
  cat("With tax: p_buyer =", round(p_buyer, 2), ", p_seller =", round(p_seller, 2), "\n")
  cat("         Q_tax =", round(Q_tax, 2), "\n\n")
  
  cat("Changes:\n")
  cat("  ΔCS =", round(CS_new - orig_surplus$CS, 2), "\n")
  cat("  ΔPS =", round(PS_new - orig_surplus$PS, 2), "\n")
  cat("  Tax Revenue =", round(revenue, 2), "\n")
  cat("  DWL =", round(DWL, 2), "\n")
  
  cat("\nVerification: ΔCS + ΔPS + T = DWL?\n")
  cat("  ", round(CS_new - orig_surplus$CS, 2), "+", 
      round(PS_new - orig_surplus$PS, 2), "+", round(revenue, 2),
      "=", round((CS_new - orig_surplus$CS) + (PS_new - orig_surplus$PS) + revenue, 2), "\n")
  
  return(list(p_buyer = p_buyer, p_seller = p_seller, Q = Q_tax,
              revenue = revenue, DWL = DWL,
              delta_CS = CS_new - orig_surplus$CS,
              delta_PS = PS_new - orig_surplus$PS))
}

tax_result <- tax_analysis(a = 100, b = 2, c = -20, d = 3, t = 10)
```

---

## 6. Visualize Tax Effects

```r
plot_tax <- function(a, b, c, d, t) {
  orig <- market_equilibrium(a, b, c, d)
  tax <- tax_analysis(a, b, c, d, t)
  
  P_d_int <- a / b
  P_s_int <- -c / d
  
  p_max <- P_d_int * 1.1
  Q_max <- orig$quantity * 1.3
  Q_range <- seq(0, Q_max, length = 200)
  
  # Inverse curves
  P_d <- P_d_int - Q_range/b
  P_s <- P_s_int + Q_range/d
  P_s_tax <- P_s_int + t + Q_range/d  # Shifted supply
  
  plot(NULL, xlim = c(0, Q_max), ylim = c(0, p_max),
       xlab = 'Quantity', ylab = 'Price',
       main = paste('Effect of Tax (t =', t, ')'))
  
  # DWL triangle
  Q_dwl <- c(tax$Q, orig$quantity, tax$Q)
  P_dwl <- c(tax$p_buyer, orig$price, tax$p_seller)
  polygon(Q_dwl, P_dwl, col = rgb(1, 1, 0, 0.5), border = NA)
  
  # Curves
  lines(Q_range, P_d, col = 'blue', lwd = 2)
  lines(Q_range, P_s, col = 'red', lwd = 2)
  lines(Q_range, P_s_tax, col = 'red', lwd = 2, lty = 2)
  
  # Tax wedge
  segments(tax$Q, tax$p_seller, tax$Q, tax$p_buyer, col = 'darkgreen', lwd = 3)
  
  # Points
  points(orig$quantity, orig$price, pch = 19, cex = 1.5)
  points(tax$Q, tax$p_buyer, pch = 17, cex = 1.5, col = 'blue')
  points(tax$Q, tax$p_seller, pch = 17, cex = 1.5, col = 'red')
  
  legend('topright', c('Demand', 'Supply', 'Supply + Tax', 'Tax Wedge', 'DWL'),
         col = c('blue', 'red', 'red', 'darkgreen', rgb(1,1,0,0.5)),
         lwd = c(2, 2, 2, 3, NA), lty = c(1, 1, 2, 1, NA), pch = c(NA, NA, NA, NA, 15))
  grid()
}

plot_tax(a = 100, b = 2, c = -20, d = 3, t = 10)
```

---

## 7. Subsidy Analysis

```r
# Analyze welfare effects of a per-unit subsidy

subsidy_analysis <- function(a, b, c, d, s) {
  orig <- market_equilibrium(a, b, c, d)
  orig_surplus <- calc_surplus(a, b, c, d)
  
  # With subsidy: sellers receive s more than buyers pay
  # p_seller = p_buyer + s
  # Supply: Q = c + d*(p_buyer + s)
  
  p_buyer <- (a - c - d*s) / (b + d)
  p_seller <- p_buyer + s
  Q_sub <- a - b * p_buyer
  
  # Subsidy cost
  cost <- s * Q_sub
  
  # New surpluses
  P_d_int <- a / b
  P_s_int <- -c / d
  
  CS_new <- 0.5 * (P_d_int - p_buyer) * Q_sub
  PS_new <- 0.5 * (p_seller - P_s_int) * Q_sub
  
  # Net welfare effect
  delta_W <- (CS_new - orig_surplus$CS) + (PS_new - orig_surplus$PS) - cost
  
  cat("\n=== Subsidy Analysis ===\n")
  cat("Subsidy per unit: s =", s, "\n\n")
  cat("Original: p* =", round(orig$price, 2), ", Q* =", round(orig$quantity, 2), "\n")
  cat("With subsidy: p_buyer =", round(p_buyer, 2), ", p_seller =", round(p_seller, 2), "\n")
  cat("              Q_sub =", round(Q_sub, 2), "\n\n")
  
  cat("Changes:\n")
  cat("  ΔCS =", round(CS_new - orig_surplus$CS, 2), "(gain)\n")
  cat("  ΔPS =", round(PS_new - orig_surplus$PS, 2), "(gain)\n")
  cat("  Government cost =", round(cost, 2), "\n")
  cat("  Net welfare change (DWL) =", round(delta_W, 2), "(loss)\n")
  
  return(list(p_buyer = p_buyer, p_seller = p_seller, Q = Q_sub,
              cost = cost, DWL = -delta_W))
}

sub_result <- subsidy_analysis(a = 100, b = 2, c = -20, d = 3, s = 5)
```

---

## 8. Long-Run Equilibrium with Entry/Exit

```r
# Find long-run equilibrium with free entry
# Given firm cost function and market demand

LR_equilibrium <- function(TC_fn, demand_fn, y_range = seq(0.01, 100, 0.01)) {
  # Find minimum AC
  AC <- function(y) TC_fn(y) / y
  AC_vals <- sapply(y_range, AC)
  
  min_idx <- which.min(AC_vals)
  y_efficient <- y_range[min_idx]
  p_LR <- AC_vals[min_idx]
  
  # Market quantity at LR price
  Q_LR <- demand_fn(p_LR)
  
  # Number of firms
  n_firms <- Q_LR / y_efficient
  
  # Verify zero profit
  profit <- p_LR * y_efficient - TC_fn(y_efficient)
  
  cat("=== Long-Run Equilibrium ===\n")
  cat("LR Price: p =", round(p_LR, 3), "\n")
  cat("Firm output: y* =", round(y_efficient, 3), "\n")
  cat("Market quantity: Q =", round(Q_LR, 3), "\n")
  cat("Number of firms: n =", round(n_firms, 1), "\n")
  cat("Firm profit: π =", round(profit, 6), "(≈ 0)\n")
  
  return(list(price = p_LR, firm_output = y_efficient, 
              market_Q = Q_LR, num_firms = n_firms))
}

# Example: C(y) = 1 + y^2, Q^d = 22 - 3p
TC <- function(y) 1 + y^2
demand <- function(p) max(0, 22 - 3*p)

lr <- LR_equilibrium(TC, demand)
```

---

## 9. Entry/Exit Dynamics Simulation

```r
simulate_entry_exit <- function(TC_fn, demand_fn, n_init, periods = 30) {
  # Get LR equilibrium for reference
  AC <- function(y) TC_fn(y) / y
  MC <- function(y) 2*y  # Assuming TC = 1 + y^2
  
  # Find min AC
  y_range <- seq(0.1, 10, 0.01)
  y_eff <- y_range[which.min(sapply(y_range, AC))]
  p_LR <- AC(y_eff)
  
  # Track history
  n <- n_init
  history <- data.frame(t = 0, n = n, price = NA, firm_output = NA, profit = NA)
  
  for (t in 1:periods) {
    # Find SR equilibrium: market supply = n * firm_supply
    # Firm supply from p = MC = 2y → y = p/2
    # Market supply: Q_s = n * p/2
    # Demand: Q_d = demand_fn(p)
    # Equilibrium: demand_fn(p) = n * p/2
    
    # Solve for p (assuming linear demand Q = a - b*p)
    # Let's use numerical approach
    excess <- function(p) demand_fn(p) - n * (p/2)
    p_eq <- tryCatch(
      uniroot(excess, c(0.1, 50))$root,
      error = function(e) p_LR
    )
    
    y_firm <- p_eq / 2
    profit <- p_eq * y_firm - TC_fn(y_firm)
    
    # Entry/exit rule (gradual adjustment)
    if (profit > 0.1) {
      n <- n + max(1, round(profit))
    } else if (profit < -0.1) {
      n <- max(1, n - max(1, round(abs(profit))))
    }
    
    history <- rbind(history, 
                     data.frame(t = t, n = n, price = p_eq, 
                                firm_output = y_firm, profit = profit))
  }
  
  # Plot
  par(mfrow = c(2, 2))
  
  plot(history$t, history$n, type = 'b', col = 'blue',
       xlab = 'Period', ylab = 'Number of Firms', main = 'Industry Size')
  abline(h = demand_fn(p_LR)/y_eff, lty = 2, col = 'red')
  
  plot(history$t[-1], history$price[-1], type = 'b', col = 'red',
       xlab = 'Period', ylab = 'Price', main = 'Market Price')
  abline(h = p_LR, lty = 2, col = 'blue')
  
  plot(history$t[-1], history$profit[-1], type = 'b', col = 'green',
       xlab = 'Period', ylab = 'Profit', main = 'Firm Profit')
  abline(h = 0, lty = 2)
  
  plot(history$t[-1], history$firm_output[-1], type = 'b', col = 'purple',
       xlab = 'Period', ylab = 'Output/Firm', main = 'Firm Output')
  abline(h = y_eff, lty = 2, col = 'blue')
  
  par(mfrow = c(1, 1))
  
  return(history)
}

# Simulate starting with 5 firms
history <- simulate_entry_exit(TC, demand, n_init = 5)
```

---

## 10. Demand Aggregation

```r
# Aggregate multiple individual demand curves

aggregate_demand <- function(demands, p_range = seq(0, 20, 0.1)) {
  # demands: list of functions, each takes p and returns Q
  
  Q_total <- numeric(length(p_range))
  
  for (p_idx in seq_along(p_range)) {
    p <- p_range[p_idx]
    Q_total[p_idx] <- sum(sapply(demands, function(d) max(0, d(p))))
  }
  
  # Plot
  plot(Q_total, p_range, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Quantity', ylab = 'Price',
       main = 'Aggregate Demand')
  
  # Add individual curves in lighter colors
  colors <- rainbow(length(demands), alpha = 0.5)
  for (i in seq_along(demands)) {
    Q_i <- sapply(p_range, function(p) max(0, demands[[i]](p)))
    lines(Q_i, p_range, col = colors[i], lwd = 1, lty = 2)
  }
  
  legend('topright', c('Aggregate', paste('Consumer', 1:length(demands))),
         col = c('blue', colors), lwd = c(2, rep(1, length(demands))),
         lty = c(1, rep(2, length(demands))))
  grid()
  
  return(data.frame(price = p_range, Q_aggregate = Q_total))
}

# Example: Three consumers
d1 <- function(p) 12 - 2*p
d2 <- function(p) 10 - p
d3 <- function(p) 8 - 0.5*p

agg <- aggregate_demand(list(d1, d2, d3))
```

---

## 11. Complete Market Analysis Function

```r
market_analysis <- function(a, b, c, d, tax = 0, subsidy = 0) {
  cat("╔══════════════════════════════════════════╗\n")
  cat("║         MARKET EQUILIBRIUM ANALYSIS       ║\n")
  cat("╚══════════════════════════════════════════╝\n\n")
  
  # Base equilibrium
  eq <- market_equilibrium(a, b, c, d)
  surplus <- calc_surplus(a, b, c, d)
  
  cat("\n")
  
  # Tax/subsidy analysis if applicable
  if (tax > 0) {
    cat("\n--- Tax Impact ---\n")
    tax_analysis(a, b, c, d, tax)
  }
  
  if (subsidy > 0) {
    cat("\n--- Subsidy Impact ---\n")
    subsidy_analysis(a, b, c, d, subsidy)
  }
  
  return(list(equilibrium = eq, surplus = surplus))
}

# Full analysis
result <- market_analysis(a = 100, b = 2, c = -20, d = 3, tax = 8)
```

---

## 12. Agricultural Application: Price Support

```r
# Analyze agricultural price support (price floor)

price_support <- function(a, b, c, d, p_floor) {
  eq <- market_equilibrium(a, b, c, d)
  
  cat("=== Price Support Analysis ===\n")
  cat("Free market: p* =", round(eq$price, 2), ", Q* =", round(eq$quantity, 2), "\n")
  cat("Price floor: p_floor =", p_floor, "\n\n")
  
  if (p_floor <= eq$price) {
    cat("Price floor is NOT BINDING (below equilibrium)\n")
    cat("Market remains at free equilibrium.\n")
    return(NULL)
  }
  
  # Quantities at floor price
  Q_d <- max(0, a - b * p_floor)
  Q_s <- max(0, c + d * p_floor)
  surplus <- Q_s - Q_d
  
  cat("At price floor:\n")
  cat("  Quantity demanded:", round(Q_d, 2), "\n")
  cat("  Quantity supplied:", round(Q_s, 2), "\n")
  cat("  Surplus (excess supply):", round(surplus, 2), "\n\n")
  
  # If government buys surplus
  gov_cost <- p_floor * surplus
  cat("If government purchases surplus:\n")
  cat("  Cost =", round(gov_cost, 2), "\n")
  
  # Welfare effects
  P_d_int <- a / b
  P_s_int <- -c / d
  
  # Original surplus
  CS_orig <- 0.5 * (P_d_int - eq$price) * eq$quantity
  PS_orig <- 0.5 * (eq$price - P_s_int) * eq$quantity
  
  # New surplus (consumers only get Q_d)
  CS_new <- 0.5 * (P_d_int - p_floor) * Q_d
  PS_new <- p_floor * Q_s - 0.5 * (Q_s) * Q_s / d - P_s_int * Q_s + 0.5 * P_s_int * Q_s
  # Simplified: PS includes revenue from both consumers and government
  PS_new_simple <- 0.5 * (p_floor - P_s_int) * Q_s + (p_floor - P_s_int) * (Q_s - 0)
  
  cat("\nWelfare changes (approximate):\n")
  cat("  ΔCS =", round(CS_new - CS_orig, 2), "(loss)\n")
  
  return(list(Q_d = Q_d, Q_s = Q_s, surplus = surplus, gov_cost = gov_cost))
}

# Example: Wheat price support
support <- price_support(a = 100, b = 2, c = -20, d = 3, p_floor = 30)
```
