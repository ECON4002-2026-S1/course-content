# Week 1: Foundations — Economics & R Setup

## ECON4002: Core Concepts in Agricultural and Resource Economics
**University of Western Australia**

---

## Learning Objectives

By the end of this week, you will be able to:

1. **Explain** the role of formal mathematical analysis in agricultural and resource economics
2. **Identify** the key topics and methods covered in this unit
3. **Set up** R and RStudio for economic analysis
4. **Execute** basic R commands for arithmetic, variables, and functions
5. **Construct** simple supply and demand models in R
6. **Visualize** market relationships using R's plotting capabilities

---

## 1. Introduction to Agricultural and Resource Economics

### 1.1 What is Agricultural and Resource Economics?

Agricultural and Resource Economics applies economic theory and quantitative methods to understand:

- **Agricultural production decisions**: How farmers choose what to grow, how much input to use, and when to sell
- **Resource allocation**: How scarce resources (water, land, labor) are distributed across competing uses
- **Market dynamics**: How prices form, how supply responds to demand, and how markets clear
- **Policy evaluation**: How government interventions (subsidies, taxes, trade policies) affect welfare

### 1.2 Why Formal Economic Analysis?

We use mathematical models because they provide:

| Benefit | Description |
|---------|-------------|
| **Precision** | Mathematical statements are unambiguous |
| **Explicit assumptions** | We know exactly what we're assuming |
| **Logical consistency** | Mathematics prevents contradictions |
| **Generalization** | Results extend beyond specific examples |
| **Quantification** | We can measure effects, not just describe them |
| **Computational implementation** | Models can be simulated and estimated |

> **Key Insight**: An economic model is a *simplified analytical framework* representing economic reality. It abstracts from unimportant details to focus on essential relationships.

### 1.3 The Master Narrative of This Course

This course follows a logical progression:

```
Mathematical Tools → Microeconomic Agents → Market Interactions → Policy Analysis → Real-World Complexity
     (Wk 1-4)            (Wk 5-8)              (Wk 9-10)           (Wk 10)           (Wk 11-12)
```

**You are building toward becoming an Agricultural & Resource Economist** who can:
1. Formalize real-world problems mathematically
2. Derive optimal solutions analytically
3. Implement computational analysis in R
4. Interpret results for policy and business decisions

---

## 2. Course Overview: Topics and Methods

### 2.1 Topics Covered

#### Consumer/Demand Analysis (Weeks 5-6)
- Utility maximization subject to budget constraints
- Marshallian (ordinary) and Hicksian (compensated) demand
- Indirect utility and expenditure functions
- Consumer welfare measures (CV, EV)

**Agricultural Application**: Food demand analysis, dietary choice modeling, welfare effects of food price changes

#### Producer/Supply Analysis (Weeks 7-8)
- Production functions and technology
- Cost minimization and profit maximization
- Input demands and output supply
- Economies of scale and scope

**Agricultural Application**: Farm production decisions, input use optimization, technology adoption

#### Market Analysis (Week 9)
- Market equilibrium determination
- Consumer and producer surplus
- Tax incidence and deadweight loss
- Market efficiency

**Agricultural Application**: Commodity market analysis, agricultural policy evaluation

#### International Trade (Week 10)
- Comparative advantage
- Excess demand and supply
- Trade policy (tariffs, quotas, subsidies)
- Welfare effects of trade

**Agricultural Application**: Agricultural trade policy, export subsidies, import restrictions

#### Decision Under Uncertainty (Week 11)
- Expected utility theory
- Risk aversion measures
- Certainty equivalents and risk premiums
- Insurance markets

**Agricultural Application**: Crop insurance, weather risk, price risk management

#### Linear Programming (Week 12)
- LP formulation and graphical solution
- Duality and shadow prices
- Sensitivity analysis

**Agricultural Application**: Farm planning, feed mixing, resource allocation

### 2.2 Mathematical Methods

