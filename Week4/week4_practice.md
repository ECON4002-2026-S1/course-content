# Week 4: Practice Problems — Optimization

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Problem Set Overview

| Problem | Topic | Difficulty |
|---------|-------|------------|
| W4-P1 | Single Variable Optimization | Basic |
| W4-P2 | Multi-Variable Unconstrained | Intermediate |
| W4-P3 | Hessian and Definiteness | Intermediate |
| W4-P4 | Lagrangian Method | Intermediate |
| W4-P5 | Cost Minimization | Intermediate |
| W4-P6 | Bordered Hessian SOC | Advanced |
| W4-P7 | Shadow Price Interpretation | Intermediate |
| W4-P8 | Multi-Constraint Problem | Advanced |
| W4-P9 | Envelope Theorem | Intermediate |
| W4-P10 | R Implementation | Intermediate |
| W4-P11 | Agricultural Application | Advanced |
| W4-P12 | Concavity and Global Optima | Intermediate |

---

## W4-P1: Single Variable Optimization (Basic)

**Problem:** A firm faces inverse demand $P = 120 - 2Q$ and has cost function $C(Q) = 20Q + Q^2$. 

(a) Derive the profit function $\pi(Q)$.  
(b) Find the profit-maximizing quantity $Q^*$ using FOC.  
(c) Verify this is a maximum using SOC.  
(d) Calculate the optimal price $P^*$ and maximum profit $\pi^*$.

**Hints:**
- Profit = Total Revenue − Total Cost
- $TR = P \times Q = (120 - 2Q)Q$
- For FOC: set $d\pi/dQ = 0$
- For SOC: check $d^2\pi/dQ^2 < 0$

---

## W4-P2: Multi-Variable Unconstrained (Intermediate)

**Problem:** A farm produces output using labor ($L$) and fertilizer ($F$) with production function $Q = 10L^{0.5}F^{0.3}$. Output price is \$5, wage is \$2, fertilizer price is \$1.

(a) Write the profit function $\pi(L, F)$.  
(b) Derive the first-order conditions.  
(c) Solve for the profit-maximizing input levels $L^*$ and $F^*$.  
(d) Calculate the optimal output and profit.

**Hints:**
- $\pi = pQ - wL - p_F \cdot F$
- Set both $\partial\pi/\partial L = 0$ and $\partial\pi/\partial F = 0$
- The ratio of FOCs often simplifies the solution

---

## W4-P3: Hessian and Definiteness (Intermediate)

**Problem:** For the function $f(x,y) = -2x^2 - 3y^2 + 4xy - 8x + 6y$:

(a) Find the critical point by solving $\nabla f = 0$.  
(b) Construct the Hessian matrix $H$.  
(c) Determine whether $H$ is positive definite, negative definite, or indefinite.  
(d) Classify the critical point (max, min, or saddle).  
(e) Calculate $f$ at the critical point.

**Hints:**
- The Hessian is $H = \begin{bmatrix} f_{xx} & f_{xy} \\ f_{yx} & f_{yy} \end{bmatrix}$
- For 2×2: Negative definite if $H_{11} < 0$ and $\det(H) > 0$
- For 2×2: Positive definite if $H_{11} > 0$ and $\det(H) > 0$

---

## W4-P4: Lagrangian Method (Intermediate)

**Problem:** A consumer maximizes utility $u(x,y) = xy$ subject to budget constraint $4x + 2y = 100$.

(a) Set up the Lagrangian function.  
(b) Derive the three first-order conditions.  
(c) Solve for the optimal consumption bundle $(x^*, y^*)$.  
(d) Find the value of $\lambda^*$ and interpret it economically.

**Hints:**
- Lagrangian: $\mathcal{L} = xy + \lambda(100 - 4x - 2y)$
- The ratio $y/x$ from the first two FOCs is useful
- $\lambda^*$ represents the marginal utility of income

---

## W4-P5: Cost Minimization (Intermediate)

