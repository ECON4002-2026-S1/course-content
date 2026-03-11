# Week 10: International Trade and Policy

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Explain why nations trade using comparative advantage
2. Distinguish between autarky and free trade equilibria
3. Derive excess demand and excess supply functions
4. Analyze welfare effects of trade for small and large countries
5. Evaluate the impact of tariffs on prices, quantities, and welfare
6. Calculate deadweight loss from trade restrictions
7. Compare tariffs, quotas, and subsidies as policy instruments

---

## 1. Why Nations Trade

### 1.1 Measuring Trade Openness

**Trade openness** measures a country's integration with the global economy:

$$\text{Trade Openness} = \frac{\text{Exports} + \text{Imports}}{\text{GDP}} \times 100\%$$

Australia's trade openness ≈ 45% (2024), reflecting significant agricultural exports (wheat, beef, wool) and manufactured imports.

### 1.2 Gains from Trade: The Core Insight

Trade allows countries to:
- **Specialize** in goods they produce relatively efficiently
- **Consume** beyond their own production possibilities
- **Access** goods they cannot produce domestically

```
┌─────────────────────────────────────────────────────────────────────┐
│                    AUTARKY vs FREE TRADE                             │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│   Good Y                                                             │
│     │                                                                │
│     │        PPF                                                     │
│     │      ╱    ╲                                                    │
│     │    ╱   C    ╲  ← Consumption with trade                       │
│     │  ╱    ↗      ╲    (beyond PPF!)                               │
│     │ ╱   B         ╲  ← Production with trade                      │
│     │╱  A            ╲ ← Autarky (produce = consume)                │
│     └────────────────────── Good X                                   │
│                                                                      │
│   A: Autarky equilibrium (on PPF, domestic prices)                  │
│   B: Production point with trade (specialize)                       │
│   C: Consumption point with trade (import Y, export X)              │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 2. Comparative Advantage

### 2.1 Absolute vs Comparative Advantage

**Absolute advantage**: Producing a good using fewer resources

**Comparative advantage**: Producing a good at a lower **opportunity cost**

**Key insight** (David Ricardo, 1817): Trade is beneficial even if one country has absolute advantage in everything. What matters is *relative* efficiency.

### 2.2 Numerical Example

Consider Australia and the US producing wheat (Good 1) and cars (Good 2):

| Country | Labor Hours per Unit |        | Opportunity Cost |        |
|---------|---------------------|--------|------------------|--------|
|         | Wheat               | Cars   | Wheat            | Cars   |
| Australia | 20                | 40     | 1/2 car          | 2 wheat |
| US      | 6                   | 24     | 1/4 car          | 4 wheat |

**Analysis**:
- US has **absolute advantage** in both goods (fewer hours)
- Australia's opportunity cost of wheat: 20/40 = 1/2 car
- US's opportunity cost of wheat: 6/24 = 1/4 car
- US has **comparative advantage** in wheat (lower OC)
- Australia has **comparative advantage** in cars (lower OC: 2 vs 4 wheat)

### 2.3 Gains from Specialization

Without trade: Each country produces both goods inefficiently

With trade:
- US specializes in wheat (comparative advantage)
- Australia specializes in cars (comparative advantage)
- Both countries can consume more of both goods

### 2.4 Terms of Trade

The **terms of trade** (ToT) is the ratio at which goods exchange internationally:

$$\text{ToT} = \frac{P_{\text{export}}}{P_{\text{import}}}$$

For mutually beneficial trade, the ToT must lie between the two countries' opportunity costs:

**Example**: Trade in cars for wheat
- Australia won't trade 1 car for less than 2 wheat (its OC)
- US won't pay more than 4 wheat for 1 car (its OC)
- Mutually beneficial ToT: 1 car trades for 2-4 wheat

---

## 3. Sources of Comparative Advantage

### 3.1 Factor Endowments: Heckscher-Ohlin Model

Countries have comparative advantage in goods that use their **abundant factors** intensively:

| Country | Abundant Factor | Comparative Advantage |
|---------|-----------------|----------------------|
| Australia | Land | Land-intensive goods (wheat, beef, wool) |
| China | Labor | Labor-intensive goods (textiles, electronics assembly) |
| Germany | Capital, skilled labor | Capital-intensive goods (machinery, autos) |

### 3.2 Factor Price Equalization

The Heckscher-Ohlin model predicts that free trade tends to **equalize factor prices** across countries:

- Trade increases demand for the abundant factor → its price rises
- Trade decreases demand for the scarce factor → its price falls
- In the limit, wages and rents converge internationally

**Implication for Australia**: Trade raises returns to land (farmland values increase) while potentially lowering returns to labor in import-competing industries.

### 3.3 Other Sources

- **Technology differences** (Ricardian model)
- **Economies of scale** (New Trade Theory)
- **Product differentiation** (intra-industry trade)
- **Historical accident** and path dependence

---

## 4. Partial Equilibrium Analysis of Trade

### 4.1 The Framework

We analyze trade in a **single market** (partial equilibrium), building on Week 9's supply-demand framework.

**Key concepts**:
- **Domestic demand**: $D(p)$
- **Domestic supply**: $S(p)$
- **World price**: $p^w$ (exogenous for small country)
- **Autarky price**: $p^A$ where $D(p^A) = S(p^A)$

### 4.2 Autarky Equilibrium

In **autarky** (no trade), the domestic market clears:

$$D(p^A) = S(p^A)$$

```
    p │
      │         S
      │        /
  p^A ├───────●───── Autarky equilibrium
      │      /│╲
      │     / │ ╲
      │    /  │  ╲ D
      │   /   │   ╲
      └───────┴─────── Q
              Q^A
