# Week 10: R Code Snippets — International Trade and Policy

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## 1. Comparative Advantage Calculator

```r
# Calculate opportunity costs and determine comparative advantage

comparative_advantage <- function(country1, country2, 
                                   goods = c("Good1", "Good2"),
                                   labor1, labor2) {
  # labor1, labor2: vectors of labor hours per unit for each country
  # labor1 = c(good1_hours, good2_hours) for country 1
  
  # Opportunity costs
  # OC of good 1 = labor_good1 / labor_good2 (in terms of good 2)
  OC1_c1 <- labor1[1] / labor1[2]  # Country 1's OC of good 1
  OC1_c2 <- labor2[1] / labor2[2]  # Country 2's OC of good 1
  
  OC2_c1 <- labor1[2] / labor1[1]  # Country 1's OC of good 2
  OC2_c2 <- labor2[2] / labor2[1]  # Country 2's OC of good 2
  
  cat("=== Comparative Advantage Analysis ===\n\n")
  cat("Opportunity Costs:\n")
  cat(country1, "- OC of", goods[1], "=", round(OC1_c1, 3), goods[2], "\n")
  cat(country2, "- OC of", goods[1], "=", round(OC1_c2, 3), goods[2], "\n")
  cat(country1, "- OC of", goods[2], "=", round(OC2_c1, 3), goods[1], "\n")
  cat(country2, "- OC of", goods[2], "=", round(OC2_c2, 3), goods[1], "\n\n")
  
  # Comparative advantage
  CA_good1 <- ifelse(OC1_c1 < OC1_c2, country1, country2)
  CA_good2 <- ifelse(OC2_c1 < OC2_c2, country1, country2)
  
  cat("Comparative Advantage:\n")
  cat(goods[1], ":", CA_good1, "\n")
  cat(goods[2], ":", CA_good2, "\n\n")
  
  # Terms of trade range
  ToT_min <- min(OC1_c1, OC1_c2)
  ToT_max <- max(OC1_c1, OC1_c2)
  
  cat("Mutually Beneficial ToT for", goods[1], ":\n")
  cat("  Between", round(ToT_min, 3), "and", round(ToT_max, 3), goods[2], "per", goods[1], "\n")
  
  return(list(OC = data.frame(
    Country = c(country1, country2),
    OC_Good1 = c(OC1_c1, OC1_c2),
    OC_Good2 = c(OC2_c1, OC2_c2)
  ), CA = c(CA_good1, CA_good2)))
}

# Example: Australia vs US
comparative_advantage("Australia", "US", 
                      goods = c("Wheat", "Cars"),
                      labor1 = c(20, 40),   # Australia
                      labor2 = c(6, 24))    # US
```

---

## 2. Autarky vs Free Trade Analysis

```r
# Compare autarky equilibrium with free trade

trade_equilibrium <- function(a, b, c, d, p_w) {
  # Demand: Q = a - b*p
  # Supply: Q = c + d*p
  # World price: p_w
  
  # Autarky equilibrium
  p_A <- (a - c) / (b + d)
  Q_A <- a - b * p_A
  
  # Free trade quantities
  Q_D_trade <- a - b * p_w
  Q_S_trade <- c + d * p_w
  M <- Q_D_trade - Q_S_trade  # Imports (negative = exports)
  
  cat("=== Trade Equilibrium Analysis ===\n\n")
  cat("Autarky:\n")
  cat("  Price: p_A =", round(p_A, 2), "\n")
  cat("  Quantity: Q_A =", round(Q_A, 2), "\n\n")
  
  cat("World price: p_w =", p_w, "\n\n")
  
  if (p_w < p_A) {
    cat("Trade direction: IMPORT (p_w < p_A)\n")
  } else if (p_w > p_A) {
    cat("Trade direction: EXPORT (p_w > p_A)\n")
  } else {
    cat("No trade (p_w = p_A)\n")
  }
  
  cat("\nFree Trade:\n")
  cat("  Domestic demand: Q_D =", round(Q_D_trade, 2), "\n")
  cat("  Domestic supply: Q_S =", round(Q_S_trade, 2), "\n")
  cat("  Net trade:", round(abs(M), 2), 
      ifelse(M > 0, "(imports)", "(exports)"), "\n")
  
  return(list(p_autarky = p_A, Q_autarky = Q_A,
              Q_D = Q_D_trade, Q_S = Q_S_trade, 
              trade = M))
}

# Example
eq <- trade_equilibrium(a = 120, b = 2, c = -30, d = 3, p_w = 24)
```

