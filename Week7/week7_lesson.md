# Week 7: Producer Theory I — Technology & Costs

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Represent production technology using production functions
2. Calculate and interpret marginal and average products
3. Analyze isoquants and the marginal rate of technical substitution
4. Classify returns to scale for different production technologies
5. Solve the cost minimization problem
6. Derive cost functions and apply Shephard's Lemma
7. Distinguish short-run from long-run cost curves

---

## 1. The Producer's Problem

### 1.1 From Consumers to Producers

In consumer theory, agents maximize utility subject to a budget constraint. Producers face a **dual structure**:

| Consumer Theory | Producer Theory |
|-----------------|-----------------|
| Maximize utility | Maximize profit |
| Budget constraint | Technology constraint |
| Preferences (utility function) | Technology (production function) |
| Indifference curves | Isoquants |
| MRS | MRTS |

The mathematical tools are nearly identical—we're applying the same optimization framework to a different economic context.

### 1.2 Two-Stage Approach

Profit maximization can be decomposed:

**Stage 1 (This Week):** Cost Minimization  
Given output $y$, choose inputs to minimize cost:
$$\min_{L,K} wL + rK \quad \text{s.t.} \quad f(L,K) = y$$

**Stage 2 (Next Week):** Output Choice  
Given cost function $C(y)$, choose output to maximize profit:
$$\max_{y} py - C(y)$$

---

## 2. Production Functions

### 2.1 Definition

A **production function** $f: \mathbb{R}^n_+ \to \mathbb{R}_+$ maps inputs to maximum achievable output:
$$y = f(x_1, x_2, \ldots, x_n) = f(L, K)$$

For two inputs (labor $L$, capital $K$):
$$y = f(L, K)$$

**Properties assumed:**
- $f(0) = 0$ (no inputs → no output)
- $f$ is increasing in all inputs
- $f$ is (quasi-)concave (diminishing marginal returns)

### 2.2 Common Production Functions

**Cobb-Douglas:**
$$f(L, K) = A L^\alpha K^\beta$$

**Leontief (Fixed Proportions):**
$$f(L, K) = \min\left\{\frac{L}{a}, \frac{K}{b}\right\}$$

**CES (Constant Elasticity of Substitution):**
$$f(L, K) = A\left[\delta L^\rho + (1-\delta)K^\rho\right]^{1/\rho}$$

where $\sigma = \frac{1}{1-\rho}$ is the elasticity of substitution.

**Linear (Perfect Substitutes):**
$$f(L, K) = aL + bK$$

### 2.3 Agricultural Example

Wheat production with labor and machinery:
$$Q = 50 L^{0.4} K^{0.6}$$

where:
- $Q$ = tonnes of wheat
- $L$ = labor hours (thousands)
- $K$ = machinery hours (thousands)
- $A = 50$ captures technology level (seed quality, soil, climate)

---

## 3. Marginal and Average Products

### 3.1 Definitions

**Marginal Product of Labor:**
$$MP_L = \frac{\partial f}{\partial L}$$

**Marginal Product of Capital:**
$$MP_K = \frac{\partial f}{\partial K}$$

**Average Product of Labor:**
$$AP_L = \frac{f(L,K)}{L}$$

### 3.2 Cobb-Douglas Example

For $f(L,K) = AL^\alpha K^\beta$:

$$MP_L = \alpha A L^{\alpha-1} K^\beta = \frac{\alpha f(L,K)}{L} = \alpha \cdot AP_L$$

$$MP_K = \beta A L^\alpha K^{\beta-1} = \frac{\beta f(L,K)}{K} = \beta \cdot AP_K$$

**Key insight:** For Cobb-Douglas, $MP = \alpha \cdot AP$ where $\alpha < 1$, so $MP < AP$ always.

### 3.3 Law of Diminishing Marginal Returns

Holding other inputs fixed, eventually:
$$\frac{\partial^2 f}{\partial L^2} < 0$$

For Cobb-Douglas with $\alpha < 1$:
$$\frac{\partial MP_L}{\partial L} = \alpha(\alpha-1) A L^{\alpha-2} K^\beta < 0$$

**Intuition:** Adding the 100th worker to a fixed plot of land yields less extra output than the 10th worker.

---

## 4. Isoquants

### 4.1 Definition

