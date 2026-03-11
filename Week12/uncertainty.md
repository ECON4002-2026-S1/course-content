
# Uncertainty

## Introduction
- Decisions made by economic agents can be decisions made under uncertainty.
- Uncertainty can be *quantifiable* (risk) or not (uncertainty).
- Examples: dry/wet crop season, encounter with a shark at Cottesloe beach, gains/losses by the ASX next week.

## Describing Risk
- Choice under risk can be viewed as a lottery.
- Probabilities can be objective (frequencies) or subjective (best guesses).
- The sum of probabilities over events that are mutually exclusive and exhaustive would add to 1.0.

## Example
- A farmer could decide to apply fertilizer to his crops, a decision that could lead to high or low profits depending on whether the season turns out to be wet or dry.

| Event         | Probability | Profit |
|---------------|-------------|--------|
| Wet season    | 0.5         | $450   |
| Dry season    | 0.5         | $50    |

- Expected profit: $E(\text{profit}) = 0.5 * \$450 + 0.5 * \$50 = \$250$

## Value of Information
- What would this farmer be willing to pay for perfect foresight?
- How much does the farmer's expected profit change with perfect information?

## Invest
- If the expected profit with fertilizer is the same as the profit without fertilizer, does it mean the farmer is indifferent between the two choices?
- Fertilizing is a **fair gamble** or **fair bet**, but people are not necessarily indifferent between fair bets.

## St. Petersburg Paradox
- Gamble: A fair coin is tossed until it comes up heads, at which point the player is paid $2^t$, where $t$ is the number of times the coin was flipped.
- $EV = \frac{1}{2}.2 + \frac{1}{4}.4 + \frac{1}{8}.8 + \ldots = \sum_{1}^{\infty} 1 = \infty$
- How much would you pay for the chance to play the game?

## Expected Utility
- People maximize **expected utility (EU)**, not expected value.
- $EU = \sum_{1} p_i \times u(v_i)$
- Example: If the utility function is $u(x) = 10\sqrt{x}$, the farmer's EU would be: $\frac{1}{2} u(450) + \frac{1}{2} u(50) = 141$
- The utility of a certain outcome (no fertilizer choice) is $u(250) = 158$
- Expected utility theory says the farmer should not fertilize.

## EU Theory
- Expected Utility at point $b$
- Certainty equivalent at point $e$: \$199
- Risk premium: $251 - 199 = 51$

## Exercise
- Solve the problem for a wet season probability of 0.9.
- EU at ______
- Certainty equivalent at ______
- Risk premium: ______

## Decision Maker Types
- **Risk averse**: unwilling to make a fair bet, concave utility function (diminishing MU).
- **Risk neutral**: willing to make a fair bet, linear utility function (constant MU).
- **Risk loving**: willing to make a fair bet, convex utility function (increasing MU).

## Further Reading
- Perloff chapter on Uncertainty for more details.
- People's behavior can be inconsistent with EU theory.

## Acknowledgments
- Amusement park image from [Unsplash](https://unsplash.com/@gregoirehervebazin)
- Petersburg image from [Unsplash](https://unsplash.com/photos/_UpHRv9o9Zo)

### Python Code for Expected Utility Diagram
```python
import numpy as np
import matplotlib.pyplot as plt

# Define utility function
def utility(x):
    return 10 * np.sqrt(x)

# Profits and probabilities
profits = [50, 450]
probabilities = [0.5, 0.5]

# Calculate expected utility
eu = sum(p * utility(pft) for p, pft in zip(probabilities, profits))

# Calculate certainty equivalent
# Solve for x in 10*sqrt(x) = eu
certainty_equivalent = (eu / 10) ** 2

# Calculate risk premium
risk_premium = 250 - certainty_equivalent

# Plotting
x = np.linspace(0, 500, 400)
y = utility(x)

plt.figure(figsize=(10, 6))
plt.plot(x, y, label='Utility Function: $u(x) = 10\sqrt{x}$')

# Mark points
plt.scatter(profits, [utility(pft) for pft in profits], color='red', label='Possible Outcomes')
plt.axhline(y=eu, color='green', linestyle='--', label=f'Expected Utility: {eu:.2f}')
plt.axvline(x=certainty_equivalent, color='orange', linestyle='--', 
           label=f'Certainty Equivalent: {certainty_equivalent:.2f}')

plt.title('Expected Utility and Certainty Equivalent')
plt.xlabel('Profit ($)')
plt.ylabel('Utility')
plt.legend()
plt.grid(True)
plt.show()

# Print results
eu, certainty_equivalent, risk_premium
```
