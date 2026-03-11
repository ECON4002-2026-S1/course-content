# Week 12: Decision Making Under Uncertainty

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Distinguish between risk (quantifiable uncertainty) and true uncertainty
2. Calculate expected value and explain why it may not guide decisions
3. Apply expected utility theory to analyze decisions under risk
4. Calculate certainty equivalents and risk premiums
5. Classify decision makers by risk attitude (averse, neutral, loving)
6. Analyze agricultural decisions involving weather, price, and yield risk
7. Calculate the value of information for risky decisions
8. Apply risk concepts to insurance, crop choice, and resource management

---

## 1. Introduction: Why Uncertainty Matters

### 1.1 The Nature of Economic Decisions

Most decisions faced by economic agents—especially in agriculture and natural resources—are made **under uncertainty**:

| Domain | Sources of Uncertainty |
|--------|------------------------|
| **Agriculture** | Weather, pest outbreaks, commodity prices, input costs |
| **Fisheries** | Stock abundance, recruitment, catch rates, market prices |
| **Mining** | Ore grades, extraction costs, commodity prices, regulations |
| **Water** | Rainfall, streamflow, allocation decisions, demand |
| **Environment** | Climate change impacts, ecosystem responses, policy shifts |

### 1.2 Risk vs. Uncertainty: The Knight Distinction

**Frank Knight (1921)** distinguished between:

- **Risk**: Outcomes are uncertain but probabilities are *known* (or can be estimated)
  - Example: Probability of a dry season based on historical climate data
  
- **Uncertainty**: Outcomes are uncertain and probabilities are *unknown* or cannot be meaningfully assigned
  - Example: Probability of a completely novel regulatory change

In this course, we focus primarily on **risk**—situations where we can assign probabilities to outcomes.

### 1.3 Framing Risky Decisions as Lotteries

A **lottery** is a formal representation of a risky prospect:

$$L = \{(x_1, p_1), (x_2, p_2), \ldots, (x_n, p_n)\}$$

where:
- $x_i$ = outcome $i$ (e.g., profit, wealth)
- $p_i$ = probability of outcome $i$
- $\sum_{i=1}^{n} p_i = 1$ (probabilities are exhaustive)
- Outcomes are mutually exclusive

**Types of probabilities:**

| Type | Source | Example |
|------|--------|---------|
| **Objective** | Relative frequencies from data | 30% of years are drought years (60-year record) |
| **Subjective** | Best guesses, expert judgment | 20% chance of new export restrictions next year |

---

## 2. Expected Value: A First Approach

### 2.1 Definition

The **expected value (EV)** of a lottery is the probability-weighted average of outcomes:

$$EV = E[X] = \sum_{i=1}^{n} p_i \cdot x_i$$

### 2.2 Farmer Fertilizer Example

A wheat farmer considers whether to apply nitrogen fertilizer. The decision depends on rainfall:

| Season | Probability | Profit with Fertilizer | Profit without Fertilizer |
|--------|-------------|------------------------|---------------------------|
| Wet    | 0.5         | $450                   | $300                      |
| Dry    | 0.5         | $50                    | $200                      |

**Expected profit WITH fertilizer:**
$$E[\pi_{fert}] = 0.5 \times 450 + 0.5 \times 50 = 225 + 25 = \$250$$

**Expected profit WITHOUT fertilizer:**
$$E[\pi_{no}] = 0.5 \times 300 + 0.5 \times 200 = 150 + 100 = \$250$$

Both strategies have the same expected profit. Should the farmer be *indifferent*?

### 2.3 The Problem with Expected Value

**Observation**: Fertilizing involves greater variance:
- Fertilizer: outcomes are $50 or $450 (range = $400)
- No fertilizer: outcomes are $200 or $300 (range = $100)

**Most people prefer the less risky option when expected values are equal.**

This is the concept of a **fair gamble** (or fair bet): a gamble with expected value of zero (or equal to the status quo). Most people are unwilling to accept fair gambles.

### 2.4 The St. Petersburg Paradox

The inadequacy of expected value was demonstrated by the **St. Petersburg Paradox** (Bernoulli, 1738):

**The Game:**
- A fair coin is tossed until heads appears
- If heads appears on toss $t$, you receive $2^t$ dollars
- Payoffs: $2 (1st toss), $4 (2nd), $8 (3rd), $16 (4th), ...

**Expected Value:**
$$EV = \frac{1}{2}(2) + \frac{1}{4}(4) + \frac{1}{8}(8) + \ldots = 1 + 1 + 1 + \ldots = \infty$$