| Method | Application | Week |
|--------|-------------|------|
| Linear algebra | Systems of equations, input-output | 2 |
| Calculus | Marginal analysis, elasticity | 3 |
| Unconstrained optimization | Profit maximization | 4 |
| Constrained optimization | Utility/cost optimization | 4-6 |
| Comparative statics | Policy analysis | 5-10 |
| Expected utility | Risk analysis | 11 |
| Linear programming | Resource allocation | 12 |

---

## 3. Assessment Structure

| Component | Weight | Description |
|-----------|--------|-------------|
| Assignment 1 | 15% | Mathematical methods (Due Week 4) |
| Assignment 2 | 20% | Consumer and producer theory (Due Week 8) |
| Assignment 3 | 20% | Markets, trade, uncertainty (Due Week 11) |
| Participation | 10% | Homework, quizzes, engagement |
| Final Test | 35% | Comprehensive (Week 13) |

**Key Point**: Assignments require both analytical derivations AND R implementation.

---

## 4. Getting Started with R and RStudio

### 4.1 Why R?

R is the language of choice for agricultural economists because:

- **Free and open-source**: No licensing costs
- **Powerful statistical capabilities**: From basic stats to advanced econometrics
- **Excellent graphics**: Publication-quality figures
- **Reproducibility**: Scripts document your analysis
- **Community**: Thousands of packages for specialized tasks
- **Industry standard**: Used by USDA, FAO, agricultural consulting firms

### 4.2 Installing R and RStudio

