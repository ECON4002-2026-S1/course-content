# Week 11: Welfare Economics — Measuring Economic Well-Being

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Explain the foundations of welfare economics and the invisible hand
2. Calculate consumer surplus as a measure of consumer welfare
3. Calculate producer surplus as a measure of producer welfare
4. Analyze the welfare effects of price controls (ceilings and floors)
5. Distinguish between Marshallian and Hicksian welfare measures
6. Calculate Compensating Variation (CV) and Equivalent Variation (EV)
7. Apply the two fundamental theorems of welfare economics
8. Evaluate policies affecting different stakeholder groups

---

## 1. Foundations of Welfare Economics

### 1.1 Adam Smith and the Invisible Hand

Adam Smith's *The Wealth of Nations* (1776) articulated a profound insight:

> "Every individual... intends only his own gain, and he is in this... led by an invisible hand to promote an end which was no part of his intention."

**The invisible hand**: Markets coordinate self-interested behavior to produce socially beneficial outcomes—without central planning.

### 1.2 What is Welfare Economics?

**Welfare economics** studies:
- How to measure economic well-being
- Whether markets achieve efficient outcomes
- How policies affect different groups
- The trade-offs between efficiency and equity

```
┌─────────────────────────────────────────────────────────────────────┐
│                    WELFARE ECONOMICS FRAMEWORK                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   POSITIVE Analysis          NORMATIVE Analysis                      │
│   "What is?"                 "What ought to be?"                     │
│                                                                      │
│   • Measure CS, PS           • Evaluate policy desirability          │
│   • Calculate DWL            • Compare efficiency vs equity          │
│   • Predict effects          • Recommend interventions               │
│                                                                      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   KEY QUESTIONS:                                                     │
│   1. Is the market outcome efficient?                                │
│   2. Who gains and who loses from a policy?                          │
│   3. Is the total pie maximized?                                     │
│   4. How is the pie distributed?                                     │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### 1.3 Whose Welfare Counts?

Welfare analysis considers multiple stakeholders:

| Group | Welfare Measure | Considerations |
|-------|-----------------|----------------|
| Consumers | Consumer Surplus (CS) | Willingness to pay minus actual payment |
| Producers | Producer Surplus (PS) | Revenue minus variable costs |
| Government | Tax revenue / Subsidy cost | Budget impact |
| Third parties | Externality costs/benefits | Pollution, congestion, spillovers |
| Future generations | Discounted future welfare | Sustainability, resource depletion |

---

## 2. Consumer Surplus: Measuring Consumer Welfare

### 2.1 Willingness to Pay (WTP)

The **demand curve** reflects consumers' willingness to pay for each unit:

- First unit: High WTP (consumers who value it most)
- Additional units: Decreasing WTP (marginal consumers)

### 2.2 Definition of Consumer Surplus

**Consumer Surplus** = Total willingness to pay − Amount actually paid

$$CS = \int_0^{Q^*} P^d(Q) \, dQ - p^* \cdot Q^*$$

Or equivalently:
$$CS = \int_0^{Q^*} [P^d(Q) - p^*] \, dQ$$

### 2.3 Graphical Representation

```
    p │
      │╲
      │ ╲  Demand (WTP)
      │  ╲
      │   ╲╲╲╲╲╲  ← Consumer Surplus (CS)
      │    ╲╲╲╲╲╲    Area below demand,
  p*  ├─────────●───  above price
      │         │
      │         │
      └─────────┴────── Q
                Q*
```

### 2.4 Discrete Example

| Unit | WTP | Price | Surplus |
|------|-----|-------|---------|
| 1st  | $7  | $4    | $3      |
| 2nd  | $6  | $4    | $2      |
| 3rd  | $5  | $4    | $1      |
| 4th  | $4  | $4    | $0      |
| **Total** | | | **$6** |

### 2.5 Linear Demand Example

For inverse demand $P^d = a - bQ$ with equilibrium at $(Q^*, p^*)$:

$$CS = \frac{1}{2} \times (a - p^*) \times Q^*$$

**Example**: $P^d = 7 - Q$, equilibrium $p^* = 4$, $Q^* = 3$

$$CS = \frac{1}{2} \times (7 - 4) \times 3 = \frac{1}{2} \times 3 \times 3 = 4.5$$

---

## 3. Producer Surplus: Measuring Producer Welfare

### 3.1 Minimum Willingness to Accept

The **supply curve** reflects producers' minimum acceptable price:

- First unit: Low cost (most efficient producer)
- Additional units: Higher cost (marginal producers)

### 3.2 Definition of Producer Surplus

**Producer Surplus** = Revenue received − Minimum willing to accept

$$PS = p^* \cdot Q^* - \int_0^{Q^*} P^s(Q) \, dQ$$

Or equivalently:
$$PS = \int_0^{Q^*} [p^* - P^s(Q)] \, dQ$$

### 3.3 Relationship to Profit

$$PS = \pi + TFC$$

Producer surplus equals profit plus fixed costs. In the short run:
- PS = Revenue − Variable Costs
- Profit = Revenue − Total Costs = PS − Fixed Costs

### 3.4 Graphical Representation

```
    p │              S
      │             /
  p*  ├────────────●
      │   ╱╱╱╱╱╱╱╱│
      │  ╱╱╱╱╱╱╱╱ │  ← Producer Surplus (PS)
      │ ╱╱╱╱╱╱╱╱  │     Area above supply,
      │╱╱╱╱╱╱╱╱   │     below price
      └───────────┴────── Q
                  Q*
