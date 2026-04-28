# Week 9: Market Equilibrium — Prices, Efficiency & Policy

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Aggregate individual demand and supply curves to form market curves
2. Solve for competitive market equilibrium (price and quantity)
3. Calculate consumer surplus and producer surplus
4. Prove that competitive equilibrium maximizes total welfare
5. Analyze welfare effects of taxes and subsidies
6. Calculate deadweight loss from market interventions
7. Determine long-run equilibrium with free entry and exit
8. Identify sources of market power in agricultural input and output markets and explain how imperfect competition shapes equilibrium outcomes and farmer welfare

---

## 1. Market Structures Overview

### 1.1 The Spectrum of Competition

Markets vary by the degree of market power—the ability to influence prices:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    MARKET STRUCTURE SPECTRUM                             │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Perfect           Monopolistic        Oligopoly         Monopoly       │
│  Competition       Competition                                          │
│     ◄────────────────────────────────────────────────────────►          │
│                                                                          │
│  Many firms        Many firms         Few firms         One firm        │
│  Identical goods   Differentiated     Strategic         Unique good     │
│  No market power   Some power         Interdependent    Full power      │
│                                                                          │
│  Examples:         Examples:          Examples:         Examples:       │
│  - Wheat           - Restaurants      - Airlines        - Utilities     │
│  - Corn            - Clothing         - Telecom         - Patents       │
│  - Soybeans        - Coffee shops     - Fertilizers     - Water         │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

### 1.2 Why Study Perfect Competition?

Perfect competition serves as:
- **Benchmark**: The ideal against which we measure market failures
- **Approximation**: Many agricultural markets are nearly competitive
- **Foundation**: Understanding imperfect competition requires this base

**Key assumptions of perfect competition**:
1. Many buyers and sellers (no individual influences price)
2. Homogeneous (identical) products
3. Free entry and exit
4. Perfect information
5. No transaction costs

### 1.3 Equilibrium in Non-Competitive Markets

Most real agricultural input and output markets are **not** perfectly competitive. Understanding where actual equilibria land — and how they diverge from the competitive benchmark — is essential for policy analysis.

#### Seller-Side Market Power

| Market Structure             | How equilibrium is reached                                      | Welfare vs. competition                 |
| ---------------------------- | --------------------------------------------------------------- | --------------------------------------- |
| **Perfect competition**      | $p = MC$; many firms; free entry; $\pi \to 0$ in LR             | Maximum $W = CS + PS$                   |
| **Monopolistic competition** | Each firm faces downsloping demand; LR $\pi = 0$ but $p > MC$   | Some DWL; product variety               |
| **Oligopoly**                | Few firms; strategic interaction (Cournot, Bertrand, collusion) | $p > MC$; DWL; possible tacit collusion |
| **Monopoly**                 | $MR = MC$; $p^m > MC$; $Q^m < Q^{\text{comp}}$; $\pi > 0$       | Largest DWL; no supply curve            |

#### Buyer-Side Market Power

| Market Structure             | Equilibrium                                                 | Welfare impact                             |
| ---------------------------- | ----------------------------------------------------------- | ------------------------------------------ |
| **Monopsony** (single buyer) | MFC $>$ price paid; farm-gate $p <$ competitive; $Q < Q^*$  | DWL on seller side; buyer captures surplus |
| **Oligopsony** (few buyers)  | Price below competitive; buyers exercise joint market power | Reduced PS; DWL                            |

---

## 2. Competitive Markets: Price-Taking Behavior

### 2.1 The Price-Taker Assumption

In a competitive market:
- Each firm is so small relative to the market that its actions don't affect price
- Firms and consumers take the market price $p$ as **given** (exogenous)
- No individual agent has **market power**

**Analogy**: A single wheat farmer can sell any quantity at the market price. If they try to charge more, buyers go elsewhere. If they charge less, they lose money unnecessarily.

### 2.2 The Competitive Firm's Problem (Review from Week 8)

A competitive firm maximizes profit:
$$\max_{y} \pi = py - c(y)$$

**First-Order Condition (FOC)**:
$$\frac{d\pi}{dy} = p - c'(y) = 0 \implies \boxed{p = MC(y)}$$

**Second-Order Condition (SOC)**:
$$\frac{d^2\pi}{dy^2} = -c''(y) \leq 0 \implies c''(y) \geq 0$$