---

## 3. Welfare Comparison: Autarky vs Free Trade

```r
# Calculate welfare gains from trade

trade_welfare <- function(a, b, c, d, p_w) {
  eq <- trade_equilibrium(a, b, c, d, p_w)
  
  P_d_int <- a / b      # Demand price intercept
  P_s_int <- -c / d     # Supply price intercept
  
  # Autarky welfare
  CS_A <- 0.5 * (P_d_int - eq$p_autarky) * eq$Q_autarky
  PS_A <- 0.5 * (eq$p_autarky - P_s_int) * eq$Q_autarky
  W_A <- CS_A + PS_A
  
  # Free trade welfare
  CS_T <- 0.5 * (P_d_int - p_w) * eq$Q_D
  PS_T <- 0.5 * (p_w - P_s_int) * eq$Q_S
  W_T <- CS_T + PS_T
  
  cat("\n=== Welfare Analysis ===\n\n")
  cat("Autarky:\n")
  cat("  CS =", round(CS_A, 2), "\n")
  cat("  PS =", round(PS_A, 2), "\n")
  cat("  Total =", round(W_A, 2), "\n\n")
  
  cat("Free Trade:\n")
  cat("  CS =", round(CS_T, 2), "(Δ =", round(CS_T - CS_A, 2), ")\n")
  cat("  PS =", round(PS_T, 2), "(Δ =", round(PS_T - PS_A, 2), ")\n")
  cat("  Total =", round(W_T, 2), "\n\n")
  
  cat("Gains from Trade =", round(W_T - W_A, 2), "\n")
  
  return(list(autarky = list(CS = CS_A, PS = PS_A, W = W_A),
              free_trade = list(CS = CS_T, PS = PS_T, W = W_T),
              gains = W_T - W_A))
}

welfare <- trade_welfare(a = 120, b = 2, c = -30, d = 3, p_w = 24)
```

---

## 4. Tariff Analysis (Small Country)

```r
# Analyze effects of import tariff

tariff_analysis <- function(a, b, c, d, p_w, t) {
  # Free trade baseline
  Q_D_free <- a - b * p_w
  Q_S_free <- c + d * p_w
  M_free <- Q_D_free - Q_S_free
  
  # With tariff
  p_t <- p_w + t  # Domestic price
  Q_D_t <- a - b * p_t
  Q_S_t <- c + d * p_t
  M_t <- max(0, Q_D_t - Q_S_t)
  
  # Welfare calculations
  P_d_int <- a / b
  P_s_int <- -c / d
  
  CS_free <- 0.5 * (P_d_int - p_w) * Q_D_free
  CS_tariff <- 0.5 * (P_d_int - p_t) * Q_D_t
  
  PS_free <- 0.5 * (p_w - P_s_int) * Q_S_free
  PS_tariff <- 0.5 * (p_t - P_s_int) * Q_S_t
  
  revenue <- t * M_t
  
  delta_CS <- CS_tariff - CS_free
  delta_PS <- PS_tariff - PS_free
  delta_W <- delta_CS + delta_PS + revenue
  DWL <- -delta_W
  
  cat("=== Tariff Analysis (t =", t, ") ===\n\n")
  cat("Prices:\n")
  cat("  World price: p_w =", p_w, "\n")
  cat("  Domestic price: p_t =", p_t, "\n\n")
  
  cat("Quantities:\n")
  cat("  Free trade imports:", round(M_free, 2), "\n")
  cat("  Tariff imports:", round(M_t, 2), "\n")
  cat("  Import reduction:", round(M_free - M_t, 2), "\n\n")
  
  cat("Welfare Effects:\n")
  cat("  ΔCS =", round(delta_CS, 2), "\n")
  cat("  ΔPS =", round(delta_PS, 2), "\n")
  cat("  Revenue =", round(revenue, 2), "\n")
  cat("  Net ΔW =", round(delta_W, 2), "\n")
  cat("  DWL =", round(DWL, 2), "\n")
  
  return(list(p_domestic = p_t, imports = M_t,
              delta_CS = delta_CS, delta_PS = delta_PS,
              revenue = revenue, DWL = DWL))
}

tariff <- tariff_analysis(a = 120, b = 2, c = -30, d = 3, p_w = 24, t = 6)
```

