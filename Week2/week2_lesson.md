# Week 2: Mathematical Methods I — Linear Algebra

**ECON4002: Core Concepts in Agricultural and Resource Economics**  
*University of Western Australia*

---

## Learning Objectives

By the end of this week, you will be able to:

1. Create and manipulate matrices in R
2. Perform matrix operations (addition, multiplication, transpose, inverse)
3. Calculate determinants and understand their economic significance
4. Solve systems of linear equations using matrices
5. Apply Cramer's Rule to economic problems
6. Represent supply-demand systems in matrix form
7. Build and solve a **Leontief input-output model** to trace direct and indirect inter-industry effects
8. Use **eigenvalues** to test definiteness of a quadratic form and assess stability of a linear dynamic system

---

## 1. Why Linear Algebra in Economics?

### 1.1 Economic Applications

Linear algebra is fundamental to economics because many economic relationships can be expressed as systems of linear equations:

| Application               | Example                                     |
| ------------------------- | ------------------------------------------- |
| **Market equilibrium**    | Multiple markets with interdependent prices |
| **Input-output analysis** | Leontief models of industry interdependence |
| **Consumer demand**       | Linear expenditure systems                  |
| **Regression**            | Estimating economic relationships from data |
| **Optimization**          | Constraints in linear programming           |
| **Dynamic systems**       | Difference equations in macroeconomics      |

### 1.2 Linear Equations and Their Uses

A **linear equation** has the form:
$$a_1 x_1 + a_2 x_2 + \cdots + a_n x_n = b$$

Linear equations are important because:
- Many economic relationships are approximately linear over relevant ranges
- Linear systems can be solved analytically
- First-order approximations of nonlinear relationships are linear
- Computational methods are well-developed

---

## 2. Matrices: Fundamentals

### 2.1 What is a Matrix?

A **matrix** is a rectangular array of numbers arranged in rows and columns.

$$A = \begin{bmatrix} a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \end{bmatrix}$$

- **Dimensions**: rows × columns (this matrix is 2×3)
- **Element**: $a_{ij}$ is in row $i$, column $j$
- **Square matrix**: same number of rows and columns

### 2.2 Special Matrices

**Identity Matrix** ($I$): Square matrix with 1s on diagonal, 0s elsewhere
$$I_3 = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$$

**Zero Matrix**: All elements are zero

**Diagonal Matrix**: Non-zero elements only on the main diagonal

**Symmetric Matrix**: $A = A'$ (equals its transpose)

**Transpose** ($A'$ or $A^T$): Rows become columns
$$A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \\ 5 & 6 \end{bmatrix} \Rightarrow A' = \begin{bmatrix} 1 & 3 & 5 \\ 2 & 4 & 6 \end{bmatrix}$$

### 2.3 Matrices in R

```r
# Create a matrix
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3, byrow = TRUE)
A
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

# Create by columns (default)
B <- matrix(c(1, 4, 2, 5, 3, 6), nrow = 2, ncol = 3)
# Same result as A

# Special matrices
I <- diag(3)           # 3×3 identity matrix
D <- diag(c(2, 3, 4))  # Diagonal matrix with 2, 3, 4
Z <- matrix(0, 2, 3)   # 2×3 zero matrix

# Matrix properties
dim(A)       # Dimensions: 2, 3
nrow(A)      # Number of rows: 2
ncol(A)      # Number of columns: 3
t(A)         # Transpose
```

---

## 3. Matrix Operations

### 3.1 Addition and Subtraction

Matrices must have the **same dimensions**. Add/subtract element by element.

$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} + \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix} = \begin{bmatrix} 6 & 8 \\ 10 & 12 \end{bmatrix}$$

```r
A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), nrow = 2, byrow = TRUE)

A + B  # Element-wise addition
A - B  # Element-wise subtraction
```

### 3.2 Scalar Multiplication

Multiply each element by the scalar:

$$3 \times \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} = \begin{bmatrix} 3 & 6 \\ 9 & 12 \end{bmatrix}$$

```r
3 * A
```

### 3.3 Matrix Multiplication

For matrices $A$ (m×n) and $B$ (n×p), the product $C = AB$ is (m×p).

**Rule**: Element $c_{ij}$ is the dot product of row $i$ of $A$ and column $j$ of $B$.

$$c_{ij} = \sum_{k=1}^{n} a_{ik} b_{kj}$$

**Example**:
$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \times \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix} = \begin{bmatrix} 1(5)+2(7) & 1(6)+2(8) \\ 3(5)+4(7) & 3(6)+4(8) \end{bmatrix} = \begin{bmatrix} 19 & 22 \\ 43 & 50 \end{bmatrix}$$

**Key Properties**:
- **Not commutative**: $AB \neq BA$ in general
- **Associative**: $(AB)C = A(BC)$
- **Distributive**: $A(B + C) = AB + AC$
- $AI = IA = A$ (identity is multiplicative identity)

```r
A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), nrow = 2, byrow = TRUE)

# Matrix multiplication uses %*%
A %*% B    # Correct: matrix multiplication
# A * B    # WRONG: this is element-wise multiplication!

# Verify non-commutativity
A %*% B
B %*% A    # Different result!
```

> **⚠️ Critical R Note**: Use `%*%` for matrix multiplication. The `*` operator performs element-wise multiplication, not matrix multiplication!

---

## 4. Determinants

### 4.1 Definition and Calculation

The **determinant** is a scalar value that characterizes a square matrix.

**2×2 Determinant**:
$$\begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc$$

**3×3 Determinant** (expansion by first row):
$$\begin{vmatrix} a & b & c \\ d & e & f \\ g & h & i \end{vmatrix} = a(ei - fh) - b(di - fg) + c(dh - eg)$$

```r
A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
det(A)   # 1*4 - 2*3 = -2

B <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
det(B)   # 0 (singular matrix)
```

### 4.2 Economic Significance of Determinants

The determinant tells us whether a system of equations has a **unique solution**:

| Determinant      | Meaning                | Graphical                    |
| ---------------- | ---------------------- | ---------------------------- |
| $\det(A) \neq 0$ | **Unique solution**    | Lines intersect at one point |
| $\det(A) = 0$    | **No unique solution** | Lines parallel or identical  |

**Economic interpretation**: A market system with $\det = 0$ means the equations are dependent—one equation is redundant or the system is inconsistent.

### 4.3 Example: Market System

Consider:
- Demand: $Q_d = 100 - 2P$
- Supply: $Q_s = -20 + 4P$

Rewrite in standard form ($Ax = b$):
$$\begin{bmatrix} 1 & 2 \\ 1 & -4 \end{bmatrix} \begin{bmatrix} Q \\ P \end{bmatrix} = \begin{bmatrix} 100 \\ -20 \end{bmatrix}$$

Determinant:
$$\begin{vmatrix} 1 & 2 \\ 1 & -4 \end{vmatrix} = 1(-4) - 2(1) = -6 \neq 0$$

Since $\det \neq 0$, there is a unique equilibrium.

---

## 5. Matrix Inverse

### 5.1 Definition

The **inverse** of a square matrix $A$, denoted $A^{-1}$, satisfies:
$$A \cdot A^{-1} = A^{-1} \cdot A = I$$

**Existence**: A matrix has an inverse if and only if $\det(A) \neq 0$. Such matrices are called **nonsingular** or **invertible**.

### 5.2 Finding the Inverse

**2×2 Formula**:
$$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$

where $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$

**Example**:
$$A = \begin{bmatrix} 2 & 1 \\ 3 & 5 \end{bmatrix}$$

$\det(A) = 2(5) - 1(3) = 7$

