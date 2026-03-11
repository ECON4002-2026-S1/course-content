# ============================================================================
# ECON4002: R CODE MODULES FOR AGRICULTURAL AND RESOURCE ECONOMICS
# Complete Computational Companion to the 12-Week Curriculum
# ============================================================================

# Required packages - run once at start of semester
# install.packages(c("nloptr", "lpSolve", "ggplot2", "dplyr", "rootSolve", 
#                    "Deriv", "plotly", "tidyr"))

# ============================================================================
# MODULE 1: R FOUNDATIONS (Week 1)
# ============================================================================

# --- 1.1 Basic Operations and Data Types ---

# Vectors
prices <- c(10, 15, 20, 25, 30)
quantities <- c(100, 80, 60, 40, 20)

# Element-wise operations
revenue <- prices * quantities
total_revenue <- sum(revenue)

# Sequences
p_seq <- seq(0, 50, by = 2)      # From 0 to 50, step 2
q_seq <- seq(0, 100, length = 50) # 50 evenly spaced points

# --- 1.2 Functions ---

# Demand function: Q = a - bP
demand <- function(p, a = 200, b = 4) {
  q <- a - b * p
  return(pmax(q, 0))  # Ensure non-negative
}

# Supply function: Q = c + dP
supply <- function(p, c = -20, d = 6) {
  q <- c + d * p
  return(pmax(q, 0))
}

# Inverse demand: P = (a - Q)/b
inv_demand <- function(q, a = 200, b = 4) {
  return((a - q) / b)
}

# --- 1.3 Basic Plotting ---

plot_market <- function() {
  p_range <- seq(0, 50, by = 1)
  
  plot(demand(p_range), p_range, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Quantity', ylab = 'Price', 
       main = 'Supply and Demand',
       xlim = c(0, 200), ylim = c(0, 50))
  lines(supply(p_range), p_range, col = 'red', lwd = 2)
  legend('topright', legend = c('Demand', 'Supply'), 
         col = c('blue', 'red'), lwd = 2)
  grid()
}

# --- 1.4 Finding Equilibrium Numerically ---

find_equilibrium <- function(demand_fn, supply_fn, p_range = c(0, 100)) {
  excess_demand <- function(p) demand_fn(p) - supply_fn(p)
  eq <- uniroot(excess_demand, interval = p_range)
  p_star <- eq$root
  q_star <- demand_fn(p_star)
  return(list(price = p_star, quantity = q_star))
}

eq <- find_equilibrium(demand, supply)
cat("Equilibrium: P =", round(eq$price, 2), ", Q =", round(eq$quantity, 2), "\n")


# ============================================================================
# MODULE 2: LINEAR ALGEBRA (Week 2)
# ============================================================================

# --- 2.1 Matrix Operations ---

# Create matrices
A <- matrix(c(1, 3, 4, 2, -1, 5, -2, 4, 1), nrow = 3, byrow = TRUE)
B <- matrix(c(2, 1, 0, -1, 3, 2, 4, 1, -2), nrow = 3, byrow = TRUE)

# Basic operations
A + B           # Addition
A - B           # Subtraction
3 * A           # Scalar multiplication
A %*% B         # Matrix multiplication (NOT A * B!)
t(A)            # Transpose

# Matrix properties
det(A)          # Determinant
solve(A)        # Inverse (only if det ≠ 0)
A %*% solve(A)  # Should give identity matrix

# --- 2.2 Solving Systems of Equations ---

# System: Ax = b
# Example: Supply-demand system
# Qd = 100 - 2P  →  Qd + 2P = 100
# Qs = -20 + 4P  →  Qs - 4P = -20
# At equilibrium: Qd = Qs = Q

# Rewrite as: [1, 2; 1, -4] * [Q; P] = [100; -20]
coef_matrix <- matrix(c(1, 2, 1, -4), nrow = 2, byrow = TRUE)
constants <- c(100, -20)

solution <- solve(coef_matrix, constants)
cat("Q* =", solution[1], ", P* =", solution[2], "\n")

# --- 2.3 Cramer's Rule ---

cramers_rule <- function(A, b) {
  n <- length(b)
  det_A <- det(A)
  if (abs(det_A) < 1e-10) stop("Matrix is singular")
  
  x <- numeric(n)
  for (i in 1:n) {
    A_i <- A
    A_i[, i] <- b
    x[i] <- det(A_i) / det_A
  }
  return(x)
}

# Verify with previous system
cramers_rule(coef_matrix, constants)

# --- 2.4 Eigenvalues for Stability Analysis ---

# Dynamic system stability
dynamic_matrix <- matrix(c(0.8, 0.2, 0.3, 0.6), nrow = 2, byrow = TRUE)
eigen_result <- eigen(dynamic_matrix)
cat("Eigenvalues:", eigen_result$values, "\n")
cat("System stable?:", all(abs(eigen_result$values) < 1), "\n")


# ============================================================================
# MODULE 3: CALCULUS AND ELASTICITY (Week 3)
# ============================================================================

# --- 3.1 Numerical Differentiation ---

# Central difference approximation
numerical_derivative <- function(f, x, h = 1e-6) {
  (f(x + h) - f(x - h)) / (2 * h)
}

# Example: derivative of demand w.r.t. price
dQ_dP <- numerical_derivative(demand, p = 20)
cat("dQ/dP at P=20:", dQ_dP, "\n")

# --- 3.2 Elasticity Calculations ---

# Point elasticity: ε = (dQ/dP) * (P/Q)
elasticity <- function(demand_fn, p) {
  q <- demand_fn(p)
  dq_dp <- numerical_derivative(demand_fn, p)
  return(dq_dp * p / q)
}

# Elasticity at various prices
prices_test <- c(10, 20, 30, 40)
for (p in prices_test) {
  e <- elasticity(demand, p)
  cat("At P =", p, ": ε =", round(e, 3), 
      ifelse(abs(e) > 1, "(elastic)", 
             ifelse(abs(e) < 1, "(inelastic)", "(unit elastic)")), "\n")
}

# --- 3.3 Partial Derivatives (Multivariate Functions) ---

# Cobb-Douglas production: Q = A * L^α * K^β
cobb_douglas <- function(L, K, A = 1, alpha = 0.3, beta = 0.7) {
  A * L^alpha * K^beta
}

# Marginal products
MPL <- function(L, K, alpha = 0.3) {
  h <- 1e-6
  (cobb_douglas(L + h, K) - cobb_douglas(L - h, K)) / (2 * h)
}