```

---

## 4. Net Social Welfare and Market Efficiency

### 4.1 Total Welfare

**Net Social Welfare** is the sum of all surpluses:

$$W = CS + PS$$

(With government: $W = CS + PS + \text{Government Revenue}$)

### 4.2 The Efficiency of Competitive Equilibrium

At the competitive equilibrium:
- Marginal benefit (demand) = Marginal cost (supply)
- All mutually beneficial trades occur
- No deadweight loss
- **Total welfare is maximized**

### 4.3 Numerical Example from Table

| Price | $Q^d$ | $Q^s$ |
|-------|-------|-------|
| 1     | 6     | 0     |
| 2     | 5     | 1     |
| 3     | 4     | 2     |
| 4     | 3     | 3     |
| 5     | 2     | 4     |
| 6     | 1     | 5     |
| 7     | 0     | 6     |

**Equilibrium**: $p^* = 4$, $Q^* = 3$

From the table, we can derive linear functions:
- Demand: $Q^d = 7 - p$ → Inverse: $P^d = 7 - Q$
- Supply: $Q^s = p - 1$ → Inverse: $P^s = 1 + Q$

**Consumer Surplus**:
$$CS = \frac{1}{2}(7-4)(3) = 4.5$$

**Producer Surplus**:
$$PS = \frac{1}{2}(4-1)(3) = 4.5$$

**Total Welfare**: $W = CS + PS = 4.5 + 4.5 = 9$

---

## 5. The Two Fundamental Theorems of Welfare Economics

### 5.1 First Welfare Theorem

> **First Fundamental Theorem**: Every competitive equilibrium is Pareto efficient.

**Pareto efficient**: No reallocation can make someone better off without making someone else worse off.

**Implications**:
- Markets "get it right" in terms of efficiency
- No central planner needed
- The invisible hand works

**Conditions required**:
- Perfect competition
- No externalities
- Complete markets
- Perfect information

### 5.2 Second Welfare Theorem

> **Second Fundamental Theorem**: Any Pareto efficient allocation can be achieved as a competitive equilibrium, given appropriate redistribution of initial endowments.

**Implications**:
- Efficiency and equity are separable problems
- Use markets for efficiency
- Use transfers (taxes/subsidies) for equity

**Practical challenge**: Lump-sum transfers are difficult; most redistribution creates distortions.

### 5.3 Efficiency vs Equity

```
┌─────────────────────────────────────────────────────────────────┐
│              EFFICIENCY VS EQUITY TRADE-OFF                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   Competitive equilibrium maximizes total surplus                │
│   BUT says nothing about distribution                            │
│                                                                  │
│   Example: Two outcomes with same total welfare                  │
│                                                                  │
│   Outcome A:  CS = 100, PS = 100  → W = 200                     │
│   Outcome B:  CS = 190, PS = 10   → W = 200                     │
│                                                                  │
│   Both are efficient, but distributional implications differ     │
│                                                                  │
│   "Economists' advice is not always politically palatable"       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 6. Welfare Effects of Price Controls

### 6.1 Price Ceiling (Maximum Price)

A **price ceiling** sets a maximum legal price below equilibrium: $p^c < p^*$

Using our example market ($P^d = 7 - Q$, $P^s = 1 + Q$, $p^* = 4$, $Q^* = 3$):

**Price ceiling $p^c = 3$**:
- Quantity supplied: $Q^s = 3 - 1 = 2$
- Quantity demanded: $Q^d = 7 - 3 = 4$
- **Shortage**: $4 - 2 = 2$ units
- Quantity traded: $Q^c = 2$ (limited by supply)

