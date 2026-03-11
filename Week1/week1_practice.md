# Week 1: Practice Problems

**ECON4002: Core Concepts in Agricultural and Resource Economics**

---

## Instructions

Complete all problems. Show your work for analytical questions and include R code for computational questions. You may use the AI tutor for guidance, but ensure you understand the solutions.

---

## Part A: Conceptual Questions

### Problem 1: Economic Modeling

a) Explain why economists use mathematical models rather than purely verbal analysis. Give two specific advantages.

b) What is the difference between an *exogenous* variable and an *endogenous* variable in an economic model? Provide an example of each in a supply-demand model.

c) Consider the statement: "A good economic model should include every real-world detail." Do you agree or disagree? Explain.

---

### Problem 2: Course Connections

For each of the following real-world scenarios, identify which topic area from this course would be most relevant. Choose from: Consumer Theory, Producer Theory, Market Equilibrium, Trade Policy, Uncertainty, or Linear Programming.

a) A farmer deciding how much fertilizer to apply to maximize profit

b) The government evaluating the welfare effects of removing wheat import tariffs

c) A household choosing between organic and conventional vegetables given their budget

d) An agricultural cooperative deciding how to allocate limited water across different crops

e) A grain trader considering whether to hedge against price risk using futures contracts

---

## Part B: R Fundamentals

### Problem 3: Basic Operations

Without using R first, predict the output of each expression. Then verify in R.

```r
# a) 
3 + 5 * 2

# b)
(3 + 5) * 2

# c)
17 %% 5

# d)
log(exp(3))

# e)
sqrt(64) / 2^2
```

---

### Problem 4: Vectors

a) Create a vector called `yields` containing the following wheat yields (bushels/acre): 45, 52, 48, 55, 50, 47, 53

b) Calculate the mean, standard deviation, minimum, and maximum of `yields`

c) How many observations are above the mean? (Use logical indexing)

d) Create a new vector `high_yields` containing only yields above 50 bushels/acre

e) If the price of wheat is $6.50 per bushel, create a vector `revenues` showing revenue per acre for each observation

---

### Problem 5: Functions

a) Write a function called `fahrenheit_to_celsius` that converts temperature from Fahrenheit to Celsius using the formula: $C = \frac{5}{9}(F - 32)$

b) Test your function with F = 32, 68, and 100

c) Write a function called `profit` that takes `revenue` and `cost` as arguments and returns profit. Include a default argument `tax_rate = 0.25` that reduces profit by that percentage.

d) Use your profit function to calculate after-tax profit when revenue = $50,000, cost = $30,000, and tax rate = 20%

---

## Part C: Economic Applications

### Problem 6: Supply and Demand

The market for soybeans can be described by:
- Demand: $Q_d = 500 - 10P$
- Supply: $Q_s = -100 + 20P$

where $Q$ is in millions of bushels and $P$ is in dollars per bushel.

a) **Analytically**: Solve for the equilibrium price $P^*$ and quantity $Q^*$

b) **In R**: Create functions for demand and supply, then find equilibrium numerically using `uniroot()`

c) **In R**: Create a plot showing both curves with the equilibrium point marked

d) Calculate the price elasticity of demand at equilibrium using the formula:
$$\varepsilon_d = \frac{dQ_d}{dP} \cdot \frac{P}{Q_d}$$

e) Is demand elastic or inelastic at equilibrium? What does this imply for soybean producers considering a price increase?

---

### Problem 7: Policy Analysis

Continuing with the soybean market from Problem 6:

a) Suppose the government imposes a price floor of $25 per bushel. What quantity will be demanded? What quantity will be supplied? Is there a surplus or shortage, and of how much?

b) Now suppose instead of a price floor, the government imposes a $3 per bushel tax on producers. 
   - Write a new supply function incorporating the tax
   - Find the new equilibrium price and quantity
   - Calculate how the tax burden is shared between consumers and producers
   - Compute the deadweight loss (you may approximate graphically)

---

### Problem 8: Multiple Markets

A farmer produces two crops. The profit from each depends on price:
- Wheat profit: $\pi_W = 50P_W - 200$
- Corn profit: $\pi_C = 30P_C - 100$

where prices are in $/bushel.

a) Write R functions for each profit equation

b) If $P_W = 8$ and $P_C = 6$, which crop is more profitable?

c) At what wheat price would the farmer be indifferent between the two crops (assuming $P_C = 6$)?

d) Create a plot showing both profit functions for prices ranging from $0 to $15. Mark the indifference point.

---

## Part D: Challenge Problems

### Problem 9: Data Analysis Preview

The following R code loads a built-in dataset about car stopping distances:

```r
data(cars)
head(cars)
```

a) How many observations are in the dataset?

b) What are the variable names?

c) Create a scatter plot of stopping distance (`dist`) versus speed (`speed`)

d) Does there appear to be a relationship? Describe it in words.

e) Calculate the correlation coefficient using `cor()`

---

### Problem 10: Simulation

A simple crop yield model assumes yield depends on rainfall:
$$Y = 30 + 0.5R - 0.002R^2$$

where $Y$ is yield (bushels/acre) and $R$ is rainfall (mm).

a) Write this as an R function

b) What rainfall level maximizes yield? (Hint: Take derivative, set to zero)

c) Create a plot of yield versus rainfall for $R \in [0, 200]$

d) Generate 50 random rainfall values from a uniform distribution between 50 and 150 mm using `runif(50, 50, 150)`. Calculate yields for each.

e) What is the average yield across your 50 simulations?

---

## Submission Guidelines

- Submit as a PDF containing both analytical work and R code/output
- For R questions, include both your code AND the output
- Comment your code to explain what each section does
- Due: Before Week 2 class

---

## Self-Assessment Checklist

Before submitting, ensure you can:

- [ ] Explain why we use mathematical models in economics
- [ ] Create and manipulate vectors in R
- [ ] Write and use custom functions
- [ ] Build a simple supply-demand model
- [ ] Find equilibrium analytically and numerically
- [ ] Create basic plots in R
- [ ] Calculate elasticity and interpret it
- [ ] Analyze simple policy interventions
