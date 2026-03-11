# Week 1: R Code Snippets

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Overview

This document contains essential R code snippets for Week 1. Copy and modify these for your practice problems and assignments.

---

## 1. Basic Operations

### 1.1 Arithmetic

```r
# Basic arithmetic
2 + 3          # Addition: 5
10 - 4         # Subtraction: 6
5 * 6          # Multiplication: 30
20 / 4         # Division: 5
2^5            # Exponentiation: 32
17 %% 5        # Modulo (remainder): 2
17 %/% 5       # Integer division: 3

# Order of operations (PEMDAS)
3 + 5 * 2      # 13 (multiplication first)
(3 + 5) * 2    # 16 (parentheses first)
2^3 + 1        # 9 (exponent first)
```

### 1.2 Mathematical Functions

```r
# Square root and absolute value
sqrt(16)       # 4
sqrt(2)        # 1.414214
abs(-5)        # 5

# Exponential and logarithms
exp(1)         # e = 2.718282
exp(2)         # e² = 7.389056
log(10)        # Natural log: 2.302585
log10(100)     # Log base 10: 2
log(8, base=2) # Log base 2: 3

# Verify: log and exp are inverses
log(exp(5))    # 5
exp(log(5))    # 5

# Rounding
round(3.14159, 2)   # 3.14
floor(3.9)          # 3 (round down)
ceiling(3.1)        # 4 (round up)

# Constants
pi             # 3.141593
```

---

## 2. Variables and Assignment

### 2.1 Creating Variables

```r
# Assignment (use <- or =, but <- is conventional)
price <- 25
quantity <- 100
revenue <- price * quantity
revenue        # 2500

# Multiple assignments
a <- b <- c <- 0   # All equal to 0

# Viewing all variables
ls()           # List all objects in environment

# Removing variables
rm(a)          # Remove 'a'
rm(list = ls()) # Remove ALL variables (careful!)
```

### 2.2 Naming Conventions

```r
# Valid names
wheat_price <- 300      # snake_case (recommended)
wheatPrice <- 300       # camelCase
wheat.price <- 300      # dot notation (can confuse with S3)
Wheat_Price_2024 <- 300 # numbers OK (not at start)

# Invalid names
# 2024_price <- 300     # Cannot start with number
# wheat-price <- 300    # Hyphens not allowed
# wheat price <- 300    # Spaces not allowed
```

---

## 3. Vectors

### 3.1 Creating Vectors

```r
# Combine elements with c()
prices <- c(250, 275, 300, 280, 290)
crops <- c("wheat", "corn", "soybean")
is_cash_crop <- c(TRUE, TRUE, FALSE)

# Sequences
years <- 2020:2025                      # Integer sequence
by_two <- seq(0, 10, by = 2)            # 0, 2, 4, 6, 8, 10
five_points <- seq(0, 100, length.out = 5)  # 0, 25, 50, 75, 100

# Repetition
zeros <- rep(0, 5)                      # 0, 0, 0, 0, 0
ones_twos <- rep(c(1, 2), times = 3)    # 1, 2, 1, 2, 1, 2
each_three <- rep(c(1, 2), each = 3)    # 1, 1, 1, 2, 2, 2
```

### 3.2 Vector Operations

```r
# Element-wise operations
x <- c(1, 2, 3, 4, 5)
y <- c(10, 20, 30, 40, 50)

x + y          # 11, 22, 33, 44, 55
x * y          # 10, 40, 90, 160, 250
x / y          # 0.1, 0.1, 0.1, 0.1, 0.1
y^x            # 10, 400, 27000, 2560000, 312500000

# Scalar operations (recycling)
x * 2          # 2, 4, 6, 8, 10
x + 100        # 101, 102, 103, 104, 105

# Useful functions
length(x)      # Number of elements: 5
sum(x)         # Sum: 15
prod(x)        # Product: 120
mean(x)        # Average: 3
median(x)      # Median: 3
sd(x)          # Standard deviation: 1.581
var(x)         # Variance: 2.5
min(x)         # Minimum: 1
max(x)         # Maximum: 5
range(x)       # c(min, max): 1, 5

# Cumulative functions
cumsum(x)      # Running sum: 1, 3, 6, 10, 15
cumprod(x)     # Running product: 1, 2, 6, 24, 120
cummax(x)      # Running max: 1, 2, 3, 4, 5
```

### 3.3 Indexing and Subsetting