```

### 4.3 Excess Demand and Supply

**Excess demand** (import demand): $ED(p) = D(p) - S(p)$

**Excess supply** (export supply): $ES(p) = S(p) - D(p) = -ED(p)$

At domestic prices:
- If $p < p^A$: $ED(p) > 0$ (would import)
- If $p > p^A$: $ES(p) > 0$ (would export)
- If $p = p^A$: $ED = ES = 0$ (autarky)

---

## 5. Small Country Trade Analysis

### 5.1 The Small Country Assumption

A **small country** is a price-taker in world markets:
- Cannot influence world price $p^w$
- Faces perfectly elastic world supply/demand
- Australia is "small" in markets like oil, but "large" in wool

### 5.2 Free Trade Equilibrium

**Case 1: Importing** ($p^w < p^A$)

When the world price is below the autarky price:

```
    p │
      │         S
      │        /
  p^A ├───────●─────
      │      /│╲
      │     / │ ╲
  p^w ├────●──┼──●───── World price (perfectly elastic)
      │   /│  │  │╲
      │  / │  │  │ ╲ D
      │ /  │  │  │  ╲
      └────┴──┴──┴───── Q
          S^w    D^w
           ←─────→
            Imports
```

At $p = p^w$:
- Domestic production: $Q_S = S(p^w)$
- Domestic consumption: $Q_D = D(p^w)$
- **Imports**: $M = D(p^w) - S(p^w) = Q_D - Q_S$

### 5.3 Welfare Effects of Free Trade (Importing)

Compared to autarky:

| Component | Change | Explanation |
|-----------|--------|-------------|
| Consumer Surplus | $+$ (gains) | Lower price, more consumption |
| Producer Surplus | $-$ (losses) | Lower price, less production |
| **Net Welfare** | $+$ (gains) | CS gains > PS losses |

$$\Delta W = \Delta CS + \Delta PS > 0$$

**Key result**: Free trade increases total welfare, but creates winners (consumers) and losers (domestic producers).

### 5.4 Graphical Welfare Analysis

```
    p │
      │         S
  p^A ├───────●─────
      │    a /│╲ b
      │     / │ ╲
  p^w ├────●──┼──●─────
      │   /│ c│ d│╲
      │    │  │  │  D
      └────┴──┴──┴───── Q
          S^w Q^A D^w

    ΔCS = +a + b + c + d  (large gain)
    ΔPS = -a              (loss)
    ΔW  = +b + c + d      (net gain)
```

The triangles $b$ and $d$ represent the **gains from trade**—value created by:
- $b$: Releasing resources from inefficient domestic production
- $d$: Consumers accessing goods they value above $p^w$

---

## 6. Import Tariffs

### 6.1 What is a Tariff?

A **tariff** is a tax on imports:

- **Specific tariff**: Fixed amount per unit ($t$ dollars per tonne)
- **Ad valorem tariff**: Percentage of value ($\tau\%$ of price)

Tariff raises domestic price above world price:
$$p^{tariff} = p^w + t \quad \text{(specific)}$$
$$p^{tariff} = p^w(1 + \tau) \quad \text{(ad valorem)}$$

### 6.2 Small Country Tariff Analysis

With tariff $t$, domestic price rises to $p^w + t$:

```
    p │
      │              S
  p^A ├─────────●─────
      │        /│╲
p^w+t ├──────●─┼─●────── Domestic price with tariff
      │     /│E│F│╲
      │    / │ │ │ ╲
  p^w ├───●──┼─┼─┼──●─── World price
      │  / g│ │ │ h│ ╲
      │ /   │ │ │  │  ╲ D
      └─────┴─┴─┴──┴────── Q
           S_t    D_t
            ←─────→
         Imports (reduced)
