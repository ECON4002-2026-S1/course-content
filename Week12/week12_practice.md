# Week 12: Decision Making Under Uncertainty — Practice Problems

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Learning Objectives

- Calculate expected value and expected utility
- Determine certainty equivalents and risk premiums
- Classify decision makers by risk attitude
- Analyze insurance demand decisions
- Calculate the value of information
- Apply risk concepts to agricultural decisions

---

## Problem 1: Expected Value Calculation (Basic)

A canola farmer faces uncertain prices at harvest. The distribution of prices is:
- $520/t with probability 0.3
- $480/t with probability 0.5  
- $400/t with probability 0.2

The farmer expects to harvest 200 tonnes.

**Calculate:**
(a) Expected price
(b) Expected revenue
(c) Variance of revenue

### Solution

**(a) Expected price:**
$$E[P] = 0.3(520) + 0.5(480) + 0.2(400) = 156 + 240 + 80 = \$476/t$$

**(b) Expected revenue:**
$$E[R] = 200 \times 476 = \$95,200$$

Alternative: $E[R] = 0.3(104,000) + 0.5(96,000) + 0.2(80,000) = \$95,200$

**(c) Variance of revenue:**

Revenues: $R_1 = \$104,000$, $R_2 = \$96,000$, $R_3 = \$80,000$

Deviations squared:
- $(104,000 - 95,200)^2 = 77,440,000$
- $(96,000 - 95,200)^2 = 640,000$
- $(80,000 - 95,200)^2 = 230,560,000$

$$\text{Var}(R) = 0.3(77,440,000) + 0.5(640,000) + 0.2(230,560,000) = 69,664,000$$

Standard deviation: $\sigma = \sqrt{69,664,000} \approx \$8,346$

---

## Problem 2: Expected Utility with Square Root (Basic)

A decision maker has utility function $u(x) = \sqrt{x}$ and faces a lottery: win $10,000 with probability 0.4, win $2,500 with probability 0.6.

**Calculate:**
(a) Expected value
(b) Expected utility
(c) Certainty equivalent
(d) Risk premium

### Solution

**(a) Expected Value:**
$$EV = 0.4(10,000) + 0.6(2,500) = 4,000 + 1,500 = \$5,500$$

**(b) Expected Utility:**
$$EU = 0.4 \times \sqrt{10,000} + 0.6 \times \sqrt{2,500} = 0.4(100) + 0.6(50) = 40 + 30 = 70$$

**(c) Certainty Equivalent:**
$$\sqrt{CE} = 70 \implies CE = 70^2 = \$4,900$$

**(d) Risk Premium:**
$$RP = EV - CE = 5,500 - 4,900 = \$600$$

**Interpretation:** The decision maker would accept $4,900 with certainty instead of the lottery. They would pay $600 to eliminate the risk.

---

## Problem 3: Expected Utility with Logarithmic Function (Intermediate)

An investor with utility $u(W) = \ln(W)$ and current wealth $50,000 considers an investment: gain $30,000 with probability 0.5, lose $10,000 with probability 0.5.

(a) Should they invest?
(b) What is the maximum they would pay for this opportunity?

### Solution

**(a) Investment Decision:**

$$EU_{\text{no invest}} = \ln(50,000) = 10.820$$

$$EU_{\text{invest}} = 0.5 \times \ln(80,000) + 0.5 \times \ln(40,000) = 0.5(11.290) + 0.5(10.597) = 10.943$$

Since $EU_{\text{invest}} > EU_{\text{no invest}}$ → **INVEST**

Note: $EV_{\text{gain}} = 0.5(30,000) + 0.5(-10,000) = \$10,000 > 0$ confirms investment is actuarially favorable.

**(b) Maximum Payment:**

Find $P$ such that $0.5 \times \ln(80,000 - P) + 0.5 \times \ln(40,000 - P) = \ln(50,000)$

CE of investment: $e^{10.943} = \$56,514$

Maximum payment: $CE - \text{current wealth} = 56,514 - 50,000 = \$6,514$

---

