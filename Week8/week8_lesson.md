# Week 8: Producer Theory II — Profit Maximization & Industry

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Solve the profit maximization problem
2. Derive output supply and input demand functions
3. Apply the value of marginal product (VMP) condition
4. Construct supply curves from cost functions
5. Analyze short-run vs. long-run supply decisions
6. Determine long-run competitive equilibrium
7. Calculate producer surplus and economic rent
8. Apply Hotelling's Lemma

---

## 1. The Profit Maximization Framework

### 1.1 From Cost Minimization to Profit Maximization

Last week we solved Stage 1—cost minimization:
$$\min_{L,K} wL + rK \quad \text{s.t.} \quad f(L,K) = y$$

This yielded the cost function $C(w, r, y)$.

This week we solve Stage 2—output choice:
$$\max_y \; \pi = py - C(w, r, y)$$

### 1.2 Alternative: Direct Profit Maximization

We can also solve directly over inputs:
$$\max_{L, K} \; \pi = pf(L, K) - wL - rK$$

Both approaches yield identical solutions when the production function is well-behaved.

### 1.3 Who Maximizes Profit?

**Economic profit** subtracts the opportunity cost of all inputs, including capital and the owner's own time — not just out-of-pocket expenses. Accounting profit $\geq$ economic profit.

**Assumed to maximize profit:**

- **Owner-operated farms** (smallholder and family farms): the standard assumption in agricultural production economics; validated empirically by Lau & Yotopoulos (1971) for Indian farms.
- **Incorporated agribusiness firms** (grain traders, processors, input suppliers): textbook profit maximisers subject to shareholder pressure.
- **Cooperatives** (dairy, grain, wine): maximize returns to members — approximates profit maximization when members are price-taking producers.

**Not assumed to maximize profit:**  public agencies, subsistence households, and regulated utilities face different objectives (cost minimization, output targets, social welfare) and require different models.

*This week:* we treat all producers as competitive profit maximizers facing given prices $(p, w, r)$.

---

## 2. First-Order Conditions for Profit Maximization

### 2.1 Output Choice Approach

$$\max_y \; \pi = py - C(y)$$

**First-order condition:**
$$\frac{d\pi}{dy} = p - \frac{dC}{dy} = 0 \quad \Rightarrow \quad \boxed{p = MC(y)}$$

**Second-order condition:**
$$\frac{d^2\pi}{dy^2} = -\frac{d^2C}{dy^2} < 0 \quad \Rightarrow \quad MC'(y) > 0$$

**Interpretation:** Optimal output where marginal cost equals price, with MC rising.

### 2.2 Input Choice Approach

$$\max_{L,K} \; \pi = pf(L,K) - wL - rK$$

**First-order conditions:**
$$\frac{\partial \pi}{\partial L} = p \cdot MP_L - w = 0 \quad \Rightarrow \quad \boxed{p \cdot MP_L = w}$$
$$\frac{\partial \pi}{\partial K} = p \cdot MP_K - r = 0 \quad \Rightarrow \quad \boxed{p \cdot MP_K = r}$$

### 2.3 Value of Marginal Product (VMP)

Define the **value of marginal product**:
$$VMP_L = p \cdot MP_L$$
$$VMP_K = p \cdot MP_K$$

The profit-maximizing conditions become:
$$VMP_L = w \quad \text{and} \quad VMP_K = r$$

**Interpretation:** Hire labor until the dollar value of additional output equals the wage.

```
        $
        │
    w ──┼─────────●──────
        │        ╱ ╲
        │       ╱   ╲  VMP_L = p·MP_L
        │      ╱     ╲
        │     ╱       ╲
        │    ╱         ╲
        └───────────────── L
              L*
        
    Employ L* where VMP_L = w
```

---

## 3. Unconditional Input Demands

### 3.1 Definition

Solving the profit-max FOCs yields **unconditional (profit-maximizing) input demands**:
$$L^d(p, w, r) \quad \text{and} \quad K^d(p, w, r)$$