MPK <- function(L, K, beta = 0.7) {
  h <- 1e-6
  (cobb_douglas(L, K + h) - cobb_douglas(L, K - h)) / (2 * h)
}

# Verify analytical: MPL = α * Q/L
L_test <- 100; K_test <- 50
Q <- cobb_douglas(L_test, K_test)
cat("Numerical MPL:", round(MPL(L_test, K_test), 4), "\n")
cat("Analytical MPL:", round(0.3 * Q / L_test, 4), "\n")

# --- 3.4 Gradient and Hessian ---

# For f(x,y), gradient = [∂f/∂x, ∂f/∂y]
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

# Hessian matrix
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


# ============================================================================
# MODULE 4: OPTIMIZATION (Week 4)
# ============================================================================

# --- 4.1 Unconstrained Optimization ---

# Profit maximization: π = PQ - C(Q) = 50Q - (100 + 10Q + 0.5Q²)
profit <- function(Q) {
  50 * Q - (100 + 10 * Q + 0.5 * Q^2)
}

# For optim(), we minimize, so negate for maximization
neg_profit <- function(Q) -profit(Q)

# One-dimensional optimization
result_1d <- optimize(profit, interval = c(0, 100), maximum = TRUE)
cat("Optimal Q:", result_1d$maximum, ", Max Profit:", result_1d$objective, "\n")

# Verify FOC: dπ/dQ = 50 - 10 - Q = 0 → Q* = 40
# SOC: d²π/dQ² = -1 < 0 ✓ (maximum)

# --- 4.2 Multivariate Unconstrained ---

# Two-input profit: π(L,K) = p*f(L,K) - wL - rK
two_input_profit <- function(x) {
  L <- x[1]; K <- x[2]
  p <- 10; w <- 2; r <- 3
  Q <- L^0.4 * K^0.4  # Diminishing returns
  profit <- p * Q - w * L - r * K
  return(-profit)  # Negative for minimization
}

result_multi <- optim(par = c(10, 10), fn = two_input_profit, method = "BFGS")
cat("Optimal L:", result_multi$par[1], ", K:", result_multi$par[2], "\n")
cat("Max Profit:", -result_multi$value, "\n")

# Check SOC: Hessian should be negative definite at optimum
H <- hessian(function(x) -two_input_profit(x), result_multi$par)
eigen_H <- eigen(H)$values
cat("Hessian eigenvalues:", eigen_H, "\n")
cat("Negative definite (max)?:", all(eigen_H < 0), "\n")

# --- 4.3 Constrained Optimization: Lagrangian Method ---

# Utility maximization: max u(x1,x2) = x1^0.5 * x2^0.5
# Subject to: p1*x1 + p2*x2 = m

# Using nloptr package for constrained optimization
library(nloptr)

utility_max_constrained <- function() {
  # Parameters
  p1 <- 2; p2 <- 3; m <- 120
  
  # Objective (negative for maximization)
  eval_f <- function(x) {
    return(-x[1]^0.5 * x[2]^0.5)
  }
  
  # Gradient of objective
  eval_grad_f <- function(x) {
    return(c(-0.5 * x[1]^(-0.5) * x[2]^0.5,
             -0.5 * x[1]^0.5 * x[2]^(-0.5)))
  }
  
  # Equality constraint: p1*x1 + p2*x2 - m = 0
  eval_g_eq <- function(x) {
    return(p1 * x[1] + p2 * x[2] - m)
  }
  
  # Jacobian of constraint
  eval_jac_g_eq <- function(x) {
    return(c(p1, p2))
  }
  
  # Solve
  result <- nloptr(
    x0 = c(10, 10),
    eval_f = eval_f,
    eval_grad_f = eval_grad_f,
    eval_g_eq = eval_g_eq,
    eval_jac_g_eq = eval_jac_g_eq,
    opts = list(algorithm = "NLOPT_LD_SLSQP", xtol_rel = 1e-8)
  )
  
  # Analytical solution for comparison
  # For u = x1^α * x2^(1-α), demands are:
  # x1* = α*m/p1, x2* = (1-α)*m/p2
  alpha <- 0.5
  x1_analytical <- alpha * m / p1
  x2_analytical <- (1 - alpha) * m / p2
  
  cat("Numerical solution: x1 =", result$solution[1], ", x2 =", result$solution[2], "\n")
  cat("Analytical solution: x1 =", x1_analytical, ", x2 =", x2_analytical, "\n")
  cat("Max utility:", -result$objective, "\n")
  
  return(result)
}

utility_max_constrained()

# --- 4.4 Bordered Hessian Check ---

check_bordered_hessian <- function(f, g, x_star, lambda_star) {
  # f = objective, g = constraint (g(x) = 0)
  # For maximization with one constraint:
  # Bordered Hessian = | 0    g_x1   g_x2  |
  #                    | g_x1 L_x1x1 L_x1x2|
  #                    | g_x2 L_x1x2 L_x2x2|
  # Need det(H_B) > 0 for max with one constraint
  
  h <- 1e-6
  
  # Gradient of constraint
  g_grad <- gradient(g, x_star)
  
  # Lagrangian: L = f - λg
  L <- function(x) f(x) - lambda_star * g(x)
  
  # Hessian of Lagrangian
  H_L <- hessian(L, x_star)
  
  # Construct bordered Hessian
  n <- length(x_star)
  H_B <- matrix(0, n + 1, n + 1)
  H_B[1, 1] <- 0
  H_B[1, 2:(n+1)] <- g_grad
  H_B[2:(n+1), 1] <- g_grad
  H_B[2:(n+1), 2:(n+1)] <- H_L
  
  cat("Bordered Hessian:\n")
  print(round(H_B, 4))
  cat("Determinant:", det(H_B), "\n")
  cat("For max with 1 constraint: det > 0 required\n")
  
  return(H_B)
}


# ============================================================================
# MODULE 5: CONSUMER THEORY I - Marshallian Demand (Week 5)
# ============================================================================

# --- 5.1 Indifference Curves ---

plot_indifference_curves <- function(utility_fn, u_levels, alpha = 0.5, 
                                     xlim = c(0, 20), ylim = c(0, 20)) {
  plot(NULL, xlim = xlim, ylim = ylim, 
       xlab = expression(x[1]), ylab = expression(x[2]),
       main = "Indifference Map")
  
  x1_seq <- seq(0.1, xlim[2], length = 200)
  colors <- rainbow(length(u_levels))
  
  for (i in seq_along(u_levels)) {
    u <- u_levels[i]
    # For Cobb-Douglas u = x1^α * x2^(1-α)
    # x2 = (u / x1^α)^(1/(1-α))
    x2_seq <- (u / x1_seq^alpha)^(1/(1 - alpha))
    x2_seq[x2_seq > ylim[2]] <- NA
    lines(x1_seq, x2_seq, col = colors[i], lwd = 2)
  }
  
  legend("topright", legend = paste("u =", u_levels), 
         col = colors, lwd = 2, cex = 0.8)
  grid()
}