## Problem 4: Risk Attitudes from Utility Functions (Intermediate)

For each utility function, determine risk attitude and calculate ARA and RRA:

(a) $u(x) = x^2$
(b) $u(x) = -e^{-0.001x}$
(c) $u(x) = x^{0.5}$
(d) $u(x) = 100 + 5x$

### Solution

**(a) $u(x) = x^2$:**
- $u'(x) = 2x$, $u''(x) = 2 > 0$
- **Risk LOVING** (convex, $u'' > 0$)
- $A(x) = -2/(2x) = -1/x < 0$ (confirms risk loving)
- $R(x) = -x(2)/(2x) = -1$ (constant)

**(b) $u(x) = -e^{-0.001x}$:**
- $u'(x) = 0.001e^{-0.001x} > 0$, $u''(x) = -0.000001e^{-0.001x} < 0$
- **Risk AVERSE** (concave, $u'' < 0$)
- $A(x) = 0.001$ (constant) — CARA utility
- $R(x) = 0.001x$ (increasing with wealth)

**(c) $u(x) = x^{0.5}$:**
- $u'(x) = 0.5x^{-0.5}$, $u''(x) = -0.25x^{-1.5} < 0$
- **Risk AVERSE** (concave)
- $A(x) = 0.5/x$ (decreasing with wealth)
- $R(x) = 0.5$ (constant) — CRRA utility with $\gamma = 0.5$

**(d) $u(x) = 100 + 5x$:**
- $u'(x) = 5$, $u''(x) = 0$
- **Risk NEUTRAL** (linear)
- $A(x) = 0$, $R(x) = 0$

---

## Problem 5: Fair Gamble Analysis (Basic)

A farmer with wealth $100,000 and utility $u(W) = \sqrt{W}$ is offered a bet: win $44,000 with probability 0.5, lose $36,000 with probability 0.5.

(a) Is this a fair bet?
(b) Will the farmer accept?
(c) What is the risk premium for this gamble?

### Solution

**(a) Fair Bet?**
$$EV_{\text{gamble}} = 0.5(44,000) + 0.5(-36,000) = 22,000 - 18,000 = \$4,000$$

**NOT a fair bet** ($EV > 0$, favorable to gambler)

**(b) Decision:**
$$EU_{\text{no bet}} = \sqrt{100,000} = 316.23$$

$$EU_{\text{bet}} = 0.5 \times \sqrt{144,000} + 0.5 \times \sqrt{64,000} = 0.5(379.47) + 0.5(252.98) = 316.23$$

**INDIFFERENT** ($EU_{\text{bet}} = EU_{\text{no bet}}$)

Despite positive expected value, risk aversion exactly offsets the advantage.

**(c) Risk Premium:**
$$EV_{\text{with bet}} = 100,000 + 4,000 = \$104,000$$
$$CE_{\text{bet}} = 316.23^2 = \$100,000$$
$$RP = EV - CE = 104,000 - 100,000 = \$4,000$$

The farmer would need $4,000 compensation to accept this risk.

---

## Problem 6: Insurance Demand (Intermediate)

A sheep farmer has a flock worth $200,000. There is a 5% chance of disease causing $150,000 loss. With $u(W) = \ln(W)$:

(a) Calculate EU without insurance
(b) What is the fair premium?
(c) Will the farmer buy at fair premium?
(d) What is maximum premium they would pay?

### Solution

**(a) EU without insurance:**

Outcomes: No disease: $W = \$200,000$ (prob 0.95); Disease: $W = \$50,000$ (prob 0.05)

$$EU_{\text{no ins}} = 0.95 \times \ln(200,000) + 0.05 \times \ln(50,000) = 0.95(12.206) + 0.05(10.820) = 12.137$$

**(b) Fair premium:**
$$P_{\text{fair}} = 0.05 \times \$150,000 = \$7,500$$

**(c) Buy at fair premium?**

Wealth insured: $W = 200,000 - 7,500 = \$192,500$ (certain)

$$EU_{\text{insured}} = \ln(192,500) = 12.168$$