These differ from conditional demands $L^*(w, r, y)$:
- **Conditional:** Given output $y$, minimize cost
- **Unconditional:** Choose $L$ and $K$ to maximize profit (output endogenous)

### 3.2 Cobb-Douglas Example

For $f(L,K) = L^\alpha K^\beta$ with $\alpha + \beta < 1$ (DRS required for interior solution):

From FOCs:
$$p \cdot \alpha L^{\alpha-1} K^\beta = w$$
$$p \cdot \beta L^\alpha K^{\beta-1} = r$$

Solving simultaneously:
$$L^d = \left(\frac{\alpha}{w}\right)^{\frac{1-\beta}{1-\alpha-\beta}} \left(\frac{\beta}{r}\right)^{\frac{\beta}{1-\alpha-\beta}} p^{\frac{1}{1-\alpha-\beta}}$$

### 3.3 Properties

Unconditional input demands are:
- **Increasing in $p$** (higher output price → use more inputs)
- **Decreasing in own price** ($\partial L^d/\partial w < 0$)
- **Homogeneous of degree 0** in $(p, w, r)$

---

## 4. The Output Supply Function

### 4.1 Derivation from Cost Function

From $p = MC(y)$, invert to get:
$$y^s(p, w, r) = MC^{-1}(p)$$

**The supply curve is the inverse of the marginal cost curve.**

### 4.2 Cobb-Douglas Supply (CRS Case)

For CRS ($\alpha + \beta = 1$), cost is linear: $C(y) = cy$ where $c = c(w,r)$.

Then $MC = c$ (constant), so:
- If $p < c$: produce $y = 0$
- If $p = c$: any $y \geq 0$ is optimal
- If $p > c$: produce infinite output

**Problem:** CRS implies indeterminate firm size. This is why we need DRS (at least eventually) for finite supply.

### 4.3 General Supply Properties

1. **Upward sloping:** $\partial y^s/\partial p > 0$ (rising MC)
2. **Shifts with input prices:** Higher $w$ or $r$ shifts supply left
3. **Homogeneous of degree 0** in $(p, w, r)$

---

## 5. The Profit Function

### 5.1 Definition

The **profit function** gives maximum profit at given prices:
$$\pi(p, w, r) = \max_y \{py - C(w, r, y)\} = py^s - C(y^s)$$

Or equivalently:
$$\pi(p, w, r) = pf(L^d, K^d) - wL^d - rK^d$$

### 5.2 Properties

1. **Non-decreasing in $p$:** Higher output price → (weakly) higher profit
2. **Non-increasing in $w$, $r$:** Higher input prices → lower profit
3. **Homogeneous of degree 1** in $(p, w, r)$
4. **Convex in $(p, w, r)$:** Flexibility to adjust is valuable

### 5.3 Cobb-Douglas Profit Function (DRS)

For $f = L^\alpha K^\beta$ with $\alpha + \beta < 1$:
$$\pi(p, w, r) = \kappa \cdot p^{\frac{1}{1-\alpha-\beta}} \cdot w^{\frac{-\alpha}{1-\alpha-\beta}} \cdot r^{\frac{-\beta}{1-\alpha-\beta}}$$

where $\kappa$ is a constant depending on $\alpha$ and $\beta$.

---

## 6. Hotelling's Lemma

### 6.1 Statement

$$\boxed{\frac{\partial \pi(p, w, r)}{\partial p} = y^s(p, w, r)}$$

$$\boxed{\frac{\partial \pi(p, w, r)}{\partial w} = -L^d(p, w, r)}$$

$$\boxed{\frac{\partial \pi(p, w, r)}{\partial r} = -K^d(p, w, r)}$$

### 6.2 Intuition: Envelope Theorem

At the optimum, a small increase in output price $p$:
- Direct effect: Revenue on existing output rises by $y^s$
- Indirect effect: Reoptimize output → second-order (≈ 0)

