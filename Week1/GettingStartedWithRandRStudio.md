# Getting Started with R and RStudio

**Atakelty Hailu**
University of Western Australia

---

## 1. Introduction

This unit is taught with **R**, a software for statistical computing and graphics development. R includes a large number of methods for data manipulation, statistical computations, and statistical tests. Its capabilities can be extended by installing add-on packages. R is often described as a programming language and software environment for statistical computing and graphical visualization.

R has been around for about three decades and is well-documented. It is available for download from the **CRAN (Comprehensive R Archive Network)**. R is platform-independent, meaning R scripts work the same way on Windows, Unix/Linux, or Mac/iOS.

R can be used on its own, but it is more productive to use it with **RStudio**, an integrated development environment (IDE) that makes R easier to use for beginners and experts alike.

---

## 2. The RStudio IDE

When RStudio is launched, you get a graphical user interface (GUI) with four default panes:

1. **Source Pane**: Where R scripts are written and edited.
2. **Console/Terminal Pane**: Where you interact directly with R.
3. **Environment/History Pane**: Shows objects in the workspace and command history.
4. **Files/Plots/Packages/Help Pane**: Displays plots, files, packages, and help documentation.

---

### 2.1 Exploring RStudio

#### 2.1.1 Set a Working Directory

To avoid confusion, organize your files using a sensible directory structure. For example:

```
HOME_DIRECTORY/
├── SCIE4401/
│   ├── Week1/
│   │   └── Test.R
```

To set a working directory in RStudio, go to **Session > Set Working Directory**.

---

### 2.1.2 Testing the RStudio Environment

Run some basic R commands to get familiar with the environment:

```r
# What is 2 + 2?
2 + 2

# What is 2 times 3?
2 * 3

# Store the result of 2 times 3 in a variable
product <- 2 * 3
product

# What is the square of 9?
9^2

# Calculate the square root of 2
t1 <- sqrt(2)
t1

# What is the natural log of 10?
log(10)

# What is the log of 10 (base 10)?
log10(10)

# What is the value of the constant pi?
pi
```

---

## 3. R Basics

### 3.1 R Commands, Comments, and Methods

- **Comments**: Lines starting with `#` are ignored by R.
- **Methods/Functions**: Always use parentheses, e.g., `print()`, `log()`.
- **Ending Commands**: Use a semicolon (`;`) to separate multiple commands on a single line.

```r
# Example of a comment
X <- c(2, 3, 4, 5, 6, 7)  # Create a vector
print(X)  # Print the vector
```

---

### 3.2 Using a Working Directory

- **Get Working Directory**: `getwd()`
- **Set Working Directory**: `setwd("path/to/directory")`
- **List Files**: `list.files()`

---

### 3.3 Data Types and Structures

R supports the following data types:
- Numeric
- Integer
- Character
- Logical

#### Vectors

```r
# Create a numeric vector
vec1 <- c(2, 3, 4, 5)

# Create a sequence
vec2 <- 2:5

# Create a vector with repetition
vec3 <- rep(3, 5)
```

#### Data Frames

```r
# Create a data frame
X1 <- c(1, 2, 3, 4, 5, 6, 7)
X2 <- 15:21
X3 <- 66:72

X.data <- data.frame(X1 = X1, X2 = X2, X3 = X3)
head(X.data, n = 3)
```

---

### 3.4 Subsetting Data

```r
# Subset rows where X3 >= 70
X.data[X.data$X3 >= 70, ]

# Subset rows where X2 * X3 > 1200
subset(X.data, X.data$X2 * X.data$X3 > 1200)
```

---

### 3.5 Loading and Reading Data

```r
# Load built-in dataset
data(cars)
head(cars, n = 4)

# Read data from a CSV file
b <- read.csv("sBarley.csv")
str(b)
```

---

### 3.6 Plotting Data

```r
# Scatter plot
with(b, plot(GrainYield ~ TotalRainfall,
             pch = "+", col = "brown", cex = 0.7,
             main = "Rainfall and Grain Yield",
             ylab = "Grain Yield (kg/ha)",
             xlab = "Total Rainfall (mm)"))

# Box plot
with(b, boxplot(N, P,
                col = "gold",
                names = c("N", "P"),
                ylab = "Fertiliser Rate (kg/ha)",
                main = "N and P Application Rates"))
```

---

### 3.7 Using `apply()` and `tapply()`

```r
# Calculate mean by group
mean.hours.bygender <- tapply(hours.table[, "hours"],
                             INDEX = gender,
                             mean)
```

---

## 4. Learning About R Beyond the Lab Sessions

- **Online Tutorials**: [Kelly Black’s R Tutorial](http://www.cyclismo.org/tutorial/R/)
- **Books**: Applied Econometrics with R, Linear Models in R
- **Search Engines**: Rseek, Google
- **Videos**: YouTube tutorials on R and RStudio

---

## 5. Summary

This guide covered:
- R and RStudio software
- Working directories
- R commands, comments, and methods
- Data types, structures, and data frames
- Loading and reading data
- Subsetting data
- Plotting data
- Using `apply()` and `tapply()`

---

## 6. Appendix A: R & RStudio Windows

- **R Window**: Standalone R environment.
- **RStudio Window**: Integrated development environment for R.

---

You can download this Markdown file and use it as a reference guide for R and RStudio.