# Example: Plot indifference curves for u = 5, 10, 15
plot_indifference_curves(NULL, c(5, 10, 15), alpha = 0.5)

# --- 5.2 Budget Constraint ---

add_budget_line <- function(p1, p2, m, col = "black") {
  # m = p1*x1 + p2*x2  →  x2 = (m - p1*x1)/p2
  x1_max <- m / p1
  x2_max <- m / p2
  segments(0, x2_max, x1_max, 0, col = col, lwd = 2, lty = 2)
}

# --- 5.3 Marshallian Demand Derivation ---

# For Cobb-Douglas u = x1^α * x2^(1-α)
marshallian_demand_CD <- function(p1, p2, m, alpha = 0.5) {
  x1 <- alpha * m / p1
  x2 <- (1 - alpha) * m / p2
  return(c(x1 = x1, x2 = x2))
}

# For Leontief (perfect complements) u = min(ax1, bx2)
marshallian_demand_leontief <- function(p1, p2, m, a = 1, b = 1) {
  # At optimum: ax1 = bx2, so x2 = (a/b)*x1
  # Budget: p1*x1 + p2*(a/b)*x1 = m
  # x1 = m / (p1 + p2*a/b)
  x1 <- m / (p1 + p2 * a / b)
  x2 <- (a / b) * x1
  return(c(x1 = x1, x2 = x2))
}

# For linear (perfect substitutes) u = ax1 + bx2
marshallian_demand_linear <- function(p1, p2, m, a = 1, b = 1) {
  # Compare MRS = a/b with price ratio p1/p2
  MRS <- a / b
  price_ratio <- p1 / p2
  
  if (MRS > price_ratio) {
    # x1 is relatively more valuable, buy only x1
    x1 <- m / p1
    x2 <- 0
  } else if (MRS < price_ratio) {
    # x2 is relatively more valuable, buy only x2
    x1 <- 0
    x2 <- m / p2
  } else {
    # Indifferent, any combination on budget line
    x1 <- m / (2 * p1)  # Convention: split evenly
    x2 <- m / (2 * p2)
  }
  return(c(x1 = x1, x2 = x2))
}

# --- 5.4 Demand Curve Visualization ---

plot_demand_curve <- function(p2 = 3, m = 120, alpha = 0.5) {
  p1_range <- seq(1, 20, by = 0.5)
  x1_demand <- sapply(p1_range, function(p1) marshallian_demand_CD(p1, p2, m, alpha)[1])
  
  plot(x1_demand, p1_range, type = 'l', col = 'blue', lwd = 2,
       xlab = expression(x[1]), ylab = expression(p[1]),
       main = paste("Marshallian Demand (p2 =", p2, ", m =", m, ")"))
  grid()
}


# ============================================================================
# MODULE 6: CONSUMER THEORY II - Duality (Week 6)
# ============================================================================

# --- 6.1 Indirect Utility Function ---

# For Cobb-Douglas: v(p1, p2, m) = (α/p1)^α * ((1-α)/p2)^(1-α) * m
indirect_utility_CD <- function(p1, p2, m, alpha = 0.5) {
  (alpha / p1)^alpha * ((1 - alpha) / p2)^(1 - alpha) * m
}

# Verify: v(p, m) = u(x^m(p, m))
verify_indirect <- function(p1 = 2, p2 = 3, m = 120, alpha = 0.5) {
  # Method 1: Direct calculation
  v_direct <- indirect_utility_CD(p1, p2, m, alpha)
  
  # Method 2: Substitute demands into utility
  x <- marshallian_demand_CD(p1, p2, m, alpha)
  u_substituted <- x[1]^alpha * x[2]^(1 - alpha)
  
  cat("Direct v(p,m):", v_direct, "\n")
  cat("u(x^m(p,m)):", u_substituted, "\n")
}

verify_indirect()

# --- 6.2 Roy's Identity ---

# x^m_i = -∂v/∂p_i / ∂v/∂m
roys_identity <- function(v_fn, p1, p2, m, h = 1e-6) {
  # Numerical partial derivatives
  dv_dp1 <- (v_fn(p1 + h, p2, m) - v_fn(p1 - h, p2, m)) / (2 * h)
  dv_dp2 <- (v_fn(p1, p2 + h, m) - v_fn(p1, p2 - h, m)) / (2 * h)
  dv_dm <- (v_fn(p1, p2, m + h) - v_fn(p1, p2, m - h)) / (2 * h)
  
  x1 <- -dv_dp1 / dv_dm
  x2 <- -dv_dp2 / dv_dm
  
  return(c(x1 = x1, x2 = x2))
}

# Verify Roy's Identity
p1 <- 2; p2 <- 3; m <- 120
x_roy <- roys_identity(indirect_utility_CD, p1, p2, m)
x_marshallian <- marshallian_demand_CD(p1, p2, m)
cat("From Roy's Identity:", x_roy, "\n")
cat("Marshallian demand:", x_marshallian, "\n")

# --- 6.3 Expenditure Function ---

# For Cobb-Douglas: e(p1, p2, u) = u * (p1/α)^α * (p2/(1-α))^(1-α)
expenditure_CD <- function(p1, p2, u, alpha = 0.5) {
  u * (p1 / alpha)^alpha * (p2 / (1 - alpha))^(1 - alpha)
}

# --- 6.4 Hicksian Demand ---

# For Cobb-Douglas:
# x^h_1 = u * ((1-α)*p1 / (α*p2))^(-(1-α))
# x^h_2 = u * (α*p2 / ((1-α)*p1))^(-α)
hicksian_demand_CD <- function(p1, p2, u, alpha = 0.5) {
  x1 <- u * ((1 - alpha) * p1 / (alpha * p2))^(-(1 - alpha))
  x2 <- u * (alpha * p2 / ((1 - alpha) * p1))^(-alpha)
  return(c(x1 = x1, x2 = x2))
}

# --- 6.5 Shephard's Lemma ---