**Problem:** A firm minimizes cost $C = wL + rK$ subject to producing output $\bar{Q}$ using Cobb-Douglas technology $Q = AL^\alpha K^\beta$.

(a) Set up the Lagrangian for this minimization problem.  
(b) Derive the first-order conditions.  
(c) Show that the optimal input ratio is $K/L = \beta w / (\alpha r)$.  
(d) For $A = 1$, $\alpha = 0.5$, $\beta = 0.5$, $w = 4$, $r = 9$, $\bar{Q} = 100$, find $L^*$, $K^*$, and minimum cost $C^*$.

**Hints:**
- For minimization, Lagrangian can be written as $\mathcal{L} = wL + rK + \lambda(\bar{Q} - AL^\alpha K^\beta)$
- Dividing the FOCs eliminates $\lambda$

---

## W4-P6: Bordered Hessian SOC (Advanced) ⭐

**Problem:** For the utility maximization problem $\max u = x^{0.5}y^{0.5}$ subject to $2x + y = 60$:

(a) Solve for the optimal $(x^*, y^*)$ using the Lagrangian.  
(b) Compute the constraint gradients $g_x$ and $g_y$.  
(c) Compute the second derivatives of the Lagrangian: $\mathcal{L}_{xx}$, $\mathcal{L}_{yy}$, $\mathcal{L}_{xy}$.  
(d) Construct the bordered Hessian $\bar{H}$.  
(e) Calculate $|\bar{H}|$ and verify the second-order condition for a maximum.

**Hints:**
- Bordered Hessian structure: $\bar{H} = \begin{bmatrix} 0 & g_x & g_y \\ g_x & \mathcal{L}_{xx} & \mathcal{L}_{xy} \\ g_y & \mathcal{L}_{yx} & \mathcal{L}_{yy} \end{bmatrix}$
- For maximization with 1 constraint, 2 variables: need $|\bar{H}| > 0$
- For minimization with 1 constraint, 2 variables: need $|\bar{H}| < 0$

---

## W4-P7: Shadow Price Interpretation (Intermediate)

**Problem:** A farmer maximizes profit $\pi = 50x + 80y$ from two crops subject to:
- Land constraint: $x + y \leq 100$
- Water constraint: $2x + 3y \leq 240$

(a) Identify the corner points of the feasible region.  
(b) Evaluate profit at each corner to find the optimum.  
(c) Which constraints are binding at the optimum?  
(d) Interpret the shadow prices: What is the marginal value of an additional hectare of land? An additional unit of water?

**Hints:**
- This is a linear programming problem
- Shadow price is zero for non-binding constraints
- Shadow price > 0 for binding constraints

---

## W4-P8: Multi-Constraint Problem (Advanced)

**Problem:** A diet problem: minimize cost $C = 2x + 3y$ where $x$ = units of Food A, $y$ = units of Food B.

Constraints:
- Protein: $4x + 2y \geq 40$
- Calories: $3x + 5y \geq 60$
- Non-negativity: $x, y \geq 0$

(a) Graph the feasible region.  
(b) Identify the corner points.  
(c) Find the cost-minimizing diet.  
(d) Which nutritional constraints are binding?

**Hints:**
- For $\geq$ constraints, feasible region is above/right of constraint lines
- Optimal solution is at a corner point
- Check which constraints are satisfied with equality

---

## W4-P9: Envelope Theorem (Intermediate)

**Problem:** Consider a profit maximization problem $\pi(p,w) = \max_L \{pf(L) - wL\}$ where $p$ is output price and $w$ is wage.

(a) Write the first-order condition that defines $L^*(p,w)$.  
(b) Use the envelope theorem to show $\partial\pi^*/\partial p = f(L^*) = Q^*$.  
(c) Use the envelope theorem to show $\partial\pi^*/\partial w = -L^*$.  
(d) Interpret these results economically.

**Hints:**
- Envelope theorem: $dV^*/da = \partial \mathcal{L}/\partial a|_{x=x^*}$
- Part (b) is known as Hotelling's lemma

---