Only the direct effect matters, giving $\partial \pi/\partial p = y^s$.

### 6.3 Parallel to Consumer Theory

| Consumer Theory                                                                  | Producer Theory                                            |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| Indirect utility $v(p, m)$                                                       | Profit function $\pi(p, w, r)$                             |
| Roy's Identity: $x_i^m = -\frac{\partial v/\partial p_i}{\partial v/\partial m}$ | Hotelling's Lemma: $y^s = \frac{\partial \pi}{\partial p}$ |
| Expenditure function                                                             | Cost function                                              |
| Shephard's Lemma                                                                 | Shephard's Lemma (same!)                                   |

---

## 7. Short-Run Supply

### 7.1 Fixed Costs and the Shutdown Decision

In the short run, capital is fixed at $\bar{K}$:
- **Fixed Cost (FC):** $r\bar{K}$ — paid regardless of output
- **Variable Cost (VC):** $wL(y; \bar{K})$ — depends on output

### 7.2 The Shutdown Rule

Compare operating vs. shutting down:

| Scenario  | Revenue | Cost      | Profit         |
| --------- | ------- | --------- | -------------- |
| Operate   | $py$    | $VC + FC$ | $py - VC - FC$ |
| Shut down | $0$     | $FC$      | $-FC$          |

**Operate if:** $py - VC - FC > -FC \Rightarrow py > VC \Rightarrow p > AVC$

$$\boxed{\text{Shut down if } p < AVC}$$

### 7.3 Short-Run Supply Curve

$$y^s_{SR}(p) = \begin{cases} MC^{-1}(p) & \text{if } p \geq \min AVC \\ 0 & \text{if } p < \min AVC \end{cases}$$

```
        $
        │           MC
        │          ╱
        │     ____╱_____ AC
        │    ╱   ╲╱
        │   ╱ ___╲______ AVC
        │  ╱ ╱    ╲
        │ ╱ ╱      ╲
        │  ╱ pₘᵢₙ ← Shutdown point
        │ ╱
        └──────────────── y
        
    Supply = MC curve above min AVC
```

---

## 8. Long-Run Supply and Industry Equilibrium

### 8.1 Long-Run Individual Supply

In the long run, all inputs are variable. The firm:
- Chooses optimal $K$ (not fixed)
- Operates only if $\pi \geq 0$

$$y^s_{LR}(p) = \begin{cases} MC^{-1}(p) & \text{if } p \geq \min AC \\ 0 & \text{if } p < \min AC \end{cases}$$

### 8.2 Entry and Exit

**Free entry** drives the long-run equilibrium:

| Market Condition | Profit    | Response    |
| ---------------- | --------- | ----------- |
| $p > \min AC$    | $\pi > 0$ | Firms enter |
| $p < \min AC$    | $\pi < 0$ | Firms exit  |
| $p = \min AC$    | $\pi = 0$ | No change   |

### 8.3 Long-Run Competitive Equilibrium

In long-run equilibrium:
$$\boxed{p^* = \min AC \quad \text{and} \quad \pi = 0}$$

Each firm produces at minimum average cost—the efficient scale.

```
        $
        │         MC
        │        ╱╲
        │       ╱  ╲
   p* ──┼──────●────── AC
        │     ╱  ╲
        │    ╱    ╲
        │   ╱      ╲
        └──────────────── y
              y*
              
    LR equilibrium: p* = min AC, each firm produces y*
```

### 8.4 Industry Supply

**Short run:** Sum individual supplies
$$Y^s_{SR}(p) = \sum_{i=1}^{n} y_i^s(p)$$

**Long run (constant-cost industry):** Horizontal at $p = \min AC$
- Any quantity can be supplied at this price
- Entry/exit adjusts number of firms

---

## 9. Entry, Exit, and Dynamics

### 9.1 Adjustment Process

Starting from equilibrium, suppose demand increases:

1. **Short run:** Price rises above $\min AC$; existing firms profit
2. **Medium run:** New firms enter; supply increases
3. **Long run:** Price returns to $\min AC$; profit returns to zero

### 9.2 Agricultural Application

**Australian wheat industry:**

1. High global prices (e.g., 2022): $p > \min AC$ → positive profits
2. Farmers expand acreage, new entrants
3. Supply increases → price falls
4. Long run: return to normal profits

**Complication:** Land is scarce, so wheat industry may have increasing costs—the long-run supply curve slopes up.

---

## 10. Producer Surplus

### 10.1 Definition

**Producer surplus (PS)** is the difference between what producers receive and their minimum willingness to accept:

$$PS = \int_0^{y^*} [p - MC(y)] \, dy = py^* - VC(y^*)$$

### 10.2 Graphical Representation

```
        $
        │         S = MC
        │        ╱
        │   p* _╱█████████  ← Producer Surplus
        │     ╱███████████
        │    ╱████████████
        │   ╱█████████████
        └──────────────────── y
              y*
```

Area between price and supply curve, up to quantity sold.

### 10.3 Relationship to Profit

$$PS = \pi + FC$$

- In the long run (FC = 0 and $\pi = 0$): PS measures pure economic rent
- In the short run: PS = Variable profit + Fixed costs. This short-run producer surplus is exactly the **quasi-rent** earned by the firm's *fixed* factors — the return above their short-run opportunity cost (zero, by the definition of "fixed") that those factors collect while the firm continues to operate. As the firm's fixed factors become variable in the long run, those quasi-rents are competed away by entry (§§8.2–8.3); they do not survive into long-run equilibrium. The terminology is developed in detail in §11.

### 10.4 Changes in Producer Surplus

When price rises from $p_0$ to $p_1$:
$$\Delta PS = \int_{p_0}^{p_1} y^s(p) \, dp$$

---

## 11. Economic Rent and Quasi-Rent

### 11.1 Definitions

**Economic rent:** Payment to a factor above its opportunity cost
- Arises from scarcity or unique characteristics

**Quasi-rent:** Short-run return to fixed factors
- In the long run, quasi-rents are competed away

### 11.2 Agricultural Examples

**Pure economic rent:**
- Highly fertile land earns rent above marginal land
- Unique water rights

**Quasi-rent:**
- Specialized dairy equipment earns returns until it depreciates
- Short-run profits during price spikes

### 11.3 Ricardian Rent

Different land qualities create rent:
- **Marginal land:** Zero rent, $p = AC$
- **Better land:** Positive rent = $p \cdot y - C(y)$

```
        $                    $
        │    Marginal        │    Fertile
        │      Land          │      Land
        │     ╱MC            │     ╱MC
   p ───┼────●────           p ───┼────────────
        │   ╱ AC             │   ╱████ Rent
        │  ╱                 │  ╱████
        │ ╱                  │ ╱█████ AC
        └────────── y        └────────── y
```

---

## 12. Historical and Empirical Milestones

### 12.1 Hotelling (1932): The Lemma That Bears His Name

**Source:** "Edgeworth's Taxation Paradox and the Nature of Demand and Supply Functions," *Journal of Political Economy*, 40(5), 577–616.

**Contribution:** Hotelling proved that differentiating the value function of a maximization problem with respect to a parameter yields the optimal policy function for that parameter — what we now call the envelope theorem applied to the profit function. Specifically, $\partial\pi/\partial p = y^s$ and $\partial\pi/\partial w = -L^d$.

**Context:** The paper addressed a debate about whether specific or ad valorem taxes were more distortionary. As a by-product, Hotelling derived the duality between profit functions and supply/input-demand schedules — a result that sat largely unnoticed until it was absorbed into duality theory by the 1970s.

**Legacy:** Hotelling's Lemma is now the standard one-line derivation of supply and input demands in any applied production study; it replaced the need to solve the firm's optimization problem repeatedly for each price scenario. The result predates Samuelson's formalization by 15 years.