```

### 6.3 Welfare Effects of Tariff (Small Country)

| Component | Change | Area |
|-----------|--------|------|
| Consumer Surplus | $\Delta CS < 0$ | $-(E + F + g + h)$ |
| Producer Surplus | $\Delta PS > 0$ | $+E$ |
| Government Revenue | $+T$ | $+F$ |
| **Net Welfare** | $\Delta W < 0$ | $-(g + h)$ |

**Deadweight loss**: $DWL = g + h$

Where:
- $g$ = Production inefficiency (resources in inefficient domestic production)
- $h$ = Consumption inefficiency (foregone consumer surplus)

### 6.4 Tariff Calculations

**Example**: Australian wheat import market
- Demand: $Q^D = 100 - 2p$
- Supply: $Q^S = 3p - 20$
- World price: $p^w = 20$

**Free trade**:
- $Q^D = 100 - 40 = 60$
- $Q^S = 60 - 20 = 40$
- Imports = 60 - 40 = 20

**With tariff $t = 5$**:
- Domestic price: $p = 25$
- $Q^D = 100 - 50 = 50$
- $Q^S = 75 - 20 = 55$
- Imports = 50 - 55 = -5 (now exports!)

This tariff is **prohibitive**—it reverses trade direction.

---

## 7. Import Quotas

### 7.1 What is a Quota?

An **import quota** is a quantitative restriction limiting imports to $\bar{M}$ units.

### 7.2 Quota Analysis

With quota $\bar{M}$:

$$D(p^q) - S(p^q) = \bar{M}$$

Solve for the **quota-induced price** $p^q$.

```
    p │
      │              S      S + M̄ (domestic + quota)
      │             /      /
  p^q ├────────────●──────●
      │           /│     /│
      │          / │    / │
  p^w ├─────────/──┼───/──┼────
      │        /   │  /   │
      │       /    │ /    │ D
      └────────────┴──────┴────── Q
              S^q       D^q
               ←──M̄──→
```

### 7.3 Quota vs Tariff Equivalence

A quota of $\bar{M}$ has the same price and quantity effects as a tariff that reduces imports to $\bar{M}$.

**Key difference**: Who captures the "quota rent" (area $F$)?

| Instrument | Rent Recipient |
|------------|----------------|
| Tariff | Government (tax revenue) |
| Quota (auctioned) | Government (auction revenue) |
| Quota (allocated) | Quota holders (importers) |
| Quota (foreign) | Foreign exporters |

### 7.4 Quota Rent

**Quota rent** = $(p^q - p^w) \times \bar{M}$

This is the premium earned by those with the right to import.

---

## 8. Export Subsidies and Other Instruments

### 8.1 Export Subsidies

An **export subsidy** pays domestic producers to export:

$$p^{domestic} = p^w + s$$

Effects (small exporting country):
- Domestic price rises above world price
- Domestic consumers pay more (lose)
- Domestic producers receive more (gain)
- Government pays subsidy (cost)
- Net welfare loss (DWL)

### 8.2 Other Trade Policy Instruments

| Instrument | Description | Effect |
|------------|-------------|--------|
| **Voluntary Export Restraint (VER)** | Exporting country limits exports | Like quota, rent goes to foreigners |
| **Local content requirement** | Minimum domestic input share | Raises costs, protects input suppliers |
| **Anti-dumping duties** | Tariff on "unfairly" priced imports | Often disguised protectionism |
| **Sanitary/Phytosanitary (SPS)** | Health/safety standards | Can be legitimate or protectionist |

---

## 9. Large Country Analysis

### 9.1 The Large Country Case

A **large country** can affect world prices through its trade:
- Large importer: Imports drive down world price
- Large exporter: Exports drive up world price

### 9.2 Large Country Tariff

When a large country imposes a tariff:

1. Domestic price rises (but by less than $t$)
2. World price falls (foreign suppliers absorb part of tariff)
3. **Terms of trade improve** for the importing country

```
    p │
      │              S
      │             /
p^w+t ├────────────●────── What domestic price would be (small country)
      │           /│
  p_d ├──────────●─┼────── Actual domestic price
      │         /│ │
  p^w ├────────/─┼─┼────── Original world price
      │       /  │ │