Since $EU_{\text{insured}} (12.168) > EU_{\text{no ins}} (12.137)$ → **YES, farmer buys at fair premium**

**(d) Maximum premium:**

Find $P$ where $\ln(200,000 - P) = 12.137$

$$200,000 - P = e^{12.137} = \$186,232$$
$$P_{\text{max}} = 200,000 - 186,232 = \$13,768$$

Maximum loading: $13,768/7,500 = 1.84$ (84% above fair premium)

---

## Problem 7: Value of Perfect Information (Intermediate)

A fruit grower must decide whether to apply expensive frost protection ($5,000 cost). Without protection, frost causes $40,000 damage. Frost probability is 0.2. With $u(W) = \sqrt{W}$ and initial wealth $100,000$:

(a) Find optimal decision without forecast
(b) Calculate value of perfect frost forecast

### Solution

**(a) Optimal decision without forecast:**

$$EU_{\text{no protect}} = 0.8 \times \sqrt{100,000} + 0.2 \times \sqrt{60,000} = 0.8(316.23) + 0.2(244.95) = 301.97$$

$$EU_{\text{protect}} = \sqrt{95,000} = 308.22$$ (certain outcome)

**Decision: PROTECT** ($EU_{\text{protect}} > EU_{\text{no protect}}$)

**(b) Value of Perfect Information:**

With perfect info:
- If frost forecast → Protect → $W = \$95,000$
- If no frost forecast → Don't protect → $W = \$100,000$

$$EU_{\text{with info}} = 0.2 \times \sqrt{95,000} + 0.8 \times \sqrt{100,000} = 0.2(308.22) + 0.8(316.23) = 314.63$$

Certainty equivalents:
- $CE_{\text{no info}} = 308.22^2 = \$95,000$ (protection is chosen)
- $CE_{\text{with info}} = 314.63^2 = \$98,992$

$$VPI = 98,992 - 95,000 = \$3,992$$

The farmer would pay up to **$3,992** for perfect frost forecast.

---

## Problem 8: Crop Portfolio (Intermediate)

A farmer allocates 100 ha between wheat and lentils.

| Crop | E[Return/ha] | σ (Std Dev) |
|------|--------------|-------------|
| Wheat | $400 | $150 |
| Lentils | $500 | $300 |

Correlation: $\rho = 0.2$. Risk aversion: $A = 0.002$.

(a) Write portfolio expected return and variance
(b) Find optimal wheat allocation

### Solution

**(a) Portfolio formulas:**

Let $w$ = hectares to wheat, $(100-w)$ = hectares to lentils.

$$E[R_p] = 400w + 500(100-w) = 50,000 - 100w$$

$$\text{Var}(R_p) = w^2(150^2) + (100-w)^2(300^2) + 2w(100-w)(0.2)(150)(300)$$

$$= 22,500w^2 + 90,000(100-w)^2 + 18,000w(100-w)$$

Expanding: $= 94,500w^2 - 16,200,000w + 900,000,000$

(Check: the cross term $2w(100-w)(0.2)(150)(300) = 18{,}000w(100-w)$ contributes $+1{,}800{,}000w$, not $+19{,}800{,}000w$.)

**(b) Optimal allocation:**

Objective: $\max U = E[R_p] - \frac{A}{2}\text{Var}(R_p)$

$$U = (50,000 - 100w) - 0.001(94,500w^2 - 16,200,000w + 900,000,000)$$

$$= -850,000 + 16,100w - 94.5w^2$$

FOC: $\frac{dU}{dw} = 16,100 - 189w = 0$

$$w^* = 16,100/189 \approx 85.2 \text{ ha}$$

Since $0 \leq 85.2 \leq 100$, this is an interior solution: **85.2 ha to wheat, 14.8 ha to lentils**.

**Interpretation:** Even though lentils offer higher expected return, risk aversion induces partial diversification into wheat. The lower variance of wheat (and positive inter-crop correlation) makes it optimal to devote roughly 85% of area to wheat and 15% to lentils at this level of risk aversion.

---

## Problem 9: St. Petersburg Paradox (Intermediate)