---

## 5. Visualize Tariff Effects

```r
plot_tariff <- function(a, b, c, d, p_w, t) {
  p_t <- p_w + t
  p_A <- (a - c) / (b + d)
  
  # Price range
  p_max <- max(a/b, p_A) * 1.1
  Q_max <- a * 1.1
  
  # Create Q range and inverse curves
  Q_range <- seq(0, Q_max, length = 200)
  P_d <- (a - Q_range) / b
  P_s <- (Q_range - c) / d
  P_s[P_s < 0] <- NA
  
  # Quantities
  Q_D_free <- a - b * p_w
  Q_S_free <- c + d * p_w
  Q_D_t <- a - b * p_t
  Q_S_t <- c + d * p_t
  
  # Plot
  plot(Q_range, P_d, type = 'l', col = 'blue', lwd = 2,
       xlim = c(0, Q_max), ylim = c(0, p_max),
       xlab = 'Quantity', ylab = 'Price',
       main = paste('Tariff Analysis (t =', t, ')'))
  lines(Q_range, P_s, col = 'red', lwd = 2)
  
  # World price and tariff price
  abline(h = p_w, col = 'darkgreen', lwd = 2)
  abline(h = p_t, col = 'orange', lwd = 2, lty = 2)
  
  # Shade DWL triangles
  # Production distortion
  polygon(c(Q_S_free, Q_S_t, Q_S_t, Q_S_free),
          c(p_w, p_w, p_t, p_t),
          col = rgb(1, 1, 0, 0.3), border = NA)
  
  # Consumption distortion
  polygon(c(Q_D_t, Q_D_free, Q_D_free, Q_D_t),
          c(p_t, p_t, p_w, p_w),
          col = rgb(1, 1, 0, 0.3), border = NA)
  
  # Mark quantities
  points(c(Q_S_free, Q_S_t, Q_D_t, Q_D_free), 
         c(p_w, p_t, p_t, p_w), pch = 19)
  
  legend('topright', 
         c('Demand', 'Supply', 'World price', 'Domestic (tariff)', 'DWL'),
         col = c('blue', 'red', 'darkgreen', 'orange', rgb(1,1,0,0.5)),
         lwd = c(2, 2, 2, 2, NA), lty = c(1, 1, 1, 2, NA),
         pch = c(NA, NA, NA, NA, 15))
  grid()
}

plot_tariff(a = 120, b = 2, c = -30, d = 3, p_w = 24, t = 6)
```

---

## 6. Import Quota Analysis