The firm produces where price equals marginal cost, and MC must be increasing.

### 2.3 Individual Supply Curve

The firm's supply curve is its MC curve above the shutdown point:

$$y_i(p) = \begin{cases} MC^{-1}(p) & \text{if } p \geq AVC_{min} \\ 0 & \text{if } p < AVC_{min} \end{cases}$$

```
        p │
          │                    MC
          │                   /
          │                  /
          │                 /  ← Supply curve
          │                /    (MC above AVC_min)
    AVC_min├───────────●
          │          /│
          │         / │ Shutdown
          │        /  │ region
          │       /   │
          └───────────┴────────── y
```

---

## 3. Aggregating to Market Supply and Demand

### 3.1 Horizontal Aggregation

Market supply and demand are found by **horizontal summation** of individual curves.

**Market Demand**: Sum of all consumer demands at each price
$$D(p) = \sum_{i=1}^{n} x_i(p)$$

**Market Supply**: Sum of all firm supplies at each price
$$S(p) = \sum_{j=1}^{m} y_j(p)$$

### 3.2 Example: Aggregating Consumer Demands

Consider two consumers with individual demand curves:
- Consumer 1: $Q_1^d = 12 - 2p$ (active for $p \leq 6$)
- Consumer 2: $Q_2^d = 10 - p$ (active for $p \leq 10$)

**Step 1**: Find when each consumer enters the market

| Price $p$ | $Q_1^d$ | $Q_2^d$ | $Q^d = Q_1^d + Q_2^d$ |
| --------- | ------- | ------- | --------------------- |
| 0         | 12      | 10      | 22                    |
| 2         | 8       | 8       | 16                    |
| 4         | 4       | 6       | 10                    |
| 6         | 0       | 4       | 4                     |
| 8         | 0       | 2       | 2                     |
| 10        | 0       | 0       | 0                     |

**Step 2**: Write the aggregate demand (piecewise if needed)

$$Q^d(p) = \begin{cases} 22 - 3p & \text{if } p \leq 6 \\ 10 - p & \text{if } 6 < p \leq 10 \\ 0 & \text{if } p > 10 \end{cases}$$

For $p \leq 6$: $Q^d = (12 - 2p) + (10 - p) = 22 - 3p$

```
    p │
      │
   10 ├──●
      │   \
    6 ├────●         ← Kink where Consumer 1 exits
      │     \
      │      \
    2 ├───────\───●
      │        \ │
      │         \│
      └──────────┴────── Q
                22
```

### 3.3 Aggregating Firm Supplies

Similarly, if there are $n$ identical firms each with supply $y_i(p)$:

$$S(p) = n \cdot y_i(p)$$

**Example**: 50 identical wheat farms each have $y_i = 2p - 4$ for $p \geq 2$

Market supply: $S(p) = 50(2p - 4) = 100p - 200$ for $p \geq 2$

---

## 4. Market Equilibrium

### 4.1 Definition

**Market equilibrium** occurs when quantity demanded equals quantity supplied:

$$\boxed{D(p^*) = S(p^*)}$$

At the equilibrium price $p^*$:
- No excess demand (shortage)
- No excess supply (surplus)
- The market **clears**

### 4.2 Solving for Equilibrium

**Example**: Using our aggregated curves:
- Demand: $Q^d = 22 - 3p$
- Supply: $Q^s = p - 3$ (for $p \geq 3$)

**Equilibrium condition**:
$$22 - 3p = p - 3$$
$$25 = 4p$$
$$p^* = 6.25$$

**Equilibrium quantity**:
$$Q^* = 22 - 3(6.25) = 22 - 18.75 = 3.25$$

**Verification**: $Q^s = 6.25 - 3 = 3.25$ ✓

### 4.3 Graphical Representation

```
    p │          S
      │         /
      │        /
 6.25 ├───────●────── Equilibrium
      │      /│\
      │     / │ \
      │    /  │  \
    3 ├───●   │   \  D
      │  /    │    \
      │ /     │     \
      │/      │      \
      └───────┴───────┴─── Q
              3.25
```

### 4.4 Market Adjustment

What happens when the market is not in equilibrium?

