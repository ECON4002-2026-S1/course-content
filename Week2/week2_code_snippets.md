# Week 2: R Code Snippets — Linear Algebra

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Overview

Essential R code for matrix operations, determinants, inverses, and solving linear systems.

---

## 1. Creating Matrices

### 1.1 Basic Matrix Creation

```r
# Create matrix by row (byrow = TRUE)
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3, byrow = TRUE)
A
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

# Create matrix by column (default)
B <- matrix(c(1, 4, 2, 5, 3, 6), nrow = 2, ncol = 3)
# Same result as A

# From vectors
row1 <- c(1, 2, 3)
row2 <- c(4, 5, 6)
C <- rbind(row1, row2)  # Bind rows

col1 <- c(1, 4)
col2 <- c(2, 5)
D <- cbind(col1, col2)  # Bind columns
```

### 1.2 Special Matrices

```r
# Identity matrix
I <- diag(3)           # 3×3 identity
I
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

# Diagonal matrix
D <- diag(c(2, 3, 4))  # Diagonal with 2, 3, 4
D
#      [,1] [,2] [,3]
# [1,]    2    0    0
# [2,]    0    3    0
# [3,]    0    0    4

# Zero matrix
Z <- matrix(0, nrow = 2, ncol = 3)

# Matrix of ones
ones <- matrix(1, nrow = 2, ncol = 3)
```

### 1.3 Matrix Properties

```r
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = TRUE)

dim(A)        # Dimensions: 2 3
nrow(A)       # Number of rows: 2
ncol(A)       # Number of columns: 3
length(A)     # Total elements: 6

# Access elements
A[1, 2]       # Row 1, Column 2: 2
A[1, ]        # Entire row 1: 1 2 3
A[, 2]        # Entire column 2: 2 5
A[1:2, 2:3]   # Submatrix
```

---

## 2. Matrix Operations

### 2.1 Element-wise Operations

```r
A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), nrow = 2, byrow = TRUE)

# Element-wise (NOT matrix multiplication!)
A + B         # Addition
A - B         # Subtraction
A * B         # Element-wise multiplication
A / B         # Element-wise division
A^2           # Element-wise squaring

# Scalar operations
3 * A         # Scalar multiplication
A + 10        # Add scalar to each element
```

### 2.2 Matrix Multiplication

```r
# CRITICAL: Use %*% for matrix multiplication
A <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), nrow = 2, byrow = TRUE)

# Matrix multiplication
A %*% B
#      [,1] [,2]
# [1,]   19   22
# [2,]   43   50

# Verify: element [1,1] = 1*5 + 2*7 = 5 + 14 = 19

# Common error
A * B         # WRONG! This is element-wise
#      [,1] [,2]
# [1,]    5   12
# [2,]   21   32

# Non-commutativity
A %*% B
B %*% A       # Different result!
```

### 2.3 Transpose

```r
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = TRUE)
A
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

t(A)          # Transpose
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6

# Property: (AB)' = B'A'
B <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, byrow = TRUE)
all.equal(t(A %*% B), t(B) %*% t(A))  # TRUE
```

---

## 3. Determinants

### 3.1 Calculating Determinants

```r
# 2×2 determinant
A <- matrix(c(3, 2, 1, 4), nrow = 2, byrow = TRUE)
det(A)        # 3*4 - 2*1 = 10

# 3×3 determinant
B <- matrix(c(1, 2, 3, 7, 0, 8, 4, 5, 6), nrow = 3, byrow = TRUE)
det(B)        # 45

# Check for singularity
C <- matrix(c(6, 2, 3, 1), nrow = 2, byrow = TRUE)
det(C)        # 0 - singular matrix!
```

### 3.2 Determinant Check Function

```r
# Function to check if matrix is invertible
is_invertible <- function(A) {
  if (nrow(A) != ncol(A)) {
    return(FALSE)  # Must be square
  }
  return(abs(det(A)) > 1e-10)  # Non-zero determinant
}

A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
is_invertible(A)  # TRUE

B <- matrix(c(6, 2, 3, 1), nrow = 2, byrow = TRUE)
is_invertible(B)  # FALSE
```

---

## 4. Matrix Inverse

### 4.1 Finding Inverses