# x^h_i = ∂e/∂p_i
shephards_lemma <- function(e_fn, p1, p2, u, h = 1e-6) {
  de_dp1 <- (e_fn(p1 + h, p2, u) - e_fn(p1 - h, p2, u)) / (2 * h)
  de_dp2 <- (e_fn(p1, p2 + h, u) - e_fn(p1, p2 - h, u)) / (2 * h)
  return(c(x1 = de_dp1, x2 = de_dp2))
}

# Verify
u_test <- 10
x_shephard <- shephards_lemma(expenditure_CD, p1, p2, u_test)
x_hicksian <- hicksian_demand_CD(p1, p2, u_test)
cat("From Shephard's Lemma:", x_shephard, "\n")
cat("Hicksian demand:", x_hicksian, "\n")

# --- 6.6 Slutsky Decomposition ---

slutsky_decomposition <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  # Initial situation
  x_old <- marshallian_demand_CD(p1_old, p2, m, alpha)
  u_old <- x_old[1]^alpha * x_old[2]^(1 - alpha)
  
  # Final situation
  x_new <- marshallian_demand_CD(p1_new, p2, m, alpha)
  
  # Hicksian at new prices, old utility
  x_hicksian <- hicksian_demand_CD(p1_new, p2, u_old, alpha)
  
  # Decomposition for x1
  total_effect <- x_new[1] - x_old[1]
  substitution_effect <- x_hicksian[1] - x_old[1]
  income_effect <- total_effect - substitution_effect
  
  cat("=== Slutsky Decomposition for x1 ===\n")
  cat("Price change: p1 from", p1_old, "to", p1_new, "\n")
  cat("Initial x1:", round(x_old[1], 4), "\n")
  cat("Final x1:", round(x_new[1], 4), "\n")
  cat("---\n")
  cat("Total effect:", round(total_effect, 4), "\n")
  cat("Substitution effect:", round(substitution_effect, 4), "(always ≤ 0 for own-price)\n")
  cat("Income effect:", round(income_effect, 4), "\n")
  
  return(list(total = total_effect, substitution = substitution_effect, 
              income = income_effect))
}

slutsky_decomposition(p1_old = 2, p1_new = 4, p2 = 3, m = 120)

# --- 6.7 Compensating and Equivalent Variation ---

welfare_measures <- function(p1_old, p1_new, p2, m, alpha = 0.5) {
  # Old utility
  u_old <- indirect_utility_CD(p1_old, p2, m, alpha)
  
  # New utility
  u_new <- indirect_utility_CD(p1_new, p2, m, alpha)
  
  # CV: expenditure at new prices to achieve old utility, minus m
  CV <- expenditure_CD(p1_new, p2, u_old, alpha) - m
  
  # EV: m minus expenditure at old prices to achieve new utility
  EV <- m - expenditure_CD(p1_old, p2, u_new, alpha)
  
  cat("=== Welfare Measures ===\n")
  cat("Old utility:", round(u_old, 4), "\n")
  cat("New utility:", round(u_new, 4), "\n")
  cat("---\n")
  cat("Compensating Variation (CV):", round(CV, 2), "\n")
  cat("  (Amount needed to restore original utility at new prices)\n")
  cat("Equivalent Variation (EV):", round(EV, 2), "\n")
  cat("  (Income change equivalent to the price change)\n")
  
  return(list(CV = CV, EV = EV))
}

welfare_measures(p1_old = 2, p1_new = 4, p2 = 3, m = 120)


# ============================================================================
# MODULE 7: PRODUCER THEORY I - Costs (Week 7)
# ============================================================================

# --- 7.1 Production Functions ---

# Cobb-Douglas: Q = A * L^α * K^β
prod_CD <- function(L, K, A = 1, alpha = 0.3, beta = 0.7) {
  A * L^alpha * K^beta
}

# CES: Q = A * (αL^ρ + (1-α)K^ρ)^(1/ρ)
prod_CES <- function(L, K, A = 1, alpha = 0.5, rho = 0.5) {
  A * (alpha * L^rho + (1 - alpha) * K^rho)^(1/rho)
}

# Leontief: Q = min(aL, bK)
prod_leontief <- function(L, K, a = 1, b = 1) {
  pmin(a * L, b * K)
}

# --- 7.2 Returns to Scale ---

check_returns_to_scale <- function(prod_fn, L = 10, K = 10, t = 2) {
  Q_original <- prod_fn(L, K)
  Q_scaled <- prod_fn(t * L, t * K)
  
  ratio <- Q_scaled / Q_original
  
  cat("Q(L, K) =", Q_original, "\n")
  cat("Q(", t, "L,", t, "K) =", Q_scaled, "\n")
  cat("Ratio:", ratio, "\n")
  
  if (abs(ratio - t) < 0.01) {
    cat("Returns to scale: CONSTANT\n")
  } else if (ratio > t) {
    cat("Returns to scale: INCREASING\n")
  } else {
    cat("Returns to scale: DECREASING\n")
  }
}

# CD with α + β = 1 → CRS
check_returns_to_scale(function(L, K) prod_CD(L, K, alpha = 0.3, beta = 0.7))

# --- 7.3 Cost Minimization ---

# For Cobb-Douglas, cost function is:
# C(w, r, Q) = Q^(1/(α+β)) * [(α+β)/A] * (w/α)^(α/(α+β)) * (r/β)^(β/(α+β))

cost_function_CD <- function(w, r, Q, A = 1, alpha = 0.3, beta = 0.7) {
  sum_exp <- alpha + beta
  term1 <- Q^(1/sum_exp)
  term2 <- (sum_exp / A)^(1/sum_exp)
  term3 <- (w / alpha)^(alpha/sum_exp)
  term4 <- (r / beta)^(beta/sum_exp)
  return(term1 * term2 * term3 * term4)
}

# Conditional input demands
input_demand_CD <- function(w, r, Q, A = 1, alpha = 0.3, beta = 0.7) {
  # L* = Q^(1/(α+β)) * A^(-1/(α+β)) * (α/β)^(β/(α+β)) * (r/w)^(β/(α+β))
  sum_exp <- alpha + beta
  
  L <- Q^(1/sum_exp) * A^(-1/sum_exp) * 
       (alpha/beta)^(beta/sum_exp) * (r/w)^(beta/sum_exp)
  
  K <- Q^(1/sum_exp) * A^(-1/sum_exp) * 
       (beta/alpha)^(alpha/sum_exp) * (w/r)^(alpha/sum_exp)
  
  return(c(L = L, K = K))
}

# --- 7.4 Cost Curves ---