**Excess supply** ($S > D$ at current price):
- Firms have unsold inventory
- Price falls
- Supply decreases, demand increases
- Market moves toward equilibrium

**Excess demand** ($D > S$ at current price):
- Consumers can't buy all they want
- Price rises
- Supply increases, demand decreases
- Market moves toward equilibrium

---

## 5. Welfare Analysis: Consumer and Producer Surplus

### 5.1 Consumer Surplus (CS)

**Consumer surplus** measures the gain consumers receive from trading:

$$CS = \text{Willingness to pay} - \text{Amount actually paid}$$

Graphically: Area below the demand curve, above the price, up to $Q^*$

$$CS = \int_0^{Q^*} P^d(Q) \, dQ - p^* \cdot Q^*$$

where $P^d(Q)$ is the inverse demand function.

**Intuition**: Some consumers would pay more than $p^*$—their surplus is the difference between their valuation and the market price.

### 5.2 Producer Surplus (PS)

**Producer surplus** measures the gain producers receive from trading:

$$PS = \text{Revenue received} - \text{Minimum willing to accept}$$

Graphically: Area above the supply curve, below the price, up to $Q^*$

$$PS = p^* \cdot Q^* - \int_0^{Q^*} P^s(Q) \, dQ$$

where $P^s(Q)$ is the inverse supply function.

**Relation to profit**: $PS = \pi + TFC$ (producer surplus = profit + fixed costs)

### 5.3 Total Welfare

**Total welfare** (social surplus) is the sum:

$$W = CS + PS$$

```
    p │
      │\
      │ \
      │  \  CS (consumer surplus)
      │   ╲╲╲╲╲
 p*   ├────────●─────── S
      │   ╱╱╱╱╱│╲
      │  ╱     │ ╲
      │ ╱  PS  │  ╲ D
      │╱       │   ╲
    0 └────────┴────────── Q
               Q*

    CS = Area below D, above p*, left of Q*
    PS = Area above S, below p*, left of Q*
```

### 5.4 Calculating Surplus with Linear Curves

For linear supply and demand, surpluses are triangular areas.

**Example**: 
- Demand: $P^d = 22/3 - Q/3$ (inverse of $Q = 22 - 3p$)
- Supply: $P^s = 3 + Q$ (inverse of $Q = p - 3$)
- Equilibrium: $p^* = 6.25$, $Q^* = 3.25$

$$CS = \frac{1}{2}(P_{max} - p^*)Q^* = \frac{1}{2}(7.33 - 6.25)(3.25) = 1.76$$

$$PS = \frac{1}{2}(p^* - P_{min})Q^* = \frac{1}{2}(6.25 - 3)(3.25) = 5.28$$

$$W = CS + PS = 1.76 + 5.28 = 7.04$$

---

## 6. The First Welfare Theorem

### 6.1 Statement

**First Fundamental Theorem of Welfare Economics**: A competitive equilibrium is **Pareto efficient**—no reallocation can make someone better off without making someone else worse off.

Equivalently: Competitive equilibrium maximizes total welfare $W = CS + PS$.

### 6.2 Intuition

At equilibrium:
- Price reflects both marginal value to consumers (willingness to pay) and marginal cost to producers
- All mutually beneficial trades are completed
- No deadweight loss

### 6.3 Proof Sketch

Consider any quantity $Q \neq Q^*$:

**If $Q < Q^*$**: 
- Marginal value (demand) > marginal cost (supply)
- Additional trade would increase welfare
- Not optimal

**If $Q > Q^*$**:
- Marginal cost > marginal value
- Some trades destroy value
- Not optimal

Only at $Q = Q^*$ where $D(p^*) = S(p^*)$ is welfare maximized.

### 6.4 Limitations of the Model

The First Welfare Theorem assumes away important real-world features:

| Assumption             | Reality                   | Consequence                     |
| ---------------------- | ------------------------- | ------------------------------- |
| Perfect competition    | Market power exists       | Prices above MC                 |
| No externalities       | Pollution, congestion     | Prices don't reflect true costs |
| Complete markets       | Missing markets           | Some goods not traded           |
| Perfect information    | Asymmetric information    | Adverse selection, moral hazard |
| Zero transaction costs | Search, contracting costs | Some trades not completed       |

**Key insight**: "Efficiency does not mean equity." A Pareto efficient outcome may be very unequal.