```r
A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)

# Using solve()
A_inv <- solve(A)
A_inv
#            [,1]       [,2]
# [1,]  0.7142857 -0.1428571
# [2,] -0.4285714  0.2857143

# Verify: A * A^(-1) = I
round(A %*% A_inv, 10)
#      [,1] [,2]
# [1,]    1    0
# [2,]    0    1

# Manual 2×2 formula
det_A <- det(A)  # 7
A_inv_manual <- (1/det_A) * matrix(c(5, -1, -3, 2), nrow = 2, byrow = TRUE)
```

### 4.2 Error Handling

```r
# Singular matrix - no inverse
B <- matrix(c(6, 2, 3, 1), nrow = 2, byrow = TRUE)

# This will error:
# solve(B)  # Error: system is exactly singular

# Safe inversion function
safe_inverse <- function(A) {
  if (abs(det(A)) < 1e-10) {
    warning("Matrix is singular or near-singular")
    return(NULL)
  }
  return(solve(A))
}

safe_inverse(B)  # Returns NULL with warning
```

---

## 5. Solving Linear Systems

### 5.1 Using solve()

```r
# System: 2x + y = 8
#         3x + 5y = 19

A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
b <- c(8, 19)

# Solve Ax = b
x <- solve(A, b)
x             # x = 3, y = 2

# Verify
A %*% x       # Should equal b
```

### 5.2 Cramer's Rule Implementation

```r
cramers_rule <- function(A, b) {
  det_A <- det(A)
  
  if (abs(det_A) < 1e-10) {
    stop("Matrix is singular - no unique solution")
  }
  
  n <- length(b)
  x <- numeric(n)
  
  for (i in 1:n) {
    A_i <- A
    A_i[, i] <- b        # Replace column i with b
    x[i] <- det(A_i) / det_A
  }
  
  return(x)
}

# Example
A <- matrix(c(2, 1, 3, 5), nrow = 2, byrow = TRUE)
b <- c(8, 19)
cramers_rule(A, b)   # 3, 2
```

### 5.3 Checking Solution Types

```r
check_system <- function(A, b) {
  det_A <- det(A)
  
  if (abs(det_A) > 1e-10) {
    solution <- solve(A, b)
    cat("Unique solution exists:\n")
    print(solution)
  } else {
    # Check if consistent (augmented matrix has same rank as A)
    augmented <- cbind(A, b)
    rank_A <- qr(A)$rank
    rank_aug <- qr(augmented)$rank
    
    if (rank_A == rank_aug) {
      cat("Infinitely many solutions (dependent equations)\n")
    } else {
      cat("No solution (inconsistent system)\n")
    }
  }
}

# Test with different systems
A1 <- matrix(c(5, 3, 4, 1), nrow = 2, byrow = TRUE)
b1 <- c(11, 6)
check_system(A1, b1)  # Unique solution

A2 <- matrix(c(2, 1, 4, 2), nrow = 2, byrow = TRUE)
b2 <- c(4, 8)
check_system(A2, b2)  # Infinite solutions

A3 <- matrix(c(2, 1, 4, 2), nrow = 2, byrow = TRUE)
b3 <- c(4, 10)
check_system(A3, b3)  # No solution
```

---

## 6. Economic Applications

### 6.1 Market Equilibrium System

```r
# Demand: Qd = 100 - 2P  →  Qd + 2P = 100
# Supply: Qs = -20 + 4P  →  Qs - 4P = -20
# At equilibrium: Qd = Qs = Q

solve_market_matrix <- function(demand_intercept, demand_slope,
                                 supply_intercept, supply_slope) {
  # System: Q + demand_slope*P = demand_intercept
  #         Q - supply_slope*P = supply_intercept
  
  A <- matrix(c(1, demand_slope, 
                1, -supply_slope), nrow = 2, byrow = TRUE)
  b <- c(demand_intercept, supply_intercept)
  
  det_A <- det(A)
  if (abs(det_A) < 1e-10) {
    return(list(error = "No unique equilibrium"))
  }
  
  eq <- solve(A, b)
  return(list(Q = eq[1], P = eq[2], determinant = det_A))
}

# Solve
result <- solve_market_matrix(100, 2, -20, 4)
cat("Equilibrium: Q* =", result$Q, ", P* =", result$P, "\n")
```

### 6.2 Two-Market System