$$A^{-1} = \frac{1}{7} \begin{bmatrix} 5 & -1 \\ -3 & 2 \end{bmatrix} = \begin{bmatrix} 5/7 & -1/7 \\ -3/7 & 2/7 \end{bmatrix}$$

```r
A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
det(A)       # 7
solve(A)     # Inverse

# Verify: A * A^(-1) = I
A %*% solve(A)   # Should give identity matrix
```

---

## 6. Solving Linear Systems

### 6.1 Matrix Form of Linear Systems

A system of linear equations:
$$\begin{align}
a_{11}x_1 + a_{12}x_2 &= b_1 \\
a_{21}x_1 + a_{22}x_2 &= b_2
\end{align}$$

Can be written as:
$$Ax = b$$

where:
$$A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}, \quad x = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}, \quad b = \begin{bmatrix} b_1 \\ b_2 \end{bmatrix}$$

### 6.2 Solution Methods

**Method 1: Matrix Inversion**

If $\det(A) \neq 0$:
$$x = A^{-1}b$$

```r
A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
b <- c(8, 19)

x <- solve(A, b)   # More efficient than solve(A) %*% b
x                  # Solution: x1 = 3, x2 = 2
```

> **Note**: `solve(A, b)` directly solves the linear system using **LU decomposition** — faster and more numerically stable than explicitly forming $A^{-1}$. Always prefer `solve(A, b)` over `solve(A) %*% b` for numerical work.

**Method 2: Cramer's Rule**

For $Ax = b$ with $\det(A) \neq 0$:
$$x_i = \frac{\det(A_i)}{\det(A)}$$

where $A_i$ is matrix $A$ with column $i$ replaced by $b$.

**Example**:
$$\begin{align}
2x_1 + x_2 &= 8 \\
3x_1 + 5x_2 &= 19
\end{align}$$

$$x_1 = \frac{\begin{vmatrix} 8 & 1 \\ 19 & 5 \end{vmatrix}}{\begin{vmatrix} 2 & 1 \\ 3 & 5 \end{vmatrix}} = \frac{40 - 19}{10 - 3} = \frac{21}{7} = 3$$

$$x_2 = \frac{\begin{vmatrix} 2 & 8 \\ 3 & 19 \end{vmatrix}}{\begin{vmatrix} 2 & 1 \\ 3 & 5 \end{vmatrix}} = \frac{38 - 24}{7} = \frac{14}{7} = 2$$

```r
# Cramer's Rule implementation
cramers_rule <- function(A, b) {
  det_A <- det(A)
  if (abs(det_A) < 1e-10) stop("Matrix is singular")
  
  n <- length(b)
  x <- numeric(n)
  
  for (i in 1:n) {
    A_i <- A
    A_i[, i] <- b      # Replace column i with b
    x[i] <- det(A_i) / det_A
  }
  return(x)
}

A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
b <- c(8, 19)
cramers_rule(A, b)   # 3, 2
```

### 6.3 Types of Solutions

| $\det(A)$           | System Type             | Solution        |
| ------------------- | ----------------------- | --------------- |
| $\neq 0$            | Consistent, independent | Unique          |
| $= 0$, consistent   | Dependent               | Infinitely many |
| $= 0$, inconsistent | Contradictory           | None            |

**Example: Infinite Solutions**
$$\begin{align}
2x + y &= 4 \\
x + 0.5y &= 2
\end{align}$$

The second equation is just half of the first—they're the same line.

```r
A <- matrix(c(2, 1, 1, 0.5), nrow = 2, byrow = TRUE)
det(A)  # 0 - singular matrix
```

---

## 7. Economic Applications

### 7.1 Market Equilibrium

**Two-market system**:
- Market 1: $Q_1^d = 10 - 2P_1 + P_2$ (goods are substitutes)
- Market 1: $Q_1^s = -2 + 3P_1$
- Market 2: $Q_2^d = 15 + P_1 - 3P_2$
- Market 2: $Q_2^s = -1 + 2P_2$