plot_cost_curves <- function(w = 10, r = 20, Q_range = 1:100) {
  # Calculate costs
  TC <- sapply(Q_range, function(Q) cost_function_CD(w, r, Q))
  AC <- TC / Q_range
  
  # Marginal cost (numerical derivative)
  MC <- c(TC[1], diff(TC))
  
  par(mfrow = c(1, 2))
  
  # Total cost
  plot(Q_range, TC, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Output (Q)', ylab = 'Cost',
       main = 'Total Cost')
  grid()
  
  # AC and MC
  plot(Q_range, AC, type = 'l', col = 'red', lwd = 2,
       xlab = 'Output (Q)', ylab = 'Cost per unit',
       main = 'Average and Marginal Cost',
       ylim = c(0, max(c(AC, MC)) * 1.1))
  lines(Q_range, MC, col = 'green', lwd = 2)
  legend('topright', legend = c('AC', 'MC'), col = c('red', 'green'), lwd = 2)
  grid()
  
  par(mfrow = c(1, 1))
}


# ============================================================================
# MODULE 8: PRODUCER THEORY II - Profit Maximization (Week 8)
# ============================================================================

# --- 8.1 Profit Maximization ---

# π = p*Q - C(Q)
# FOC: p = MC(Q)  →  p = C'(Q)

profit_max <- function(p, cost_fn, Q_range = seq(0.1, 100, by = 0.1)) {
  # Calculate profit at each Q
  profits <- sapply(Q_range, function(Q) p * Q - cost_fn(Q))
  
  # Find maximum
  max_idx <- which.max(profits)
  Q_star <- Q_range[max_idx]
  pi_star <- profits[max_idx]
  
  return(list(Q = Q_star, profit = pi_star))
}

# Example with quadratic cost: C(Q) = 100 + 10Q + 0.5Q²
quad_cost <- function(Q) 100 + 10 * Q + 0.5 * Q^2

result <- profit_max(p = 30, cost_fn = quad_cost)
cat("At p = 30: Q* =", result$Q, ", π* =", result$profit, "\n")

# Verify: MC = 10 + Q, set MC = p → Q* = p - 10 = 20

# --- 8.2 Supply Curve Derivation ---

derive_supply <- function(cost_fn, p_range = seq(10, 50, by = 1)) {
  Q_supply <- sapply(p_range, function(p) {
    result <- profit_max(p, cost_fn)
    if (result$profit < 0 && result$Q > 0) {
      # Check shutdown condition: p < min AVC
      return(0)
    }
    return(result$Q)
  })
  
  return(data.frame(price = p_range, quantity = Q_supply))
}

supply_curve <- derive_supply(quad_cost)
plot(supply_curve$quantity, supply_curve$price, type = 'l', col = 'red', lwd = 2,
     xlab = 'Quantity', ylab = 'Price', main = 'Firm Supply Curve')
grid()

# --- 8.3 Long-Run Industry Equilibrium ---

industry_equilibrium <- function(demand_fn, cost_fn, firm_count_range = 1:200) {
  # Each firm produces where p = MC
  # Industry supply: Q_industry = n * q_firm(p)
  # Equilibrium: Demand(p) = Industry Supply(p)
  # Long-run: profit = 0, so p = min AC
  
  # Find minimum AC
  Q_range <- seq(1, 100, by = 0.5)
  AC <- sapply(Q_range, function(Q) cost_fn(Q) / Q)
  min_AC_idx <- which.min(AC)
  q_efficient <- Q_range[min_AC_idx]
  p_longrun <- AC[min_AC_idx]
  
  # Industry quantity at long-run price
  Q_industry <- demand_fn(p_longrun)
  
  # Number of firms
  n_firms <- Q_industry / q_efficient
  
  cat("=== Long-Run Industry Equilibrium ===\n")
  cat("Long-run price:", round(p_longrun, 2), "\n")
  cat("Each firm produces:", round(q_efficient, 2), "\n")
  cat("Industry quantity:", round(Q_industry, 2), "\n")
  cat("Number of firms:", round(n_firms, 0), "\n")
  
  return(list(price = p_longrun, firm_output = q_efficient, 
              industry_output = Q_industry, num_firms = round(n_firms)))
}


# ============================================================================
# MODULE 9: MARKET EQUILIBRIUM & WELFARE (Week 9)
# ============================================================================

# --- 9.1 Equilibrium with Numerical Solver ---

market_equilibrium <- function(demand_inv, supply_inv) {
  # Find Q where Pd(Q) = Ps(Q)
  excess <- function(Q) demand_inv(Q) - supply_inv(Q)
  
  # Find root
  Q_star <- uniroot(excess, interval = c(0.1, 1000))$root
  P_star <- demand_inv(Q_star)
  
  return(list(Q = Q_star, P = P_star))
}

# --- 9.2 Consumer and Producer Surplus ---

calculate_welfare <- function(demand_inv, supply_inv, P_star, Q_star) {
  # CS = ∫[0,Q*] Pd(Q)dQ - P*Q*
  CS <- integrate(demand_inv, 0, Q_star)$value - P_star * Q_star
  
  # PS = P*Q* - ∫[0,Q*] Ps(Q)dQ
  PS <- P_star * Q_star - integrate(supply_inv, 0, Q_star)$value
  
  # Total welfare
  TW <- CS + PS
  
  return(list(CS = CS, PS = PS, TW = TW))
}

# Example
demand_inv <- function(Q) 100 - 2 * Q
supply_inv <- function(Q) 10 + Q

eq <- market_equilibrium(demand_inv, supply_inv)
welfare <- calculate_welfare(demand_inv, supply_inv, eq$P, eq$Q)

cat("Equilibrium: P =", round(eq$P, 2), ", Q =", round(eq$Q, 2), "\n")
cat("Consumer Surplus:", round(welfare$CS, 2), "\n")
cat("Producer Surplus:", round(welfare$PS, 2), "\n")
cat("Total Welfare:", round(welfare$TW, 2), "\n")

# --- 9.3 Tax Analysis ---

