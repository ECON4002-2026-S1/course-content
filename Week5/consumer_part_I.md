```markdown
---
title: "Consumer Choice and Optimization in Economics"
author: "Atakelty Hailu"
date: "University of Western Australia"
output: github_document
---

# Consumer Choice (Part 1)

---

## Concepts Covered

- Consumer Preferences
- Preference Maps/ICs
- Utility Function
- Budget Constraint
- Consumer Choice (Optimal Consumption)
- Utility Maximization

---

## Economics of Consumer Behavior

Three key premises/assumptions underlying economic modeling of individual consumer behavior:

1. Consumers have **tastes** or **preferences** which determine the satisfaction they derive from the goods (and services) they consume.
2. Consumers have **budget constraints** which limit their choices.
3. Consumers **maximize** the satisfaction/pleasure/utility from consumption subject to their budget constraints.

---

## Preference Relation

- Economics uses **preference relations** to describe a consumer's ranking of bundles of goods (e.g., $\mathbf{x} \succcurlyeq \mathbf{y}$).
- A consumer may **weakly/strictly prefer** one bundle to another, or she might be **indifferent** between the two.

### Preference Characteristics

- **Completeness**: The consumer is able to rank any two bundles ($\mathbf{x} \succsim \mathbf{y}, \mathbf{x} \succ \mathbf{y}$ or $\mathbf{x} \sim \mathbf{y}$).
- **Transitivity**: Consumers are consistent or logical (e.g., if $\mathbf{x} \succsim \mathbf{y}$ and $\mathbf{y} \succsim \mathbf{z}$, then $\mathbf{x} \succsim \mathbf{z}$).
- **More is Better**: A bundle with more goods is at least as good as one with less (preferences are *monotonic* or *insatiable*).

### Extended List of Properties

- **Completeness (COM)**: $\mathbf{x} \succcurlyeq \mathbf{y}, \mathbf{y} \succcurlyeq \mathbf{x}$, or both ($\mathbf{x} \sim \mathbf{y}$).
- **Reflexivity (REF)**: $\mathbf{x} \succcurlyeq \mathbf{x}$.
- **Transitivity (TR)**: $\mathbf{x} \succcurlyeq \mathbf{y}$ and $\mathbf{y} \succcurlyeq \mathbf{z} \Rightarrow \mathbf{x} \succcurlyeq \mathbf{z}$.
- **Continuity (CON)**: $\{\mathbf{x} : \mathbf{x} \succcurlyeq \mathbf{y}\}$ is a CLOSED set.
- **Monotonicity**:
  - **Weak Monotonicity (WM)**: $\mathbf{x} \geq \mathbf{y} \Rightarrow \mathbf{x} \succcurlyeq \mathbf{y}$.
  - **Strict Monotonicity (SM)**: $\mathbf{x} > \mathbf{y}$ and $\mathbf{x} \neq \mathbf{y} \Rightarrow \mathbf{x} > \mathbf{y}$.

### Convexity

- **Convexity (CONV)**: If $\mathbf{x} \succsim \mathbf{z}$ and $\mathbf{y} \succsim \mathbf{z}$, then $\theta \mathbf{x} + (1 - \theta) \mathbf{y} \succsim \mathbf{z}$ for all $\theta \in [0, 1]$.
- **Strict Convexity (SCONV)**: If $\mathbf{x} \succsim \mathbf{z}$ and $\mathbf{y} \succsim \mathbf{z}$, then $\theta \mathbf{x} + (1 - \theta) \mathbf{y} \succ \mathbf{z}$ for all $\theta \in (0, 1)$.

---

## Preference Maps

- A consumer's preference can be summarized by an **indifference map**, which is the complete set of indifference curves (ICs) representing the consumer's preferences.
- An **indifference curve** depicts the combinations of commodities that are equally desirable to the consumer.

### Marginal Rate of Substitution (MRS)

- The **Marginal Rate of Substitution (MRS)** is the slope of the indifference curve.
- It indicates the rate at which a consumer is willing to substitute one commodity for another.
- Formula: $MRS = -\frac{MU_1}{MU_2}$.

---

## Utility

- **Utility Function**: $U(.)$ is a mapping from the commodity space $X \subset \mathbb{R}_{+}^{k}$ to the set of real numbers $\mathbb{R}$.
- Utility functions are **ordinal**, not **cardinal**: the ordering or ranking of utility values, not the actual levels, are important.

### Utility and Monotonic Transformation

- If $U(x_{1}, x_{2}, \ldots, x_{n})$ is a utility function representing a consumer's preferences, then so is any monotonic transformation of that function.

---

## Budget Constraint

- The budget constraint limits the bundles that the consumer can choose from, thus defining the opportunity set over which utility can be maximized.
- **Budget Line**: $Y = P_1 X_1 + P_2 X_2$.
- **Opportunity Set**: $Y \geq P_1 X_1 + P_2 X_2$.
- **Marginal Rate of Transformation (MRT)**: $MRT = -\frac{P_1}{P_2}$.

---

## Optimal Choices

- The utility-maximizing consumption bundle will always be on the highest indifference curve that touches the budget line.
- **Corner Solution**: Some commodities have zero levels of optimal consumption.
- **Interior Solution**: Positive amounts of all commodities consumed at the point of tangency between the budget line and IC.

### Interior Solution

- The budget constraint is tangent to the highest IC achievable.
- The consumer's MRS equals the slope of the budget line: $MRS = -\frac{P_1}{P_2}$.
- The last dollar spent on good 1 gives as much extra utility as the last dollar spent on good 2: $\frac{MU_1}{P_1} = \frac{MU_2}{P_2}$.

---

## Utility Maximization

- **General Form**:
  - Maximize: $U(\mathbf{x})$
  - Subject to: $\mathbf{p}\mathbf{x} \leq m$ (budget constraint), $\mathbf{x} \in X$ (in consumption set).

### Lagrangian Function

- **Lagrangian**: $\mathcal{L}(x, \lambda, m) = U(x) + \lambda (m - p x)$.
- **First Order Conditions (FOC)**: $\frac{\partial \mathcal{L}}{\partial x_i} = 0, \forall i = 1, \dots, n$, $\frac{\partial \mathcal{L}}{\partial \lambda} = 0$.

---

## Exercises

1. Draw the indifference curve going through $(X_{1} = 5, X_{2} = 10)$ and calculate the MRS at that point for the following:
   - $U = X_{1} + 2X_{2}$
   - $U = X_{1}X_{2}$
   - $U = \min\{X_{1}, X_{2}\}$

2. Derive the formula for the MRS for the following:
   - $U = X_1 + X_2$
   - $\ln U = 0.25 \ln X_1 + 0.75 \ln X_2$
   - $U = 3X_1X_2$

3. Simplify the following utility functions:
   - $U = \sqrt{0.25X_1 + 0.5X_2}$
   - $\ln U = 0.5 \ln X_1 + 0.5 \ln X_2$
   - $U = (X_1 X_2) + 100$

4. Draw the indifference curve for the utility function $U(x_{1},x_{2}) = 4x_{1}x_{2}$ for utility level $U = 40$.

5. Maximize the utility function $U(x_{1},x_{2}) = 4x_{1}x_{2}$ for the case where the consumer's income is $48 and the prices of the two commodities are $p_1 = \$2$ and $p_2 = \$1$.

---

# Homework 4

## Instructions

Do the readings identified below on consumer choice. Then provide answers to the questions below and upload your answers through the LMS. Hand-written and hand-drawn answers are acceptable as long as they are uploaded as PDF files through the LMS.

### Reading

Chapter 4 (Consumer Choice) in Perloff's (2018) "Microeconomics" book, available online through the UWA library system.

### Questions

1. Draw the indifference curve for utility level of 64 ($U = 64$) for each of the following utility functions ($X_1$ and $X_2$ are commodities consumed):
   - $U = X_1 X_2$
   - $U = \min\{X_1, X_2\}$

2. Calculate the marginal rate of substitution (MRS) for the two utility functions above for commodity consumption levels of $X_{1}=4$ and $X_{2}=16$. Write out the formula for MRS and show how you got the MRS value in the space provided.
   - $U=X_{1}X_{2} \implies MRS = \ldots$
   - $U=\min\{X_{1},X_{2}\} \implies MRS = \ldots$

3. Show what the optimal consumption choices would be for a consumer with an income of $72 if the prices for the two commodities $(X_{1},X_{2})$ s/he consumes are $3 and $4 per unit, respectively, and if the utility function is $U=X_{1}X_{2}$. Illustrate the solution graphically, marking clearly the budget constraint, the maximum achieved indifference curve, and the point of tangency between the two.

4. Would your answer to the question above change if the utility function is $U=\sqrt{X_{1}X_{2}}$? How about for $U=\ln(X_{1}X_{2})+12$? Explain your answer in one sentence.
```

