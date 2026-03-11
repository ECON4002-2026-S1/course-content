```markdown
---
title: "Consumer Choice and Optimization in Economics"
author: "Atakelty Hailu"
date: "University of Western Australia"
output: github_document
---

# Homework 5: Core Concepts in Agricultural and Applied Economics (ECON4002)

## Instructions

Do the readings identified below on consumer choice. Then provide answers to the questions below and upload your answers through the LMS. Hand-written and hand-drawn answers are acceptable as long as they are uploaded as PDF files through the LMS.

### Reading

Chapter 5 (Applying Consumer Theory, esp. sections 5.1 to 5.3) in *Perloff’s (2018)* "Microeconomics" book, which is available online through the UWA library system.

### Questions

1. Derive the demand for commodity 1 ($X_{1}$) if the consumer has a utility function $U=X_{1}^{0.25}X_{2}^{0.75}$, a budget of $Y$, and the prices for the two commodities are $P_{1}$ and $P_{2}$.

2. What would the demand function for $X_{1}$ be if $U=\min\{2X_{1},X_{2}\}$ (case of perfect complements)? Draw the demand curve for income $Y=60$ and $P_{2}=1$.

3. Suppose the two commodities in a utility function are perfect substitutes: $U=2X_{1}+X_{2}$. Draw the demand curve for $X_{1}$ for the case of income $Y=60$ and $P_{2}=1$.

---

# Consumer Choice (Part 2)

## Concepts Covered

- Optimal consumer choice (general treatment)
- Consumer demand
- Engel curves
- Price change effects (substitution and income effects)
- Classification of goods
- Indirect utility
- Expenditure functions
- Compensated demand

---

## Utility Maximization

### Formulation

- **General Form**:
  - Maximize: $U(\mathbf{x})$
  - Subject to: $\mathbf{p}\mathbf{x} \leq m$ (budget constraint), $\mathbf{x} \in X$ (in consumption set)

### Optimality Conditions

- **Lagrangian Function**: $\mathcal{L}(\mathbf{x}, \lambda, m) = U(\mathbf{x}) + \lambda (m - p\mathbf{x})$
- **First Order Conditions (FOC)**: $\frac{\partial \mathcal{L}}{\partial x_i} = 0, \forall i = 1, \dots, n$, $\frac{\partial \mathcal{L}}{\partial \lambda} = 0$

### Example

- **Utility Function**: $U = x_1 x_2$
- **Budget Constraint**: $60 \geq 2x_1 + 3x_2$
- **Lagrangian Function**: $\mathcal{L}(\mathbf{x}, \lambda) = x_1 x_2 + \lambda (60 - 2x_1 - 3x_2)$
- **FOC**:
  - $\frac{\partial \mathcal{L}}{\partial x_1} = x_2 - \lambda 2 = 0$
  - $\frac{\partial \mathcal{L}}{\partial x_2} = x_1 - \lambda 3 = 0$
  - $\frac{\partial \mathcal{L}}{\partial \lambda} = 60 - 2x_1 - 3x_2 = 0$
- **Solution**: $x_1 = 15, x_2 = 10, \lambda = 5, U = 150$

---

## Second Order Conditions (SOC)

- **Lagrangian Function**: Should be Negative Semi-Definite (NSD)
- **Utility Function**: Should be Quasi-Concave

### Example

- **Lagrangian Function**: $\mathcal{L}(\mathbf{x}, \lambda) = x_1 x_2 + \lambda (60 - 2x_1 - 3x_2)$
- **Hessian Matrix**: Should be NSD

---

## Curvature

### Quasi-Concavity

- **Quasi-Concave Function**: Upper sets are convex, $f(\theta \mathbf{x}_1 + (1 - \theta)\mathbf{x}_2) \geq \min\{f(\mathbf{x}_1), f(\mathbf{x}_2)\}$ for all $\theta \in [0, 1]$
- **Strict Quasi-Concavity**: Upper sets are strictly convex, $f(\theta \mathbf{x}_1 + (1 - \theta)\mathbf{x}_2) > \min\{f(\mathbf{x}_1), f(\mathbf{x}_2)\}$ for all $\theta \in (0, 1)$

### Exercises

1. Show how you would adapt the definitions of concavity and quasi-concavity to the case of convex and quasi-convex functions.
2. Provide two drawn examples of a function that is concave.
3. Provide two drawn examples of a function that is quasi-concave.
4. Provide a drawn example of a function that is quasi-concave but not concave.

---

## Demand

### Deriving Demand

- **Demand**: Relationship between price and quantity purchased
- **Price Consumption Curve (PCC)**: Tangency between the rotating budget line and the optimal consumption traces out the PCC

### Demand Curve

- **Example**: $U = x_1 x_2$, subject to $60 = p_1 x_1 + 3x_2$
- **Demand Curve**: $x_1 = \frac{m}{2p_1}$

### Price Change Effects

- **Income Effect**: Change in price means the consumer can move to a higher or lower indifference curve.
- **Substitution Effect**: Change in price means the relative prices of the commodities are changed.

### Normal vs. Inferior Goods

- **Normal Goods**: Demand goes up with income.
- **Inferior Goods**: Demand decreases as income goes up.

---

## Demand Functions

- **Marshallian Demand Functions**: $x_i^m(p_1, p_2, \dots, p_n, m)$
- **Properties**:
  - Homogeneous of degree zero in (p, m)
  - Downward sloping (except in the case of Giffen’s goods)

### Engel Curves

- **Engel Curve**: Relationship between demand and income.
- **Normal Goods**: Upward sloping Engel curve.
- **Inferior Goods**: Downward sloping Engel curve.

---

## Indirect Utility

- **Indirect Utility Function**: $v(\mathbf{p}, m) = U(x_1^m(\mathbf{p}, m), x_2^m(\mathbf{p}, m), \dots, x_n^m(\mathbf{p}, m))$
- **Properties**:
  - Non-increasing in $\mathbf{p}$
  - Non-decreasing in $m$
  - Homogeneous of degree zero in $(\mathbf{p}, m)$
  - Quasi-convex in $\mathbf{p}$
  - Continuous for strictly positive prices and incomes

### Example

- **Utility Function**: $U = x_1 x_2$
- **Indirect Utility Function**: $v(\mathbf{p}, m) = \frac{m^2}{4p_1 p_2}$

---

## Expenditure Function

- **Expenditure Function**: $e(\mathbf{p}, u)$
- **Properties**:
  - Homogeneous of degree one in $\mathbf{p}$
  - Non-decreasing in $\mathbf{p}$
  - Non-increasing in $u$
  - Concave in $\mathbf{p}$

### Example

- **Utility Function**: $U = x_1 x_2$
- **Expenditure Function**: $e(\mathbf{p}, u) = 2 \sqrt{u p_1 p_2}$

---

## Exercises

### Exercises 1a: Cobb-Douglas Utility

Given a utility function $u = x_1^{\alpha} x_2^{1 - \alpha}$ that is maximized subject to the budget constraint $m = p_1 x_1 + p_2 x_2$:

1. Show that the Marshallian demand functions are: $x_1^m = \frac{\alpha m}{p_1}$ and $x_2^m = \frac{(1 - \alpha) m}{p_2}$.
2. Show that the indirect utility function $v(p_1, p_2, m)$ is proportional to $\frac{m}{p_1^{\alpha} p_2^{1 - \alpha}}$.
3. Find the expenditure function corresponding to the utility function.

### Exercises 1b: Cobb-Douglas Utility

1. How would you convince yourself that the solutions you derived above satisfy the SOC conditions for utility maximization?
2. Is the utility function concave? Quasi-concave?
3. Derive the Hessian matrix for the utility function.

### Exercises 1c: Cobb-Douglas Utility

1. Use the Marshallian demand functions and the expenditure function to generate the Hicksian demand functions for the Cobb-Douglas utility function above.
2. Plot the Marshallian and Hicksian demand curves for $x_1$ assuming that income is $60$ and the price for the two commodities ($x_1$ and $x_2$) are $3 and $2 per unit, respectively.

### Exercises 2: Properties of Expenditure Function

1. What homogeneity properties does the expenditure function $e(\mathbf{p}, u)$ have?
2. What monotonicity properties would you expect $e(\mathbf{p}, u)$ to have?
3. What would the derivative of $e(\mathbf{p}, u)$ with respect to a commodity price (e.g., $p_1$) be? (Hint: Apply the envelope theorem, which is known as Shephard's lemma in this context)
4. What other properties does the expenditure function have?

### Exercises 3: Equivalences

Translate the following statements, which are true by definition, into mathematical statements.

1. The minimum expenditure required to achieve utility $v(\mathbf{p}, \mathbf{m})$ is $m$.
2. The Hicksian demand at utility $u$ is the same as the Marshallian demand at income $e(\mathbf{p}, u)$.

### Exercises 4

Suppose a consumer has the utility function $U(x_1, x_2) = \max\{2x_1, x_2\}$.

1. Explain what this utility shows about the consumer's preferences.
2. Is it possible to solve the utility maximization without setting a formal optimization problem or a Lagrangian?
3. Derive the demand for commodity 1 ($x_1$).
4. Draw the demand curve.
5. Derive the indirect utility and the expenditure functions for the consumer.

---

## Topics for Later Discussion

- Demand aggregation and representative consumer
- Commodity aggregation and separability
- Demand systems for empirical analysis (e.g., LES, Rotterdam, ALIDS, etc.)
```
Here is the combined Markdown file for the provided documents:

```markdown
---
title: "Analysis of Producer Behavior and Linear Programming with GAMS"
author: "Atakelty Hailu"
date: "University of Western Australia"
output: github_document
---

# Analysis of Producer Behavior (Part I)

---

## Concepts Covered

- Firms and Producer Behavior
- Production: Short-run (SR) and Long-run (LR)
- Economies or Returns to Scale (RTS)
- Productivity and Technical Change
- Costs: Short-run and Long-run
- Cost Functions
- Elasticity of Cost
- Profit Functions
- Linear Programming (LP)

---

## Firms

- Firms are organizations that transform inputs (such as labor, capital, materials, and energy) into outputs (goods and services).
- Firms can be public or private.
- Examples: farmers, manufacturers, transport companies, healthcare providers, security services, education providers.
- Broad sectoral classification: primary, secondary, and tertiary.

---

## Objectives of Firms

- **Cost Minimization**: Relevant to all firms (public, not-for-profit, and for-profit).
- **Revenue Maximization**: Relevant to cases where the focus is on maximizing revenue given resources.
- **Profit Maximization**: More general, requires both cost minimization and revenue maximization.

---

## Optimal Behavior

- **Technical Efficiency**: Is the firm using the best technology? Is it operating on the frontier?
- **Allocative Efficiency**: Are inputs and/or outputs combined optimally in relation to market prices?

---

## Length of the Run

- **Short-run**: Some inputs (or outputs) are variable, but others are fixed.
- **Medium-run**: More inputs (or outputs) are variable than in the short-run, but there are still fixed ones.
- **Long-run**: All inputs/outputs are variable and should be optimized.

---

## Models of Producer Behavior

- **Single-Factor and Single-Product Models (SFSP)**
- **Factor-Factor Models**
- **Product-Product Models**
- **General Multi-Input & Multi-Output Models**

---

## SFSP Model

### Example 1: Cobb-Douglas Function

- **Maize Output**: $y = A \cdot N^{\alpha_1} \cdot L^{\alpha_2} \cdot K^{\alpha_3}$
- **Short-Run Production Function**: $y = B \cdot N^{\alpha_1}$ (if all inputs other than nitrogen are fixed)

### Example 2: Quadratic Function

- **Maize Output**: $y = a_0 + bN + cL - dN^2 - eL^2 + fNL$
- **Short-Run Production Function**: $y = a_1 + b_1N - dN^2$ (if labor is fixed at $\bar{L}$)

---

## Exercise: Fill Out

Suppose the production can be expressed as a quadratic function of a variable input (say, N):
$y = 8N - \frac{1}{2}N^2$

- **AP**: $\frac{y}{N} = 8 - \frac{1}{2}N$
- **MP**: $\frac{\partial y}{\partial N} = 8 - N$
- **TVC**: $80 - 10\sqrt{64 - 2y}$
- **MC**: $\frac{10}{\sqrt{64 - 2y}}$
- **AC**: $\frac{10}{4 + \sqrt{16 - \frac{y}{2}}}$

---

## Production-Cost Link/Duality

- Cost functions inherit properties from the production function.
- The economically relevant properties of the production function can be recovered from the cost function.
- Duality is not limited to cost vs. production (includes other models of producer behavior such as profit functions).

---

## Factor-Factor Model

- **Cost Minimization**:
  - **Objective**: Minimize $C = w_1 x_1 + w_2 x_2$
  - **Constraint**: $y = f(x_1, x_2)$
  - **Lagrangian**: $\mathcal{L}(\mathbf{x}, \lambda, y) = w_1 x_1 + w_2 x_2 + \lambda (y - f(x_1, x_2))$
  - **FOC**: $\frac{\partial \mathcal{L}}{\partial x_i} = w_i - \lambda f_i = 0, \forall i = 1, \dots, n$
  - **SOC**: Satisfied if the production function is strictly quasi-concave.

---

## Characterizing Technology

- **Rate of Technical Substitution (RTS)**: $RTS = \frac{dx_2}{dx_1}$
- **Elasticity of Substitution ($\sigma$)**:
  $\sigma = \frac{d \ln \left(\frac{x_2}{x_1}\right)}{d \ln \left(\frac{f_1}{f_2}\right)} = \frac{d \ln \left(\frac{x_2}{x_1}\right)}{d \ln \left(\frac{w_1}{w_2}\right)}$

---

## Cost Functions

- **Cost Function**: $C = c(w_1, w_2, y)$
- **Properties**:
  - Monotonicity: Non-decreasing in input prices and output.
  - Linear Homogeneous of Degree 1 in input prices.
  - Concave function of input prices.
  - Shephard's Lemma: $\frac{\partial c(\cdot)}{\partial w_i} = x_i(w_1, w_2, y)$

---

## Product-Product Model

- **Production Possibility Frontier (PPF)**: Set of maximum (technically efficient) possible output combinations.
- **Marginal Rate of Product Transformation (MRT)**: Slope of PPF.

---

## Profit Optimization

- **Profit Function**: $\pi = \text{Revenue} - \text{Cost} = p y - c(w_1, w_2, y)$
- **FOC**: $\frac{\partial \pi}{\partial x_i} = p f_i - w_i = 0, \forall i = 1, \dots, n$
- **SOC**: Sufficient condition - production function is strictly concave.

---

## Profit Function Properties

- **Monotonicity**: Non-increasing (decreasing) in input (output) prices.
- **Linear Homogeneity** in input and output prices.
- **Convexity** in prices.
- **Hotelling Lemma**:
  - $\frac{\pi^*(\mathbf{w}, \mathbf{p})}{\partial p_m} = y_m^*(\mathbf{w}, \mathbf{p})$
  - $\frac{\pi^*(\mathbf{w}, \mathbf{p})}{\partial w_n} = -x_n^*(\mathbf{w}, \mathbf{p})$

---

## Exercise

1. Show how you would optimize profits for a simple (one-input Cobb-Douglas) production function: $y = A x^{\alpha}$.
2. How about a CD function with two inputs? $y = A x_{1}^{\alpha} x_{2}^{\beta}$.
3. Note that the CD is self-dual: cost and profit functions are also CD in functional form.

---

# Linear Programming using GAMS

---

## Diet Mix Problem Example (Chow et al. 1980)

### Objective

Design an optimal (low cost) diet mix for catfish while satisfying the following requirements:

### Constraints

1. Weight of meal mix is 100 kg (a quintal).
2. Protein content of mix at least 30 kg.
3. At least 250 Meal of DE in mix.
4. Calcium content of at least 0.5 kg in mix.
5. Calcium content not to exceed 1.5 kg.
6. At least 8 kg of fishmeal in mix.
7. At most 20 kg of rice bran in mix.

---

## LP Matrix

| Ingredient | Cost, Bahts/kg | Protein, % | Digestible energy (DE), Meal/kg | Calcium, % |
| --- | --- | --- | --- | --- |
| Maize | 2.15 | 9 | 1.1 | 0.02 |
| Fishmeal | 8 | 65 | 3.9 | 3.7 |
| Soymeal | 6 | 44 | 2.57 | 0.3 |
| Ricebran | 2 | 12 | 1.99 | 0.1 |
| Limestone | 0.4 | 0 | 0 | 38 |

---

## LP Equations

### Objective Function

$2.15 \text{ MAIZE} + 8.000 \text{ FISHMEAL} + 6.000 \text{ SOYMEAL} + 2.00 \text{ RICEBRAN} + 0.40 \text{ LIMESTONE} = \text{Cost}$

### Constraints

1. $1.00 \text{ MAIZE} + 1.000 \text{ FISHMEAL} + 1.000 \text{ SOYMEAL} + 1.00 \text{ RICEBRAN} + 1.00 \text{ LIMESTONE} = 100$
2. $0.09 \text{ MAIZE} + 0.650 \text{ FISHMEAL} + 0.440 \text{ SOYMEAL} + 0.12 \text{ RICEBRAN} \geq 30$
3. $1.10 \text{ MAIZE} + 3.900 \text{ FISHMEAL} + 2.570 \text{ SOYMEAL} + 1.99 \text{ RICEBRAN} \geq 250$
4. $0.037 \text{ FISHMEAL} + 0.003 \text{ SOYMEAL} + 0.001 \text{ RICEBRAN} + 0.38 \text{ LIMESTONE} \geq 0.5$
5. $0.037 \text{ FISHMEAL} + 0.003 \text{ SOYMEAL} + 0.001 \text{ RICEBRAN} + 0.38 \text{ LIMESTONE} \leq 1.5$
6. $\text{FISHMEAL} \geq 8$
7. $\text{RICEBRAN} \leq 20$

---

## GAMS Implementations

### catfish_diet1.gms

```gams
*GAMS program for catfish diet problem (Chow et al. 1980)
*author: A Hailu
*LP model
*choice variables
Positive variables
maize
fishmeal
soymeal
ricebran
limestone
;
Variables
cost
;
*declare the equations
Equations
CostEq
BagsizeEq
ProteinEq
DEmealEq
CalciumMinEq
CalciumMaxEq
FishmealMinEq
RicebranMaxEq
;
*OBJECTIVE FUNCTION
CostEq.. cost =e= 2.15*maize + 8*fishmeal + 6*soymeal + 2*ricebran + 0.4*limestone;
*CONSTRAINTS
BagsizeEq.. 1.0*maize + 1.0*fishmeal + 1.0*soymeal + 1.0*ricebran + 1.0*limestone =e= 100;
ProteinEq.. 0.09*maize + 0.65*fishmeal + 0.44*soymeal + 0.12*ricebran + 0*limestone =g= 30;
DEmealEq.. 1.10*maize + 3.90*fishmeal + 2.57*soymeal + 1.99*ricebran + 0*limestone =g= 250;
CalciumMinEq.. 0.0002*maize + 0.037*fishmeal + 0.003*soymeal + 0.001*ricebran + 0.38*limestone =g= 0.5;
CalciumMaxEq.. 0.0002*maize + 0.037*fishmeal + 0.003*soymeal + 0.001*ricebran + 0.38*limestone =l= 1.5;
FishmealMinEq.. 1.0*fishmeal =g= 8;
RicebranMaxEq.. 1.0*ricebran =l= 20;
*MODEL - define model using 'all' for all equations
model catfish /all/;
*SOLVE MODEL as LP problem minimising objective value 'cost'
solve catfish minimizing cost using lp;
*DISPLAY SOLUTION LEVELS (.l)
display maize.l, fishmeal.l, soymeal.l, ricebran.l, limestone.l, cost.l;
```

### catfish_diet2.gms

```gams
*GAMS program for catfish diet problem (Chow et al. 1980, http://www.fao.org/3/x5738e/x5738e0h.htm)
*author of GAMS program below: Atakelty Hailu (UWA)
*OPTIONAL INPUT LISTING INSTRUCTION
* Turn off the listing of the input file
$offlisting
* Turn off the listing and cross-reference of the symbols used
$offsymxref offsymlist
option
limrow = 0,
limcol = 0,
solprint = off,
sysout = off;
*LP model below
*create sets/indexes
set ingrd /maize, fishmeal, soymeal, ricebran, limestone/
set lpdata /cost, protein, demeal, calcium/;
scalar minProtn /30/;
scalar minDEml /250/;
scalar minCalc /0.5/;
scalar maxCalc /1.5/;
scalar minFmeal /8/;
scalar maxRbran /20/;
Table lptab(ingrd,lpdata)
    cost    protein    DEmeal    calcium
maize    2.15    0.09    1.10    0.0002
fishmeal    8.00    0.65    3.90    0.0370
soymeal    6.00    0.44    2.57    0.0030
ricebran    2.00    0.12    1.99    0.0010
;
display lptab;
*choice variables
Positive variables
x(ingrd)
;
*objective variable
Variables
cost
;
*declare the equations
equations
costEq
BagsizeEq
proteinEq
DEmealEq
calciumMinEq
calciumMaxEq
fishmealMinEq
ricebranMaxEq
;
*OBJECTIVE FUNCTION
costEq.. cost =e= sum(ingrd, lptab(ingrd, "cost") * x(ingrd));
*CONSTRAINTS
BagsizeEq.. sum(ingrd, x(ingrd)) =e= 100;
proteinEq.. sum(ingrd, lptab(ingrd, "protein") * x(ingrd)) =g= minProtn;
DEmealEq.. sum(ingrd, lptab(ingrd, "demeal") * x(ingrd)) =g= minDEml;
calciumMinEq.. sum(ingrd, lptab(ingrd, "calcium") * x(ingrd)) =g= minCalc;
calciumMaxEq.. sum(ingrd, lptab(ingrd, "calcium") * x(ingrd)) =l= maxCalc;
fishmealMinEq.. 1.0*x("fishmeal") =g= minFmeal;
ricebranMaxEq.. 1.0*x("ricebran") =l= maxRbran;
*MODEL - define model using 'all' for all equations
model catfish /all/;
*SOLVE MODEL as LP problem minimising objective value 'cost'
solve catfish minimizing cost using lp;
*DISPLAY SOLUTION LEVELS (.l)
display x.l, cost.l;
*check how the solution would vary if price of soybean goes down to 4
lptab("soymeal", "cost") = 4;
solve catfish minimizing cost using lp;
display x.l, cost.l;
```

---

## Simple Diet Problem

### Problem

Design a diet from foods I & II to meet daily nutrient requirements while minimizing cost of food purchase.

|   | Food I | Food II | Minimum Required |
| --- | --- | --- | --- |
| Price | $0.60 | $1.00 |   |
| Calcium | 10 | 4 | 20 |
| Protein | 5 | 5 | 20 |
| Vitamin A | 2 | 6 | 12 |

---

## Student Exercise: Complete GAMS Code

```gams
*Problem (Chiang, 1984): mix two foods (x1 and x2)
*in a cost optimal way while satisfying
*minimum daily nutrient requirements of
** calcium 20
** protein 20
** vitamin A 12
*A pound of food has these nutrients
**Food 1: calcium 10, protein 5, vit A 2
**Food 2: calcium 4, protein 5, vit A 6
*Food prices are $0.60 and $1.0 per pound
*author of GAMS program skeleton below: Atakelty Hailu (UWA)
*LP model below
*choice variables - food quantities to use
Positive variables
x1
x2
;
*objective variable
Variables
cost
;
*declare the equations
Equations
CostEq
ProteinEq
CalciumEq
VitaminAEq
;
*OBJECTIVE FUNCTION
CostEq.. cost =e= 0.60*x1 + 1.00*x2;
*CONSTRAINTS
ProteinEq.. 5*x1 + 5*x2 =g= 20;
CalciumEq.. 10*x1 + 4*x2 =g= 20;
VitaminAEq.. 2*x1 + 6*x2 =g= 12;
*MODEL - define model using 'all' for all equations
model dietmodel /CostEq, ProteinEq, CalciumEq, VitaminAEq/;
*SOLVE MODEL as LP problem minimising objective value 'cost'
solve dietmodel minimizing cost using lp;
*DISPLAY SOLUTION LEVELS (.l)
display x1.l, x2.l, cost.l, ProteinEq.l, CalciumEq.l, VitaminAEq.l;
```

---

## Exercise: Argawal-Heady Example

### Context

A farmer has 160 acres of land (L) to allocate among two crops – corn and wheat. Wheat is planted in March when the farmer has only 65 hours of labor available. Corn is planted in July, and the farmer has 110 hours of labor available in July. Labor requirements are 0.5 hour/acre for wheat and 1.0 hour/acre for corn. Wheat generates a net revenue of $32 per acre while corn generates only $16/acre.

### Objective

Maximize profits (or net revenue).

### Objective Function

Maximize $\pi = 32A_w + 16A_c$

### Constraints

- Land: $A_w + A_c \leq 160$
- March Labor: $0.5A_w \leq 65$
- July Labor: $A_c \leq 110$
- Positivity: $A_w, A_c \geq 0$

---

## GAMS Code for Argawal-Heady Example

```gams
*GAMS program for Argawal-Heady problem
*author: Atakelty Hailu (UWA)
*LP model below
*choice variables - land allocation to crops
Positive variables
Aw
Ac
;
*objective variable
Variables
profit
;
*declare the equations
Equations
ProfitEq
LandEq
MarchLabourEq
JulyLabourEq
;
*OBJECTIVE FUNCTION
ProfitEq.. profit =e= 32*Aw + 16*Ac;
*CONSTRAINTS
LandEq.. Aw + Ac =l= 160;
MarchLabourEq.. 0.5*Aw =l= 65;
JulyLabourEq.. Ac =l= 110;
*MODEL - define model using 'all' for all equations
model argawalheady /ProfitEq, LandEq, MarchLabourEq, JulyLabourEq/;
*SOLVE MODEL as LP problem maximizing objective value 'profit'
solve argawalheady maximizing profit using lp;
*DISPLAY SOLUTION LEVELS (.l)
display Aw.l, Ac.l, profit.l, LandEq.l, MarchLabourEq.l, JulyLabourEq.l;
```

---