tax_analysis <- function(demand_inv, supply_inv, tax) {
  # Without tax
  eq_no_tax <- market_equilibrium(demand_inv, supply_inv)
  welfare_no_tax <- calculate_welfare(demand_inv, supply_inv, 
                                       eq_no_tax$P, eq_no_tax$Q)
  
  # With tax on suppliers
  supply_inv_tax <- function(Q) supply_inv(Q) + tax
  eq_tax <- market_equilibrium(demand_inv, supply_inv_tax)
  
  # Prices
  P_consumer <- eq_tax$P
  P_producer <- eq_tax$P - tax
  
  # Welfare with tax
  welfare_tax <- calculate_welfare(demand_inv, supply_inv_tax, 
                                    P_consumer, eq_tax$Q)
  
  # Government revenue
  tax_revenue <- tax * eq_tax$Q
  
  # Deadweight loss
  DWL <- welfare_no_tax$TW - (welfare_tax$TW + tax_revenue)
  
  # Tax burden shares
  burden_consumer <- (P_consumer - eq_no_tax$P) / tax
  burden_producer <- (eq_no_tax$P - P_producer) / tax
  
  cat("=== Tax Analysis (t = $", tax, ") ===\n")
  cat("\nWithout tax:\n")
  cat("  P =", round(eq_no_tax$P, 2), ", Q =", round(eq_no_tax$Q, 2), "\n")
  cat("  CS =", round(welfare_no_tax$CS, 2), ", PS =", round(welfare_no_tax$PS, 2), "\n")
  
  cat("\nWith tax:\n")
  cat("  P_consumer =", round(P_consumer, 2), ", P_producer =", round(P_producer, 2), "\n")
  cat("  Q =", round(eq_tax$Q, 2), "\n")
  
  cat("\nWelfare effects:\n")
  cat("  ΔCS =", round(welfare_tax$CS - welfare_no_tax$CS, 2), "\n")
  cat("  ΔPS =", round(welfare_tax$PS - welfare_no_tax$PS + tax * eq_tax$Q, 2), "\n")
  cat("  Tax revenue =", round(tax_revenue, 2), "\n")
  cat("  Deadweight loss =", round(DWL, 2), "\n")
  
  cat("\nTax burden:\n")
  cat("  Consumer bears:", round(burden_consumer * 100, 1), "%\n")
  cat("  Producer bears:", round(burden_producer * 100, 1), "%\n")
  
  return(list(eq_no_tax = eq_no_tax, eq_tax = eq_tax, DWL = DWL,
              burden_consumer = burden_consumer, burden_producer = burden_producer))
}

tax_analysis(demand_inv, supply_inv, tax = 6)


# ============================================================================
# MODULE 10: INTERNATIONAL TRADE (Week 10)
# ============================================================================

# --- 10.1 Two-Country Trade Model ---

trade_model <- function(dA, sA, dB, sB) {
  # dA, sA: demand and supply functions for country A
  # dB, sB: demand and supply functions for country B
  # All functions of price
  
  # Autarky equilibria
  excess_A <- function(p) dA(p) - sA(p)
  excess_B <- function(p) dB(p) - sB(p)
  
  p_autarky_A <- uniroot(excess_A, c(0.1, 100))$root
  p_autarky_B <- uniroot(excess_B, c(0.1, 100))$root
  
  # Determine exporter/importer
  if (p_autarky_A < p_autarky_B) {
    exporter <- "A"; importer <- "B"
  } else {
    exporter <- "B"; importer <- "A"
  }
  
  # Free trade: ES(p) = ED(p)
  # If A exports: ES_A(p) = sA(p) - dA(p), ED_B(p) = dB(p) - sB(p)
  if (exporter == "A") {
    ES <- function(p) sA(p) - dA(p)
    ED <- function(p) dB(p) - sB(p)
  } else {
    ES <- function(p) sB(p) - dB(p)
    ED <- function(p) dA(p) - sA(p)
  }
  
  world_excess <- function(p) ES(p) - ED(p)
  p_world <- uniroot(world_excess, c(min(p_autarky_A, p_autarky_B),
                                      max(p_autarky_A, p_autarky_B)))$root
  
  # Trade volume
  trade_volume <- ES(p_world)
  
  cat("=== Two-Country Trade Model ===\n")
  cat("Autarky prices: A =", round(p_autarky_A, 2), ", B =", round(p_autarky_B, 2), "\n")
  cat("Exporter:", exporter, ", Importer:", importer, "\n")
  cat("World price:", round(p_world, 2), "\n")
  cat("Trade volume:", round(trade_volume, 2), "\n")
  
  return(list(p_A_autarky = p_autarky_A, p_B_autarky = p_autarky_B,
              exporter = exporter, p_world = p_world, trade_volume = trade_volume))
}

# Example
dA <- function(p) 200 - p
sA <- function(p) p/3
dB <- function(p) 150 - p
sB <- function(p) 2 * p

result_trade <- trade_model(dA, sA, dB, sB)

# --- 10.2 Export Subsidy Analysis ---

export_subsidy_analysis <- function(dA, sA, dB, sB, subsidy) {
  # Baseline free trade
  baseline <- trade_model(dA, sA, dB, sB)
  
  # With subsidy: exporter receives p + s, importer pays p
  # Modified ES: at price p, exporters behave as if price is p + s
  
  if (baseline$exporter == "A") {
    ES_sub <- function(p) sA(p + subsidy) - dA(p + subsidy)
    ED <- function(p) dB(p) - sB(p)
  } else {
    ES_sub <- function(p) sB(p + subsidy) - dB(p + subsidy)
    ED <- function(p) dA(p) - sA(p)
  }
  
  world_excess <- function(p) ES_sub(p) - ED(p)
  p_world_sub <- uniroot(world_excess, c(0.1, 100))$root
  
  # Producer price in exporting country
  p_exporter <- p_world_sub + subsidy
  
  cat("=== Export Subsidy Analysis (s = $", subsidy, ") ===\n")
  cat("World price: Before =", round(baseline$p_world, 2), 
      ", After =", round(p_world_sub, 2), "\n")
  cat("Price to exporter producers:", round(p_exporter, 2), "\n")
  
  return(list(p_world_before = baseline$p_world, p_world_after = p_world_sub,
              p_exporter = p_exporter))
}


# ============================================================================
# MODULE 11: DECISION MAKING UNDER UNCERTAINTY (Week 11)
# ============================================================================

# --- 11.1 Expected Utility Calculation ---

expected_utility <- function(utility_fn, outcomes, probabilities) {
  if (length(outcomes) != length(probabilities)) {
    stop("Outcomes and probabilities must have same length")
  }
  if (abs(sum(probabilities) - 1) > 1e-6) {
    stop("Probabilities must sum to 1")
  }
  
  EU <- sum(probabilities * sapply(outcomes, utility_fn))
  return(EU)
}

# --- 11.2 Risk Measures ---