```r
quota_analysis <- function(a, b, c, d, p_w, M_bar) {
  # Free trade baseline
  Q_D_free <- a - b * p_w
  Q_S_free <- c + d * p_w
  M_free <- Q_D_free - Q_S_free
  
  # With quota: find domestic price where D - S = M_bar
  # (a - b*p) - (c + d*p) = M_bar
  # a - c - (b + d)*p = M_bar
  p_q <- (a - c - M_bar) / (b + d)
  
  Q_D_q <- a - b * p_q
  Q_S_q <- c + d * p_q
  
  # Quota rent
  quota_rent <- (p_q - p_w) * M_bar
  
  # Welfare
  P_d_int <- a / b
  P_s_int <- -c / d
  
  CS_free <- 0.5 * (P_d_int - p_w) * Q_D_free
  CS_quota <- 0.5 * (P_d_int - p_q) * Q_D_q
  
  PS_free <- 0.5 * (p_w - P_s_int) * Q_S_free
  PS_quota <- 0.5 * (p_q - P_s_int) * Q_S_q
  
  delta_CS <- CS_quota - CS_free
  delta_PS <- PS_quota - PS_free
  
  # Equivalent tariff
  t_equiv <- p_q - p_w
  
  cat("=== Quota Analysis (M̄ =", M_bar, ") ===\n\n")
  cat("Free trade imports:", round(M_free, 2), "\n")
  cat("Quota:", M_bar, "\n\n")
  
  cat("Domestic price: p_q =", round(p_q, 2), "\n")
  cat("Price increase:", round(p_q - p_w, 2), "\n")
  cat("Equivalent tariff:", round(t_equiv, 2), "\n\n")
  
  cat("Welfare Effects:\n")
  cat("  ΔCS =", round(delta_CS, 2), "\n")
  cat("  ΔPS =", round(delta_PS, 2), "\n")
  cat("  Quota rent =", round(quota_rent, 2), "\n\n")
  
  cat("Total welfare loss depends on who gets rent:\n")
  cat("  If auctioned (govt): DWL =", round(-(delta_CS + delta_PS + quota_rent), 2), "\n")
  cat("  If domestic importers: DWL =", round(-(delta_CS + delta_PS + quota_rent), 2), "\n")
  cat("  If foreign (VER): DWL =", round(-(delta_CS + delta_PS), 2), "\n")
  
  return(list(p_quota = p_q, quota_rent = quota_rent, t_equiv = t_equiv))
}

quota <- quota_analysis(a = 120, b = 2, c = -30, d = 3, p_w = 24, M_bar = 12)
```

---

## 7. Large Country Tariff Analysis

```r
large_country_tariff <- function(a, b, c, d, 
                                  X_intercept, X_slope,  # Foreign export supply
                                  t) {
  # Domestic: D = a - bp, S = c + dp
  # Foreign export supply: X* = X_slope * p_w - X_intercept
  
  # Free trade equilibrium
  # Imports = D - S = (a-c) - (b+d)p
  # X* = X_slope * p - X_intercept
  # (a-c) - (b+d)p = X_slope * p - X_intercept
  # (a - c + X_intercept) = (b + d + X_slope) * p
  
  p_free <- (a - c + X_intercept) / (b + d + X_slope)
  M_free <- (a - c) - (b + d) * p_free
  
  # With tariff: p_d = p_w + t
  # Imports at domestic price: (a-c) - (b+d)*(p_w + t)
  # Foreign supply at world price: X_slope * p_w - X_intercept
  # (a-c) - (b+d)*(p_w + t) = X_slope * p_w - X_intercept
  # (a-c+X_intercept) - (b+d)*t = (b+d+X_slope) * p_w
  
  p_w_new <- (a - c + X_intercept - (b + d) * t) / (b + d + X_slope)
  p_d_new <- p_w_new + t
  M_new <- (a - c) - (b + d) * p_d_new
  
  # Incidence
  consumer_burden <- p_d_new - p_free
  foreign_burden <- p_free - p_w_new
  
  # ToT gain
  ToT_gain <- (p_free - p_w_new) * M_new
  
  cat("=== Large Country Tariff Analysis (t =", t, ") ===\n\n")
  cat("Free Trade:\n")
  cat("  Price:", round(p_free, 2), "\n")
  cat("  Imports:", round(M_free, 2), "\n\n")
  
  cat("With Tariff:\n")
  cat("  World price: p_w =", round(p_w_new, 2), "(↓", round(p_free - p_w_new, 2), ")\n")
  cat("  Domestic price: p_d =", round(p_d_new, 2), "(↑", round(p_d_new - p_free, 2), ")\n")
  cat("  Imports:", round(M_new, 2), "\n\n")
  
  cat("Tariff Incidence:\n")
  cat("  Consumers pay:", round(consumer_burden, 2), "(", round(100*consumer_burden/t, 1), "%)\n")
  cat("  Foreigners absorb:", round(foreign_burden, 2), "(", round(100*foreign_burden/t, 1), "%)\n\n")
  
  cat("Terms of Trade gain:", round(ToT_gain, 2), "\n")
  
  return(list(p_free = p_free, p_w_new = p_w_new, p_d_new = p_d_new,
              ToT_gain = ToT_gain))
}

large <- large_country_tariff(a = 200, b = 4, c = -40, d = 2,
                               X_intercept = 80, X_slope = 4,
                               t = 10)
```