---

## 7. Policy Analysis: Taxes and Subsidies

### 7.1 Per-Unit Tax

A tax of $t$ per unit creates a **wedge** between buyer and seller prices:

$$p_b = p_s + t$$

where $p_b$ = price buyers pay, $p_s$ = price sellers receive.

**New equilibrium**:
$$D(p_b) = S(p_s) \quad \text{with} \quad p_b = p_s + t$$

```
    p │
      │\
      │ \
  pb  ├──●───┐
      │  │╲╲╲│ Tax wedge
  ps  ├──┼───●──────── S
      │  │   │╲
      │  │DWL│ ╲
      │  │   │  ╲ D
      └──┴───┴───┴──── Q
         Qt   Q*

    DWL = Deadweight Loss (triangle of lost trades)
```

### 7.2 Welfare Effects of a Tax

| Component        | Change          | Formula                                           |
| ---------------- | --------------- | ------------------------------------------------- |
| Consumer Surplus | $\Delta CS < 0$ | Loss: area between old and new consumer positions |
| Producer Surplus | $\Delta PS < 0$ | Loss: area between old and new producer positions |
| Tax Revenue      | $T > 0$         | $T = t \cdot Q_t$                                 |
| Deadweight Loss  | $DWL > 0$       | $DWL = -\Delta CS - \Delta PS - T$                |

**Deadweight loss** represents value destroyed—trades that would have occurred but don't because of the tax.

$$DWL = \frac{1}{2} t \cdot \Delta Q = \frac{1}{2} t \cdot (Q^* - Q_t)$$

### 7.3 Per-Unit Subsidy

A subsidy of $s$ per unit means sellers receive more than buyers pay:

$$p_s = p_b + s$$

**Welfare effects**:

| Component        | Change                  |
| ---------------- | ----------------------- |
| Consumer Surplus | $\Delta CS = +a$ (gain) |
| Producer Surplus | $\Delta PS = +b$ (gain) |
| Government Cost  | $-(a + b + c)$          |
| Net Welfare      | $-c = DWL$              |

The subsidy induces "too many" trades—units where MC > marginal value.

### 7.4 Example: Subsidy Analysis

Market: $Q^d = 22 - 3p$, $Q^s = p - 3$
Original equilibrium: $p^* = 6.25$, $Q^* = 3.25$

**With a $\$1$ per-unit subsidy to producers**:

Producers receive: $p_s = p_b + 1$

New equilibrium:
$$22 - 3p_b = p_b + 1 - 3$$
$$22 - 3p_b = p_b - 2$$
$$24 = 4p_b$$
$$p_b = 6, \quad p_s = 7, \quad Q = 22 - 18 = 4$$

**Welfare analysis**:
- $\Delta CS > 0$ (lower price for consumers)
- $\Delta PS > 0$ (higher effective price for producers)
- Subsidy cost = $1 \times 4 = \$4$
- DWL = excess of cost over CS + PS gains

---

## 8. Long-Run Equilibrium with Entry and Exit

### 8.1 The Entry/Exit Mechanism

In the **long run**, firms can enter or exit the industry:

- If $\pi > 0$: New firms enter → supply increases → price falls
- If $\pi < 0$: Firms exit → supply decreases → price rises
- Equilibrium when $\pi = 0$

### 8.2 Long-Run Equilibrium Conditions

At long-run equilibrium:

$$\boxed{p^{LR} = \min AC}$$

**Why?**
1. Profit maximization: $p = MC$
2. Zero profit: $p = AC$
3. Therefore: $MC = AC$, which only occurs at $\min AC$

### 8.3 Example: Entry/Exit with Identical Firms

Each firm has cost function: $C(y) = 1 + y^2$

- $MC = 2y$
- $AC = 1/y + y$
- $\min AC$: Set $\frac{dAC}{dy} = -1/y^2 + 1 = 0 \implies y^* = 1$
- $AC_{min} = 1 + 1 = 2$

**Long-run price**: $p^{LR} = 2$

**With demand $Q^d = 22 - 3p$**:
- Market quantity: $Q^{LR} = 22 - 3(2) = 16$
- Firm output: $y^* = 1$
- **Number of firms**: $n = Q^{LR}/y^* = 16/1 = 16$ firms

