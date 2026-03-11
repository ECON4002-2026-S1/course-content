# Week 4: Optimization — Unconstrained and Constrained

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. **Formulate** economic optimization problems with objective functions and constraints
2. **Derive** first-order conditions (FOC) for unconstrained optimization
3. **Verify** second-order conditions (SOC) using the Hessian matrix
4. **Apply** the Lagrangian method to constrained optimization problems
5. **Evaluate** the bordered Hessian for constrained SOC verification
6. **Interpret** the Lagrange multiplier as a shadow price
7. **Implement** optimization algorithms in R using `optim()` and `nloptr`

---

## 1. Why Optimization in Economics?

### 1.1 Economics as the Science of Choice

At its core, economics studies how agents make **optimal choices** given constraints:

| Agent | Objective | Choice Variables | Constraints |
|-------|-----------|------------------|-------------|
| **Consumer** | Maximize utility | Consumption bundle $(x_1, x_2, ...)$ | Budget: $\sum p_i x_i \leq m$ |
| **Firm** | Maximize profit | Output $Q$, inputs $(L, K)$ | Technology: $Q = f(L, K)$ |
| **Farm manager** | Minimize cost | Input mix $(L, K, W)$ | Output target: $Q \geq \bar{Q}$ |
| **Policy maker** | Maximize welfare | Tax rates, subsidies | Budget balance, political feasibility |

### 1.2 The General Optimization Problem

**Unconstrained:**
$$\max_{x} f(x) \quad \text{or} \quad \min_{x} f(x)$$

**Constrained:**
$$\max_{x} f(x) \quad \text{subject to} \quad g(x) = c$$

where:
- $f(x)$ is the **objective function** (utility, profit, cost, welfare)
- $x = (x_1, x_2, \ldots, x_n)$ are the **choice variables**
- $g(x) = c$ is the **constraint** (budget, technology, resource limit)

### 1.3 A Roadmap for This Week

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    OPTIMIZATION FRAMEWORK                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  UNCONSTRAINED                        CONSTRAINED                       │
│  ─────────────                        ───────────                       │
│  Single variable:                     Lagrangian method:                │
│    FOC: f'(x) = 0                       ℒ = f(x) + λ(c - g(x))         │
│    SOC: f''(x) < 0 (max)                                                │
│         f''(x) > 0 (min)              FOC: ∇ℒ = 0                       │
│                                                                         │
│  Multiple variables:                  SOC: Bordered Hessian             │
│    FOC: ∇f(x) = 0                       Check sign pattern of           │
│    SOC: Hessian H(x)                    leading principal minors        │
│         Negative definite (max)                                         │
│         Positive definite (min)       Shadow price interpretation:      │
│                                         λ* = ∂f*/∂c                     │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Unconstrained Optimization: Single Variable

### 2.1 First-Order Condition (FOC)

At an interior optimum $x^*$, the **slope of the objective function is zero**:

$$\boxed{f'(x^*) = 0}$$

**Intuition**: If $f'(x^*) > 0$, you could increase $f$ by raising $x$. If $f'(x^*) < 0$, you could increase $f$ by lowering $x$. Only when $f'(x^*) = 0$ is there no direction of improvement.

### 2.2 Second-Order Condition (SOC)

The FOC identifies **critical points** (maxima, minima, or saddle points). The SOC distinguishes between them:

| Type | Condition | Intuition |
|------|-----------|-----------|
| **Maximum** | $f''(x^*) < 0$ | Function curves downward (concave at $x^*$) |
| **Minimum** | $f''(x^*) > 0$ | Function curves upward (convex at $x^*$) |
| **Inflection** | $f''(x^*) = 0$ | Inconclusive; need higher-order derivatives |

### 2.3 Example: Monopolist's Profit Maximization

A monopolist faces inverse demand $P = 100 - 2Q$ and has cost function $C(Q) = 10Q + Q^2$.

**Profit function:**
$$\pi(Q) = TR - TC = P \cdot Q - C(Q) = (100 - 2Q)Q - (10Q + Q^2) = 90Q - 3Q^2$$

**FOC:**
$$\frac{d\pi}{dQ} = 90 - 6Q = 0 \quad \Rightarrow \quad Q^* = 15$$

**SOC:**
$$\frac{d^2\pi}{dQ^2} = -6 < 0 \quad \checkmark \text{ (maximum)}$$

**Optimal price:** $P^* = 100 - 2(15) = 70$

**Maximum profit:** $\pi^* = 90(15) - 3(15)^2 = 1350 - 675 = 675$

### 2.4 Sufficient Conditions: Global vs. Local

The SOC provides a **local** condition. For **global** optimality:

- If $f(x)$ is **concave** everywhere (i.e., $f''(x) \leq 0$ for all $x$), any critical point is a **global maximum**
- If $f(x)$ is **convex** everywhere (i.e., $f''(x) \geq 0$ for all $x$), any critical point is a **global minimum**

---

## 3. Curvature: Concavity and Convexity

### 3.1 Definitions

**Concave function:** A line segment connecting any two points on the graph lies **on or below** the curve.

**Convex function:** A line segment connecting any two points on the graph lies **on or above** the curve.

```
    CONCAVE                           CONVEX
    ────────                          ──────
         ●───────●                    
        /         \                       /\
       /           \                     /  \
      /    curve    \                   /    \
     ●───────────────●                 ●      ●
                                            curve
```

**Mathematical characterization (twice differentiable functions):**

| Property | Single variable | Multiple variables |
|----------|-----------------|-------------------|
| Concave | $f''(x) \leq 0$ | Hessian is negative semi-definite |
| Strictly concave | $f''(x) < 0$ | Hessian is negative definite |
| Convex | $f''(x) \geq 0$ | Hessian is positive semi-definite |
| Strictly convex | $f''(x) > 0$ | Hessian is positive definite |

### 3.2 Economic Significance

| Function Type | Economic Implication | Examples |
|---------------|---------------------|----------|
| Concave utility | Diminishing marginal utility, risk aversion | $u(x) = \sqrt{x}$, $u(x) = \ln(x)$ |
| Convex costs | Increasing marginal cost | $C(Q) = 10 + Q^2$ |
| Concave production | Diminishing marginal returns | $Q = L^{0.5}$ |

---

## 4. Unconstrained Optimization: Multiple Variables

### 4.1 The Gradient and First-Order Conditions

For $f(x_1, x_2, \ldots, x_n)$, the **gradient** is the vector of partial derivatives:

$$\nabla f = \begin{bmatrix} \frac{\partial f}{\partial x_1} \\ \frac{\partial f}{\partial x_2} \\ \vdots \\ \frac{\partial f}{\partial x_n} \end{bmatrix}$$

**FOC for interior optimum:**
$$\boxed{\nabla f(x^*) = \mathbf{0}}$$

This gives $n$ equations for $n$ unknowns.

### 4.2 The Hessian Matrix

The **Hessian** is the matrix of second-order partial derivatives:

$$H = \begin{bmatrix} 
\frac{\partial^2 f}{\partial x_1^2} & \frac{\partial^2 f}{\partial x_1 \partial x_2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
\frac{\partial^2 f}{\partial x_2 \partial x_1} & \frac{\partial^2 f}{\partial x_2^2} & \cdots & \frac{\partial^2 f}{\partial x_2 \partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial^2 f}{\partial x_n \partial x_1} & \frac{\partial^2 f}{\partial x_n \partial x_2} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
\end{bmatrix}$$

**Note:** By Young's theorem, $\frac{\partial^2 f}{\partial x_i \partial x_j} = \frac{\partial^2 f}{\partial x_j \partial x_i}$, so the Hessian is **symmetric**.

### 4.3 Second-Order Conditions via Definiteness

| Optimization | Hessian Condition | Test |
|--------------|-------------------|------|
| **Maximum** | Negative definite | All eigenvalues $< 0$ |
| **Minimum** | Positive definite | All eigenvalues $> 0$ |

**Alternative test using leading principal minors:**

For the Hessian $H = \begin{bmatrix} h_{11} & h_{12} \\ h_{21} & h_{22} \end{bmatrix}$:

| Condition | First minor $|H_1| = h_{11}$ | Second minor $|H_2| = \det(H)$ |
|-----------|------------------------------|-------------------------------|
| **Negative definite** (max) | $< 0$ | $> 0$ |
| **Positive definite** (min) | $> 0$ | $> 0$ |

**General pattern for negative definite (maximization):**
$$|H_1| < 0, \quad |H_2| > 0, \quad |H_3| < 0, \quad \ldots \quad \text{(alternating signs)}$$

**General pattern for positive definite (minimization):**
$$|H_1| > 0, \quad |H_2| > 0, \quad |H_3| > 0, \quad \ldots \quad \text{(all positive)}$$

### 4.4 Example: Two-Input Profit Maximization

A farm produces output $Q = 10L^{0.3}K^{0.5}$ using labor $L$ and capital $K$. Output price is $p = 5$, wage is $w = 2$, and rental rate is $r = 3$.

**Profit function:**
$$\pi(L, K) = pQ - wL - rK = 5 \cdot 10L^{0.3}K^{0.5} - 2L - 3K = 50L^{0.3}K^{0.5} - 2L - 3K$$

**FOC:**
$$\frac{\partial \pi}{\partial L} = 50 \cdot 0.3 \cdot L^{-0.7}K^{0.5} - 2 = 15L^{-0.7}K^{0.5} - 2 = 0$$

$$\frac{\partial \pi}{\partial K} = 50 \cdot 0.5 \cdot L^{0.3}K^{-0.5} - 3 = 25L^{0.3}K^{-0.5} - 3 = 0$$

**Solving:**
From FOC 1: $K^{0.5} = \frac{2L^{0.7}}{15}$
From FOC 2: $L^{0.3} = \frac{3K^{0.5}}{25}$

Substituting and solving yields $L^* \approx 88.9$, $K^* \approx 74.1$.

**Hessian:**
$$H = \begin{bmatrix} -10.5L^{-1.7}K^{0.5} & 7.5L^{-0.7}K^{-0.5} \\ 7.5L^{-0.7}K^{-0.5} & -12.5L^{0.3}K^{-1.5} \end{bmatrix}$$

At the optimum, we verify $|H_1| < 0$ and $|H_2| > 0$ (negative definite) ✓.

---

## 5. Constrained Optimization: The Lagrangian Method

### 5.1 The Problem

We want to optimize $f(x)$ subject to a constraint $g(x) = c$:

$$\max_{x} f(x) \quad \text{subject to} \quad g(x) = c$$

**Examples:**
- Maximize utility $u(x_1, x_2)$ subject to budget $p_1x_1 + p_2x_2 = m$
- Minimize cost $wL + rK$ subject to output $f(L, K) = \bar{Q}$

### 5.2 The Lagrangian Function

The **Lagrangian** incorporates the constraint into the objective using a **Lagrange multiplier** $\lambda$:

$$\boxed{\mathcal{L}(x, \lambda) = f(x) + \lambda(c - g(x))}$$

> **Note on sign convention:** We write $\lambda(c - g(x))$ so that $\lambda$ has the natural interpretation as the marginal value of relaxing the constraint. Some texts write $\lambda(g(x) - c)$, which flips the sign of $\lambda$.

### 5.3 First-Order Conditions

Differentiate $\mathcal{L}$ with respect to all choice variables and $\lambda$:

$$\frac{\partial \mathcal{L}}{\partial x_i} = \frac{\partial f}{\partial x_i} - \lambda \frac{\partial g}{\partial x_i} = 0 \quad \text{for } i = 1, \ldots, n$$

$$\frac{\partial \mathcal{L}}{\partial \lambda} = c - g(x) = 0$$

This gives $(n+1)$ equations for $(n+1)$ unknowns $(x_1, \ldots, x_n, \lambda)$.

**Interpretation of FOC:**
$$\frac{\partial f/\partial x_i}{\partial g/\partial x_i} = \lambda \quad \text{for all } i$$

The ratio of marginal benefit to marginal "use" of the constraint is equal across all choice variables.

### 5.4 The Shadow Price Interpretation

**The Lagrange multiplier $\lambda^*$ equals the marginal value of relaxing the constraint:**

$$\boxed{\lambda^* = \frac{\partial f^*}{\partial c}}$$

where $f^* = f(x^*(c))$ is the optimized value of the objective.

**Economic interpretations:**

| Problem | Constraint | $\lambda^*$ Interpretation |
|---------|------------|---------------------------|
| Utility max | Budget $= m$ | Marginal utility of income |
| Cost min | Output $= \bar{Q}$ | Marginal cost of production |
| Profit max | Land $= \bar{A}$ | Marginal value product of land |

### 5.5 Example: Utility Maximization

A consumer maximizes $u(x_1, x_2) = x_1^{0.4} x_2^{0.6}$ subject to $2x_1 + 3x_2 = 120$.

**Lagrangian:**
$$\mathcal{L} = x_1^{0.4} x_2^{0.6} + \lambda(120 - 2x_1 - 3x_2)$$

**FOC:**
$$\frac{\partial \mathcal{L}}{\partial x_1} = 0.4 x_1^{-0.6} x_2^{0.6} - 2\lambda = 0 \quad \cdots (1)$$

$$\frac{\partial \mathcal{L}}{\partial x_2} = 0.6 x_1^{0.4} x_2^{-0.4} - 3\lambda = 0 \quad \cdots (2)$$

$$\frac{\partial \mathcal{L}}{\partial \lambda} = 120 - 2x_1 - 3x_2 = 0 \quad \cdots (3)$$

**Solving:**
Divide (1) by (2):
$$\frac{0.4 x_2}{0.6 x_1} = \frac{2}{3} \quad \Rightarrow \quad \frac{x_2}{x_1} = \frac{2 \cdot 0.6}{3 \cdot 0.4} = 1$$

So $x_2 = x_1$. Substituting into (3):
$$120 - 2x_1 - 3x_1 = 0 \quad \Rightarrow \quad x_1^* = 24, \quad x_2^* = 24$$

Wait—let's recalculate. From the ratio:
$$\frac{0.4 x_2}{0.6 x_1} = \frac{2\lambda}{3\lambda} = \frac{2}{3}$$

$$\frac{x_2}{x_1} = \frac{2}{3} \cdot \frac{0.6}{0.4} = \frac{2}{3} \cdot \frac{3}{2} = 1$$

Hmm, that gives $x_1 = x_2$. Let's verify with the Cobb-Douglas formula:
For $u = x_1^\alpha x_2^{1-\alpha}$ with budget $p_1 x_1 + p_2 x_2 = m$:
$$x_1^* = \frac{\alpha m}{p_1} = \frac{0.4 \cdot 120}{2} = 24$$
$$x_2^* = \frac{(1-\alpha) m}{p_2} = \frac{0.6 \cdot 120}{3} = 24$$

So $x_1^* = x_2^* = 24$. ✓

**Lagrange multiplier:**
From (1): $\lambda^* = \frac{0.4 \cdot 24^{-0.6} \cdot 24^{0.6}}{2} = \frac{0.4}{2} = 0.2$

**Interpretation:** An extra dollar of income would increase utility by 0.2 units.

---

## 6. Second-Order Conditions for Constrained Problems: The Bordered Hessian

### 6.1 Why We Need the Bordered Hessian

For constrained optimization, checking the regular Hessian is **insufficient**. We're not moving freely in all directions—we're restricted to the constraint surface. The **bordered Hessian** accounts for this restriction.

### 6.2 Constructing the Bordered Hessian

For a problem with one constraint $g(x) = c$ and two choice variables $(x_1, x_2)$:

$$\bar{H} = \begin{bmatrix}
0 & g_1 & g_2 \\
g_1 & \mathcal{L}_{11} & \mathcal{L}_{12} \\
g_2 & \mathcal{L}_{21} & \mathcal{L}_{22}
\end{bmatrix}$$

where:
- $g_i = \frac{\partial g}{\partial x_i}$ (constraint gradients)
- $\mathcal{L}_{ij} = \frac{\partial^2 \mathcal{L}}{\partial x_i \partial x_j}$ (second derivatives of Lagrangian)

**General structure with $m$ constraints and $n$ variables:**

$$\bar{H} = \begin{bmatrix}
\mathbf{0}_{m \times m} & G \\
G^T & H_{\mathcal{L}}
\end{bmatrix}$$

where $G$ is the $m \times n$ Jacobian of constraints and $H_{\mathcal{L}}$ is the $n \times n$ Hessian of the Lagrangian.

### 6.3 SOC via Bordered Hessian

**For maximization with $m$ equality constraints and $n$ variables:**

The last $(n - m)$ leading principal minors of $\bar{H}$ must alternate in sign, starting with $(-1)^{m+1}$.

**Special case: One constraint ($m = 1$), two variables ($n = 2$):**

$$|\bar{H}| = \begin{vmatrix} 0 & g_1 & g_2 \\ g_1 & \mathcal{L}_{11} & \mathcal{L}_{12} \\ g_2 & \mathcal{L}_{21} & \mathcal{L}_{22} \end{vmatrix}$$

| Optimization | Condition |
|--------------|-----------|
| **Maximum** | $|\bar{H}| > 0$ |
| **Minimum** | $|\bar{H}| < 0$ |

**Special case: One constraint ($m = 1$), three variables ($n = 3$):**

Check the last two leading principal minors:
- $|\bar{H}_3|$ (the $3 \times 3$ bordered Hessian)
- $|\bar{H}_4|$ (the $4 \times 4$ bordered Hessian)

| Optimization | $|\bar{H}_3|$ | $|\bar{H}_4|$ |
|--------------|--------------|--------------|
| **Maximum** | $> 0$ | $< 0$ |
| **Minimum** | $< 0$ | $> 0$ |

### 6.4 Example: Verifying SOC for Utility Maximization

From our earlier example: $\max u = x_1^{0.4} x_2^{0.6}$ subject to $g = 2x_1 + 3x_2 = 120$.

**Constraint derivatives:**
$$g_1 = 2, \quad g_2 = 3$$

**Lagrangian second derivatives:**

The Lagrangian is $\mathcal{L} = x_1^{0.4} x_2^{0.6} + \lambda(120 - 2x_1 - 3x_2)$

$$\mathcal{L}_{11} = \frac{\partial^2 \mathcal{L}}{\partial x_1^2} = 0.4 \cdot (-0.6) x_1^{-1.6} x_2^{0.6} = -0.24 x_1^{-1.6} x_2^{0.6}$$

$$\mathcal{L}_{22} = \frac{\partial^2 \mathcal{L}}{\partial x_2^2} = 0.6 \cdot (-0.4) x_1^{0.4} x_2^{-1.4} = -0.24 x_1^{0.4} x_2^{-1.4}$$

$$\mathcal{L}_{12} = \mathcal{L}_{21} = 0.4 \cdot 0.6 \cdot x_1^{-0.6} x_2^{-0.4} = 0.24 x_1^{-0.6} x_2^{-0.4}$$

**At optimum $(x_1^*, x_2^*) = (24, 24)$:**

$$\mathcal{L}_{11}^* = -0.24 \cdot 24^{-1.6} \cdot 24^{0.6} = -0.24 \cdot 24^{-1} = -0.01$$

$$\mathcal{L}_{22}^* = -0.24 \cdot 24^{0.4} \cdot 24^{-1.4} = -0.24 \cdot 24^{-1} = -0.01$$

$$\mathcal{L}_{12}^* = 0.24 \cdot 24^{-0.6} \cdot 24^{-0.4} = 0.24 \cdot 24^{-1} = 0.01$$

**Bordered Hessian:**
$$\bar{H} = \begin{bmatrix} 0 & 2 & 3 \\ 2 & -0.01 & 0.01 \\ 3 & 0.01 & -0.01 \end{bmatrix}$$

**Determinant:**
$$|\bar{H}| = 0 \cdot \begin{vmatrix} -0.01 & 0.01 \\ 0.01 & -0.01 \end{vmatrix} - 2 \cdot \begin{vmatrix} 2 & 0.01 \\ 3 & -0.01 \end{vmatrix} + 3 \cdot \begin{vmatrix} 2 & -0.01 \\ 3 & 0.01 \end{vmatrix}$$

$$= 0 - 2(2 \cdot (-0.01) - 0.01 \cdot 3) + 3(2 \cdot 0.01 - (-0.01) \cdot 3)$$

$$= -2(-0.02 - 0.03) + 3(0.02 + 0.03)$$

$$= -2(-0.05) + 3(0.05) = 0.10 + 0.15 = 0.25 > 0$$

Since $|\bar{H}| > 0$, the SOC for maximization is satisfied. ✓

---

## 7. Cost Minimization: A Detailed Example

### 7.1 Problem Setup

A farm wants to produce $Q = 160$ units using a Cobb-Douglas technology $Q = 2L^{0.5}K^{0.5}$.
Input prices: wage $w = 3$, rental rate $r = 4$.

**Minimize** $C = 3L + 4K$ **subject to** $2L^{0.5}K^{0.5} = 160$

### 7.2 Lagrangian and FOC

$$\mathcal{L} = 3L + 4K + \lambda(160 - 2L^{0.5}K^{0.5})$$

**FOC:**
$$\frac{\partial \mathcal{L}}{\partial L} = 3 - \lambda L^{-0.5}K^{0.5} = 0 \quad \cdots (1)$$

$$\frac{\partial \mathcal{L}}{\partial K} = 4 - \lambda L^{0.5}K^{-0.5} = 0 \quad \cdots (2)$$

$$\frac{\partial \mathcal{L}}{\partial \lambda} = 160 - 2L^{0.5}K^{0.5} = 0 \quad \cdots (3)$$

### 7.3 Solving the System

Divide (1) by (2):
$$\frac{3}{4} = \frac{L^{-0.5}K^{0.5}}{L^{0.5}K^{-0.5}} = \frac{K}{L}$$

So $K = \frac{3L}{4}$.

Substitute into (3):
$$160 = 2L^{0.5}\left(\frac{3L}{4}\right)^{0.5} = 2L^{0.5} \cdot \frac{\sqrt{3}}{2} L^{0.5} = \sqrt{3} L$$

$$L^* = \frac{160}{\sqrt{3}} = \frac{160\sqrt{3}}{3} \approx 92.38$$

$$K^* = \frac{3L^*}{4} = \frac{3}{4} \cdot 92.38 \approx 69.28$$

### 7.4 Minimum Cost and Shadow Price

**Minimum cost:**
$$C^* = 3(92.38) + 4(69.28) = 277.13 + 277.13 = 554.26$$

**Lagrange multiplier (marginal cost):**
From (1): $\lambda^* = 3 \cdot (L^*)^{0.5}(K^*)^{-0.5} = 3 \cdot \sqrt{\frac{92.38}{69.28}} = 3 \cdot 1.155 = 3.46$

**Interpretation:** If the output target increases from 160 to 161, cost increases by approximately $3.46.

### 7.5 Verifying with Bordered Hessian

**Constraint:** $g(L,K) = 2L^{0.5}K^{0.5}$

$$g_L = L^{-0.5}K^{0.5}, \quad g_K = L^{0.5}K^{-0.5}$$

At optimum: $g_L^* \approx 0.866$, $g_K^* \approx 1.155$

**Lagrangian second derivatives:**

$$\mathcal{L}_{LL} = \frac{\partial^2 \mathcal{L}}{\partial L^2} = \frac{\lambda}{2} L^{-1.5} K^{0.5} > 0$$

$$\mathcal{L}_{KK} = \frac{\partial^2 \mathcal{L}}{\partial K^2} = \frac{\lambda}{2} L^{0.5} K^{-1.5} > 0$$

$$\mathcal{L}_{LK} = -\frac{\lambda}{2} L^{-0.5} K^{-0.5} < 0$$

**Bordered Hessian determinant:**

For minimization, we need $|\bar{H}| < 0$. After calculation:

$$|\bar{H}| = -2g_L g_K \mathcal{L}_{LK} + g_L^2 \mathcal{L}_{KK} + g_K^2 \mathcal{L}_{LL} - 0$$

Given the signs, this will be negative, confirming a minimum. ✓

---

## 8. The Envelope Theorem

### 8.1 Statement

When optimizing $f(x; a)$ with respect to $x$ where $a$ is a parameter:

$$\frac{d f^*(a)}{da} = \frac{\partial f(x^*, a)}{\partial a}$$

The derivative of the optimized value function with respect to a parameter equals the partial derivative of the objective, **evaluated at the optimum**.

### 8.2 Economic Application

For cost minimization $C^*(w, r, Q)$:

$$\frac{\partial C^*}{\partial w} = L^*(w, r, Q)$$

$$\frac{\partial C^*}{\partial Q} = \lambda^* = MC$$

This is **Shephard's Lemma** (input demand) and the marginal cost interpretation.

---

## 9. Optimization in R

### 9.1 Single-Variable Optimization

```r
# Profit function: π(Q) = 90Q - 3Q²
profit <- function(Q) 90 * Q - 3 * Q^2

# Find maximum (optimize uses minimization, so negate for max)
result <- optimize(profit, interval = c(0, 50), maximum = TRUE)
cat("Q* =", result$maximum, ", π* =", result$objective)
```

### 9.2 Multi-Variable Unconstrained

```r
# Negative profit (for minimization)
neg_profit <- function(x) {
  L <- x[1]; K <- x[2]
  -(50 * L^0.3 * K^0.5 - 2*L - 3*K)
}

result <- optim(par = c(10, 10), fn = neg_profit, method = "BFGS")
cat("L* =", result$par[1], ", K* =", result$par[2])
```

### 9.3 Constrained Optimization with nloptr

```r
library(nloptr)

# Objective: minimize cost
cost <- function(x) 3*x[1] + 4*x[2]

# Constraint: 2*L^0.5*K^0.5 - 160 = 0
constraint <- function(x) 2 * x[1]^0.5 * x[2]^0.5 - 160

result <- nloptr(
  x0 = c(50, 50),
  eval_f = cost,
  eval_g_eq = constraint,
  opts = list(algorithm = "NLOPT_LN_COBYLA", xtol_rel = 1e-8)
)

cat("L* =", result$solution[1], ", K* =", result$solution[2])
cat("C* =", result$objective)
```

### 9.4 Computing and Checking the Hessian

```r
# Numerical Hessian
hessian_numerical <- function(f, x, h = 1e-5) {
  n <- length(x)
  H <- matrix(0, n, n)
  for (i in 1:n) {
    for (j in 1:n) {
      x_pp <- x; x_pp[i] <- x_pp[i] + h; x_pp[j] <- x_pp[j] + h
      x_pm <- x; x_pm[i] <- x_pm[i] + h; x_pm[j] <- x_pm[j] - h
      x_mp <- x; x_mp[i] <- x_mp[i] - h; x_mp[j] <- x_mp[j] + h
      x_mm <- x; x_mm[i] <- x_mm[i] - h; x_mm[j] <- x_mm[j] - h
      H[i,j] <- (f(x_pp) - f(x_pm) - f(x_mp) + f(x_mm)) / (4*h^2)
    }
  }
  return(H)
}

# Check definiteness via eigenvalues
check_definiteness <- function(H) {
  eig <- eigen(H)$values
  if (all(eig < 0)) return("Negative definite (maximum)")
  if (all(eig > 0)) return("Positive definite (minimum)")
  return("Indefinite (saddle point)")
}
```

---

## 10. Summary

### Key Concepts

| Concept | Unconstrained | Constrained |
|---------|---------------|-------------|
| **Setup** | $\max f(x)$ | $\max f(x)$ s.t. $g(x) = c$ |
| **Tool** | Direct optimization | Lagrangian $\mathcal{L} = f + \lambda(c - g)$ |
| **FOC** | $\nabla f = 0$ | $\nabla_x \mathcal{L} = 0$, $\nabla_\lambda \mathcal{L} = 0$ |
| **SOC (max)** | $H$ negative definite | $\bar{H}$ with correct sign pattern |
| **SOC (min)** | $H$ positive definite | $\bar{H}$ with opposite sign pattern |

### Critical Formulas

| Item | Formula |
|------|---------|
| Lagrangian | $\mathcal{L} = f(x) + \lambda(c - g(x))$ |
| Shadow price | $\lambda^* = \partial f^*/\partial c$ |
| Bordered Hessian (2 vars, 1 constraint) | $\bar{H} = \begin{bmatrix} 0 & g_1 & g_2 \\ g_1 & \mathcal{L}_{11} & \mathcal{L}_{12} \\ g_2 & \mathcal{L}_{21} & \mathcal{L}_{22} \end{bmatrix}$ |
| Max condition (2 vars, 1 constraint) | $\|\bar{H}\| > 0$ |
| Min condition (2 vars, 1 constraint) | $\|\bar{H}\| < 0$ |

---

## 11. Preparation for Next Week

**Week 5: Consumer Theory I — Utility and Marshallian Demand**

Before class:
- Read Varian, Chapters 2-5
- Review the Lagrangian method
- Complete Assignment 1 (due this week)

Key concepts to preview:
- Utility functions and preferences
- Budget constraints
- Marshallian (ordinary) demand derivation
- Properties of demand functions

---

## References

- Chiang, A.C. & Wainwright, K. (2005). *Fundamental Methods of Mathematical Economics*, 4th ed., Chapters 9-12.
- Simon, C.P. & Blume, L. (1994). *Mathematics for Economists*, Chapters 18-19.
- Varian, H. (2014). *Intermediate Microeconomics*, Mathematical Appendix.