---

## 8. Optimal Tariff Calculation

```r
optimal_tariff <- function(X_intercept, X_slope, p_free, X_free) {
  # Foreign export supply elasticity at free trade
  # ε = (dX*/dp) * (p/X*)
  
  epsilon <- X_slope * (p_free / X_free)
  
  # Optimal tariff formula
  t_star <- 1 / (epsilon - 1)
  
  cat("=== Optimal Tariff ===\n\n")
  cat("Foreign export supply elasticity: ε =", round(epsilon, 3), "\n")
  cat("Optimal tariff (ad valorem): t* =", round(t_star, 3), "\n")
  cat("Optimal tariff (specific): t* =", round(t_star * p_free, 2), "\n\n")
  
  if (epsilon <= 1) {
    cat("Warning: ε ≤ 1 means infinite optimal tariff (monopsony power)\n")
  }
  
  return(list(elasticity = epsilon, t_star = t_star))
}

# Using values from large country example
opt <- optimal_tariff(X_intercept = 80, X_slope = 4, p_free = 32, X_free = 48)
```

---

## 9. Excess Demand/Supply Functions

```r
# Derive and plot excess demand function

excess_demand <- function(a, b, c, d) {
  # ED(p) = D(p) - S(p) = (a - bp) - (c + dp) = (a - c) - (b + d)p
  
  p_A <- (a - c) / (b + d)  # Autarky price (where ED = 0)
  
  ED <- function(p) (a - c) - (b + d) * p
  
  # Plot
  p_range <- seq(0, p_A * 1.5, length = 200)
  ED_vals <- sapply(p_range, ED)
  
  plot(ED_vals, p_range, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Excess Demand (ED)', ylab = 'Price',
       main = 'Excess Demand Function')
  abline(v = 0, lty = 2)
  abline(h = p_A, lty = 2, col = 'red')
  
  # Shade regions
  polygon(c(ED_vals[ED_vals > 0], 0), 
          c(p_range[ED_vals > 0], p_A),
          col = rgb(0, 0, 1, 0.2), border = NA)
  polygon(c(ED_vals[ED_vals < 0], 0), 
          c(p_range[ED_vals < 0], p_A),
          col = rgb(1, 0, 0, 0.2), border = NA)
  
  text(max(ED_vals)/2, p_A/2, "Import region\n(ED > 0)", col = 'blue')
  text(min(ED_vals)/2, p_A * 1.25, "Export region\n(ED < 0)", col = 'red')
  points(0, p_A, pch = 19, cex = 1.5)
  text(0, p_A, paste("p_A =", round(p_A, 2)), pos = 4)
  
  grid()
  
  return(list(ED = ED, p_autarky = p_A))
}

ed <- excess_demand(a = 120, b = 2, c = -30, d = 3)
```

---

## 10. Complete Trade Policy Toolkit