**The Paradox:** Despite infinite expected value, most people would pay only $10-20 to play.

**Implication:** People don't maximize expected value—they must be maximizing something else.

---

## 3. Expected Utility Theory

### 3.1 The von Neumann-Morgenstern Framework

**Expected Utility (EU) Theory** proposes that rational decision makers maximize the expected value of a **utility function** over outcomes:

$$EU = E[u(X)] = \sum_{i=1}^{n} p_i \cdot u(x_i)$$

Key insight: Transform outcomes through a utility function $u(\cdot)$ *before* taking expectations.

### 3.2 Properties of Utility Functions

The utility function $u(x)$ has these properties:

1. **Monotonicity**: More is better → $u'(x) > 0$
2. **Risk attitude**: Curvature determines attitude toward risk
3. **Cardinality**: Only defined up to positive affine transformations

### 3.3 Solving the St. Petersburg Paradox

Using $u(x) = \ln(x)$:

$$EU = \sum_{t=1}^{\infty} \frac{1}{2^t} \ln(2^t) = \sum_{t=1}^{\infty} \frac{t \ln 2}{2^t} = 2\ln 2 \approx 1.39$$

A finite expected utility! The certainty equivalent is $e^{1.39} \approx \$4$.

### 3.4 Farmer Example with Expected Utility

Suppose the farmer has utility function $u(x) = 10\sqrt{x}$:

**With fertilizer:**
$$EU_{fert} = 0.5 \times 10\sqrt{450} + 0.5 \times 10\sqrt{50}$$
$$= 0.5 \times 212.13 + 0.5 \times 70.71 = 106.07 + 35.36 = 141.42$$

**Without fertilizer:**
$$EU_{no} = 0.5 \times 10\sqrt{300} + 0.5 \times 10\sqrt{200}$$
$$= 0.5 \times 173.21 + 0.5 \times 141.42 = 86.60 + 70.71 = 157.31$$

**Decision:** $EU_{no} > EU_{fert}$ → The farmer should NOT fertilize.

**Utility of certain $250:**
$$u(250) = 10\sqrt{250} = 158.11$$

This exceeds $EU_{fert} = 141.42$, confirming the farmer prefers certainty.

---

## 4. Certainty Equivalent and Risk Premium

### 4.1 Certainty Equivalent (CE)

The **certainty equivalent** is the guaranteed amount that yields the same utility as the risky lottery:

$$u(CE) = EU \implies CE = u^{-1}(EU)$$

**For the fertilizer lottery:**
$$10\sqrt{CE} = 141.42 \implies \sqrt{CE} = 14.142 \implies CE = 200$$

The farmer is indifferent between:
- The risky fertilizer lottery (50% chance of $50, 50% chance of $450)
- A guaranteed $200

### 4.2 Risk Premium (RP)

The **risk premium** is the amount the decision maker would pay to eliminate risk:

$$RP = E[X] - CE$$

**For the fertilizer lottery:**
$$RP = 250 - 200 = \$50$$

The farmer would pay up to $50 to convert the risky prospect ($50 or $450) into a certain $200.

### 4.3 Graphical Interpretation

```
  u(x)
    │                              ●━━━━ u(450) = 212
    │                           ╱
    │                        ╱
    │ u(250) = 158 ━━━●━━━╱━━━━━━━━━━━━━━━━━━━━
    │                ╱│
    │ EU = 141 ─────╱─┼───────●────────────────
    │            ╱   │       ╱│
    │         ╱     │     ╱  │
    │      ╱        │   ╱    │
    │   ●━━━━━━━━━━━│━╱━━━━━━│━━━━ u(50) = 71
    │ ╱             │╱       │
    │╱              ●        ●
    └───────────────┴────────┴────────────────── x
                   CE=200   EV=250    450
    
    Chord between u(50) and u(450) lies below curve
    Risk Premium = EV - CE = 250 - 200 = 50
```

The **chord** connecting the utility at the two outcomes lies *below* the utility curve—this is the graphical signature of **risk aversion**.

---

## 5. Risk Attitudes

### 5.1 Three Types of Decision Makers

| Risk Attitude | Utility Shape | $u''(x)$ | Behavior |
|---------------|---------------|----------|----------|
| **Risk Averse** | Concave | $u'' < 0$ | Rejects fair gambles; $CE < EV$ |
| **Risk Neutral** | Linear | $u'' = 0$ | Indifferent to fair gambles; $CE = EV$ |
| **Risk Loving** | Convex | $u'' > 0$ | Accepts fair gambles; $CE > EV$ |

### 5.2 Mathematical Characterization

