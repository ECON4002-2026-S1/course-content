
# Measures of Economic Welfare

## Markets and Efficiency
- Adam Smith's *The Wealth of Nations* (1776) articulates the efficiency of market outcomes.
- The *invisible hand* of the market and its organizing power.

## Welfare Economics
- Focuses on net social (economic) benefits under different policy scenarios.
- Can be theoretical or quantitative, positive or normative.

## Equity
- Fundamental theorems in welfare economics: Theorems I & II.
- Economists' advice is not always politically palatable, leading to distortionary policies.

## Whose Benefits
- Consumers
- Producers
- Taxpayers/government
- Rest of society (including future generations, ecological values, and third-party effects)

## Consumer Welfare
- Willingness to Pay (WTP) is reflected in the demand curve.
- Consumer welfare measure: Consumer Surplus (CS).

## Producer Welfare
- Minimum willingness to accept for supply: Supply Curve.
- Producer Welfare: Producer Surplus (PS).

## Net Social Welfare
- Net social welfare (CS + PS) is maximized by equilibrium outcome.

## Exercise: Market Table

| Price | Qd  | Qs  |
|-------|-----|-----|
| 1     | 6.00| 0.00|
| 2     | 5.00| 1.00|
| 3     | 4.00| 2.00|
| 4     | 3.00| 3.00|
| 5     | 2.00| 4.00|
| 6     | 1.00| 5.00|
| 7     | 0.00| 6.00|

## Without Intervention
- $p* = 6$, $q* = 6$
- $CS = A + B + C$
- $PS = D + E + F$

## Price Ceiling
- Price ceiling of $p^c = 4$
- Supplied quantity: $q^c = 4$
- $CS = A + B + E$
- $PS = D$
- Deadweight loss: $C + F$

## Price Ceiling: Inelastic Supply
- Perfectly inelastic supply ($Q_s = 6$)
- Price ceiling of $p^c = 4$
- $CS = A + B$ (gain of $B$)
- $PS = C$
- Deadweight loss: Zero (complete transfer of $B$ from PS to CS)

## Exact Measures of Welfare
- Consumer Surplus (CS) is not an exact measure of economic welfare.
- Equivalent Variation (EV) and Compensating Variation (CV) are exact monetary measures of welfare.

## EV and CV
- EV: Change in income at current prices that is equivalent to a proposed change in terms of impact on utility.
- CV: Change in income at the new prices that is required to compensate the consumer for the change.
- EV and CV are consumer surplus measured along the Hicksian demand curves.

## Exercise: CV vs. EV
- Utility function: $U = X_1X_2$
- Income: $M = 100$
- Initial price of good 1: $P_1^0 = 10$
- New price of good 1: $P_1^1 = 5$
- Price of good 2: $P_2^0 = 5$

### Python Code for CV vs. EV Diagram
```python
import numpy as np
import matplotlib.pyplot as plt

# Define utility function
U = lambda x1, x2: x1 * x2

# Define budget constraints
M = 100
P1_0, P1_1 = 10, 5
P2_0 = 5

# Calculate optimal bundles
x1_0 = M / (2 * P1_0)
x2_0 = M / (2 * P2_0)
x1_1 = M / (2 * P1_1)
x2_1 = M / (2 * P2_0)

# Calculate utility levels
u0 = U(x1_0, x2_0)
u1 = U(x1_1, x2_1)

# Calculate CV and EV
cv = M - (P1_1 * x1_0 + P2_0 * x2_0)
ev = (M - (P1_0 * x1_1 + P2_0 * x2_1))

# Plotting
x1_values = np.linspace(0, 20, 400)
x2_values_u0 = u0 / x1_values
x2_values_u1 = u1 / x1_values

plt.figure(figsize=(10, 6))
plt.plot(x1_values, x2_values_u0, label=f'U = {u0:.2f} (Initial Utility)')
plt.plot(x1_values, x2_values_u1, label=f'U = {u1:.2f} (New Utility)')

# Budget lines
x2_bl0 = (M - P1_0 * x1_values) / P2_0
x2_bl1 = (M - P1_1 * x1_values) / P2_0

plt.plot(x1_values, x2_bl0, '--', label=f'Budget Line (P1 = {P1_0})')
plt.plot(x1_values, x2_bl1, '--', label=f'Budget Line (P1 = {P1_1})')

plt.xlim(0, 20)
plt.ylim(0, 20)
plt.xlabel('Good 1 (X1)')
plt.ylabel('Good 2 (X2)')
plt.title('CV vs. EV Diagram')
plt.legend()
plt.grid(True)
plt.show()

cv, ev
```