p^w' ├──────/───┼─┼────── New world price (falls!)
      │    /    │ │
      └─────────┴─┴────── Q

    Tariff incidence shared: domestic consumers pay (p_d - p^w)
                            foreign suppliers absorb (p^w - p^w')
```

### 9.3 Optimal Tariff

For a large country, there exists an **optimal tariff** $t^*$ that maximizes national welfare:

$$t^* = \frac{1}{\epsilon^{*}_s - 1}$$

where $\epsilon^*_s$ is the foreign export supply elasticity.

**Intuition**: The optimal tariff exploits market power to extract rents from foreign suppliers.

**Limitations**:
- Invites retaliation (trade wars)
- Harms trading partners
- WTO rules prohibit discriminatory tariffs

---

## 10. Political Economy of Trade Policy

### 10.1 Why Do Countries Restrict Trade?

Despite welfare losses, trade restrictions persist due to:

| Reason | Explanation |
|--------|-------------|
| **Revenue** | Tariffs are easy to collect (especially in developing countries) |
| **Protection** | Shield domestic industries from foreign competition |
| **Employment** | Preserve jobs in import-competing sectors |
| **National security** | Self-sufficiency in strategic goods |
| **Infant industry** | Temporary protection for new industries |
| **Retaliation** | Respond to trading partners' restrictions |

### 10.2 Distributional Effects

Trade creates **winners and losers**:

| Group | Free Trade | Protection |
|-------|------------|------------|
| Consumers | Gain (lower prices) | Lose |
| Import-competing producers | Lose | Gain |
| Export producers | Gain | Lose (if retaliation) |
| Overall welfare | Higher | Lower |

**Political economy**: Losers from trade are often concentrated and organized; gains are diffuse.

### 10.3 Australian Agricultural Trade Policy

Australia generally pursues **free trade** in agriculture:
- Net exporter of agricultural products
- Competitive in global markets
- Benefits from open markets abroad

**Key issues**:
- Market access barriers in export destinations
- SPS measures as disguised protection
- Subsidies in competing countries (EU, US)

---

## 11. Summary: Trade Policy Analysis Framework

### 11.1 The Analysis Procedure

```
┌─────────────────────────────────────────────────────────────────┐
│              TRADE POLICY ANALYSIS PROCEDURE                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Establish autarky equilibrium (p^A, Q^A)                    │
│                    ↓                                             │
│  2. Compare p^A with p^w to determine trade direction           │
│     • p^w < p^A → imports                                       │
│     • p^w > p^A → exports                                       │
│                    ↓                                             │
│  3. Calculate free trade quantities and welfare                 │
│                    ↓                                             │
│  4. Introduce policy (tariff, quota, subsidy)                   │
│                    ↓                                             │
│  5. Find new domestic price                                      │
│     • Small country: p_d = p^w + t                              │
│     • Large country: solve for p_d and p^w'                     │
│                    ↓                                             │
│  6. Calculate changes: ΔCS, ΔPS, ΔGov, ΔW                       │
│                    ↓                                             │
│  7. Identify DWL and distributional effects                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 11.2 Key Formulas

| Concept | Formula |
|---------|---------|
| Imports | $M = D(p) - S(p)$ |
| Exports | $X = S(p) - D(p)$ |
| Tariff price (small) | $p_d = p^w + t$ |
| Tariff revenue | $T = t \times M$ |
| DWL (tariff) | $DWL = \frac{1}{2}t(\Delta Q_D + \Delta Q_S)$ |
| Quota rent | $QR = (p^q - p^w) \times \bar{M}$ |
| Terms of trade | $ToT = P_{export}/P_{import}$ |

### 11.3 Policy Comparison

| Instrument | Price Effect | Welfare Loss | Revenue/Rent |
|------------|--------------|--------------|--------------|
| Free trade | $p = p^w$ | None | None |
| Tariff | $p > p^w$ | DWL | Government |
| Quota | $p > p^w$ | DWL + rent loss | Quota holders |
| Export subsidy | $p > p^w$ (domestic) | DWL | Government cost |

---

## 12. Agricultural Trade Applications

### 12.1 Australian Wheat Exports

Australia is a **large exporter** of wheat:
- ~15% of global wheat trade
- Exports to Asia, Middle East, Africa
- Price-maker in some regional markets

Policy implications:
- Export restrictions would lower world price
- Domestic consumers might benefit short-term
- Long-term damage to export industry

### 12.2 Beef Import Restrictions

Many countries restrict beef imports (SPS, tariffs):
- Japan: High tariffs, strict SPS
- US: Quota system for Australian beef
- EU: Hormone ban effectively blocks imports

Australian response:
- Negotiate market access (FTAs)
- Develop alternative markets
- Maintain high SPS standards for credibility

### 12.3 Sugar and Dairy Protection

Australia's sugar and dairy sectors face:
- Subsidized competition (EU, US sugar programs)
- High tariffs in potential export markets
- Domestic adjustment pressures

---

## R Code Integration

See `week10_code_snippets.json` for implementations including:
- Autarky vs free trade equilibrium
- Import/export quantity calculations
- Tariff welfare analysis
- Quota analysis with rent calculation
- Large country tariff effects

---

## Practice Problems

Work through the problems in `week10_practice.json`, which include:
- Comparative advantage calculations
- Trade direction determination
- Tariff welfare decomposition
- Quota vs tariff comparison
- Large country optimal tariff
- Australian agricultural trade scenarios
