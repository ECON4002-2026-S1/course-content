# Week 2: Practice Problems — Linear Algebra

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Instructions

Complete all problems showing your work. For computational questions, include both R code and output. Verify analytical solutions using R.

---

## Part A: Matrix Operations

### Problem 1: Basic Operations

Given:
$$A = \begin{bmatrix} 2 & 1 \\ 3 & 5 \end{bmatrix}, \quad B = \begin{bmatrix} 4 & 0 \\ 1 & 2 \end{bmatrix}, \quad C = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$$

Calculate the following (first by hand, then verify in R):

a) $A + B$

b) $A - B$

c) $3A$

d) $AB$ (matrix multiplication)

e) $BA$ (Does $AB = BA$?)

f) $C'$ (transpose of C)

g) Is $A \cdot B = B \cdot A$? What does this tell us about matrix multiplication?

---

### Problem 2: Determinants

Calculate the determinant of each matrix (by hand, then verify in R):

a) $D_1 = \begin{bmatrix} 3 & 2 \\ 1 & 4 \end{bmatrix}$

b) $D_2 = \begin{bmatrix} 6 & 2 \\ 3 & 1 \end{bmatrix}$

c) $D_3 = \begin{bmatrix} 1 & 2 & 3 \\ 7 & 0 & 8 \\ 4 & 5 & 6 \end{bmatrix}$

d) For which matrices does an inverse exist? Explain why.

---

### Problem 3: Matrix Inverse

a) Find the inverse of $A = \begin{bmatrix} 2 & 1 \\ 3 & 5 \end{bmatrix}$ using the 2×2 formula:
$$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$

b) Verify your answer by computing $A \cdot A^{-1}$ (should equal identity matrix)

c) Use R to confirm your inverse calculation

---

## Part B: Solving Linear Systems

### Problem 4: Graphical and Algebraic Solutions

For each system below:
- (i) Solve algebraically (by substitution or elimination)
- (ii) Solve using matrix methods ($x = A^{-1}b$)
- (iii) Determine if the solution is unique, infinite, or nonexistent

**System A:**
$$\begin{align}
5x + 3y &= 11 \\
4x + y &= 6
\end{align}$$

**System B:**
$$\begin{align}
2x + y &= 4 \\
x + 0.5y &= 2
\end{align}$$

**System C:**
$$\begin{align}
2x + y &= 6 \\
x + 0.5y &= 2
\end{align}$$

---

### Problem 5: Cramer's Rule

Use Cramer's Rule to solve:
$$\begin{align}
2x - 4y + 6z &= 3 \\
-x + 3y + 2z &= 2 \\
6x - 7y - 2z &= 4
\end{align}$$

a) Write the system in matrix form $Ax = b$

b) Calculate $\det(A)$

c) Calculate $\det(A_x)$, $\det(A_y)$, $\det(A_z)$ where $A_i$ is $A$ with column $i$ replaced by $b$

d) Find $x$, $y$, $z$ using Cramer's Rule

e) Verify your solution using R's `solve()` function

---

## Part C: Economic Applications

### Problem 6: Supply and Demand System

The market for wheat can be described by:
- Demand: $Q_d = 100 - 2P$ 
- Supply: $Q_s = -20 + 4P$

a) Rewrite both equations with quantity on the left side of each equation

b) Write the system in matrix form:
$$\begin{bmatrix} ? & ? \\ ? & ? \end{bmatrix} \begin{bmatrix} Q \\ P \end{bmatrix} = \begin{bmatrix} ? \\ ? \end{bmatrix}$$

c) Calculate the determinant. What does it tell us about the equilibrium?

d) Solve for equilibrium $P^*$ and $Q^*$ using matrix methods

e) Create R code to:
   - Define the coefficient matrix and constant vector
   - Solve the system
   - Plot demand and supply curves with equilibrium marked

---

### Problem 7: Two-Market Equilibrium

Consider two related agricultural markets (wheat and corn) where:

**Wheat Market:**
- Demand: $Q_W^d = 80 - 3P_W + P_C$ (corn is a substitute)
- Supply: $Q_W^s = -10 + 2P_W$

**Corn Market:**
- Demand: $Q_C^d = 100 + P_W - 4P_C$
- Supply: $Q_C^s = -20 + 3P_C$

a) Write the equilibrium conditions ($Q^d = Q^s$ for each market)

b) Rearrange to get two equations in two unknowns ($P_W$ and $P_C$)

c) Express as a matrix system $Ax = b$

d) Solve for equilibrium prices $P_W^*$ and $P_C^*$

e) Calculate equilibrium quantities $Q_W^*$ and $Q_C^*$

f) **Interpretation**: What happens to the corn market equilibrium if wheat demand increases? (Hint: Consider how the markets are connected)

---

### Problem 8: Input-Output Analysis

A simple agricultural economy has two sectors: Crops (C) and Livestock (L).

The input-output coefficients are:
| | To Crops | To Livestock |
|---|----------|--------------|
| From Crops | 0.2 | 0.4 |
| From Livestock | 0.1 | 0.2 |

Final demand: Crops = 80, Livestock = 60

a) Write the technology matrix $A$

b) Calculate $(I - A)$

c) Find the Leontief inverse $(I - A)^{-1}$

d) Calculate total output required from each sector: $x = (I - A)^{-1}d$

e) **Interpretation**: If final demand for Crops increases by 10 units, how much additional output is required from each sector?

---

## Part D: Advanced Problems

### Problem 9: Eigenvalues and Stability

For the matrix:
$$M = \begin{bmatrix} 0.8 & 0.2 \\ 0.3 & 0.6 \end{bmatrix}$$

a) Calculate the eigenvalues using R's `eigen()` function

b) Is this matrix stable for a dynamic system? (Stable if all eigenvalues have absolute value < 1)

c) What type of matrix is this? (Hint: Check if rows sum to 1)

d) If this represents transition probabilities between two states, what does stability mean economically?

---

### Problem 10: Quadratic Forms

Consider the quadratic form:
$$Q = 2x_1^2 + 3x_2^2 + 2x_1x_2$$

a) Write this in matrix form $Q = x'Ax$ where $A$ is symmetric

b) Find the eigenvalues of $A$

c) Is $A$ positive definite, negative definite, or indefinite?

d) What does this tell us about the function $f(x_1, x_2) = 2x_1^2 + 3x_2^2 + 2x_1x_2$ at the origin?

---

## Part E: R Programming Challenges

### Problem 11: Matrix Function

Write an R function called `solve_market` that:
- Takes demand intercept `a`, demand slope `b`, supply intercept `c`, supply slope `d` as inputs
- Forms the coefficient matrix and constant vector
- Checks if a unique solution exists (determinant ≠ 0)
- Returns equilibrium price and quantity, or an error message if no unique solution

Test with: $Q_d = 150 - 5P$, $Q_s = -30 + 10P$

---

### Problem 12: Sensitivity Analysis

Using the two-market model from Problem 7:

a) Create a function that calculates equilibrium prices given the model parameters

b) Perform sensitivity analysis: How does $P_W^*$ change when the corn supply intercept changes from -20 to -10?

c) Create a plot showing how $P_W^*$ varies as the corn supply intercept ranges from -30 to 0

---

## Submission Guidelines

- Show all hand calculations for Problems 1-5
- Include R code and output for all computational problems
- Provide economic interpretations where requested
- Due: Before Week 3 class

---

## Self-Assessment Checklist

Before submitting, ensure you can:

- [ ] Perform matrix addition, subtraction, and scalar multiplication
- [ ] Correctly multiply matrices (using `%*%` in R)
- [ ] Calculate 2×2 and 3×3 determinants
- [ ] Find the inverse of a 2×2 matrix
- [ ] Solve linear systems using matrices
- [ ] Apply Cramer's Rule
- [ ] Set up economic problems in matrix form
- [ ] Interpret determinants and singularity economically
- [ ] Use R for matrix computations