Explain the St. Petersburg Paradox and how expected utility theory resolves it. If $u(x) = \ln(x)$, what is the certainty equivalent for the St. Petersburg game?

### Solution

**The Paradox:**

Game: Flip coin until heads; receive $2^t$ if heads on flip $t$.

$$EV = \sum_{t=1}^{\infty} \frac{1}{2^t} \times 2^t = \sum_{t=1}^{\infty} 1 = \infty$$

Despite infinite expected value, people only pay $10-20 to play.

**Resolution with EU Theory:**

Using $u(x) = \ln(x)$:

$$EU = \sum_{t=1}^{\infty} \frac{1}{2^t} \times \ln(2^t) = \sum_{t=1}^{\infty} \frac{t \ln 2}{2^t} = \ln 2 \times \sum_{t=1}^{\infty} \frac{t}{2^t} = \ln 2 \times 2 = 2\ln 2 \approx 1.386$$

$$CE = e^{1.386} \approx \$4$$

**Lesson:** Log utility transforms infinite EV into finite EU. People evaluate outcomes through utility functions with diminishing marginal utility, which bounds the valuation of extreme outcomes.

---

## Problem 10: Water Allocation Under Uncertainty (Advanced)

A water manager allocates between irrigation (I) and environment (E). Inflow is High (prob 0.6) or Low (prob 0.4).

Benefits: $B_I(I) = 100\sqrt{I}$, $B_E(E) = 80\sqrt{E}$

Available water: 100 ML (high), 40 ML (low).

Find state-contingent optimal allocation and expected total benefits.

### Solution

**High Inflow State:**

Constraint: $I_H + E_H \leq 100$

FOC (equal marginal benefits): $\frac{50}{\sqrt{I}} = \frac{40}{\sqrt{E}}$

$$\frac{\sqrt{E}}{\sqrt{I}} = \frac{40}{50} = 0.8 \implies E/I = 0.64$$

Substituting: $I + 0.64I = 100 \implies I_H = 61.0$, $E_H = 39.0$

Benefits: $B_H = 100\sqrt{61} + 80\sqrt{39} = 781 + 500 = 1,281$

**Low Inflow State:**

Same ratio applies: $E_L = 0.64 I_L$

$I_L + 0.64I_L = 40 \implies I_L = 24.4$, $E_L = 15.6$

Benefits: $B_L = 100\sqrt{24.4} + 80\sqrt{15.6} = 494 + 316 = 810$

**Expected Benefits:**
$$E[B] = 0.6(1,281) + 0.4(810) = 769 + 324 = \$1,093$$

---

## Problem 11: Value of Imperfect Information (Advanced)

Using the frost example (Problem 7), suppose a forecast correctly predicts frost 80% of the time when frost occurs, and correctly predicts no frost 90% of the time when no frost occurs. Prior frost probability is 0.2.

(a) Calculate posterior probabilities using Bayes' rule
(b) Find expected utility with imperfect forecast
(c) Calculate value of imperfect information

### Solution

**(a) Bayes' Rule:**

Given:
- $P(\text{frost}) = 0.2$
- $P(\text{predict frost}|\text{frost}) = 0.80$
- $P(\text{predict no frost}|\text{no frost}) = 0.90$

Marginal probability of predicting frost:
$$P(F) = 0.80(0.2) + 0.10(0.8) = 0.16 + 0.08 = 0.24$$

Posteriors:
$$P(\text{frost}|\text{predict frost}) = \frac{0.80 \times 0.2}{0.24} = 0.667$$

$$P(\text{frost}|\text{predict no frost}) = \frac{0.20 \times 0.2}{0.76} = 0.053$$

**(b) Expected Utility with Imperfect Info:**

If forecast predicts frost ($P(\text{frost}) = 0.667$):
- $EU_{\text{protect}} = \sqrt{95,000} = 308.22$
- $EU_{\text{no protect}} = 0.333 \times \sqrt{100,000} + 0.667 \times \sqrt{60,000} = 268.7$
- Decision: **PROTECT**