**Risk aversion** is equivalent to:
1. **Concave utility**: $u''(x) < 0$ (diminishing marginal utility)
2. **Jensen's Inequality**: $E[u(X)] < u(E[X])$ for non-degenerate X
3. **Positive risk premium**: $RP > 0$
4. **Fair gamble rejection**: Declines any gamble with $E[\Delta W] = 0$

### 5.3 Common Utility Functions

| Name | Form | Risk Attitude | Notes |
|------|------|---------------|-------|
| Square root | $u(x) = \sqrt{x}$ | Risk averse | Decreasing absolute RA |
| Logarithmic | $u(x) = \ln(x)$ | Risk averse | Constant relative RA |
| Exponential | $u(x) = -e^{-ax}$ | Risk averse | Constant absolute RA |
| Quadratic | $u(x) = x - bx^2$ | Risk averse | Increasing absolute RA (less realistic) |
| Linear | $u(x) = x$ | Risk neutral | Expected value maximizer |
| Power | $u(x) = x^\gamma$ | Depends on $\gamma$ | $\gamma < 1$: averse; $\gamma > 1$: loving |

### 5.4 Measures of Risk Aversion

**Arrow-Pratt Absolute Risk Aversion (ARA):**
$$A(x) = -\frac{u''(x)}{u'(x)}$$

**Arrow-Pratt Relative Risk Aversion (RRA):**
$$R(x) = -\frac{x \cdot u''(x)}{u'(x)} = x \cdot A(x)$$

**Example for $u(x) = \ln(x)$:**
- $u'(x) = 1/x$, $u''(x) = -1/x^2$
- $A(x) = -(-1/x^2)/(1/x) = 1/x$ → Decreasing ARA
- $R(x) = x \cdot (1/x) = 1$ → Constant RRA

**Economic implication**: With CRRA utility, the percentage of wealth allocated to risky assets is constant regardless of wealth level.

---

## 6. The Value of Information

### 6.1 Perfect Information

**Value of Perfect Information (VPI)**: The maximum amount a decision maker would pay to know the true state *before* making a decision.

**Setup:**
- Without information: Choose action that maximizes EU given prior probabilities
- With information: Choose optimal action *conditional* on each state

### 6.2 Farmer Example: Value of Weather Forecast

Suppose the farmer faces the fertilizer decision from before:

| Season | Prob | Profit (Fert) | Profit (No Fert) | Optimal |
|--------|------|---------------|------------------|---------|
| Wet | 0.5 | $450 | $300 | Fertilize |
| Dry | 0.5 | $50 | $200 | Don't fertilize |

**Without information:**
- If fertilize: $EU = 141.42$ (from earlier)
- If don't: $EU = 157.31$
- Optimal: Don't fertilize → $EU = 157.31$

**With perfect information:**
- If Wet → Fertilize → $u(450) = 212.13$
- If Dry → Don't → $u(200) = 141.42$
- $EU_{PI} = 0.5 \times 212.13 + 0.5 \times 141.42 = 176.78$

**Value of Perfect Information:**
$$VPI = CE_{PI} - CE_{no\_info}$$

First, find certainty equivalents:
- $CE_{no\_info}$: $10\sqrt{CE} = 157.31 → CE = 247.5$
- $CE_{PI}$: $10\sqrt{CE} = 176.78 → CE = 312.5$

$$VPI = 312.5 - 247.5 = \$65$$

The farmer would pay up to $65 for perfect weather forecasting.

### 6.3 Imperfect Information

In practice, information is imperfect. The farmer might have access to a seasonal forecast with:
- 80% accuracy when predicting wet season
- 70% accuracy when predicting dry season

The value of such imperfect information lies between zero and VPI, calculated using Bayesian updating of probabilities.

---

## 7. Applications in Agricultural and Resource Economics

### 7.1 Crop Insurance

**Problem:** Farmers face yield risk from weather, pests, and disease.

**Insurance contract:**
- Premium: $P$ (paid upfront)
- Indemnity: Pays $(Y^* - Y)$ if yield $Y < Y^*$ (guaranteed yield)

**Expected utility with insurance:**
$$EU_{ins} = \sum_i p_i \cdot u(Revenue_i - P + \max(0, Y^* - Y_i) \times Price)$$

**Fair premium:**
$$P_{fair} = E[\text{Indemnity}] = \sum_i p_i \cdot \max(0, Y^* - Y_i) \times Price$$

**Key result:** Risk-averse farmers are willing to pay *more* than the fair premium. The difference represents the **risk premium** they're willing to pay for certainty.

### 7.2 Example: Wheat Crop Insurance

| Weather | Prob | Yield (t/ha) | Revenue (@$300/t) |
|---------|------|--------------|-------------------|
| Good | 0.4 | 3.0 | $900 |
| Average | 0.4 | 2.0 | $600 |
| Drought | 0.2 | 0.5 | $150 |

**Without insurance ($u(x) = \sqrt{x}$):**
$$EU = 0.4\sqrt{900} + 0.4\sqrt{600} + 0.2\sqrt{150} = 12 + 9.80 + 2.45 = 24.25$$
$$CE = 24.25^2 = \$588$$

**Insurance contract:** Guarantees 2 t/ha, premium $P$

| Weather | Yield | Indemnity | Net Revenue |
|---------|-------|-----------|-------------|
| Good | 3.0 | $0 | $900 - P |
| Average | 2.0 | $0 | $600 - P |
| Drought | 0.5 | $450 | $600 - P |

**Fair premium:**
$$P_{fair} = 0.2 \times 450 = \$90$$

**With fair insurance ($P = 90$):**
$$EU_{ins} = 0.4\sqrt{810} + 0.4\sqrt{510} + 0.2\sqrt{510} = 11.38 + 9.03 + 4.52 = 24.93$$
$$CE_{ins} = 24.93^2 = \$622$$

**Welfare gain from insurance:** $622 - 588 = \$34

**Maximum willingness to pay for insurance:**
Solve for $P$ such that $EU_{ins} = EU_{no} = 24.25$:
$$0.4\sqrt{900-P} + 0.4\sqrt{600-P} + 0.2\sqrt{600-P} = 24.25$$

Solving numerically: $P_{max} \approx \$124$

The farmer would pay up to $124 - 90 = \$34$ above the fair premium.

### 7.3 Crop Portfolio Diversification

A farmer can allocate 100 hectares between two crops:

| | Wheat | Canola | Correlation |
|---|-------|--------|-------------|
| E[Return] | $400/ha | $500/ha | |
| Std Dev | $200 | $300 | ρ = 0.3 |

**Portfolio allocation:** $w$ hectares to wheat, $(100-w)$ to canola.

**Portfolio expected return:**
$$E[R_p] = w \times 400 + (100-w) \times 500$$

**Portfolio variance:**
$$\sigma_p^2 = w^2 \sigma_W^2 + (100-w)^2 \sigma_C^2 + 2w(100-w)\rho\sigma_W\sigma_C$$

**Optimal allocation** depends on risk preferences. A risk-averse farmer may choose $w^* > 0$ even though canola has higher expected return, to reduce variance.

### 7.4 Water Allocation Under Uncertainty

Water managers face uncertain inflows and must allocate water across agricultural and environmental uses.

**State-contingent framework:**
- States: High inflow ($s_H$), Low inflow ($s_L$)
- Probabilities: $\pi_H, \pi_L$
- Allocation: $w_a$ to agriculture, $w_e$ to environment

**Objective:**
$$\max_{w_a, w_e} \sum_s \pi_s [u_a(w_a(s)) + u_e(w_e(s))]$$

Subject to water availability in each state.

### 7.5 Fisheries and Precautionary Approach

Under stock uncertainty, regulators may adopt **precautionary** harvest rules:

**Risk-neutral approach:**
$$H^* = E[MSY]$$

**Risk-averse approach:**
$$H^* = E[MSY] - k \cdot \sigma_{MSY}$$

where $k > 0$ reflects risk aversion. This reduces expected catch but lowers the probability of stock collapse.

---

## 8. Advanced Topics

### 8.1 Mean-Variance Analysis

For decisions involving portfolios, if returns are normally distributed or utility is quadratic:

$$EU \approx E[W] - \frac{A}{2}\text{Var}(W)$$

where $A$ is absolute risk aversion.

**Implication:** Decision maker trades off expected return against variance, with the trade-off determined by risk aversion.

### 8.2 Stochastic Dominance

**First-Order Stochastic Dominance (FOSD):**
Lottery $A$ FOSD-dominates $B$ if $F_A(x) \leq F_B(x)$ for all $x$ (weakly higher probability of good outcomes).

**Second-Order Stochastic Dominance (SOSD):**
$A$ SOSD-dominates $B$ if $\int_{-\infty}^{x} F_A(t)dt \leq \int_{-\infty}^{x} F_B(t)dt$ for all $x$.

- FOSD: All decision makers (who prefer more) prefer $A$
- SOSD: All risk-averse decision makers prefer $A$

### 8.3 Behavioral Departures from EU Theory

Real behavior often violates EU theory:

| Phenomenon | Description | Example |
|------------|-------------|---------|
| **Certainty effect** | Overweight certain outcomes | Prefer sure $3,000 to 80% chance of $4,000 |
| **Loss aversion** | Losses loom larger than gains | Refuse fair 50/50 gamble of ±$100 |
| **Probability weighting** | Overweight small probabilities | Buy lottery tickets, over-insure rare events |
| **Framing effects** | Choice depends on presentation | "90% survival" vs "10% mortality" |

**Prospect Theory** (Kahneman & Tversky, 1979) addresses these by:
1. Evaluating outcomes relative to a reference point
2. Weighting probabilities non-linearly
3. Having a kinked value function (steeper for losses)

---

## 9. Summary: Key Concepts and Formulas

### 9.1 Core Formulas

| Concept | Formula |
|---------|---------|
| Expected Value | $EV = \sum_i p_i x_i$ |
| Expected Utility | $EU = \sum_i p_i u(x_i)$ |
| Certainty Equivalent | $u(CE) = EU \implies CE = u^{-1}(EU)$ |
| Risk Premium | $RP = EV - CE$ |
| Absolute Risk Aversion | $A(x) = -u''(x)/u'(x)$ |
| Relative Risk Aversion | $R(x) = -x \cdot u''(x)/u'(x)$ |

### 9.2 Risk Aversion Conditions (All Equivalent)

1. Concave utility function: $u''(x) < 0$
2. Positive risk premium: $RP > 0$
3. Certainty equivalent below expected value: $CE < EV$
4. Rejects fair gambles
5. Expected utility below utility of expected value: $E[u(X)] < u(E[X])$

### 9.3 Decision Framework

```
┌─────────────────────────────────────────────────────────────────────┐
│                     DECISION UNDER UNCERTAINTY                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  1. IDENTIFY states, outcomes, probabilities                         │
│                                                                      │
│  2. SPECIFY utility function u(x)                                    │
│                                                                      │
│  3. CALCULATE for each action a:                                     │
│        EU(a) = Σ pᵢ × u(xᵢ(a))                                       │
│                                                                      │
│  4. CHOOSE action with highest EU                                    │
│                                                                      │
│  5. INTERPRET via CE and RP                                          │
│        CE = u⁻¹(EU)                                                  │
│        RP = EV - CE                                                  │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 10. Exercises

### Exercise 1: Probability of Wet Season = 0.9

Repeat the farmer example with probability of wet season = 0.9 (instead of 0.5).

Using $u(x) = 10\sqrt{x}$:

**With Fertilizer:**
- $EU_{fert} = 0.9 \times 10\sqrt{450} + 0.1 \times 10\sqrt{50}$
- $EU_{fert} = 0.9 \times 212.13 + 0.1 \times 70.71 = 190.92 + 7.07 = 197.99$

**Certainty Equivalent:**
- $10\sqrt{CE} = 197.99 → CE = 392$

**Expected Value:**
- $EV = 0.9 \times 450 + 0.1 \times 50 = 405 + 5 = 410$

**Risk Premium:**
- $RP = 410 - 392 = 18$

**Interpretation:** With higher probability of wet season, fertilizer becomes more attractive. The risk premium is smaller because the outcome distribution is less dispersed (skewed toward the good outcome).

### Exercise 2: Insurance Loading

If an insurance company charges a 30% loading above the fair premium:
- Fair premium: $90 (from earlier example)
- Actual premium: $90 × 1.3 = $117

Would the farmer still buy insurance? Compare $EU_{ins}(P=117)$ to $EU_{no}$.

---

## R Code Integration

See `week12_code_snippets.json` for R implementations including:
- Expected utility calculations
- Certainty equivalent and risk premium
- Insurance demand analysis
- Crop portfolio optimization
- Value of information calculations
- Visualization of utility functions and risk attitudes

---

## Practice Problems

Work through the problems in `week12_practice.json`, which include:
- EU calculations with different utility functions
- CE and RP interpretations
- Insurance demand decisions
- Value of perfect and imperfect information
- Agricultural risk management applications

---

## References

- Perloff, J.M. (2018). *Microeconomics*, Chapter 17: Uncertainty.
- Varian, H. (2014). *Intermediate Microeconomics*, Chapter 12: Uncertainty.
- Knight, F.H. (1921). *Risk, Uncertainty, and Profit*.
- Hardaker, J.B. et al. (2015). *Coping with Risk in Agriculture*, 3rd ed.
- Kahneman, D. & Tversky, A. (1979). "Prospect Theory: An Analysis of Decision under Risk." *Econometrica*.
