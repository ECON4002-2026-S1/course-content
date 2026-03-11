Here is the combined Markdown file for all the documents you provided:

```markdown
---
title: "Optimization in Economics: Lecture and Homework Notes"
author: "Atakelty Hailu"
date: "University of Western Australia"
output: github_document
---

# Core Concepts in Agricultural and Applied Economics (ECON4002)

---

## Week 4: Optimization in Economics

### Purpose of Lecture

- Explain the usefulness of optimization techniques in economics.
- Review key rules in mathematical differentiation.
- Discuss free/unconstrained optimization problems (FOC and SOC).
- Discuss constrained optimization problems and methods for solving them.
- Discuss how SOC conditions and function curvature (concavity and convexity) are related.

### Outline

- Optimization in Economics
- Calculus - Differentiation Rules
- Envelope Theorem/Value Function
- Optimization Rules: Single Variable
- Curvature and Optimization
- Optimization with Multiple Variables
- Constrained Optimization

---

### Economics is Optimization

- **Economizing**: Maximizing benefits (profits, revenue, etc.) and/or minimizing costs/damages.
- **Objective Function**: Optimize with choice variables.
- Examples:
  - A farmer maximizes profit from land owned by choosing crops grown and inputs used.
  - A monopolist/monopsonist sets the price to maximize profits.

---

### Calculus in Optimization

- Economic theory and analysis are based on finding optimal outcomes.
- Optimization depends on calculus (especially differentiation) to find optimal outcomes (maximum or minimum).
- Two types of optimization: free/unconstrained and constrained optimization.

---

### Differentiation Rules

- **Power Rule**: $\frac{d}{dx} x^n = n x^{n-1}$
- **Constant Rule**: $\frac{d}{dx} c f(x) = c \cdot \frac{d}{dx} f(x)$
- **Sum/Difference Rule**: $\frac{d}{dx} (f(x) \pm g(x)) = \frac{d}{dx} f(x) \pm \frac{d}{dx} g(x)$
- **Chain Rule**: If $z = g(y)$ and $y = f(x)$, then $\frac{dz}{dx} = \frac{dz}{dy} \cdot \frac{dy}{dx}$
- **Product Rule**: $\frac{d}{dx} f(x) \cdot g(x) = f'(x) \cdot g(x) + f(x) \cdot g'(x)$
- **Quotient Rule**: $\frac{d}{dx} \frac{f(x)}{g(x)} = \frac{f'(x) \cdot g(x) - f(x) \cdot g'(x)}{g(x)^2}$

---

### Example: Monopoly Pricing

- A monopolist controls market price and does not equate marginal cost to market price to maximize profits.
- **Demand**: $q = 15 - p$
- **Cost**: $a$ per unit (constant marginal cost), say $a = 2$.
- **Revenue**: $R = p \cdot q = (15 - q)q = 15q - q^2$
- **Marginal Revenue**: $MR = \frac{d}{dq} R = 15 - 2q$
- **Cost**: $C = a \cdot q = aq = 2q$
- **Marginal Cost**: $MC = \frac{d}{dq} C = 2$
- **Optimal Quantity**: Equate $MR = MC$, $q = 6.5$, $p = 8.5$

---

### Optimization Rules: Single Variable

- **First Order Condition (FOC)**: $f'(x) = 0$ (slope is zero or tangent is flat)
- **Second Order Condition (SOC)**: $f''(x) \leq 0$ for maximization, $f''(x) \geq 0$ for minimization
- **Concave Functions**: Non-positive second derivative, FOC ensures maximum.
- **Convex Functions**: Non-negative second derivative, FOC ensures minimum.

---

### Curvature

- **Concave Functions**: A line joining any two points on the curve is always on or below the curve.
- **Convex Functions**: A line joining any two points on the curve is always on or above the curve.
- **Linear Functions**: Both concave and convex.

---

### Optimization with Multiple Variables

- **Necessary Conditions for Maximization**:
  - FOC: $\frac{\partial f(x)}{\partial x_i} = 0, \forall x_i$
  - SOC: Hessian matrix is negative semi-definite (NSD).
- **Hessian Matrix**: Elements $f_{11}, f_{12}, f_{21}, f_{22}$, etc.
- **Negative Semi-Definite**: $f_{11} \leq 0, f_{22} \leq 0, f_{11}f_{22} - f_{12}f_{21} \geq 0$

---

### Constrained Optimization

- **Substitution Method**: Turns constrained optimization into free optimization by incorporating constraints into the objective function.
- **Lagrangian Method**: Incorporates constraints into the objective function using Lagrangian multipliers.
- **Lagrangian Function**: $L(x, \lambda) = f(x) + \lambda \cdot (b - h(x))$
- **Shadow Price**: $\lambda$ indicates the impact on the objective of a slight relaxation in the constraint.

---

### Example: Constrained Optimization

- **Problem**: Minimize cost $C = 3L + 4K$ subject to $160 = 2L^{0.5}K^{0.5}$
- **Lagrangian**: $L(L, K, \lambda) = 3L + 4K + \lambda \cdot (160 - 2L^{0.5}K^{0.5})$
- **FOCs**:
  - $\frac{\partial L}{\partial L} = 3 - \lambda L^{-0.5}K^{0.5} = 0$
  - $\frac{\partial L}{\partial K} = 4 - \lambda L^{0.5}K^{-0.5} = 0$
  - $\frac{\partial L}{\partial \lambda} = 160 - 2L^{0.5}K^{0.5} = 0$
- **Solution**: $K^* = 69.28$, $L^* = 92.35$, $C^* = \$554.17$

---

### Exercises

1. Find the maximum points for the function $f_1(x) = 16 - 4x - x^2$.
2. Find the maximum points for the function $f_2(x) = 12 + 6x - x^2$.
3. Find the extremum value(s) of $z = 2x_1^2 + x_1x_2 + 4x_2^2 + x_1x_3 + x_3^2 + 2$.
4. Solve the constrained optimization problem using the Lagrangian method.

---

## Useful Concepts (MATH)

### Outline

- Useful Concepts (MATH)
- Optimization Rules
- Examples

---

### Useful Mathematical Concepts

- **Linear Algebra**: n-tuples, points or vectors, matrices, symmetric, identity matrices, quadratic forms, positive/negative (semi-)definite matrices, principal minor matrices, determinants, bordered matrices.
- **Sets**: Set operations, closed sets, compact sets, convex sets, separating hyperplanes.
- **Calculus**: Limit, gradient, derivative (partial or total), second-order derivative, Hessian matrices, Jacobian matrices.
- **Functions**: Continuous functions, differentiable functions, homogeneous functions (of degree k), Euler's theorem/law, concave/convex functions, quasi-concave (convex) functions.

---

### Free Optimization

- **Objective**: Optimize (maximize or minimize) a function $f(x)$ with respect to the choice of levels for the decision variables $x$.
- **First Order Condition**: $\frac{\partial f(x)}{\partial x_i} = 0$ for all $i = 1, 2, \ldots, n$.
- **Second Order Condition**: Check the second derivative to determine if the extremum is a maximum or minimum.

---

### Constrained Optimization

- **Lagrangian Function**: $L(x, \lambda) = f(x) + \lambda \cdot (b - h(x))$
- **Optimize**: Set derivatives of $L$ with respect to $x$ and $\lambda$ equal to zero.
- **Shadow Price**: $\lambda$ indicates the impact on the objective of a slight relaxation in the constraint.

---

### Example: Free Optimization Problem

- **Production Function**: $y = 12x - 0.05x^2$
- **Revenue**: $p \cdot y$
- **Cost**: $t \cdot x$
- **Profit**: $\text{profit}(x) = p(12x - 0.05x^2) - t x$
- **Optimal Input Use**: $x^* = 120 - \frac{10}{p}(t)$

---

### Example: Constrained Optimization

- **Utility Function**: $U = x^{30} \cdot w$
- **Budget Constraint**: $4000 = 1 \cdot x + p \cdot w$
- **Lagrangian**: $L(x, w, \lambda) = x^{30} \cdot w + \lambda (4000 - x - p \cdot w)$
- **FOCs**:
  - $\frac{\partial L}{\partial x} = 30 \cdot x^{29} \cdot w + \lambda \cdot (-1) = 0$
  - $\frac{\partial L}{\partial w} = x^{30} + \lambda \cdot (-p) = 0$
  - $\frac{\partial L}{\partial \lambda} = 4000 - x - p \cdot w = 0$
- **Solution**: $x^* = 30pw^*$, $w^* = \frac{4000}{31p}$

---

## Homework 3

### Instructions

Answer the following questions clearly showing the steps you followed to find the answers.

1. What are first- and second-order derivatives?
2. What is marginal revenue? Can it be negative?
3. What is marginal cost? Can it be negative?
4. Given a Cobb-Douglas production function $y = AK^{\alpha}L^{\beta}$ relating output (y) to capital (K) and labor (L), derive the marginal product of output with respect to labor, i.e., $\frac{\partial y}{\partial L}$.
5. What differentiation rule would we apply to get the derivative of the function $f(x) = \frac{2x - 0.1x + 10}{(x - 1)}$?
6. Consumption (C) is related to income (Y) by the function $C = 0.8Y - 0.01Y^2 + 100$. Find the marginal propensity to consume (MPC) value for the case where $Y = 5$.
7. Given a production function $Q = L^2 - 0.05L^3$, find the level of labor (L) use that would maximize average product (i.e., ratio of output (Q) to input (L)).
8. A monopolist faces the demand curve $P = 15 - Q$. What price would it set for its product to maximize its profit, if it is able to produce at a constant cost of $3 per unit?

---

### Answers

1. **First- and Second-Order Derivatives**:
   - First-order derivative: The rate of change of a function with respect to a variable.
   - Second-order derivative: The rate of change of the first derivative with respect to the same variable.

2. **Marginal Revenue**:
   - Marginal revenue is the additional revenue generated by selling one more unit of a good.
   - Yes, it can be negative if selling an additional unit decreases total revenue.

3. **Marginal Cost**:
   - Marginal cost is the additional cost incurred by producing one more unit of a good.
   - Yes, it can be negative if producing an additional unit decreases total cost (unlikely in most practical scenarios).

4. **Marginal Product of Labor**:
   - $\frac{\partial y}{\partial L} = \beta A K^{\alpha} L^{\beta - 1}$

5. **Differentiation Rule**:
   - Use the quotient rule: $\frac{d}{dx} \frac{u}{v} = \frac{u'v - uv'}{v^2}$

6. **Marginal Propensity to Consume (MPC)**:
   - $MPC = \frac{dC}{dY} = 0.8 - 0.02Y$
   - For $Y = 5$, $MPC = 0.8 - 0.02 \times 5 = 0.7$

7. **Maximizing Average Product**:
   - Average product: $AP = \frac{Q}{L} = L - 0.05L^2$
   - FOC: $\frac{d(AP)}{dL} = 1 - 0.1L = 0 \Rightarrow L = 10$

8. **Monopolist's Price**:
   - Revenue: $R = P \cdot Q = (15 - Q)Q = 15Q - Q^2$
   - Marginal Revenue: $MR = 15 - 2Q$
   - Cost: $C = 3Q$
   - Marginal Cost: $MC = 3$
   - FOC: $MR = MC \Rightarrow 15 - 2Q = 3 \Rightarrow Q = 6$
   - Price: $P = 15 - Q = 9$
```

You can copy and paste this Markdown content into a `.md` file and save it for future reference.