risk_analysis <- function(utility_fn, outcomes, probabilities) {
  EU <- expected_utility(utility_fn, outcomes, probabilities)
  EX <- sum(probabilities * outcomes)  # Expected value of outcomes
  
  # Certainty equivalent: u(CE) = EU
  # Need to invert utility function numerically
  CE <- uniroot(function(x) utility_fn(x) - EU, 
                interval = c(min(outcomes) * 0.1, max(outcomes) * 2))$root
  
  # Risk premium
  RP <- EX - CE
  
  # Absolute risk aversion at expected value (Arrow-Pratt)
  h <- 1e-6
  u_prime <- (utility_fn(EX + h) - utility_fn(EX - h)) / (2 * h)
  u_double_prime <- (utility_fn(EX + h) - 2*utility_fn(EX) + utility_fn(EX - h)) / h^2
  ARA <- -u_double_prime / u_prime
  
  cat("=== Risk Analysis ===\n")
  cat("Expected outcome E[X]:", round(EX, 2), "\n")
  cat("Expected utility E[U]:", round(EU, 4), "\n")
  cat("Certainty equivalent CE:", round(CE, 2), "\n")
  cat("Risk premium RP:", round(RP, 2), "\n")
  cat("Absolute risk aversion A(E[X]):", round(ARA, 6), "\n")
  
  # Classify risk attitude
  if (RP > 0.01) {
    cat("Risk attitude: AVERSE\n")
  } else if (RP < -0.01) {
    cat("Risk attitude: LOVING\n")
  } else {
    cat("Risk attitude: NEUTRAL\n")
  }
  
  return(list(EU = EU, EX = EX, CE = CE, RP = RP, ARA = ARA))
}

# Example: Farmer with u(π) = √π
# Wet season: π = 6400 (prob 0.75)
# Dry season: π = 900 (prob 0.25)

utility_sqrt <- function(x) sqrt(x)
outcomes <- c(6400, 900)
probs <- c(0.75, 0.25)

farmer_risk <- risk_analysis(utility_sqrt, outcomes, probs)

# --- 11.3 Insurance Valuation ---

insurance_analysis <- function(utility_fn, outcomes, probabilities, premium) {
  # Without insurance
  EU_no_ins <- expected_utility(utility_fn, outcomes, probabilities)
  EX_no_ins <- sum(probabilities * outcomes)
  
  # With insurance at premium p: guaranteed outcome = EX - premium
  guaranteed <- EX_no_ins - premium
  EU_with_ins <- utility_fn(guaranteed)
  
  cat("=== Insurance Analysis ===\n")
  cat("Expected outcome without insurance:", round(EX_no_ins, 2), "\n")
  cat("Premium:", round(premium, 2), "\n")
  cat("Guaranteed outcome with insurance:", round(guaranteed, 2), "\n")
  cat("\nExpected utility without insurance:", round(EU_no_ins, 4), "\n")
  cat("Utility with insurance:", round(EU_with_ins, 4), "\n")
  
  if (EU_with_ins > EU_no_ins) {
    cat("\n→ Should BUY insurance at this premium\n")
  } else {
    cat("\n→ Should NOT buy insurance at this premium\n")
  }
  
  # Maximum willingness to pay
  # Find premium where U(EX - premium) = EU_no_ins
  max_premium <- EX_no_ins - uniroot(function(x) utility_fn(x) - EU_no_ins,
                                      c(0.1, EX_no_ins))$root
  cat("Maximum willingness to pay for insurance:", round(max_premium, 2), "\n")
  
  return(list(EU_no_ins = EU_no_ins, EU_with_ins = EU_with_ins,
              max_premium = max_premium))
}

insurance_analysis(utility_sqrt, outcomes, probs, premium = 500)

# --- 11.4 Visualization ---

plot_risk_aversion <- function(utility_fn, outcomes, probabilities) {
  x_range <- seq(min(outcomes) * 0.5, max(outcomes) * 1.2, length = 200)
  u_range <- sapply(x_range, utility_fn)
  
  EX <- sum(probabilities * outcomes)
  EU <- expected_utility(utility_fn, outcomes, probabilities)
  
  # CE calculation
  CE <- uniroot(function(x) utility_fn(x) - EU, 
                interval = c(min(outcomes) * 0.1, max(outcomes) * 2))$root
  
  plot(x_range, u_range, type = 'l', col = 'blue', lwd = 2,
       xlab = 'Outcome', ylab = 'Utility',
       main = 'Risk Aversion Visualization')
  
  # Mark outcomes
  points(outcomes, sapply(outcomes, utility_fn), pch = 16, col = 'red', cex = 1.5)
  
  # Expected value and expected utility
  points(EX, utility_fn(EX), pch = 17, col = 'green', cex = 1.5)
  abline(h = EU, lty = 2, col = 'gray')
  abline(v = CE, lty = 2, col = 'orange')
  abline(v = EX, lty = 2, col = 'green')
  
  # Chord between outcomes
  segments(outcomes[2], utility_fn(outcomes[2]), 
           outcomes[1], utility_fn(outcomes[1]), col = 'purple', lty = 2)
  
  legend('bottomright', 
         legend = c('Utility function', 'Outcomes', 'E[X]', 'E[U] level', 'CE'),
         col = c('blue', 'red', 'green', 'gray', 'orange'),
         lty = c(1, NA, NA, 2, 2), pch = c(NA, 16, 17, NA, NA),
         lwd = c(2, NA, NA, 1, 1))
  
  grid()
}


# ============================================================================
# MODULE 12: LINEAR PROGRAMMING (Week 12)
# ============================================================================

library(lpSolve)

# --- 12.1 Diet Problem (from Final Test) ---

diet_problem <- function() {
  # Minimize cost: 1*x + 2*y
  # Subject to:
  #   4x + 5y >= 100 (protein)
  #   10x + 25y >= 400 (energy)
  #   0.1x + 0.5y >= 10 (vitamin A)
  #   1x + 0y >= 5 (calcium)
  #   x, y >= 0
  
  f.obj <- c(1, 2)  # Objective coefficients
  
  f.con <- matrix(c(
    4, 5,      # Protein
    10, 25,    # Energy
    0.1, 0.5,  # Vitamin A
    1, 0       # Calcium
  ), nrow = 4, byrow = TRUE)
  
  f.dir <- c(">=", ">=", ">=", ">=")
  f.rhs <- c(100, 400, 10, 5)
  
  result <- lp("min", f.obj, f.con, f.dir, f.rhs)
  
  cat("=== Diet Problem Solution ===\n")
  cat("Food I:", result$solution[1], "units\n")
  cat("Food II:", result$solution[2], "units\n")
  cat("Minimum cost: $", result$objval, "\n")
  
  # Shadow prices (dual values)
  # Need to solve dual problem
  dual_result <- lp("max", f.rhs, t(f.con), rep("<=", 2), f.obj)
  cat("\nShadow prices (value of relaxing constraints):\n")
  cat("  Protein:", round(dual_result$solution[1], 4), "\n")
  cat("  Energy:", round(dual_result$solution[2], 4), "\n")
  cat("  Vitamin A:", round(dual_result$solution[3], 4), "\n")
  cat("  Calcium:", round(dual_result$solution[4], 4), "\n")
  
  return(result)
}