```r
prices <- c(250, 275, 300, 280, 290)

# Positive indexing (select elements)
prices[1]           # First element: 250
prices[3]           # Third element: 300
prices[c(1, 3, 5)]  # Elements 1, 3, 5
prices[2:4]         # Elements 2 through 4

# Negative indexing (exclude elements)
prices[-1]          # All except first
prices[-c(1, 5)]    # Exclude first and last

# Logical indexing
prices[prices > 280]                    # Elements > 280
prices[prices >= 270 & prices <= 290]   # Between 270 and 290
prices[prices < 260 | prices > 290]     # Less than 260 OR greater than 290

# Which indices satisfy condition?
which(prices > 280)                     # Returns: 3, 5
which.max(prices)                       # Index of maximum: 3
which.min(prices)                       # Index of minimum: 1

# Named vectors
yields <- c(wheat = 45, corn = 180, soy = 50)
yields["wheat"]     # Access by name: 45
yields[c("wheat", "soy")]  # Multiple by name
names(yields)       # Get all names
```

---

## 4. Functions

### 4.1 Built-in Functions

```r
# Getting help
?mean          # Help for mean function
help(sum)      # Same as ?sum
example(plot)  # Run examples

# Check object types
class(5)       # "numeric"
class("hello") # "character"
class(TRUE)    # "logical"
is.numeric(5)  # TRUE
is.character(5) # FALSE
```

### 4.2 Creating Your Own Functions

```r
# Basic function structure
function_name <- function(arg1, arg2, ...) {
  # Body of function
  result <- arg1 + arg2
  return(result)
}

# Example: Calculate revenue
calculate_revenue <- function(price, quantity) {
  revenue <- price * quantity
  return(revenue)
}

calculate_revenue(25, 100)  # 2500

# Function with default arguments
calculate_profit <- function(revenue, cost, tax_rate = 0.20) {
  gross <- revenue - cost
  net <- gross * (1 - tax_rate)
  return(net)
}

calculate_profit(1000, 600)              # Uses default tax: 320
calculate_profit(1000, 600, tax_rate = 0.15)  # Override: 340

# Function returning multiple values
market_stats <- function(prices) {
  stats <- list(
    mean = mean(prices),
    sd = sd(prices),
    min = min(prices),
    max = max(prices)
  )
  return(stats)
}

result <- market_stats(c(10, 20, 30, 40))
result$mean    # 25
result$sd      # 12.91
```

### 4.3 Anonymous Functions

```r
# Inline functions (useful with apply family)
sapply(1:5, function(x) x^2)   # 1, 4, 9, 16, 25

# In R 4.1+, can use \(x) shorthand
sapply(1:5, \(x) x^2)          # Same result
```

---

## 5. Economic Model: Supply and Demand

### 5.1 Define Market Functions

```r
# Demand: Qd = a - bP (linear, downward sloping)
demand <- function(P, a = 200, b = 4) {
  Qd <- a - b * P
  return(pmax(Qd, 0))  # Ensure non-negative
}

# Supply: Qs = c + dP (linear, upward sloping)
supply <- function(P, c = -20, d = 6) {
  Qs <- c + d * P
  return(pmax(Qs, 0))  # Ensure non-negative
}

# Test at P = 30
demand(30)     # 200 - 4*30 = 80
supply(30)     # -20 + 6*30 = 160
```

### 5.2 Find Equilibrium

```r
# Method 1: Analytical (for simple linear case)
# Qd = Qs: a - bP = c + dP
# P* = (a - c) / (b + d)
P_star_analytical <- (200 - (-20)) / (4 + 6)  # 22
Q_star_analytical <- demand(P_star_analytical) # 112

# Method 2: Numerical (works for any functional form)
excess_demand <- function(P) {
  demand(P) - supply(P)
}

# Find P where excess demand = 0
equilibrium <- uniroot(excess_demand, interval = c(0, 100))
P_star <- equilibrium$root
Q_star <- demand(P_star)

cat("Equilibrium: P* =", round(P_star, 2), ", Q* =", round(Q_star, 2))
```

### 5.3 Visualize the Market

```r
# Generate price sequence
P_range <- seq(0, 50, by = 0.5)

# Calculate quantities
Qd <- demand(P_range)
Qs <- supply(P_range)

# Create plot
plot(Qd, P_range, type = "l", col = "blue", lwd = 2,
     xlim = c(0, 250), ylim = c(0, 60),
     xlab = "Quantity", ylab = "Price",
     main = "Market for Agricultural Commodity")

lines(Qs, P_range, col = "red", lwd = 2)

# Mark equilibrium
points(Q_star, P_star, pch = 19, cex = 1.5, col = "black")

# Add reference lines
abline(h = P_star, lty = 2, col = "gray")
abline(v = Q_star, lty = 2, col = "gray")

# Add legend
legend("topright", 
       legend = c("Demand", "Supply", "Equilibrium"),
       col = c("blue", "red", "black"),
       lty = c(1, 1, NA), pch = c(NA, NA, 19), lwd = 2)

# Add grid
grid()
```