---

### 12.2 Ricardo (1815/1817): Differential Rent and the Marginal Land Principle

**Sources:** "Essay on the Influence of a Low Price of Corn on the Profits of Stock" (1815); *Principles of Political Economy and Taxation*, Ch. 2 (1817).

**Argument:** In a competitive farming economy with land of varying fertility, the price of corn is determined by the cost of production on the *least fertile land in use* (the extensive margin). High-quality land earns a positive differential rent $= (p - AC_i)\cdot y_i$ because it can produce the same output at lower cost. Competition drives economic profit to zero only on marginal land; infra-marginal land earns persistent rent.

**Key result:** $\text{Rent}_i = (AC_{\text{margin}} - AC_i)\cdot y \geq 0$; rent capitalizes into land price $= \text{Rent}/\text{interest rate}$.

**Legacy:** The direct theoretical basis for the "Ricardian rent" terminology, the marginal-land zero-rent condition, and land-price heterogeneity (Section 11.3). Ricardo's framework remains the standard model of agricultural land markets, applied from 19th-century Corn Laws debates to 21st-century water-rights pricing in Australia.

---

### 12.3 Marshall (1890): Quasi-Rent, Producer Surplus, and the Short-Long Distinction

**Source:** *Principles of Economics*, Book V, Chs. 8–9 (1890; 8th ed. 1920).

**Three contributions to this week's material:**

1. **Quasi-rent:** The term and concept — short-run above-normal returns to a fixed factor, distinct from true (Ricardian) rent because they vanish as capacity adjusts in the long run (Section 11.1).
2. **Producer surplus:** The area above the supply curve and below the price line; explicitly identified as a welfare measure for producers and the basis for policy evaluation (Section 10).
3. **Short-run/long-run supply:** Marshall introduced the *market period* (all inputs fixed), *short period* (some inputs fixed), and *long period* (all inputs variable) — the taxonomy that underpins the SR/LR supply and shutdown rules in Sections 7–8.

**Legacy:** *Principles* defined the language and graphical toolkit of partial-equilibrium producer analysis for over a century. Every supply-and-demand diagram in this course is Marshallian.

---

### 12.4 Samuelson (1947): Foundations of Producer Theory

**Source:** *Foundations of Economic Analysis*, Ch. 4 (Harvard University Press, 1947).

**Contribution:** Samuelson provided the first rigorous mathematical framework for producer theory: (i) the *envelope theorem* as a general result; (ii) symmetry and negative semi-definiteness of supply and input-demand response matrices; (iii) the *correspondence principle* linking comparative statics to stability conditions.

**Key result (Le Chatelier Principle):** Long-run supply responses are larger than short-run responses:
$$\frac{\partial y^s_{LR}}{\partial p} \geq \frac{\partial y^s_{SR}}{\partial p} \geq 0$$
because more inputs are variable in the long run. This is the formal foundation for the SR/LR supply curve diagrams in Sections 7–8.

**Legacy:** *Foundations* turned producer theory from a verbal/graphical discipline into a mathematically precise one. Duality theory (Shephard, Hotelling, Roy) and modern empirical production economics all rest on Samuelson's framework.

---

### 12.5 Lau & Yotopoulos (1971–73): Profit Functions and Farm Efficiency

**Study:** "A Test for Relative Efficiency and Application to Indian Agriculture," *American Economic Review* (1971); extended in Yotopoulos & Lau (1973).

**Method:** Estimated a *normalised restricted profit function* for small and large Indian farms simultaneously, exploiting duality: given output and input prices and fixed land, output supply and input demands are recovered by differentiating a single value function via Hotelling's Lemma.

**Key finding:** Small farms were *equally allocatively efficient* as large farms — factor price ratios equalled VMP ratios on both farm sizes. Apparent productivity differences traced to land quality, not managerial failure.