diet_problem()

# --- 12.2 Farm Planning Problem ---

farm_planning <- function() {
  # Farmer has 100 hectares, 500 labor hours, 300 water units
  # Two crops: wheat (x) and corn (y)
  # 
  # Wheat: 1 ha, 4 labor hr, 2 water units, profit $200/ha
  # Corn: 1 ha, 6 labor hr, 3 water units, profit $300/ha
  #
  # Maximize profit
  
  f.obj <- c(200, 300)  # Profits
  
  f.con <- matrix(c(
    1, 1,    # Land constraint
    4, 6,    # Labor constraint
    2, 3     # Water constraint
  ), nrow = 3, byrow = TRUE)
  
  f.dir <- c("<=", "<=", "<=")
  f.rhs <- c(100, 500, 300)
  
  result <- lp("max", f.obj, f.con, f.dir, f.rhs)
  
  cat("=== Farm Planning Solution ===\n")
  cat("Wheat:", result$solution[1], "hectares\n")
  cat("Corn:", result$solution[2], "hectares\n")
  cat("Maximum profit: $", result$objval, "\n")
  
  # Resource utilization
  land_used <- sum(f.con[1,] * result$solution)
  labor_used <- sum(f.con[2,] * result$solution)
  water_used <- sum(f.con[3,] * result$solution)
  
  cat("\nResource utilization:\n")
  cat("  Land:", land_used, "/", f.rhs[1], "ha (", round(100*land_used/f.rhs[1]), "%)\n")
  cat("  Labor:", labor_used, "/", f.rhs[2], "hr (", round(100*labor_used/f.rhs[2]), "%)\n")
  cat("  Water:", water_used, "/", f.rhs[3], "units (", round(100*water_used/f.rhs[3]), "%)\n")
  
  return(result)
}

farm_planning()

# --- 12.3 Graphical Solution (2 variables) ---

plot_lp_graphical <- function(f.obj, f.con, f.dir, f.rhs, xlim = c(0, 50), ylim = c(0, 50)) {
  plot(NULL, xlim = xlim, ylim = ylim, 
       xlab = 'x', ylab = 'y', main = 'LP Graphical Solution')
  
  # Plot constraint lines
  colors <- rainbow(nrow(f.con))
  for (i in 1:nrow(f.con)) {
    a <- f.con[i, 1]
    b <- f.con[i, 2]
    c <- f.rhs[i]
    
    if (b != 0) {
      # y = (c - ax) / b
      x_vals <- seq(xlim[1], xlim[2], length = 100)
      y_vals <- (c - a * x_vals) / b
      lines(x_vals, y_vals, col = colors[i], lwd = 2)
    } else {
      # x = c/a
      abline(v = c/a, col = colors[i], lwd = 2)
    }
  }
  
  # Shade feasible region (simplified - just show constraints)
  legend('topright', legend = paste("Constraint", 1:nrow(f.con)), 
         col = colors, lwd = 2, cex = 0.8)
  
  # Solve and mark optimal point
  result <- lp("min", f.obj, f.con, f.dir, f.rhs)
  points(result$solution[1], result$solution[2], pch = 19, col = 'red', cex = 2)
  text(result$solution[1], result$solution[2], "Optimal", pos = 3)
  
  grid()
}

# --- 12.4 Sensitivity Analysis ---

lp_sensitivity <- function(f.obj, f.con, f.dir, f.rhs) {
  # Base solution
  base <- lp("min", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
  
  cat("=== LP Sensitivity Analysis ===\n\n")
  cat("Optimal solution:\n")
  cat("  x =", base$solution, "\n")
  cat("  Objective =", base$objval, "\n\n")
  
  # RHS sensitivity (shadow prices)
  cat("RHS Sensitivity (Shadow Prices):\n")
  cat("  If you could relax each constraint by 1 unit,\n")
  cat("  the objective would improve by:\n")
  
  for (i in 1:length(f.rhs)) {
    # Perturb RHS
    rhs_up <- f.rhs
    rhs_up[i] <- f.rhs[i] + 1
    result_up <- lp("min", f.obj, f.con, f.dir, rhs_up)
    shadow <- base$objval - result_up$objval
    cat("    Constraint", i, ":", round(shadow, 4), "\n")
  }
  
  cat("\nObjective Coefficient Sensitivity:\n")
  cat("  How much would coefficients need to change\n")
  cat("  to alter the optimal basis?\n")
  
  # This requires more sophisticated analysis - simplified version
  for (j in 1:length(f.obj)) {
    # Range where current solution stays optimal
    obj_test <- f.obj
    for (delta in seq(-10, 10, by = 0.5)) {
      obj_test[j] <- f.obj[j] + delta
      result_test <- lp("min", obj_test, f.con, f.dir, f.rhs)
      if (!all(abs(result_test$solution - base$solution) < 1e-6)) {
        cat("    Variable", j, ": basis changes at Δ ≈", delta, "\n")
        break
      }
    }
  }
  
  return(base)
}


# ============================================================================
# END OF R CODE MODULES
# ============================================================================

cat("\n")
cat("==========================================\n")
cat("ECON4002 R Code Modules Loaded Successfully\n")
cat("==========================================\n")
cat("\nModules available:\n")
cat("  1. R Foundations (Week 1)\n")
cat("  2. Linear Algebra (Week 2)\n")
cat("  3. Calculus & Elasticity (Week 3)\n")
cat("  4. Optimization (Week 4)\n")
cat("  5. Consumer Theory I (Week 5)\n")
cat("  6. Consumer Theory II - Duality (Week 6)\n")
cat("  7. Producer Theory I - Costs (Week 7)\n")
cat("  8. Producer Theory II - Profit Max (Week 8)\n")
cat("  9. Market Equilibrium & Welfare (Week 9)\n")
cat(" 10. International Trade (Week 10)\n")
cat(" 11. Decision Under Uncertainty (Week 11)\n")
cat(" 12. Linear Programming (Week 12)\n")
cat("\n")