At equilibrium: $Q_i^d = Q_i^s$ for each market.

Rearranging:
$$\begin{align}
5P_1 - P_2 &= 12 \\
-P_1 + 5P_2 &= 16
\end{align}$$

In matrix form:
$$\begin{bmatrix} 5 & -1 \\ -1 & 5 \end{bmatrix} \begin{bmatrix} P_1 \\ P_2 \end{bmatrix} = \begin{bmatrix} 12 \\ 16 \end{bmatrix}$$

```r
A <- matrix(c(5, -1, -1, 5), nrow = 2, byrow = TRUE)
b <- c(12, 16)

prices <- solve(A, b)
cat("P1* =", prices[1], ", P2* =", prices[2])
# P1* = 3.167, P2* = 3.833
```

### 7.2 Input-Output Analysis

The **Leontief input-output model** describes how industries depend on each other.

Let:
- $x_i$ = total output of industry $i$
- $a_{ij}$ = amount of input from industry $i$ needed per unit of output of industry $j$
- $d_i$ = final demand for industry $i$'s output

The balance equation:
$$x_i = \sum_j a_{ij} x_j + d_i$$

In matrix form:
$$x = Ax + d$$
$$(I - A)x = d$$
$$x = (I - A)^{-1} d$$

The matrix $(I - A)^{-1}$ is the **Leontief inverse**.

**Interpreting individual elements**: Element $[(I-A)^{-1}]_{ij}$ gives the total gross output of sector $i$ required — including all direct and indirect (supply-chain) effects — per unit of final demand for sector $j$. Column $j$ of $(I-A)^{-1}$ therefore gives the full economy-wide impact of a unit increase in final demand for good $j$.

```r
# Simple 2-industry example
# A[i,j] = input from i per unit output of j
A <- matrix(c(0.2, 0.3, 0.4, 0.1), nrow = 2, byrow = TRUE)
d <- c(100, 150)  # Final demand

I <- diag(2)
leontief <- solve(I - A)  # Leontief inverse
x <- leontief %*% d       # Total output needed

cat("Output required: x1 =", x[1], ", x2 =", x[2])
```

**Validity conditions for the Leontief model**:

For the model to have an economically meaningful solution (all gross outputs non-negative), two conditions must hold:
1. $\det(I - A) \neq 0$: the system has a unique solution.
2. **Hawkins–Simon conditions**: all leading principal minors of $(I - A)$ are positive. This guarantees $(I - A)^{-1} \geq 0$, ensuring no sector is required to produce negative gross output. If the Hawkins–Simon conditions fail, the model predicts an economically impossible result and the coefficient matrix should be re-examined.

---

## 8. Quadratic Forms (Preview for Optimization)

### 8.1 Definition

A **quadratic form** is an expression:
$$Q = x'Ax = \sum_i \sum_j a_{ij} x_i x_j$$

For a 2×2 case:
$$Q = \begin{bmatrix} x_1 & x_2 \end{bmatrix} \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = a_{11}x_1^2 + (a_{12} + a_{21})x_1 x_2 + a_{22}x_2^2$$

### 8.2 Definiteness

The **definiteness** of a quadratic form determines whether a function has a maximum or minimum:

| Type              | Condition                       | Optimization |
| ----------------- | ------------------------------- | ------------ |
| Positive definite | $Q > 0$ for all $x \neq 0$      | Minimum      |
| Negative definite | $Q < 0$ for all $x \neq 0$      | Maximum      |
| Indefinite        | $Q$ can be positive or negative | Saddle point |

**Testing with eigenvalues**: A symmetric matrix is positive definite if all eigenvalues are positive.

```r
# Quadratic form: Q = 2x1² + 3x2² + 2x1x2
# Symmetric matrix representation
A <- matrix(c(2, 1, 1, 3), nrow = 2, byrow = TRUE)

# Check eigenvalues
eigen(A)$values  # Both positive → positive definite
```