```r
trade_toolkit <- function(a, b, c, d) {
  list(
    # Autarky equilibrium
    autarky = function() {
      p_A <- (a - c) / (b + d)
      Q_A <- a - b * p_A
      list(price = p_A, quantity = Q_A)
    },
    
    # Free trade analysis
    free_trade = function(p_w) {
      trade_equilibrium(a, b, c, d, p_w)
    },
    
    # Welfare comparison
    welfare = function(p_w) {
      trade_welfare(a, b, c, d, p_w)
    },
    
    # Tariff analysis
    tariff = function(p_w, t) {
      tariff_analysis(a, b, c, d, p_w, t)
    },
    
    # Quota analysis
    quota = function(p_w, M_bar) {
      quota_analysis(a, b, c, d, p_w, M_bar)
    },
    
    # Plot tariff effects
    plot_tariff = function(p_w, t) {
      plot_tariff(a, b, c, d, p_w, t)
    },
    
    # Excess demand
    excess_demand = function() {
      excess_demand(a, b, c, d)
    }
  )
}

# Usage
mkt <- trade_toolkit(a = 120, b = 2, c = -30, d = 3)
mkt$autarky()
mkt$free_trade(24)
mkt$tariff(24, 6)
```

---

## 11. Policy Comparison

```r
compare_policies <- function(a, b, c, d, p_w, target_import_reduction) {
  # Free trade baseline
  Q_D_free <- a - b * p_w
  Q_S_free <- c + d * p_w
  M_free <- Q_D_free - Q_S_free
  
  # Target imports
  M_target <- M_free * (1 - target_import_reduction)
  
  # Tariff to achieve target
  # M = (a-c) - (b+d)*(p_w + t) = M_target
  # t = ((a-c) - M_target - (b+d)*p_w) / (b+d)
  # Simplify: t = (M_free - M_target) / (b + d)
  t_equiv <- (M_free - M_target) / (b + d)
  
  # Quota
  M_bar <- M_target
  
  cat("=== Policy Comparison ===\n")
  cat("Target: Reduce imports by", target_import_reduction * 100, "%\n")
  cat("Free trade imports:", round(M_free, 2), "\n")
  cat("Target imports:", round(M_target, 2), "\n\n")
  
  cat("Equivalent Policies:\n")
  cat("  Tariff: t =", round(t_equiv, 2), "\n")
  cat("  Quota: M̄ =", round(M_bar, 2), "\n\n")
  
  # Compare welfare effects
  tariff_result <- tariff_analysis(a, b, c, d, p_w, t_equiv)
  quota_result <- quota_analysis(a, b, c, d, p_w, M_bar)
  
  return(list(tariff = t_equiv, quota = M_bar))
}

compare_policies(a = 120, b = 2, c = -30, d = 3, p_w = 24, target_import_reduction = 0.5)
```

---

## 12. Agricultural Trade Application

```r
# Australian wheat export market analysis

aus_wheat_market <- function() {
  # Domestic demand: Q_D = 15 - 0.5p (million tonnes)
  # Domestic supply: Q_S = 2p - 5
  # Export demand: Q_X = 25 - p
  
  a <- 15; b <- 0.5  # Demand
  c <- -5; d <- 2    # Supply
  X_a <- 25; X_b <- 1  # Export demand
  
  # Autarky
  p_A <- (a - c) / (b + d)
  Q_A <- a - b * p_A
  
  # With trade: S - D = Export demand
  # (2p - 5) - (15 - 0.5p) = 25 - p
  # 2.5p - 20 = 25 - p
  # 3.5p = 45
  p_trade <- 45 / 3.5
  
  Q_D <- a - b * p_trade
  Q_S <- c + d * p_trade
  exports <- Q_S - Q_D
  
  cat("=== Australian Wheat Market ===\n\n")
  cat("Autarky:\n")
  cat("  Price: $", round(p_A, 2), "/tonne\n")
  cat("  Quantity:", round(Q_A, 2), "million tonnes\n\n")
  
  cat("With Trade:\n")
  cat("  Price: $", round(p_trade, 2), "/tonne\n")
  cat("  Domestic demand:", round(Q_D, 2), "million tonnes\n")
  cat("  Domestic supply:", round(Q_S, 2), "million tonnes\n")
  cat("  Exports:", round(exports, 2), "million tonnes\n")
  
  return(list(p_autarky = p_A, p_trade = p_trade, exports = exports))
}

aus_wheat_market()
```