## W4-P10: R Implementation (Intermediate)

**Problem:** Use R to solve: Minimize $f(x,y) = (x-3)^2 + (y-2)^2 + xy$ subject to $x + y = 4$.

(a) Set up and solve using `nloptr` package.  
(b) Compute the Hessian of $f$ analytically.  
(c) Construct the bordered Hessian.  
(d) Verify the SOC by checking the determinant sign.

**R Starter Code:**
```r
library(nloptr)

# Objective function
f <- function(x) {
  (x[1] - 3)^2 + (x[2] - 2)^2 + x[1] * x[2]
}

# Constraint: x + y - 4 = 0
g_eq <- function(x) {
  x[1] + x[2] - 4
}

# Solve (complete this)
result <- nloptr(
  x0 = c(2, 2),
  eval_f = f,
  eval_g_eq = g_eq,
  opts = list(algorithm = "NLOPT_LN_COBYLA", xtol_rel = 1e-8)
)
```

---

## W4-P11: Agricultural Application (Advanced)

**Problem:** A farmer has 200 hectares to allocate between wheat (W) and canola (C). Due to pest pressure, profit per hectare exhibits diminishing returns:
- Wheat: $\pi_W = 400 - 2W$ dollars per hectare
- Canola: $\pi_C = 350 - C$ dollars per hectare

Total profit is $\Pi = W \cdot \pi_W + C \cdot \pi_C$ subject to $W + C = 200$.

(a) Write out the total profit function in terms of $W$ and $C$.  
(b) Use substitution ($C = 200 - W$) to express profit as a function of $W$ only.  
(c) Find the optimal allocation $W^*$, $C^*$ using FOC.  
(d) Verify with SOC.  
(e) Calculate total profit from each crop and overall.

---

## W4-P12: Concavity and Global Optima (Intermediate)

**Problem:** 

(a) Explain why, for a strictly concave objective function, any critical point satisfying the FOC must be a global maximum.

(b) The utility function $u(x) = \ln(x)$ is strictly concave. Show this by computing $u''(x)$ and verifying it's negative for all $x > 0$.

(c) For a utility maximization problem with strictly concave utility and a linear budget constraint, explain why the solution is unique.

(d) What would happen if the utility function were convex instead? Give an example.

---

## Solutions Summary

| Problem | Key Answer |
|---------|------------|
| W4-P1 | $Q^* = 16.67$, $\pi^* = 833.33$ |
| W4-P3 | Critical point $(-3, -1)$, maximum, $f^* = 9$ |
| W4-P4 | $(x^*, y^*) = (12.5, 25)$, $\lambda^* = 6.25$ |
| W4-P5 | $(L^*, K^*) = (150, 66.67)$, $C^* = 1200$ |
| W4-P6 | $(x^*, y^*) = (15, 30)$, $|\bar{H}| > 0$ ✓ |
| W4-P7 | $(x^*, y^*) = (0, 80)$, water binding |
| W4-P8 | $(x^*, y^*) = (5.71, 8.57)$, $C^* = 37.14$ |
| W4-P10 | $(x^*, y^*) \approx (2.33, 1.67)$, $|\bar{H}| = -4 < 0$ ✓ |
| W4-P11 | $(W^*, C^*) = (75, 125)$, $\Pi^* = 46,875$ |

---

## Study Tips

1. **Always check SOC** — Finding where the derivative equals zero is not enough!

2. **Know your Hessian signs:**
   - Maximum → Negative definite → $H_{11} < 0$, $|H| > 0$ (alternating)
   - Minimum → Positive definite → $H_{11} > 0$, $|H| > 0$ (all positive)

3. **Bordered Hessian for constraints:**
   - Maximization with 1 constraint, 2 vars: $|\bar{H}| > 0$
   - Minimization with 1 constraint, 2 vars: $|\bar{H}| < 0$

4. **Interpret λ** — It's the marginal value of relaxing the constraint!

5. **Use R to verify** — Numerical solutions can catch calculation errors.