**Legacy:** Founded the empirical practice of using profit function duals to test efficiency and recover supply elasticities; shaped World Bank agricultural policy on small-farm consolidation for decades. This is the empirical validation of the profit-maximization assumption for owner-operated farms (Section 1.3).

---

## 13. Summary

### 13.1 Key Results

| Concept                    | Condition/Formula                 |
| -------------------------- | --------------------------------- |
| Profit-max output          | $p = MC(y)$                       |
| Profit-max input use       | $VMP_L = w$, $VMP_K = r$          |
| Short-run supply           | $MC$ above $\min AVC$             |
| Long-run supply            | $MC$ above $\min AC$              |
| LR competitive equilibrium | $p = \min AC$, $\pi = 0$          |
| Hotelling's Lemma          | $\partial \pi / \partial p = y^s$ |
| Producer surplus           | $PS = py - VC = \pi + FC$         |

### 13.2 Duality Summary

```
┌─────────────────────────────────────────────────────────────────────┐
│                    COMPLETE PRODUCER DUALITY                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  PRODUCTION           COST MINIMIZATION        PROFIT MAXIMIZATION │
│  f(L,K)               min wL+rK s.t. f≥y      max pf(L,K)-wL-rK   │
│     │                       │                        │              │
│     │                       ▼                        ▼              │
│     │                 Cost Function            Profit Function      │
│     │                 C(w,r,y)                 π(p,w,r)             │
│     │                       │                        │              │
│     │                       ▼                        ▼              │
│     │                 Shephard's              Hotelling's           │
│     │                 Lemma                   Lemma                 │
│     │                 ∂C/∂w = L*              ∂π/∂p = y^s          │
│     │                 ∂C/∂r = K*              ∂π/∂w = -L^d         │
│     │                                         ∂π/∂r = -K^d          │
│     │                       │                        │              │
│     └───────────────────────┴────────────────────────┘              │
│                                                                     │
│  Conditional Demands: L*(w,r,y)  ←  Given output y                 │
│  Unconditional Demands: L^d(p,w,r)  ←  Output endogenous           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 13.3 Preview: Next Week

With individual firm supply derived, we move to:
- Market supply and demand
- Competitive equilibrium
- Welfare analysis (consumer + producer surplus)
- Market interventions (taxes, subsidies, quotas)

---

## References and Further Reading

**Core textbooks:**
- Varian, H. (2014). *Intermediate Microeconomics*. Chapters 22–24.
- Nicholson & Snyder. *Microeconomic Theory*. Chapters 11–13.
- Just, R., Hueth, D., & Schmitz, A. (2004). *The Welfare Economics of Public Policy*.

**Further reading (milestones):**

- **Shephard, R. W. (1953).** *Cost and Production Functions*. Princeton University Press.  
  First rigorous proof that the cost function uniquely characterises the production set; differentiating with respect to input prices recovers conditional factor demands (Shephard's Lemma). Established formal duality between cost and production functions; together with Hotelling (1932) this confirmed the two-way duality in Section 13.2.

- **McFadden, D. (1978).** "Cost, Revenue, and Profit Functions." In M. Fuss & D. McFadden (eds.), *Production Economics: A Dual Approach to Theory and Applications*, Vol. 1, 3–109. North-Holland.  
  The definitive graduate reference for the profit-function material in this week. Proves all properties of $\pi(p,w,r)$, derives Hotelling's Lemma as a corollary of the envelope theorem, and shows how flexible functional forms (translog, generalised Leontief) serve as second-order approximations to an arbitrary profit function.

- **Lau, L. J. & Yotopoulos, P. A. (1972).** "Profit, Supply, and Factor Demand Functions." *American Economic Review*, 62(1), 11–18.  
  Companion paper to the 1971 milestone study (Section 12.5); derived supply price elasticities and factor-demand elasticities directly from the estimated normalised profit function by applying Hotelling's Lemma, closing the loop from the theoretical duality diagram (Section 13.2) to an empirical agricultural application.

