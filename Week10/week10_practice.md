# Week 10: Practice Problems — International Trade and Policy

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Problem 1: Comparative Advantage (Basic)

Two countries produce rice (R) and textiles (T):

| Country | Labor Hours per Unit |        |
|---------|---------------------|--------|
|         | Rice                | Textiles |
| Vietnam | 5                   | 10     |
| Japan   | 2                   | 3      |

**(a)** Which country has absolute advantage in each good?

**(b)** Calculate the opportunity cost of producing one unit of rice in each country.

**(c)** Calculate the opportunity cost of producing one unit of textiles in each country.

**(d)** Which country has comparative advantage in rice? In textiles?

**(e)** If trade occurs, which good will each country export?

---

## Problem 2: Terms of Trade (Basic)

Using the countries from Problem 1:

**(a)** What is the range of mutually beneficial terms of trade for textiles (in units of rice per textile)?

**(b)** If the terms of trade are 4 rice per 1 textile, which country gains more? Explain.

**(c)** How do transport costs affect the viable range of terms of trade?

---

## Problem 3: Autarky vs Free Trade (Intermediate)

A small country has:
- Domestic demand: $Q^D = 120 - 2p$
- Domestic supply: $Q^S = 3p - 30$
- World price: $p^w = 24$

**(a)** Find the autarky equilibrium price and quantity.

**(b)** Under free trade, will this country import or export? How much?

**(c)** Calculate consumer surplus under autarky and under free trade.

**(d)** Calculate producer surplus under autarky and under free trade.

**(e)** What is the net gain from trade?

---

## Problem 4: Tariff Analysis — Small Country (Intermediate)

Using the country from Problem 3, the government imposes a specific tariff of $t = 6$ per unit.

**(a)** What is the new domestic price?

**(b)** Calculate domestic consumption and production under the tariff.

**(c)** How much are imports reduced?

**(d)** Calculate tariff revenue.

**(e)** Calculate the deadweight loss from the tariff.

**(f)** Show the welfare decomposition: $\Delta CS$, $\Delta PS$, government revenue, and net welfare change.

---

## Problem 5: Import Quota (Intermediate)

Same market as Problem 3 ($Q^D = 120 - 2p$, $Q^S = 3p - 30$, $p^w = 24$).

The government imposes an import quota of $\bar{M} = 12$ units.

**(a)** Find the domestic price under the quota.

**(b)** Calculate domestic consumption and production.

**(c)** Calculate the quota rent. Who captures this rent if:
   - (i) Quota licenses are auctioned?
   - (ii) Quota licenses are given to domestic importers?
   - (iii) Foreign exporters allocate the quota (VER)?

**(d)** Compare total welfare loss under the quota vs. an equivalent tariff.

---

## Problem 6: Export Country Analysis (Intermediate)

A small country is an exporter:
- Domestic demand: $Q^D = 80 - p$
- Domestic supply: $Q^S = 2p - 10$
- World price: $p^w = 40$

**(a)** Find the autarky equilibrium.

**(b)** Calculate exports under free trade.

**(c)** The government imposes an export tax of $t = 9$. Find the new domestic price, exports, and welfare effects.

**(d)** Compare to an export subsidy of $s = 6$. Who gains and who loses?

---

## Problem 7: Large Country Tariff (Advanced)

A large importing country faces:
- Domestic demand: $Q^D = 200 - 4p$
- Domestic supply: $Q^S = 2p - 40$
- Foreign export supply (to this market): $X^* = 4p^w - 80$

**(a)** Find the free trade equilibrium (domestic price, world price, imports).

**(b)** The country imposes a tariff of $t = 10$. Find the new domestic price, world price, and imports.

**(c)** How is the tariff burden shared between domestic consumers and foreign suppliers?

**(d)** Calculate the terms of trade gain for the importing country.

**(e)** Is overall welfare higher or lower than under free trade? (Compare DWL to ToT gain)

---

## Problem 8: Optimal Tariff (Advanced)

Using the large country from Problem 7:

**(a)** Derive the formula for the optimal tariff in terms of the foreign export supply elasticity.

**(b)** Calculate the foreign export supply elasticity at the free trade equilibrium.

**(c)** What is the optimal tariff for this country?

**(d)** Why might this country choose not to impose the optimal tariff?

---

## Problem 9: Australian Beef Market (Application)

The Australian beef market:
- Domestic demand: $Q^D = 1200 - 10p$ (thousand tonnes, p in $100/tonne)
- Domestic supply: $Q^S = 5p + 200$
- Export demand from Asia: $Q^{export} = 800 - 5p^w$

**(a)** Find the autarky equilibrium in Australia.

**(b)** If Australia faces a world price of $p^w = 50$, how much does it export?

**(c)** Japan imposes an import tariff equivalent to $15 per unit. How does this affect Australian exports and domestic price?

**(d)** Calculate the welfare loss to Australia from Japan's tariff.

---

## Problem 10: Policy Comparison (Application)

A government wants to reduce imports by 50% from the free trade level. Compare three instruments:
- (i) Import tariff
- (ii) Import quota
- (iii) Domestic production subsidy

For each instrument:
**(a)** Describe the mechanism that reduces imports.

**(b)** Identify who bears the cost.

**(c)** Rank by total welfare loss (including government budget effects).

**(d)** Which instrument do domestic producers prefer? Why?

---

## Problem 11: Excess Demand/Supply Derivation (Computational)

Given:
- Domestic demand: $Q^D = a - bp$
- Domestic supply: $Q^S = c + dp$

**(a)** Derive the excess demand function $ED(p)$.

**(b)** Derive the excess supply function $ES(p)$.

**(c)** At what price is excess demand zero?

**(d)** Graph the excess demand function, marking the autarky price and regions of importing/exporting.

---

## Problem 12: R Implementation (Computational)

Write R functions to:

**(a)** Calculate autarky equilibrium and free trade quantities given demand, supply, and world price.

**(b)** Perform tariff welfare analysis, returning $\Delta CS$, $\Delta PS$, revenue, and DWL.

**(c)** Compare tariff vs quota with equivalent import reduction.

Test with: $Q^D = 100 - 2p$, $Q^S = p - 20$, $p^w = 30$, $t = 10$.

---

## Solutions Summary

| Problem | Key Result |
|---------|------------|
| 1 | Japan: abs adv both; Vietnam: comp adv rice, Japan: comp adv textiles |
| 2 | ToT range: 2 to 3 rice per textile |
| 3 | Autarky: $p^A = 30$, $Q^A = 60$; Free trade: imports = 24 |
| 4 | Tariff: $p = 30$, imports = 12, DWL = 36 |
| 5 | Quota: $p^q = 28.4$, rent = 52.8 |
| 6 | Export tax lowers domestic price; export subsidy raises it |
| 7 | Large country: tariff partly absorbed by foreigners |
| 8 | Optimal tariff = $1/(\varepsilon_s - 1)$ |
| 9 | Japanese tariff reduces Australian exports and welfare |
| 10 | Production subsidy generally least distortionary |
