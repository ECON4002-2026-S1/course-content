# Week 5: Practice Problems — Utility & Marshallian Demand

## W5-P1: Indifference Curves (Basic)
Sketch indifference curves for:
- (a) U = x₁⁰·⁵x₂⁰·⁵
- (b) U = 2x₁ + 3x₂
- (c) U = min{x₁, 2x₂}
- (d) U = x₁ + ln(x₂)

---

## W5-P2: MRS Calculation (Basic)
For U = x₁⁰·³x₂⁰·⁷, find MRS at (10, 20). Interpret economically.

**Hints**: MRS = MU₁/MU₂ = (∂U/∂x₁)/(∂U/∂x₂)

---

## W5-P3: Monotonic Transformations (Basic)
Show that U = x₁x₂ and V = ln(x₁) + ln(x₂) represent identical preferences.

---

## W5-P4: Budget Constraint (Basic)
Budget: p₁=4, p₂=5, m=100.
- (a) Write budget equation
- (b) Find intercepts
- (c) If p₁ rises to 8, describe change

---

## W5-P5: Cobb-Douglas Utility Maximization (Intermediate) ⭐
**Problem**: U = x₁⁰·⁴x₂⁰·⁶, prices p₁=2, p₂=3, income m=120.
Find optimal bundle, utility, and λ.

**Solution**:

**Lagrangian**: ℒ = x₁⁰·⁴x₂⁰·⁶ + λ(120 - 2x₁ - 3x₂)

**FOCs**:
- ∂ℒ/∂x₁ = 0.4x₁⁻⁰·⁶x₂⁰·⁶ = 2λ
- ∂ℒ/∂x₂ = 0.6x₁⁰·⁴x₂⁻⁰·⁴ = 3λ

**Divide**: (0.4x₂)/(0.6x₁) = 2/3 → x₂ = x₁

**Budget**: 2x₁ + 3x₁ = 120 → x₁ = 24, x₂ = 24

**Direct formula** (for Cobb-Douglas):
- x₁ = αm/p₁ = 0.4(120)/2 = 24
- x₂ = (1-α)m/p₂ = 0.6(120)/3 = 24

**Utility**: U = 24⁰·⁴ × 24⁰·⁶ = 24

**Lambda**: λ = MU₁/p₁ = 0.4(24⁻⁰·⁶)(24⁰·⁶)/2 = 0.4/2 = 0.2

---

## W5-P6: Perfect Substitutes (Intermediate)
U = 3x₁ + 4x₂, p₁=6, p₂=10, m=60. Find optimal bundle.

**Solution**:
- MRS = 3/4 = 0.75
- Price ratio = 6/10 = 0.6
- MRS > p₁/p₂ means x₁ gives more utility per dollar
- MU₁/p₁ = 3/6 = 0.5 > MU₂/p₂ = 4/10 = 0.4
- **Corner solution**: x₁ = 60/6 = 10, x₂ = 0

---

## W5-P7: Perfect Complements (Intermediate)
U = min{2x₁, x₂}, p₁=4, p₂=2, m=40. Find optimal bundle.

**Solution**:
- At optimum: 2x₁ = x₂
- Budget: 4x₁ + 2(2x₁) = 40 → 8x₁ = 40 → x₁ = 5
- x₂ = 10, U = min{10, 10} = 10

---

## W5-P8: Quasi-Linear Utility (Intermediate)
U = x₁ + 4√x₂, p₁=1, p₂=4, m=20. Find optimal bundle.

**Solution**:
- FOC: MU₂/MU₁ = (2/√x₂)/1 = p₂/p₁ = 4
- √x₂ = 0.5 → x₂ = 0.25
- Budget: x₁ = 20 - 4(0.25) = 19
- **Key**: x₂ doesn't depend on income (zero income effect)

---

## W5-P9: Comparative Statics (Intermediate)
For Cobb-Douglas U = x₁⁰·⁵x₂⁰·⁵ with m=100:
- (a) Find demand when p₁=2, p₂=2
- (b) Find demand when p₁=4, p₂=2
- (c) Calculate price elasticity of x₁

**Solution**:
- (a) x₁ = 25, x₂ = 25
- (b) x₁ = 12.5, x₂ = 25
- (c) ε = (Δx₁/x₁)/(Δp₁/p₁) = (-0.5)/1 = **-1** (unit elastic)

---

## W5-P10: R Implementation (Intermediate)
Write R function to solve Cobb-Douglas utility max numerically using nloptr.

```r
library(nloptr)

utility_max_numerical <- function(p1, p2, m, alpha) {
  eval_f <- function(x) -x[1]^alpha * x[2]^(1-alpha)
  
  eval_g_eq <- function(x) p1*x[1] + p2*x[2] - m
  eval_jac_g_eq <- function(x) c(p1, p2)
  
  result <- nloptr(x0 = c(m/(2*p1), m/(2*p2)),
                   eval_f = eval_f,
                   eval_g_eq = eval_g_eq,
                   eval_jac_g_eq = eval_jac_g_eq,
                   opts = list(algorithm = 'NLOPT_LD_SLSQP'))
  return(result$solution)
}
```

---

## W5-P11: Agricultural Application (Advanced) ⭐
Household allocates food budget m=200 between staples (x₁) and meat (x₂).
U = x₁⁰·⁷x₂⁰·³, p₁=2, p₂=10.

- (a) Find demands
- (b) Government subsidizes meat to p₂=5. New demands?
- (c) Income elasticities?

**Solution**:
- (a) F = 0.7(200)/2 = 70 kg, M = 0.3(200)/10 = 6 kg
- (b) F = 70 kg (unchanged!), M = 0.3(200)/5 = 12 kg (doubles)
- (c) Income elasticity = 1 for both goods (Cobb-Douglas property)

**Policy insight**: Subsidy doubles meat consumption but doesn't affect staple consumption.

---

## W5-P12: General Utility with SOC (Advanced)
U = ln(x₁) + 2ln(x₂), p₁=1, p₂=2, m=12. Solve and verify SOC.

**Solution**:
- FOCs: 1/x₁ = λ and 2/x₂ = 2λ → x₁ = x₂
- Budget: x₁ + 2x₁ = 12 → x₁ = 4, x₂ = 4
- λ = 0.25

---

## Key Formulas Summary

| Concept | Formula |
|---------|---------|
| MRS | MU₁/MU₂ |
| Optimality | MRS = p₁/p₂ |
| Cobb-Douglas demand | x₁ = αm/p₁ |
| Perfect substitutes | Corner: buy higher MU/p |
| Perfect complements | At kink: ax₁ = bx₂ |
