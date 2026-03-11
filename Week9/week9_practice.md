# Week 9: Practice Problems — Market Equilibrium

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Problem 1: Demand Aggregation (Basic)

Two consumers have individual demand curves:
- Consumer 1: $Q_1^d = 12 - 2p$
- Consumer 2: $Q_2^d = 10 - p$

**(a)** At what price does Consumer 1 drop out of the market?

**(b)** Derive the aggregate demand curve (specify any kinks).

**(c)** Calculate total quantity demanded at $p = 4$.

---

## Problem 2: Supply Aggregation (Basic)

100 identical wheat farmers each have supply curve $y_i = 3p - 6$ for $p \geq 2$.

**(a)** What is the shutdown price for an individual farmer?

**(b)** Derive the market supply curve.

**(c)** At $p = 5$, what is the total market supply?

---

## Problem 3: Market Equilibrium (Intermediate)

Market demand: $Q^d = 22 - 3p$  
Market supply: $Q^s = p - 3$ (for $p \geq 3$)

**(a)** Solve for equilibrium price and quantity.

**(b)** Verify that supply equals demand at your solution.

**(c)** What happens if the price were $p = 7$? Describe the market adjustment process.

---

## Problem 4: Consumer and Producer Surplus (Intermediate)

Using the market from Problem 3 ($Q^d = 22 - 3p$, $Q^s = p - 3$):

**(a)** Write the inverse demand and supply functions.

**(b)** Calculate consumer surplus at equilibrium.

**(c)** Calculate producer surplus at equilibrium.

**(d)** What is total welfare?

---

## Problem 5: Tax Analysis (Intermediate)

Original market: $Q^d = 100 - 5p$, $Q^s = 3p - 20$ (for $p \geq 6.67$)

**(a)** Find the original equilibrium.

**(b)** A tax of $t = 4$ per unit is imposed on sellers. Find the new equilibrium (prices paid by buyers, received by sellers, and quantity).

**(c)** Calculate tax revenue.

**(d)** Calculate deadweight loss.

---

## Problem 6: Subsidy Analysis (Intermediate)

Using the original market from Problem 5 ($Q^d = 100 - 5p$, $Q^s = 3p - 20$):

The government provides a subsidy of $s = 2$ per unit to producers.

**(a)** Find the new equilibrium prices (buyer pays, seller receives) and quantity.

**(b)** Calculate the total subsidy cost to the government.

**(c)** Calculate the change in consumer surplus.

**(d)** Calculate the change in producer surplus.

**(e)** Is there deadweight loss? Explain.

---

## Problem 7: Long-Run Equilibrium with Entry/Exit (Advanced)

Each firm in a competitive industry has cost function: $C(y) = 1 + y^2$

Market demand is: $Q^d = 22 - 3p$

**(a)** Find each firm's MC, AC, and the output that minimizes AC.

**(b)** What is the long-run equilibrium price?

**(c)** How many units does each firm produce in long-run equilibrium?

**(d)** What is the total market quantity at the long-run price?

**(e)** How many firms operate in the long-run?

**(f)** Verify that each firm earns zero economic profit.

---

## Problem 8: Short-Run vs Long-Run (Advanced)

Consider the same market as Problem 7. Initially there are only 5 firms in the industry.

**(a)** With 5 firms and supply curve $y_i = p/2$ for each, find the short-run equilibrium price and quantity.

**(b)** Calculate each firm's profit in this short-run equilibrium.

**(c)** Will firms enter or exit? Explain.

**(d)** Describe the adjustment process toward long-run equilibrium.

---

## Problem 9: Agricultural Market Application (Advanced)

The Australian barley market can be characterized as:
- Domestic demand: $Q^d = 8 - 0.5p$ (million tonnes, p in $100/tonne)
- Domestic supply: $Q^s = p - 2$ (active for $p \geq 2$)

**(a)** Find the free-market equilibrium price and quantity.

**(b)** Calculate consumer and producer surplus.

**(c)** The government introduces a price floor at $p = 5$ (i.e., $\$500$/tonne). What quantity is demanded and supplied at this price?

**(d)** If the government purchases all excess supply at $p = 5$, what is the cost to the government?

**(e)** Calculate the deadweight loss from this intervention.

---

## Problem 10: Welfare Theorem Application (Conceptual)

Explain why the following situations represent departures from the First Welfare Theorem's conditions, and predict the direction of the inefficiency:

**(a)** A single company controls 80% of the fertilizer market.

**(b)** A factory pollutes a river used by downstream farmers for irrigation.

**(c)** Farmers cannot observe the quality of seeds before purchase.

**(d)** It takes 6 months and significant legal fees to enforce a grain contract.

---

## Problem 11: Numerical Demand Aggregation (Computational)

Three consumers have demand functions:
- Consumer A: $Q_A = 20 - 4p$ for $p \leq 5$
- Consumer B: $Q_B = 15 - 3p$ for $p \leq 5$  
- Consumer C: $Q_C = 8 - p$ for $p \leq 8$

**(a)** At what prices do consumers A and B exit the market?

**(b)** Write out the aggregate demand function, carefully specifying the price ranges.

**(c)** Graph the aggregate demand curve, marking any kink points.

---

## Problem 12: R Implementation (Computational)

Write R functions to:

**(a)** Find market equilibrium given linear demand ($Q^d = a - bp$) and supply ($Q^s = c + dp$).

**(b)** Calculate consumer and producer surplus at equilibrium.

**(c)** Analyze the effect of a per-unit tax $t$ on equilibrium and welfare.

Test your functions with: $a = 100$, $b = 2$, $c = -20$, $d = 3$, $t = 5$.

---

## Solutions Summary

| Problem | Key Result |
|---------|------------|
| 1 | Aggregate: $Q^d = 22 - 3p$ for $p \leq 6$; kink at $p = 6$ |
| 2 | Market supply: $S = 300p - 600$ for $p \geq 2$ |
| 3 | $p^* = 6.25$, $Q^* = 3.25$ |
| 4 | $CS = 1.76$, $PS = 5.28$, $W = 7.04$ |
| 5 | With tax: $p_b = 17$, $p_s = 13$, $Q_t = 15$; DWL exists |
| 6 | Subsidy increases Q above efficient level; DWL > 0 |
| 7 | $p^{LR} = 2$, $y^* = 1$, $n = 16$ firms |
| 8 | SR: $\pi > 0$; entry occurs; converges to LR |
| 9 | Free market: $p^* = 6.67$; with floor at 5: surplus |
| 10 | Each represents a market failure condition |