### 8.3 Eigenvalues and Stability of Linear Dynamic Systems

Eigenvalues do double duty in economics. Beyond classifying the curvature of a quadratic form (§8.2), they characterise the **stability** of any linear dynamic system written in matrix form.

Consider a discrete-time system
$$x_{t+1} = M\,x_t,$$
where $x_t \in \mathbb{R}^n$ is a state vector (e.g. market shares of two technologies, populations of two competing species, or prices in two interconnected markets) and $M$ is an $n\times n$ transition matrix. Iterating gives $x_t = M^t x_0$. The long-run behaviour of $x_t$ is governed entirely by the eigenvalues of $M$:

- If **all eigenvalues** $\lambda_i$ satisfy $|\lambda_i| < 1$, then $M^t \to 0$ and any initial state decays toward the origin (or toward a fixed equilibrium, in the affine case $x_{t+1}=Mx_t+b$). The system is **asymptotically stable**.
- If **any eigenvalue** has $|\lambda_i| > 1$, perturbations along the corresponding eigenvector grow without bound. The system is **unstable**.
- If $|\lambda_i| = 1$ for some $i$ and all others are inside the unit circle, the system is **marginally stable** (e.g. Markov chains have a unit eigenvalue corresponding to the stationary distribution).

This is exactly the test asked for in Practice Problem 9: compute `eigen(M)$values`, then check whether every modulus is below one.

```r
# Example: simple two-state Markov-style transition matrix
M <- matrix(c(0.7, 0.4,
              0.3, 0.6), nrow = 2, byrow = TRUE)
lam <- eigen(M)$values
cat("|lambda| =", abs(lam), "\n")
# One eigenvalue equals 1 (Markov chain) → marginally stable;
# converges to a stationary distribution rather than to zero.
```

**Connection between the two uses of eigenvalues.** For a *symmetric* matrix (the relevant case for quadratic forms), all eigenvalues are real, and their **signs** classify definiteness (§8.2). For a general (possibly non-symmetric) transition matrix, eigenvalues may be complex, and their **moduli** classify stability. Both tests are computed by the same R command, `eigen(A)$values`.

---

## 9. Summary

### Key Concepts

1. **Matrices** represent systems of linear equations compactly
2. **Matrix multiplication** uses `%*%` in R (not `*`)
3. **Determinant** ≠ 0 means unique solution exists
4. **Inverse** exists only for nonsingular matrices
5. **solve(A, b)** finds $x$ in $Ax = b$
6. **Cramer's Rule** provides explicit formula for each variable
7. **Input-output models** use $(I - A)^{-1}$ to find total output

### R Functions Summary

| Task            | Function                          |
| --------------- | --------------------------------- |
| Create matrix   | `matrix(data, nrow, ncol, byrow)` |
| Dimensions      | `dim()`, `nrow()`, `ncol()`       |
| Transpose       | `t(A)`                            |
| Matrix multiply | `A %*% B`                         |
| Determinant     | `det(A)`                          |
| Inverse         | `solve(A)`                        |
| Solve $Ax = b$  | `solve(A, b)`                     |
| Identity matrix | `diag(n)`                         |
| Eigenvalues     | `eigen(A)$values`                 |

---

## 10. Preparation for Next Week

**Week 3: Calculus and Functions**

Before class:
- Read Chiang & Wainwright, Chapters 6-8
- Review differentiation rules
- Practice finding derivatives

Key concepts to preview:
- Partial derivatives
- Elasticity as a derivative
- Total differential
- Functions of multiple variables

---

## References

- Chiang, A.C. & Wainwright, K. (2005). *Fundamental Methods of Mathematical Economics*, 4th ed., Chapters 4-5.
- Melkumian, A. (2011). *Mathematical Economics*, Chapters on matrices.
- Jacques, I. (2015). *Mathematics for Economics and Business*, Linear algebra chapters.