#### Step 1: Install R
1. Go to [CRAN](https://cran.r-project.org/)
2. Select your operating system (Windows, Mac, Linux)
3. Download and install the latest version

#### Step 2: Install RStudio
1. Go to [Posit](https://posit.co/download/rstudio-desktop/)
2. Download RStudio Desktop (free version)
3. Install and launch

### 4.3 The RStudio Interface

When you open RStudio, you see four panes:

```
┌─────────────────────────────┬─────────────────────────────┐
│                             │                             │
│    SOURCE PANE              │    ENVIRONMENT PANE         │
│    (Write scripts here)     │    (See your variables)     │
│                             │                             │
├─────────────────────────────┼─────────────────────────────┤
│                             │                             │
│    CONSOLE PANE             │    FILES/PLOTS/HELP PANE    │
│    (Run commands here)      │    (View outputs)           │
│                             │                             │
└─────────────────────────────┴─────────────────────────────┘
```

### 4.4 Setting Up Your Workspace

Create a organized directory structure:

```
Documents/
└── ECON4002/
    ├── Week01/
    │   └── week1_practice.R
    ├── Week02/
    ├── ...
    ├── Assignments/
    └── Data/
```

In R, set your working directory:
```r
# Check current working directory
getwd()

# Set working directory (adjust path for your system)
setwd("~/Documents/ECON4002/Week01")

# List files in current directory
list.files()
```

---

## 5. R Fundamentals

### 5.1 R as a Calculator

```r
# Basic arithmetic
2 + 2        # Addition: 4
10 - 3       # Subtraction: 7
4 * 5        # Multiplication: 20
20 / 4       # Division: 5
2^3          # Exponentiation: 8
17 %% 5      # Modulo (remainder): 2
17 %/% 5     # Integer division: 3

# Mathematical functions
sqrt(16)     # Square root: 4
abs(-5)      # Absolute value: 5
exp(1)       # Exponential (e^1): 2.718...
log(10)      # Natural logarithm: 2.303...
log10(100)   # Base-10 logarithm: 2
log(8, base=2)  # Base-2 logarithm: 3

# Constants
pi           # 3.141593
exp(1)       # Euler's number e: 2.718...
```

### 5.2 Variables and Assignment

```r
# Assignment (use <- or =)
price <- 25
quantity <- 100
revenue <- price * quantity
revenue  # 2500

# Variable names
# - Can contain letters, numbers, dots, underscores
# - Must start with a letter or dot
# - Case-sensitive (Price ≠ price)

wheat_price <- 300    # Good
corn.yield <- 150     # Good (but dots can confuse)
2ndCrop <- "barley"   # ERROR: starts with number
```

### 5.3 Data Types

```r
# Numeric (default for numbers)
price <- 25.50
class(price)  # "numeric"

# Integer (add L suffix)
count <- 10L
class(count)  # "integer"

# Character (strings)
crop <- "wheat"
class(crop)  # "character"

# Logical (TRUE/FALSE)
is_profitable <- TRUE
class(is_profitable)  # "logical"

# Check types
is.numeric(price)     # TRUE
is.character(crop)    # TRUE
```

### 5.4 Vectors

Vectors are the fundamental data structure in R:

```r
# Create vectors with c() (combine)
prices <- c(250, 275, 300, 280, 290)
crops <- c("wheat", "corn", "soybean", "barley")
profitable <- c(TRUE, TRUE, FALSE, TRUE)

# Sequences
years <- 2020:2025                    # 2020, 2021, 2022, 2023, 2024, 2025
months <- seq(1, 12, by=1)            # 1 to 12, step 1
grid <- seq(0, 100, length.out=11)    # 11 evenly spaced points from 0 to 100

# Repetition
zeros <- rep(0, 5)                    # 0, 0, 0, 0, 0
pattern <- rep(c(1, 2), times=3)      # 1, 2, 1, 2, 1, 2

# Vector operations (element-wise)
quantities <- c(100, 150, 80, 120)
prices <- c(5, 4, 6, 3)
revenues <- quantities * prices       # 500, 600, 480, 360

# Vector functions
sum(revenues)      # Total: 1940
mean(revenues)     # Average: 485
length(revenues)   # Count: 4
min(revenues)      # Minimum: 360
max(revenues)      # Maximum: 600
```

### 5.5 Indexing and Subsetting

```r
# Access elements by position (1-indexed!)
prices <- c(250, 275, 300, 280, 290)
prices[1]          # First element: 250
prices[3]          # Third element: 300
prices[c(1, 3, 5)] # Elements 1, 3, 5: 250, 300, 290
prices[2:4]        # Elements 2 through 4: 275, 300, 280

# Negative indexing (exclude elements)
prices[-1]         # All except first: 275, 300, 280, 290
prices[-c(1, 5)]   # Exclude first and last: 275, 300, 280

# Logical indexing
prices[prices > 280]  # Elements > 280: 300, 290
prices[prices >= 275 & prices <= 290]  # Between 275 and 290

# Named vectors
yields <- c(wheat=45, corn=180, soy=50)
yields["wheat"]    # Access by name: 45
```

### 5.6 Functions

```r
# Built-in functions
mean(c(10, 20, 30))  # 20
sd(c(10, 20, 30))    # Standard deviation

# Creating your own functions
calculate_revenue <- function(price, quantity) {
  revenue <- price * quantity
  return(revenue)
}

calculate_revenue(25, 100)  # 2500

# Functions with default arguments
profit <- function(revenue, cost, tax_rate = 0.20) {
  net <- (revenue - cost) * (1 - tax_rate)
  return(net)
}

profit(1000, 600)              # Uses default tax_rate: 320
profit(1000, 600, tax_rate=0.15)  # Override default: 340
```

---

## 6. Your First Economic Model in R

### 6.1 Supply and Demand

Let's build a simple market model:

**Demand**: $Q_d = 200 - 4P$  
**Supply**: $Q_s = -20 + 6P$

```r
# Define demand and supply as functions
demand <- function(P) {
  Qd <- 200 - 4 * P
  return(pmax(Qd, 0))  # Ensure non-negative
}

supply <- function(P) {
  Qs <- -20 + 6 * P
  return(pmax(Qs, 0))  # Ensure non-negative
}

# Test the functions
demand(30)   # At P=30: Qd = 200 - 120 = 80
supply(30)   # At P=30: Qs = -20 + 180 = 160
```

### 6.2 Finding Equilibrium

At equilibrium: $Q_d = Q_s$

$$200 - 4P = -20 + 6P$$
$$220 = 10P$$
$$P^* = 22$$

```r
# Analytical solution
P_star <- 220 / 10
Q_star <- demand(P_star)
cat("Equilibrium: P* =", P_star, ", Q* =", Q_star, "\n")

# Numerical solution (useful for complex models)
excess_demand <- function(P) {
  demand(P) - supply(P)
}

P_equilibrium <- uniroot(excess_demand, interval = c(0, 100))$root
cat("Numerical solution: P* =", round(P_equilibrium, 2), "\n")
```

### 6.3 Visualizing the Market

```r
# Create price sequence
P_range <- seq(0, 50, by = 1)

# Calculate quantities
Qd <- demand(P_range)
Qs <- supply(P_range)

# Plot
plot(Qd, P_range, type = "l", col = "blue", lwd = 2,
     xlim = c(0, 200), ylim = c(0, 50),
     xlab = "Quantity", ylab = "Price",
     main = "Supply and Demand for Wheat")
lines(Qs, P_range, col = "red", lwd = 2)

# Add equilibrium point
points(Q_star, P_star, pch = 19, cex = 1.5, col = "black")
text(Q_star + 10, P_star, paste0("(", Q_star, ", ", P_star, ")"), pos = 4)

# Add legend
legend("topright", legend = c("Demand", "Supply", "Equilibrium"),
       col = c("blue", "red", "black"), lty = c(1, 1, NA), 
       pch = c(NA, NA, 19), lwd = 2)

# Add grid
grid()
```

### 6.4 Policy Analysis: A Tax

Suppose the government imposes a $6 tax per unit on suppliers:

```r
# New supply with tax
supply_tax <- function(P) {
  # Suppliers receive P - 6, so supply based on net price
  Qs <- -20 + 6 * (P - 6)
  return(pmax(Qs, 0))
}

# Alternatively, shift supply up by tax amount
supply_tax_alt <- function(P) {
  Qs <- -20 + 6 * P - 36  # = -56 + 6P
  return(pmax(Qs, 0))
}

# Find new equilibrium
excess_demand_tax <- function(P) demand(P) - supply_tax(P)
P_new <- uniroot(excess_demand_tax, c(0, 100))$root
Q_new <- demand(P_new)

cat("New equilibrium: P_consumer =", round(P_new, 2), 
    ", Q =", round(Q_new, 2), "\n")
cat("Price to producer =", round(P_new - 6, 2), "\n")
```

---

## 7. Summary

This week you learned:

1. **Course vision**: Becoming an Agricultural & Resource Economist through mathematical formalism and computational implementation

2. **Course structure**: Math tools → Agent optimization → Market analysis → Policy evaluation

3. **R basics**: 
   - Data types (numeric, character, logical)
   - Vectors and operations
   - Functions (built-in and custom)
   - Basic plotting

4. **First economic model**: Supply and demand with equilibrium, visualization, and policy analysis

---

## 8. Preparation for Next Week

**Week 2: Linear Algebra**

Before class:
1. Read Chiang & Wainwright, Chapters 4-5 (Matrices)
2. Complete Practice Problems for Week 1
3. Install any R packages that failed to load

Key concepts to preview:
- Matrix operations (addition, multiplication, inversion)
- Determinants and singularity
- Solving systems of linear equations
- Economic applications (input-output, market systems)

---

## References

- Chiang, A.C. & Wainwright, K. (2005). *Fundamental Methods of Mathematical Economics*, 4th ed. McGraw-Hill.
- Wickham, H. & Grolemund, G. (2023). *R for Data Science*, 2nd ed. O'Reilly. [Online: r4ds.hadley.nz]
- Perloff, J.M. (2018). *Microeconomics*. Pearson.