### 5.4 Calculate Elasticity

```r
# Point elasticity of demand: ε = (dQ/dP) × (P/Q)
# For linear demand Qd = a - bP, dQ/dP = -b

elasticity_demand <- function(P, a = 200, b = 4) {
  Qd <- a - b * P
  dQ_dP <- -b
  epsilon <- dQ_dP * (P / Qd)
  return(epsilon)
}

# Elasticity at equilibrium
epsilon_star <- elasticity_demand(P_star)
cat("Elasticity at equilibrium:", round(epsilon_star, 3))

# Interpretation
if (abs(epsilon_star) > 1) {
  cat("\nDemand is ELASTIC: %ΔQ > %ΔP")
} else if (abs(epsilon_star) < 1) {
  cat("\nDemand is INELASTIC: %ΔQ < %ΔP")
} else {
  cat("\nDemand is UNIT ELASTIC: %ΔQ = %ΔP")
}
```

### 5.5 Policy Analysis: Tax

```r
# Original equilibrium
P_original <- P_star
Q_original <- Q_star

# Impose $5 tax on suppliers
tax <- 5

# New supply: suppliers receive (P - tax), so supply based on net price
supply_with_tax <- function(P, c = -20, d = 6, t = 5) {
  Qs <- c + d * (P - t)
  return(pmax(Qs, 0))
}

# Find new equilibrium
excess_demand_tax <- function(P) {
  demand(P) - supply_with_tax(P, t = tax)
}

eq_tax <- uniroot(excess_demand_tax, c(0, 100))
P_consumer <- eq_tax$root
Q_new <- demand(P_consumer)
P_producer <- P_consumer - tax

# Results
cat("=== Tax Analysis ===\n")
cat("Tax amount: $", tax, "\n")
cat("Original: P =", round(P_original, 2), ", Q =", round(Q_original, 2), "\n")
cat("After tax: P_consumer =", round(P_consumer, 2), 
    ", P_producer =", round(P_producer, 2), 
    ", Q =", round(Q_new, 2), "\n")

# Tax burden
consumer_burden <- P_consumer - P_original
producer_burden <- P_original - P_producer
cat("\nConsumer bears: $", round(consumer_burden, 2), 
    " (", round(100 * consumer_burden / tax, 1), "%)\n")
cat("Producer bears: $", round(producer_burden, 2),
    " (", round(100 * producer_burden / tax, 1), "%)\n")

# Deadweight loss
DWL <- 0.5 * tax * (Q_original - Q_new)
cat("\nDeadweight loss: $", round(DWL, 2))
```

---

## 6. Data Frames (Preview)

```r
# Create a data frame
farm_data <- data.frame(
  crop = c("wheat", "corn", "soybean", "barley"),
  yield = c(45, 180, 50, 60),
  price = c(7.50, 4.50, 13.00, 5.50),
  acres = c(500, 300, 200, 100)
)

# View data
farm_data              # Print all
head(farm_data, 2)     # First 2 rows
str(farm_data)         # Structure

# Access columns
farm_data$yield        # By name
farm_data[, "yield"]   # Same result
farm_data[, 2]         # By position

# Add calculated column
farm_data$revenue <- farm_data$yield * farm_data$price * farm_data$acres

# Filter rows
farm_data[farm_data$yield > 50, ]    # Yields above 50
subset(farm_data, revenue > 100000)  # Revenue above 100k
```

---

## 7. Saving and Loading

```r
# Save plot to file
png("market_equilibrium.png", width = 800, height = 600)
# ... plotting code ...
dev.off()

# Save R objects
save(P_star, Q_star, file = "equilibrium.RData")

# Load R objects
load("equilibrium.RData")

# Save script output
sink("output.txt")
# ... code that produces output ...
sink()  # Turn off
```

---

## Quick Reference Card

| Task | Code |
|------|------|
| Create vector | `x <- c(1, 2, 3)` |
| Sequence | `1:10` or `seq(0, 1, by=0.1)` |
| Repeat | `rep(0, 5)` |
| Length | `length(x)` |
| Sum | `sum(x)` |
| Mean | `mean(x)` |
| Standard dev | `sd(x)` |
| Select element | `x[1]` or `x["name"]` |
| Logical subset | `x[x > 0]` |
| Create function | `f <- function(x) { x^2 }` |
| Find root | `uniroot(f, c(a, b))` |
| Basic plot | `plot(x, y)` |
| Add line | `lines(x, y)` |
| Add point | `points(x, y)` |

---

*Week 1 Code Snippets — ECON4002*
