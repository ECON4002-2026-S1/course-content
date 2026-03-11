# Week 8: Practice Problems

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Instructions

Complete all problems. Show your analytical work step by step and include R code for computational questions. You may use the AI tutor for guidance, but ensure you understand the solutions.

---

## Part A: Core Profit Maximisation

### Problem 1: Output Choice *(Easy)*

A firm has cost function $C(y) = 50 + 2y + 0.5y^2$. The output price is $p = 12$.

a) Find the profit-maximising output.

b) Calculate maximum profit.

c) Verify the second-order condition for a maximum.

---

### Problem 2: Value of Marginal Product *(Easy)*

A farm uses labour to produce wheat: $Q = 100L^{0.5}$. The wheat price is \$8/bushel and the wage is \$200/day.

a) Derive $VMP_L$.

b) Find the profit-maximising quantity of labour.

c) Calculate the resulting output level.

---

### Problem 3: Supply Curve Derivation *(Medium)*

A firm has total cost $TC(y) = 100 + 10y + y^2$.

a) Find $MC$, $AVC$, and $AC$.

b) Find the output level that minimises $AVC$.

c) Derive the firm's supply function $y^s(p)$.

d) At what price does profit equal zero (zero-profit condition)?

---

### Problem 4: Shutdown Decision *(Medium)*

A processing plant has fixed costs $FC = 500$ and variable costs $VC(y) = 20y + 0.1y^2$. The current output price is $p = 35$.

a) Should the plant operate in the short run? Show your reasoning.

b) Calculate short-run profit.

c) At what price would the plant shut down?

---

## Part B: Market and Industry Analysis

### Problem 5: Long-Run Equilibrium *(Medium)*

In a competitive industry, each firm has $C(y) = y^3 - 6y^2 + 15y$.

a) Find $AC$ and $MC$.

b) Find the efficient scale (output that minimises $AC$).

c) What is the long-run equilibrium price?

d) If market demand is $Q^D = 300 - 5p$, how many firms operate in long-run equilibrium?

---

### Problem 6: Producer Surplus *(Medium)*

A firm has $MC(y) = 4 + 2y$ and faces price $p = 20$. Fixed costs are $FC = 50$.

a) Find optimal output and profit.

b) Calculate producer surplus geometrically and algebraically.

c) Verify that $PS = \pi + FC$.

---

### Problem 7: Agricultural Supply Response *(Medium)*

A wheat farm has $C(y) = 1000 + 50y + 0.5y^2$ (where $y$ is in tonnes).

a) Derive the farm's supply curve.

b) If the wheat price rises from \$150 to \$200/tonne, by how much does output increase?

c) Calculate the change in profit.

---

### Problem 8: Entry, Exit, and Industry Adjustment *(Medium)*

For each scenario below, describe the adjustment process in both the short run and the long run. Address the effects on price, firm output, number of firms, and profit.

a) Market demand for a product permanently increases.

b) A new technology becomes available that reduces production costs.

c) An input price rises permanently.

---

## Part C: Advanced Topics

### Problem 9: Hotelling's Lemma *(Hard)*

A firm has profit function $\pi(p, w) = \dfrac{(p - w)^2}{4}$.

a) Use Hotelling's Lemma to find the supply function $y^s(p, w)$.

b) Use Hotelling's Lemma to find the labour demand function $L^d(p, w)$.

c) Verify your answers by solving the profit-maximisation problem directly using the production function $f(L) = 2\sqrt{L}$.

---

### Problem 10: Two-Input Profit Maximisation *(Hard)*

A farm has production function $f(L, K) = L^{0.3} K^{0.2}$ with output price $p = 50$, wage $w = 10$, and rental rate $r = 20$.

a) Write the profit-maximisation problem.

b) Derive the first-order conditions using $VMP$ conditions.

c) Solve for $L^*$, $K^*$, $y^*$, and $\pi^*$.

---

### Problem 11: Industry Equilibrium with Heterogeneous Costs *(Hard)*

An industry has two types of farms:
- **50 efficient farms** with $C_E(y) = 10 + 2y + 0.5y^2$
- **100 inefficient farms** with $C_I(y) = 20 + 4y + 0.5y^2$

a) Derive each type's supply curve (above its minimum $AVC$).

b) Derive the industry supply curve.

c) Market demand is $Q = 500 - 10p$. Find the equilibrium price and quantity.

d) Calculate profit for each farm type at this equilibrium.

---

### Problem 12: Ricardian Rent *(Hard)*

Three farms produce wheat with different land quality:
- Farm A (best land): $C_A(y) = y^2$
- Farm B (medium land): $C_B(y) = 2y^2$
- Farm C (marginal land): $C_C(y) = 4y^2$

a) If the wheat price is $p = 20$, find each farm's profit-maximising output and profit.

b) What is the economic (Ricardian) rent earned by Farm A?

c) Suppose a land tax equal to Farm A's rent is imposed as a lump sum. Does this change Farm A's output? Explain why or why not.

---

## R Exercises

### Problem 13: Profit Maximisation in R

Use R to solve Problems 1 and 3 computationally. For each:

```r
# Define cost function and compute MC, AVC, AC
# Use uniroot() or optimise() to find profit-maximising output
# Plot profit as a function of output and mark the maximum
```

### Problem 14: Industry Supply and Equilibrium

Using the heterogeneous-cost industry from Problem 11:

```r
# Define supply functions for each farm type
# Construct industry supply by summing
# Plot supply and demand and mark equilibrium
# Calculate and display profits for each type
```