### 8.4 Entry/Exit Dynamics

```
   Short-Run                               Long-Run
   (n fixed)                              (free entry)
   
   p │        S_SR                        p │      S_LR (perfectly
     │       /                              │      elastic)
     │      /                               ├──────────────── p = min AC
p*  ├─────●────                        p^LR│        ●
     │    /│\  π > 0                        │       │
     │   / │ \   ↓                          │       │
     │  /  │  \  Entry                      │       │  D
     │ /   │   \ D                          │       │
     └─────┴────────                        └───────┴─────────
           Q*                                       Q^LR
```

---

## 9. Agricultural Market Applications

### 9.1 Seasonal Price Fluctuations

Agricultural markets exhibit predictable seasonal patterns:

**Harvest season**: Supply high → prices low
**Off-season**: Supply low → prices high

Storage arbitrage tends to smooth prices over time:
- Buy low at harvest, store, sell high later
- This reduces price volatility (but doesn't eliminate it due to storage costs)

### 9.2 Agricultural Support Policies

Common interventions in agricultural markets:

| Policy             | Mechanism                     | Welfare Effect                       |
| ------------------ | ----------------------------- | ------------------------------------ |
| Price floor        | Gov't sets $p_{min} > p^*$    | Surplus, storage costs, DWL          |
| Price ceiling      | Gov't sets $p_{max} < p^*$    | Shortage, rationing, DWL             |
| Production quota   | Limits quantity               | Higher prices, DWL                   |
| Deficiency payment | Subsidy when $p < p_{target}$ | Gov't cost, potential overproduction |

### 9.3 Example: Wheat Market Analysis

**Australian wheat market** (simplified):
- Domestic demand: $Q^d = 30 - 2p$ (million tonnes, p in $100/tonne)
- Domestic supply: $Q^s = 5p - 10$ (active for $p \geq 2$)

**Equilibrium**:
$$30 - 2p = 5p - 10$$
$$40 = 7p$$
$$p^* = 5.71 \quad (\$571/\text{tonne})$$
$$Q^* = 30 - 2(5.71) = 18.57 \text{ million tonnes}$$

**Policy question**: If the government imposes a $\$50$/tonne export subsidy, what happens to domestic prices and quantities?

---

## 10. Non-Competitive Market Equilibria

### 10.1 Overview: Equilibrium Under Market Power

Sections 2–9 assume all agents are **price-takers**. In reality, many agricultural input and output markets feature firms or buyers with market power — the ability to influence the price. This section analyses how equilibrium changes and why it diverges from the competitive benchmark.

See Section 1.3 for the overview tables of seller-side and buyer-side structures. The detailed analysis follows.

### 10.2 Monopoly Equilibrium

A monopolist chooses quantity to maximise profit:
$$\max_Q \; \pi = p(Q) \cdot Q - C(Q)$$

**First-order condition**:
$$MR(Q) = MC(Q)$$

where marginal revenue $MR = p + Q \cdot \frac{dp}{dQ} < p$ (because increasing output requires lowering price on all units).

**Key properties of monopoly equilibrium**:
- Price $p^m > MC$ — allocative inefficiency
- Quantity $Q^m < Q^{\text{comp}}$ — output restriction
- Positive economic profit ($\pi^m > 0$)
- **No supply curve**: the monopolist chooses a price-quantity pair, not a supply correspondence
- DWL is larger when demand is more inelastic (fewer substitutes)

#### Agricultural Example: Seed Patents

Bayer-Monsanto's Roundup Ready soybean and canola traits illustrate seller market power in an agricultural input market:
- A **technology use fee** (patent licence) is charged per bag of seed, transferring billions annually from farmers to the IP holder
- Herbicide-tolerant varieties are **bundled** with herbicide purchases (Roundup), raising input costs further
- The 2018 Bayer-Monsanto merger was cleared with ~USD 9 billion in divestitures ordered by regulators to preserve competition in specific crop-trait segments

### 10.3 Oligopoly: Strategic Interdependence

When a few large firms compete, each must account for rivals' reactions:

| Model               | Decision variable             | Key result                                                       |
| ------------------- | ----------------------------- | ---------------------------------------------------------------- |
| **Cournot**         | Quantities set simultaneously | $p > MC$; output between monopoly and competition                |
| **Bertrand**        | Prices set simultaneously     | With identical products: $p = MC$ ("Bertrand paradox")           |
| **Tacit collusion** | Implicit coordination         | Monopoly-like outcome; highly fact-sensitive for competition law |

#### Australian Grain Markets: Duopoly in Practice

On the east coast, **GrainCorp** and **Glencore Viterra** control the dominant share of storage, handling, and export infrastructure. Key consequences:
- Farmers have limited alternatives for selling grain post-harvest
- Port terminal access is a bottleneck; the ACCC regulates access pricing under Part IIIA of the *Competition and Consumer Act 2010*
- By contrast, **CBH** (Co-operative Bulk Handling, WA) is a grower-owned cooperative — profits are returned to farmers, partly offsetting the oligopsony problem on the output side

### 10.4 Monopsony Equilibrium

A monopsonist (single buyer) maximises buyer surplus by restricting purchases:

$$\text{Buyer's condition: } MFC = MV$$

where:
- $MFC$ = marginal factor cost = cost of buying one more unit (including the price rise on all existing purchases)
- $MV$ = marginal value of the purchased input/product to the buyer

Because the monopsonist faces an upward-sloping supply curve from sellers:
$$MFC > p_s \quad \text{(price paid to sellers)}$$

**Consequences**:
- Farm-gate price $p_s$ falls below the competitive level
- Quantity traded $Q^{\text{mono}} < Q^*$
- Sellers (farmers) bear the surplus loss; DWL arises from foregone mutually beneficial trades
- Farmers with **no outside option** (e.g., perishable produce, remote locations) absorb the full monopsony discount

### 10.5 Oligopsony in Practice: Australian Farm Output Markets

**ACCC Supermarket Inquiry (2024)**: Woolworths and Coles (~65% of grocery retail) were found to exercise buyer power through:
- Requests for below-cost supply as a condition of continued ranging
- Retrospective deductions (rebates charged after contracts were signed)
- Threats of de-listing suppliers who refused terms

**Thomas Foods Murray Bridge plant fire (2018)**: The destruction of Australia's largest beef abattoir created a *zone monopsony* — cattle producers within economical trucking distance suddenly had only one or two viable buyers. Farm-gate prices in the affected region fell materially for several months, demonstrating how thin market structure can become with even one buyer removed.

---

## 11. Market Power in Agricultural Supply Chains

### 11.1 Upstream Oligopoly: Farm Input Markets

Farmers face concentrated sellers on the input side:

| Input                       | Key firms                                    | Market structure                                                 | How it affects farmers                                             |
| --------------------------- | -------------------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------ |
| **Seeds (GM traits)**       | Bayer-Monsanto, Corteva, Syngenta/CNAC, BASF | ~4 firms >70% global commercial seed sales; patents on GM traits | Technology use fees; herbicide bundling; restricted seed-saving    |
| **Fertilisers**             | Nutrien, Mosaic, Yara, OCP                   | Potash highly concentrated geographically                        | 2022 Russian sanctions → 200–300% price spikes for N/K fertilisers |
| **Machinery & diagnostics** | John Deere, CNH, AGCO                        | Software-locked telematics; right-to-repair limited              | Higher repair costs; dependence on dealer networks                 |
| **Farm inputs retail (AU)** | Nutrien Ag Solutions (formerly Ruralco/CRT)  | Nutrien acquired Ruralco in 2019, gaining ~500 rural stores      | Reduced local competition for agrochemicals and crop inputs        |

### 11.2 Downstream Oligopsony: Farm Output Buyers

Farmers also face concentrated buyers on the output side:

| Commodity                 | Key buyers                                | Market share                                                                               | Notes                                        |
| ------------------------- | ----------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------- |
| **Fresh produce & dairy** | Woolworths, Coles                         | ~65% grocery retail                                                                        | ACCC Inquiry 2024; mandatory code April 2025 |
| **Grain (east coast AU)** | GrainCorp, Glencore Viterra; CBH (WA)     | Duopoly on east coast                                                                      | ACCC Part IIIA port terminal access          |
| **Beef & sheep**          | JBS Australia, NH Foods, Thomas Foods     | 4 processors >80% of cattle slaughter                                                      | Zone monopsony risk (Thomas Foods fire 2018) |
| **Wool**                  | Multiple but demand concentrated in China | Chinese demand withdrawal (late 2019) cut the Eastern Market Indicator by ~40% in 3 months | Export dependency risk                       |

### 11.3 The Bilateral Squeeze

Australian broadacre farmers face concentrated market power on **both** sides:

| Side                     | Structure               | Effect on farmer                      |
| ------------------------ | ----------------------- | ------------------------------------- |
| **Inputs** (upstream)    | Oligopoly (few sellers) | Input prices above competitive level  |
| **Outputs** (downstream) | Oligopsony (few buyers) | Output prices below competitive level |

The combined effect is called the **bilateral squeeze** or **cost-price squeeze**: farmers are price-takers on both sides of their business, compressed between input oligopoly and output oligopsony. ABARES total factor productivity (TFP) data for broadacre agriculture shows that output price growth has consistently lagged input cost growth over the last two decades, consistent with the bilateral squeeze hypothesis.

### 11.4 Policy Responses to Agricultural Market Power

| Policy instrument           | Mechanism                                                                 | Examples                                                                  |
| --------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| **Mandatory conduct codes** | Prohibit specified buyer behaviours; mandatory dispute resolution         | Food and Grocery Code (mandatory April 2025)                              |
| **Collective bargaining**   | Allow farmers to negotiate collectively without breaching competition law | ACCC s.93 authorisation; used in dairy (Murray Goulburn) and horticulture |
| **Price transparency**      | Mandatory reporting of transaction prices; reduces information asymmetry  | Cattle and sheep mandatory price reporting since 2020                     |
| **Infrastructure access**   | Regulate access to bottleneck facilities (silos, port terminals)          | ACCC Part IIIA declarations for grain port terminals                      |

---

## 12. Summary: The Market Equilibrium Framework

### 12.1 Key Equations

| Concept            | Formula                                                             |
| ------------------ | ------------------------------------------------------------------- |
| Market equilibrium | $D(p^*) = S(p^*)$                                                   |
| Consumer surplus   | $CS = \int_0^{Q^*}[P^d(Q) - p^*]dQ$                                 |
| Producer surplus   | $PS = \int_0^{Q^*}[p^* - P^s(Q)]dQ$                                 |
| Total welfare      | $W = CS + PS$                                                       |
| Tax wedge          | $p_b = p_s + t$                                                     |
| Deadweight loss    | $DWL \approx \frac{1}{2}t\Delta Q$                                  |
| Long-run price     | $p^{LR} = \min AC$                                                  |
| Number of firms    | $n = Q^{LR}/y^*_{firm}$                                             |
| Market power       | Monopoly: $MR = MC$, $p^m > MC$; Monopsony: $MFC = MV$, $p_s < p^*$ |

### 12.2 The Welfare Analysis Process

```
┌─────────────────────────────────────────────────────────────────┐
│              WELFARE ANALYSIS PROCEDURE                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Find original equilibrium (p*, Q*)                          │
│                    ↓                                             │
│  2. Calculate original CS and PS                                 │
│                    ↓                                             │
│  3. Introduce policy (tax, subsidy, price control)              │
│                    ↓                                             │
│  4. Find new equilibrium (p_new, Q_new)                         │
│                    ↓                                             │
│  5. Calculate new CS, PS, government revenue/cost               │
│                    ↓                                             │
│  6. Compute changes: ΔCS, ΔPS, ΔGov                             │
│                    ↓                                             │
│  7. Calculate DWL = -(ΔCS + ΔPS + ΔGov)                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 12.3 Looking Ahead

This week's competitive equilibrium framework provides the foundation for:
- **Week 10**: Market failures (externalities, public goods)
- **Later**: Strategic interaction (game theory, oligopoly)
- **Applications**: Environmental policy, agricultural trade, resource extraction

---

## R Code Integration

See `week9_code_snippets.json` for implementations including:
- Market equilibrium solver
- Surplus calculations
- Tax/subsidy analysis
- Entry/exit dynamics simulation
- Graphical visualization

---

## Practice Problems

Work through the problems in `week9_practice.json`, which include:
- Demand/supply aggregation
- Equilibrium calculations
- Welfare analysis
- Tax and subsidy effects
- Long-run equilibrium with entry/exit
- Agricultural market applications