### 6.2 Welfare Analysis with Price Ceiling

```
    p │
    7 │╲
      │ ╲
      │  ╲ A
      │   ╲╲╲
    4 ├────╲─●──── p* (original equilibrium)
      │  B  ╲│╲ C
    3 ├──────●─╲── p^c (ceiling)
      │   D │ E╲
    1 ├─────┴───╲─ 
      │         │╲
      └─────────┴─┴── Q
              2  3

    Without ceiling: CS = A + B + C, PS = D + E
    With ceiling: CS = A + B + D, PS = E
```

**Welfare changes**:

| Component | Without | With Ceiling | Change |
|-----------|---------|--------------|--------|
| CS | A + B + C | A + B + D | +D − C |
| PS | D + E | E | −D |
| Total | A+B+C+D+E | A+B+D+E | −C |

**Deadweight loss** = C (triangle of lost trades)

**Numerical calculation**:
- Original: $CS = 4.5$, $PS = 4.5$, $W = 9$
- With ceiling ($Q^c = 2$):
  - $CS = \frac{1}{2}(7-3)(2) + \text{transfer}$... 
  
Let's calculate areas:
- Area A + B = $\frac{1}{2}(7-5)(2) + (5-3)(2) = 1 + 4 = 5$ → New CS
- Area E = $\frac{1}{2}(3-1)(2) = 2$ → New PS
- New W = 5 + 2 = 7
- **DWL = 9 - 7 = 2**

### 6.3 Price Ceiling with Perfectly Inelastic Supply

When supply is vertical (perfectly inelastic) at $\bar{Q}$:

```
    p │      │
      │      │ S (vertical)
  p*  ├──────●
      │   B  │
  p^c ├──────●
      │   C  │
      └──────┴────── Q
            Q̄
```

**Key result**: 
- No quantity change → **No deadweight loss**
- Pure transfer from PS to CS
- DWL = 0

This is relevant for:
- Short-run agricultural supply
- Housing in fixed supply
- Natural resources with fixed availability

---

## 7. Exact Welfare Measures: CV and EV

### 7.1 The Problem with Consumer Surplus

Consumer surplus (measured under Marshallian demand) is an **approximation** because:
- As prices change, real income changes
- This shifts the demand curve
- CS conflates substitution and income effects

**Exact measures** are based on **Hicksian (compensated) demand curves** that hold utility constant.

### 7.2 Compensating Variation (CV)

**Definition**: The income change at NEW prices needed to restore the consumer to their ORIGINAL utility level.

$$CV = e(p^1, u^0) - e(p^0, u^0) = e(p^1, u^0) - m$$

**Interpretation**:
- For price **increase**: CV > 0 (need compensation to maintain $u^0$)
- For price **decrease**: CV < 0 (would pay to keep the lower price)

### 7.3 Equivalent Variation (EV)

**Definition**: The income change at OLD prices that would have the same utility effect as the price change.

$$EV = e(p^0, u^1) - e(p^0, u^0) = e(p^0, u^1) - m$$

**Interpretation**:
- For price **decrease**: EV > 0 (equivalent to income gain)
- For price **increase**: EV < 0 (equivalent to income loss)

### 7.4 The Three Measures Compared

For a **price decrease** of a normal good:

$$|CV| < |\Delta CS| < |EV|$$

**Intuition**:
- CV: "How much would you pay?" (constrained by original utility)
- EV: "What's it worth to you?" (valued at new, higher utility)

### 7.5 Hicksian vs Marshallian Demand

```
    p │
      │
  p⁰  ├────────●────────────────
      │       /│╲ x^h(p, u⁰)
      │      / │ ╲    Hicksian at u⁰
      │     /  │  ╲
      │    /   │   ╲
  p¹  ├───●────┼────●─────────
      │  /│    │    │╲ x^m(p, m)
      │ / │    │    │ ╲  Marshallian
      │   │    │    │
      └───┴────┴────┴───── x₁
        x^h   x⁰    x^m
            (at u⁰) (at u¹)

    Areas under curves from p¹ to p⁰:
    - Under x^h(u⁰): CV
    - Under x^m: ΔCS  
    - Under x^h(u¹): EV
```

---

## 8. CV and EV Calculation: Worked Example

### 8.1 Setup

Utility function: $U = x_1 x_2$
Income: $m = 100$
Prices: $p_1^0 = 10$ → $p_1^1 = 5$, $p_2 = 5$

### 8.2 Step 1: Find Marshallian Demands and Utility

For Cobb-Douglas $U = x_1^{0.5} x_2^{0.5}$ (equivalent to $V = x_1 x_2$ by monotonic transformation):