```r
# Wheat: Qw_d = 80 - 3Pw + Pc, Qw_s = -10 + 2Pw
# Corn:  Qc_d = 100 + Pw - 4Pc, Qc_s = -20 + 3Pc

# Equilibrium conditions (Qd = Qs):
# Wheat: 80 - 3Pw + Pc = -10 + 2Pw  →  5Pw - Pc = 90
# Corn:  100 + Pw - 4Pc = -20 + 3Pc →  -Pw + 7Pc = 120

A <- matrix(c(5, -1, 
              -1, 7), nrow = 2, byrow = TRUE)
b <- c(90, 120)

prices <- solve(A, b)
Pw <- prices[1]
Pc <- prices[2]

cat("Wheat price:", round(Pw, 2), "\n")
cat("Corn price:", round(Pc, 2), "\n")

# Equilibrium quantities
Qw <- -10 + 2 * Pw
Qc <- -20 + 3 * Pc
cat("Wheat quantity:", round(Qw, 2), "\n")
cat("Corn quantity:", round(Qc, 2), "\n")
```

### 6.3 Leontief Input-Output Model

```r
# Technology matrix: A[i,j] = input from i per unit output of j
#                    Crops  Livestock
# Crops               0.2     0.4
# Livestock           0.1     0.2

leontief_model <- function(A, final_demand) {
  n <- nrow(A)
  I <- diag(n)
  
  # Leontief inverse
  L <- solve(I - A)
  
  # Total output
  x <- L %*% final_demand
  
  return(list(
    leontief_inverse = L,
    total_output = x,
    intermediate = A %*% x,
    final = final_demand
  ))
}

# Example
A <- matrix(c(0.2, 0.4, 
              0.1, 0.2), nrow = 2, byrow = TRUE)
d <- c(80, 60)  # Final demand

result <- leontief_model(A, d)
cat("Total output needed:\n")
cat("  Crops:", round(result$total_output[1], 1), "\n")
cat("  Livestock:", round(result$total_output[2], 1), "\n")
```

---

## 7. Eigenvalues (Preview for Optimization)

### 7.1 Computing Eigenvalues

```r
A <- matrix(c(2, 1, 1, 3), nrow = 2, byrow = TRUE)

eig <- eigen(A)
eig$values    # Eigenvalues: 3.618, 1.382
eig$vectors   # Eigenvectors

# Check definiteness
if (all(eig$values > 0)) {
  cat("Positive definite\n")
} else if (all(eig$values < 0)) {
  cat("Negative definite\n")
} else {
  cat("Indefinite\n")
}
```

### 7.2 Quadratic Form Analysis

```r
# Quadratic form: Q = 2x1² + 3x2² + 2x1x2
# Matrix form: Q = x'Ax

A <- matrix(c(2, 1, 
              1, 3), nrow = 2, byrow = TRUE)

# Compute for specific x
quadratic_form <- function(A, x) {
  return(as.numeric(t(x) %*% A %*% x))
}

x <- c(1, 2)
quadratic_form(A, x)  # 2(1)² + 3(2)² + 2(1)(2) = 2 + 12 + 4 = 18

# Check definiteness
eig_vals <- eigen(A)$values
cat("Eigenvalues:", eig_vals, "\n")
cat("Positive definite:", all(eig_vals > 0), "\n")
```

---

## 8. Quick Reference

| Task | R Code |
|------|--------|
| Create matrix | `matrix(data, nrow, ncol, byrow=TRUE)` |
| Identity matrix | `diag(n)` |
| Diagonal matrix | `diag(c(a, b, c))` |
| Dimensions | `dim(A)`, `nrow(A)`, `ncol(A)` |
| Transpose | `t(A)` |
| Matrix multiply | `A %*% B` |
| Determinant | `det(A)` |
| Inverse | `solve(A)` |
| Solve Ax = b | `solve(A, b)` |
| Eigenvalues | `eigen(A)$values` |
| Bind rows | `rbind(row1, row2)` |
| Bind columns | `cbind(col1, col2)` |

---

## Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| `non-conformable arguments` | Dimension mismatch | Check `dim()` of matrices |
| `system is exactly singular` | det = 0, no inverse | Check if system has solution |
| Wrong answer with `*` | Used element-wise instead of matrix mult | Use `%*%` |
| `subscript out of bounds` | Index too large | Check matrix dimensions |

---

*Week 2 Code Snippets — ECON4002*
