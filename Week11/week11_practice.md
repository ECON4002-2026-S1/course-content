# Week 11: Practice Problems — Welfare Economics

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Problem 1: Consumer Surplus from Table (Basic)

A consumer's willingness to pay for units of a good is shown below:

| Unit | WTP ($) |
|------|---------|
| 1st  | 50      |
| 2nd  | 40      |
| 3rd  | 30      |
| 4th  | 20      |
| 5th  | 10      |

The market price is $25.

**(a)** How many units will the consumer purchase?

**(b)** Calculate the consumer's total expenditure.

**(c)** Calculate the consumer's total willingness to pay for the units purchased.

**(d)** Calculate consumer surplus.

---

## Problem 2: Producer Surplus from Table (Basic)

A producer's minimum acceptable price for each unit is:

| Unit | Min Price ($) |
|------|---------------|
| 1st  | 8             |
| 2nd  | 12            |
| 3rd  | 16            |
| 4th  | 20            |
| 5th  | 24            |

The market price is $18.

**(a)** How many units will the producer supply?

**(b)** Calculate the producer's total revenue.

**(c)** Calculate producer surplus.

---

## Problem 3: Market Equilibrium Welfare (Intermediate)

A market has:
- Demand: $Q^d = 7 - p$
- Supply: $Q^s = p - 1$

**(a)** Find the equilibrium price and quantity.

**(b)** Calculate consumer surplus at equilibrium.

**(c)** Calculate producer surplus at equilibrium.

**(d)** What is total welfare?

**(e)** Verify that this is the maximum possible welfare by calculating welfare at $Q = 2$ and $Q = 4$.

---

## Problem 4: Price Ceiling Analysis (Intermediate)

Using the market from Problem 3 ($Q^d = 7 - p$, $Q^s = p - 1$):

The government imposes a price ceiling of $p^c = 2$.

**(a)** What quantity is demanded at $p^c$?

**(b)** What quantity is supplied at $p^c$?

**(c)** What is the shortage?

**(d)** What quantity is actually traded?

**(e)** Calculate CS, PS, and total welfare under the ceiling.

**(f)** Calculate the deadweight loss.

---

## Problem 5: Price Floor Analysis (Intermediate)

Same market: $Q^d = 7 - p$, $Q^s = p - 1$.

The government imposes a price floor of $p^f = 5$.

**(a)** What quantity is demanded at $p^f$?

**(b)** What quantity is supplied at $p^f$?

**(c)** What is the surplus (excess supply)?

**(d)** If only the demanded quantity is traded, calculate CS, PS, and DWL.

**(e)** If the government purchases the surplus at $p^f$, what is the government expenditure?

---

## Problem 6: Inelastic Supply Price Ceiling (Intermediate)

A market has:
- Demand: $Q^d = 10 - p$
- Supply: $Q^s = 4$ (perfectly inelastic)

**(a)** Find the equilibrium price.

**(b)** Calculate CS and PS at equilibrium.

**(c)** A price ceiling of $p^c = 4$ is imposed. Find the new CS and PS.

**(d)** What is the deadweight loss?

**(e)** Explain why the answer to (d) differs from cases with elastic supply.

---

## Problem 7: CV and EV Calculation — Cobb-Douglas (Advanced)

A consumer has utility $U = x_1 x_2$ and income $m = 100$.

Initial prices: $p_1^0 = 10$, $p_2 = 5$
New prices: $p_1^1 = 5$, $p_2 = 5$

**(a)** Find the initial optimal bundle and utility level.

**(b)** Find the new optimal bundle and utility level.

**(c)** Write the expenditure function for this utility.

**(d)** Calculate CV (Compensating Variation).

**(e)** Calculate EV (Equivalent Variation).

**(f)** Calculate ΔCS using the Marshallian demand.

**(g)** Verify that CV < ΔCS < EV.

---

## Problem 8: CV and EV — Price Increase (Advanced)

Using the same utility $U = x_1 x_2$ and $m = 100$, $p_2 = 5$:

Now consider a price **increase** from $p_1^0 = 5$ to $p_1^1 = 10$.

**(a)** Find initial and final utility levels.

**(b)** Calculate CV. Interpret the sign.

**(c)** Calculate EV. Interpret the sign.

**(d)** Calculate ΔCS.

**(e)** Verify the relationship between CV, ΔCS, and EV for a price increase.

---

## Problem 9: Welfare Theorems Application (Conceptual)

**(a)** State the First Fundamental Theorem of Welfare Economics.

**(b)** List three conditions required for the First Theorem to hold.

**(c)** State the Second Fundamental Theorem of Welfare Economics.

**(d)** A competitive equilibrium results in CS = 1000, PS = 100. A policy could change this to CS = 550, PS = 550. 
   - Which outcome is Pareto efficient?
   - Which might be preferred on equity grounds?

**(e)** Why is "economists' advice not always politically palatable"?

---

## Problem 10: Agricultural Price Support (Application)

The wheat market has:
- Demand: $Q^d = 100 - 2p$
- Supply: $Q^s = 3p - 50$

**(a)** Find the free market equilibrium.

**(b)** Calculate CS, PS, and total welfare.

The government introduces a price floor at $p^f = 35$ and purchases any surplus.

**(c)** Find quantity demanded and supplied at $p^f$.

**(d)** Calculate the government's expenditure on purchasing surplus.

**(e)** Calculate the new CS, PS, and welfare (including government cost as a welfare loss).

**(f)** What is the net welfare change from this policy?

---

## Problem 11: Comparing Welfare Measures (Application)

A consumer has utility $U = x^{0.5}y^{0.5}$, income $m = 200$, and faces a price decrease in good $x$ from $p_x = 4$ to $p_x = 1$ (with $p_y = 1$ unchanged).

**(a)** This is a 75% price reduction. Would you expect the difference between CV, ΔCS, and EV to be large or small? Why?

**(b)** Calculate the initial and final consumption bundles.

**(c)** Calculate CV, ΔCS, and EV.

**(d)** Which measure would you recommend for cost-benefit analysis of a policy causing this price change?

---

## Problem 12: R Implementation (Computational)

Write R functions to:

**(a)** Calculate CS and PS given linear demand $P^d = a - bQ$ and supply $P^s = c + dQ$.

**(b)** Analyze the welfare effects of a price ceiling, returning original welfare, new welfare, and DWL.

**(c)** Calculate CV and EV for Cobb-Douglas utility $U = x_1^\alpha x_2^{1-\alpha}$ given a price change.

Test with: $P^d = 10 - Q$, $P^s = 2 + Q$, price ceiling at $p^c = 4$.

---

## Solutions Summary

| Problem | Key Results |
|---------|-------------|
| 1 | Buy 3 units, CS = $45 |
| 2 | Supply 3 units, PS = $18 |
| 3 | $p^* = 4$, $Q^* = 3$, CS = PS = 4.5, W = 9 |
| 4 | Ceiling: Q traded = 1, DWL = 4 |
| 5 | Floor: Q traded = 2, DWL + gov cost |
| 6 | Inelastic supply: DWL = 0, pure transfer |
| 7 | CV = -29.29, ΔCS = 34.66, EV = 41.42 |
| 8 | For price increase: CV > ΔCS > EV |
| 9 | Both efficient; distribution differs |
| 10 | Price support creates DWL + fiscal cost |
