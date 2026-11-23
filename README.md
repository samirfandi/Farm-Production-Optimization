# Farm Production Optimization 🌱

## Overview

This project focuses on optimizing agricultural production using **Mathematical Optimization** and **Linear Programming**.

The objective is to maximize the farmer's net profit by determining the optimal working hours allocated to each farmland plot, while respecting budget, labor, and production constraints.

## Optimization Model

The model considers:
- 12 farmland plots (A–L).
- 3 agricultural products: cereals, fruits, and vegetables.
- Hourly production yields and operating costs for each plot.

### Objective
Maximize net profit:

**Total Revenue − Operating Costs**

### Constraints
- Total operating budget: €850 maximum.
- Maximum 80 working hours per plot.
- Maximum 300 working hours overall.
- Production limits for each crop, per plot and globally.
- Non-negative working hours.
- Binary decision variables to identify exploited plots.

## Technologies

- **AMPL** – Mathematical optimization modeling.
- **Gurobi** – Optimization solver.
- **Mixed-Integer Linear Programming (MILP)** – Binary decision variables and optimization constraints.

## Project Structure

```text
FarmProductionOptimization/
├── caroline.mod
├── data.dat
├── README.md
└── results/
```

## Key Learning Outcomes

- Formulating real-world problems as mathematical optimization models.
- Implementing linear constraints using AMPL.
- Working with binary decision variables.
- Solving Mixed-Integer Linear Programming problems using Gurobi.
- Analyzing optimal resource allocation and profitability.

---