An **isoquant** is the set of input combinations producing the same output:
$$\text{Isoquant}(\bar{y}) = \{(L,K) : f(L,K) = \bar{y}\}$$

```
        K
        │
        │  ╭────────  y = 200
        │  │  ╭─────  y = 150  
        │  │  │  ╭──  y = 100
        │  │  │  │
        │  ╰──┴──┴───
        └──────────── L
```

### 4.2 Properties

1. **Downward sloping:** Using less of one input requires more of another
2. **Higher output farther from origin**
3. **Cannot cross** (same input combo can't produce different outputs)
4. **Convex to origin:** Reflects diminishing MRTS

### 4.3 Different Production Technologies

```
   Cobb-Douglas         Leontief            Linear
        K                  K                   K
        │  ╭──             │                   │╲
        │  │╭──            │____.              │ ╲
        │  ││╭──           │    |              │  ╲
        │  │││             │    |___           │   ╲
        └──────L           └────────L          └────────L
     Smooth curves      L-shaped (no       Straight lines
                        substitution)      (perfect subs)
```

---

## 5. Marginal Rate of Technical Substitution

### 5.1 Definition

The **MRTS** is the rate at which one input can be substituted for another while maintaining output:

$$MRTS_{LK} = -\frac{dK}{dL}\bigg|_{y=\bar{y}} = \frac{MP_L}{MP_K}$$

**Derivation:** Along an isoquant $f(L,K) = \bar{y}$:
$$df = MP_L \cdot dL + MP_K \cdot dK = 0$$
$$\Rightarrow \frac{dK}{dL} = -\frac{MP_L}{MP_K}$$

### 5.2 Cobb-Douglas MRTS

For $f = AL^\alpha K^\beta$:
$$MRTS_{LK} = \frac{\alpha A L^{\alpha-1} K^\beta}{\beta A L^\alpha K^{\beta-1}} = \frac{\alpha}{\beta} \cdot \frac{K}{L}$$

The MRTS depends on the capital-labor ratio, not on output level.

### 5.3 Diminishing MRTS

As we move along an isoquant (more L, less K):
$$\frac{\partial MRTS_{LK}}{\partial L} < 0$$

**Interpretation:** As labor becomes abundant relative to capital, its marginal contribution relative to capital falls—we need to give up less K to compensate for one more L.

---

## 6. Returns to Scale

### 6.1 Definition

Returns to scale describe how output responds when **all inputs** are scaled proportionally.

For $t > 1$:
- **Constant Returns to Scale (CRS):** $f(tL, tK) = t \cdot f(L,K)$
- **Increasing Returns to Scale (IRS):** $f(tL, tK) > t \cdot f(L,K)$
- **Decreasing Returns to Scale (DRS):** $f(tL, tK) < t \cdot f(L,K)$

### 6.2 Cobb-Douglas Returns to Scale

For $f(L,K) = AL^\alpha K^\beta$:
$$f(tL, tK) = A(tL)^\alpha(tK)^\beta = t^{\alpha+\beta} A L^\alpha K^\beta = t^{\alpha+\beta} f(L,K)$$

| $\alpha + \beta$ | Returns to Scale |
|------------------|------------------|
| $= 1$ | Constant (CRS) |
| $> 1$ | Increasing (IRS) |
| $< 1$ | Decreasing (DRS) |

### 6.3 Economic Interpretation

| Returns | Interpretation | Agricultural Example |
|---------|----------------|---------------------|
| CRS | Replicability | Double all inputs → double output |
| IRS | Economies of scale | Large farms: specialization, bulk purchasing |
| DRS | Managerial limits | Very large operations: coordination problems |

---

## 7. The Cost Minimization Problem

### 7.1 Setup

Given target output $\bar{y}$ and input prices $w$ (wage), $r$ (rental rate):
$$\min_{L,K} wL + rK \quad \text{s.t.} \quad f(L,K) = \bar{y}$$

**Lagrangian:**
$$\mathcal{L} = wL + rK + \lambda[\bar{y} - f(L,K)]$$

### 7.2 First-Order Conditions

$$\frac{\partial \mathcal{L}}{\partial L} = w - \lambda \cdot MP_L = 0 \quad \Rightarrow \quad \lambda = \frac{w}{MP_L}$$

$$\frac{\partial \mathcal{L}}{\partial K} = r - \lambda \cdot MP_K = 0 \quad \Rightarrow \quad \lambda = \frac{r}{MP_K}$$

$$\frac{\partial \mathcal{L}}{\partial \lambda} = \bar{y} - f(L,K) = 0$$

### 7.3 Optimal Condition

Equating the expressions for $\lambda$:
$$\boxed{\frac{MP_L}{MP_K} = \frac{w}{r} \quad \Leftrightarrow \quad MRTS_{LK} = \frac{w}{r}}$$

**Interpretation:** The isoquant is tangent to the isocost line at the optimum.

```
        K
        │
        │     ╭──── Isoquant (y = ȳ)
        │    ╱ 
        │   ╱   ●  Optimum: MRTS = w/r
        │  ╱   ╱╲
        │ ╱   ╱  ╲ Isocost: wL + rK = C*
        └──────────── L
```

---

## 8. Conditional Input Demands

### 8.1 Definition

Solving the FOCs yields **conditional (cost-minimizing) input demands**:
$$L^*(w, r, y) \quad \text{and} \quad K^*(w, r, y)$$

These tell us how much of each input to use to produce $y$ at minimum cost.

### 8.2 Cobb-Douglas Derivation

For $f(L,K) = L^\alpha K^\beta$ (with $A=1$ for simplicity):

**Step 1:** From MRTS = w/r:
$$\frac{\alpha K}{\beta L} = \frac{w}{r} \quad \Rightarrow \quad K = \frac{\beta w}{\alpha r} L$$

**Step 2:** Substitute into production constraint:
$$L^\alpha \left(\frac{\beta w}{\alpha r} L\right)^\beta = y$$
$$L^{\alpha+\beta} \left(\frac{\beta w}{\alpha r}\right)^\beta = y$$
$$L^* = y^{1/(\alpha+\beta)} \left(\frac{\alpha r}{\beta w}\right)^{\beta/(\alpha+\beta)}$$

**Step 3:** By symmetry:
$$K^* = y^{1/(\alpha+\beta)} \left(\frac{\beta w}{\alpha r}\right)^{\alpha/(\alpha+\beta)}$$

### 8.3 Properties

Conditional input demands are:
- **Increasing in $y$** (produce more → need more inputs)
- **Decreasing in own price** (higher $w$ → use less $L$)
- **Increasing in other input's price** (cross-price effect from substitution)
- **Homogeneous of degree 0** in $(w,r)$ (only relative prices matter)

---

## 9. The Cost Function

### 9.1 Definition

The **cost function** gives minimum cost of producing $y$:
$$C(w, r, y) = wL^*(w,r,y) + rK^*(w,r,y)$$

### 9.2 Cobb-Douglas Cost Function

For CRS case ($\alpha + \beta = 1$), after substitution:
$$C(w, r, y) = y \cdot w^\alpha r^\beta \cdot \left[\left(\frac{\alpha}{\beta}\right)^\beta + \left(\frac{\beta}{\alpha}\right)^\alpha\right]$$

Simplified:
$$\boxed{C(w, r, y) = \phi(w, r) \cdot y}$$

where $\phi(w,r) = \kappa \cdot w^\alpha r^{1-\alpha}$ for some constant $\kappa$.

**Key insight:** Under CRS, cost is linear in output → constant average cost.

### 9.3 Properties of Cost Functions

1. **Non-decreasing in $w$, $r$, and $y$**
2. **Homogeneous of degree 1 in $(w,r)$:** Double all prices → double cost
3. **Concave in $(w,r)$:** Firms substitute away from expensive inputs

---

## 10. Shephard's Lemma (Producer Version)

### 10.1 Statement

$$\boxed{\frac{\partial C(w,r,y)}{\partial w} = L^*(w,r,y)}$$
$$\boxed{\frac{\partial C(w,r,y)}{\partial r} = K^*(w,r,y)}$$

**Interpretation:** The derivative of the cost function with respect to an input price equals the conditional demand for that input.

### 10.2 Intuition: Envelope Theorem

At the optimum, a small increase in $w$:
- Direct effect: Pay more for existing $L^*$ → cost rises by $L^*$
- Indirect effect: Reoptimize by using slightly less $L$ → second-order (≈ 0)

Only the direct effect matters at the margin.

### 10.3 Parallel to Consumer Theory

| Consumer Theory | Producer Theory |
|-----------------|-----------------|
| Expenditure function $e(p, \bar{u})$ | Cost function $C(w, r, \bar{y})$ |
| Shephard's Lemma: $\partial e/\partial p_i = x_i^h$ | Shephard's Lemma: $\partial C/\partial w = L^*$ |
| Hicksian demand | Conditional input demand |

---

## 11. Short-Run vs. Long-Run Costs

### 11.1 Fixed vs. Variable Inputs

**Short Run:** Capital is fixed at $\bar{K}$
- Only labor is variable
- Short-run production: $y = f(L, \bar{K})$

**Long Run:** All inputs are variable
- Both $L$ and $K$ can be optimized

### 11.2 Short-Run Cost Function

With $K = \bar{K}$ fixed:
$$SC(w, r, y; \bar{K}) = wL(y; \bar{K}) + r\bar{K}$$

where $L(y; \bar{K})$ solves $f(L, \bar{K}) = y$.

**Components:**
- **Variable Cost (VC):** $wL(y; \bar{K})$
- **Fixed Cost (FC):** $r\bar{K}$
- **Total Cost:** $SC = VC + FC$

### 11.3 Cost Curve Relationships

```
        $
        │         MC
        │        ╱
        │   ____╱_____ AC
        │  ╱   ╲╱
        │ ╱    ╱╲
        │╱    ╱  AVC
        │    ╱
        │   ╱
        └──────────── y
           
    MC passes through minimum of AC and AVC
```

**Marginal Cost:** $MC = \frac{\partial C}{\partial y}$

**Average Cost:** $AC = \frac{C}{y}$

**Average Variable Cost:** $AVC = \frac{VC}{y}$

**Average Fixed Cost:** $AFC = \frac{FC}{y}$

### 11.4 Long-Run Envelope

The long-run cost curve is the **lower envelope** of short-run cost curves:
$$C(y) = \min_{\bar{K}} SC(y; \bar{K})$$

```
        $
        │     
        │    ╱╲  SC₁
        │   ╱  ╲    ╱╲  SC₂
        │  ╱    ╲__╱  ╲    ╱╲  SC₃
        │ ╱              ╲_╱  ╲
        │╱                     ╲ Long-run C(y)
        └──────────────────────── y
```

---

## 12. Summary

### 12.1 Key Relationships

| Concept | Formula | Interpretation |
|---------|---------|----------------|
| MRTS | $\frac{MP_L}{MP_K}$ | Substitution rate along isoquant |
| Cost-min condition | $MRTS = w/r$ | Tangency of isoquant and isocost |
| Shephard's Lemma | $\partial C/\partial w = L^*$ | Envelope property |
| Returns to scale | $f(tL, tK)$ vs $tf(L,K)$ | Output response to input scaling |

### 12.2 Duality in Producer Theory

```
┌───────────────────────────────────────────────────────────┐
│                  PRODUCER DUALITY                         │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  COST MINIMIZATION              PRODUCTION FUNCTION       │
│  min wL + rK                    y = f(L,K)               │
│  s.t. f(L,K) ≥ y                                         │
│        ↓                              ↑                   │
│  Conditional Demands            Solve f(L,K) = y          │
│  L*(w,r,y), K*(w,r,y)          for production surface    │
│        ↓                                                  │
│  Cost Function                                            │
│  C(w,r,y) = wL* + rK*                                    │
│        ↓                                                  │
│  Shephard's Lemma                                         │
│  ∂C/∂w = L*, ∂C/∂r = K*                                  │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

### 12.3 Preview: Next Week

With the cost function $C(w,r,y)$ in hand, we'll solve:
$$\max_y \; py - C(w,r,y)$$

This yields:
- Output supply function $y^*(p, w, r)$
- Profit function $\pi(p, w, r)$
- Hotelling's Lemma (parallel to Roy's Identity)

---

## References

- Varian, H. (2014). *Intermediate Microeconomics*. Chapter 19-21.
- Nicholson & Snyder. *Microeconomic Theory*. Chapter 9-10.
- Chambers, R. (1988). *Applied Production Analysis*. Cambridge.