$$x_1 = \frac{0.5m}{p_1}, \quad x_2 = \frac{0.5m}{p_2}$$

**Initial** (at $p_1^0 = 10$):
$$x_1^0 = \frac{50}{10} = 5, \quad x_2^0 = \frac{50}{5} = 10$$
$$u^0 = x_1^0 \cdot x_2^0 = 50$$

**Final** (at $p_1^1 = 5$):
$$x_1^1 = \frac{50}{5} = 10, \quad x_2^1 = \frac{50}{5} = 10$$
$$u^1 = x_1^1 \cdot x_2^1 = 100$$

### 8.3 Step 2: Expenditure Function

For $U = x_1 x_2$, the expenditure function is:
$$e(p_1, p_2, u) = 2\sqrt{u \cdot p_1 \cdot p_2}$$

### 8.4 Step 3: Calculate CV

CV = Cost of achieving $u^0$ at new prices − original income:
$$CV = e(p_1^1, p_2, u^0) - m = 2\sqrt{50 \cdot 5 \cdot 5} - 100$$
$$CV = 2\sqrt{1250} - 100 = 2(35.36) - 100 = 70.71 - 100 = -29.29$$

**Interpretation**: The consumer would pay up to $29.29 to secure this price decrease.

### 8.5 Step 4: Calculate EV

EV = Cost of achieving $u^1$ at old prices − original income:
$$EV = e(p_1^0, p_2, u^1) - m = 2\sqrt{100 \cdot 10 \cdot 5} - 100$$
$$EV = 2\sqrt{5000} - 100 = 2(70.71) - 100 = 141.42 - 100 = 41.42$$

**Interpretation**: The price decrease is equivalent to a $41.42 income increase.

### 8.6 Step 5: Compare with ΔCS

Using Marshallian demand $x_1 = 50/p_1$:
$$\Delta CS = \int_5^{10} \frac{50}{p_1} dp_1 = 50[\ln p_1]_5^{10} = 50(\ln 10 - \ln 5) = 50 \ln 2 \approx 34.66$$

### 8.7 Summary

| Measure | Value | Interpretation |
|---------|-------|----------------|
| CV | 29.29 | Maximum WTP for price decrease |
| ΔCS | 34.66 | Marshallian approximation |
| EV | 41.42 | Income equivalent of gain |

Confirms: $CV < \Delta CS < EV$ for normal good price decrease.

---

## 9. Applications in Agricultural and Resource Economics

### 9.1 Agricultural Price Supports

Welfare analysis of price floors in agricultural markets:

| Stakeholder | Effect of Price Support |
|-------------|-------------------------|
| Farmers | Gain from higher prices |
| Consumers | Lose from higher prices |
| Taxpayers | Lose if government buys surplus |
| Net welfare | Typically negative (DWL) |

### 9.2 Water Pricing

Underpriced water leads to:
- Overuse relative to efficient level
- Deadweight loss
- Environmental degradation

Welfare analysis guides pricing reform.

### 9.3 Environmental Valuation

CV and EV measure value of non-market goods:
- **CV**: WTP to preserve a wetland
- **EV**: Compensation required for environmental damage

---

## 10. Summary: Welfare Analysis Toolkit

### 10.1 Key Formulas

| Concept | Formula |
|---------|---------|
| Consumer Surplus | $CS = \int_0^Q [P^d(q) - p^*] dq$ |
| Producer Surplus | $PS = \int_0^Q [p^* - P^s(q)] dq$ |
| Total Welfare | $W = CS + PS$ (+ Gov if applicable) |
| DWL | $DWL = W_{free} - W_{policy}$ |
| CV | $CV = e(p^1, u^0) - m$ |
| EV | $EV = e(p^0, u^1) - m$ |

### 10.2 Key Relationships

- First Welfare Theorem: Competitive equilibrium → Pareto efficient
- Second Welfare Theorem: Any efficient allocation achievable via markets + redistribution
- For price decrease: $CV < \Delta CS < EV$ (normal goods)
- Price controls with elastic supply: Create DWL
- Price controls with inelastic supply: Pure transfer, no DWL

---

## R Code Integration

See `week11_code_snippets.json` for R implementations including:
- Consumer and producer surplus calculations
- Price ceiling/floor welfare analysis
- CV and EV calculations for Cobb-Douglas
- Graphical welfare decomposition

---

## Practice Problems

Work through the problems in `week11_practice.json`, which include:
- Surplus calculations from market data
- Price control welfare analysis
- CV, EV, and CS comparisons
- Agricultural policy applications