If forecast predicts no frost ($P(\text{frost}) = 0.053$):
- $EU_{\text{protect}} = 308.22$
- $EU_{\text{no protect}} = 0.947 \times \sqrt{100,000} + 0.053 \times \sqrt{60,000} = 312.5$
- Decision: **DON'T PROTECT**

$$EU_{\text{imperfect}} = 0.24 \times 308.22 + 0.76 \times 312.5 = 311.5$$

**(c) Value of Imperfect Information:**

$$CE_{\text{imperfect}} = 311.5^2 = \$97,032$$

$$VPII = 97,032 - 95,000 = \$2,032$$

Comparison: $VPII (\$2,032) < VPI (\$3,992)$

Information efficiency: $2,032/3,992 = 51\%$ of perfect info value captured.

---

## Problem 12: R Implementation (Intermediate)

Write R code to:
(a) Calculate EU, CE, and RP for any lottery and utility function
(b) Plot utility function with EU graphical interpretation
(c) Calculate insurance demand curve

### Solution

```r
# (a) EU, CE, RP Calculator
eu_analysis <- function(outcomes, probs, u_fn, u_inv) {
  EV <- sum(probs * outcomes)
  EU <- sum(probs * sapply(outcomes, u_fn))
  CE <- u_inv(EU)
  RP <- EV - CE
  list(EV = EV, EU = EU, CE = CE, RP = RP)
}

# Example with sqrt utility
u_sqrt <- function(x) sqrt(x)
u_sqrt_inv <- function(u) u^2

result <- eu_analysis(
  outcomes = c(50, 450),
  probs = c(0.5, 0.5),
  u_fn = u_sqrt,
  u_inv = u_sqrt_inv
)
print(result)

# (b) Plot with EU interpretation
plot_eu <- function(outcomes, probs, u_fn, xlim = NULL) {
  if (is.null(xlim)) xlim <- c(0, max(outcomes) * 1.1)
  x <- seq(xlim[1] + 0.1, xlim[2], length = 200)
  
  EU <- sum(probs * sapply(outcomes, u_fn))
  EV <- sum(probs * outcomes)
  
  plot(x, sapply(x, u_fn), type = 'l', lwd = 2,
       xlab = 'Wealth/Outcome', ylab = 'Utility',
       main = 'Expected Utility Analysis')
  
  # Chord between outcomes
  segments(outcomes[1], u_fn(outcomes[1]),
           outcomes[2], u_fn(outcomes[2]),
           col = 'red', lwd = 2, lty = 2)
  
  # Mark points
  points(outcomes, sapply(outcomes, u_fn), pch = 19, col = 'blue', cex = 1.5)
  abline(h = EU, col = 'green', lty = 3)
  
  legend('bottomright', c('u(x)', 'Chord', 'EU'),
         col = c('black', 'red', 'green'), lwd = 2, lty = c(1, 2, 3))
}

plot_eu(c(50, 450), c(0.5, 0.5), u_sqrt)

# (c) Insurance demand curve
insurance_demand <- function(W0, loss, p_loss, u_fn, u_inv, premium_range) {
  demand <- numeric(length(premium_range))
  
  EU_no_ins <- (1 - p_loss) * u_fn(W0) + p_loss * u_fn(W0 - loss)
  
  for (i in seq_along(premium_range)) {
    P <- premium_range[i]
    EU_ins <- u_fn(W0 - P)  # Full coverage
    demand[i] <- ifelse(EU_ins >= EU_no_ins, 1, 0)
  }
  
  max_P <- W0 - u_inv(EU_no_ins)
  list(premiums = premium_range, demand = demand, max_premium = max_P)
}

ins <- insurance_demand(W0 = 200000, loss = 150000, p_loss = 0.05,
                        u_fn = log, u_inv = exp,
                        premium_range = seq(5000, 20000, by = 500))
cat('Maximum premium:', ins$max_premium)
```

**Expected output:**
- EU analysis: EV = 250, EU ≈ 14.14, CE = 200, RP = 50 (for unscaled sqrt)
- Maximum insurance premium: ≈ $13,768
