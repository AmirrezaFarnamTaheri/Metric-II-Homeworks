# Econometrics II (Graduate Applied Microeconometrics)

[![R](https://img.shields.io/badge/Language-R%204.x-blue.svg)](https://www.r-project.org/)
[![R Markdown](https://img.shields.io/badge/Reports-R%20Markdown-success.svg)](https://rmarkdown.rstudio.com/)
[![Course Score](https://img.shields.io/badge/Graduate%20Score-19.0%20%2F%2020.0-emerald.svg)](https://amirrezafarnamtaheri.github.io/portfolio/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Comprehensive graduate coursework, empirical problem sets, econometric modeling scripts, and reproducible R Markdown reports for **Econometrics II (Applied Econometrics / Microeconometrics)** at the **Tehran Institute for Advanced Studies (TeIAS)**, Department of Economics and Finance.

Supervised graduate curriculum focusing on modern identification strategies, causal inference, discrete choice modeling, panel data methods, Generalized Method of Moments (GMM), Difference-in-Differences (DiD), Synthetic Control, and Regression Discontinuity Designs (RDD).

---

## Repository Overview

Each homework directory is self-contained with annotated R Markdown sources (`.Rmd`), compiled HTML dynamic reports (`.html`), econometric datasets (`.dta`, `.csv`, `.RDS`), and custom analytical tooling.

```text
Metric-II-Homeworks/
├── HW1/       # Survey microdata ingestion, database connections (RODBC), and tidy workflows
├── HW2/       # Count data econometrics (Poisson, NegBin, GMM) & health economics (MEPS)
├── HW3/       # Binary & multinomial discrete choice models (Logit, Probit, MNL, Odds Ratios)
├── HW4/       # Instrumental variables (2SLS), endogeneity diagnostics, and causal DAGs (dagitty)
├── HW5/       # Panel data analysis: Union wage premium, Fixed Effects vs. Random Effects, Hausman test
├── HW6/       # Generalized Method of Moments (GMM) & dynamic panel estimation (Arellano-Bond)
├── HW7/       # Difference-in-Differences (DiD), parallel trends verification, and event study dynamics
├── HW8/       # Synthetic Control Method (Cigar.dta) & Iranian HEIS survey microdata policy evaluation
├── HW9/       # Regression Discontinuity Design (Sharp/Fuzzy RDD) & Propensity Score Matching (PSM)
└── README.md
```

---

## Detailed Curriculum & Problem Sets

### [HW1: Survey Microdata Ingestion & Data Wrangling](HW1/)
- **Core Topics:** Relational survey database architectures, SQL querying via `RODBC`, data transformation in `tidyverse`.
- **Methodology:** Ingesting and tidying raw household expenditure surveys, longitudinal record matching, handling missing values, and reproducible pipeline orchestration.
- **Tools & Libraries:** `tidyverse`, `RODBC`, `lemon`, `knitr`.

### [HW2: Count Data Models & Health Econometrics](HW2/)
- **Core Topics:** Non-negative integer modeling of healthcare utilization using the Medical Expenditure Panel Survey (`mepsdocvis.dta`).
- **Methodology:** 
  - Poisson regression model and overdispersion testing ($Var[y|x] > E[y|x]$).
  - Negative Binomial models (NegBin I and NegBin II with quadratic variance).
  - Generalized Method of Moments (GMM) formulation with empirical moment conditions.
  - Average Marginal Effects (AME) and Marginal Effects at the Mean (MEM) computation.
- **Tools & Libraries:** `MASS`, `gmm`, `margins`, `broom`, `haven`.

### [HW3: Discrete Choice & Maximum Likelihood Estimation](HW3/)
- **Core Topics:** Microeconometric modeling of qualitative and discrete decision-making.
- **Methodology:**
  - Binary choice: Probit, Logit, and Linear Probability Model (LPM) comparison and boundary constraint analysis.
  - Maximum Likelihood Estimation (MLE), score equations, and Hessian information matrix inversion.
  - Odds ratio interpretations, predicted probabilities, and goodness-of-fit statistics (McFadden Pseudo-$R^2$).
  - Multinomial Logit (MNL) and Independence of Irrelevant Alternatives (IIA) specification tests.
- **Tools & Libraries:** `glm2`, `margins`, `stargazer`, `RODBC`, `reshape2`.

### [HW4: Endogeneity, Instrumental Variables & Causal DAGs](HW4/)
- **Core Topics:** Causal identification under unobserved confounding and endogenous treatment assignment (`Surgery.dta`).
- **Methodology:**
  - Directed Acyclic Graphs (DAGs) formalization using `dagitty` to isolate back-door paths and identify minimal conditioning sets.
  - Two-Stage Least Squares (2SLS) estimation and Instrumental Variables (IV).
  - Weak instrument diagnostics (first-stage effective $F$-statistic vs. Stock-Yogo critical values).
  - Overidentifying restrictions testing via the Sargan-Hansen $J$-statistic.
- **Tools & Libraries:** `AER`, `dagitty`, `haven`, `broom`, `zoo`.

### [HW5: Panel Data Econometrics — Impact of Union Membership on Wages](HW5/)
- **Core Topics:** Longitudinal microdata analysis of worker wage determination and union wage premiums.
- **Methodology:**
  - Pooled Ordinary Least Squares (POLS) with cluster-robust standard errors.
  - Fixed Effects (Within / LSDV) estimator controlling for time-invariant unobserved worker ability $\alpha_i$.
  - Random Effects (GLS / FGLS) estimator under quasi-demeaned transformations.
  - First-Difference (FD) estimator and efficiency comparisons under serial correlation.
  - Hausman specification test for orthogonality between unobserved individual effects and regressors.
- **Tools & Libraries:** `plm`, `lmtest`, `sandwich`, `stargazer`, `knitr`.

### [HW6: Generalized Method of Moments & Dynamic Panels](HW6/)
- **Core Topics:** Asymptotic theory of GMM estimation, optimal weighting matrices, and dynamic panel regressions.
- **Methodology:**
  - Sample moment conditions, two-step feasible efficient GMM, and Hansen $J$-test for overidentifying restrictions.
  - Endogenous lagged dependent variables ($y_{i,t-1}$) and Nickell bias ($O(1/T)$) in standard Fixed Effects.
  - Difference GMM (Arellano-Bond) utilizing lagged levels as instruments for first-differenced equations.
  - Arellano-Bond autocorrelation tests: $AR(1)$ and $AR(2)$ in first-differenced residuals.
- **Tools & Libraries:** `gmm`, `plm`, `ggplot2`, `stargazer`.

### [HW7: Difference-in-Differences (DiD) & Event Studies](HW7/)
- **Core Topics:** Quasi-experimental program evaluation and causal policy impact analysis.
- **Methodology:**
  - Classical $2 \times 2$ Difference-in-Differences and Generalized Two-Way Fixed Effects (TWFE) regressions.
  - Event-study dynamic specifications: Estimating lead and lag coefficients ($\beta_k$) to test the **Parallel Trends Assumption**.
  - Placebo policy date and fake treatment group sensitivity checks.
  - Cluster-robust inference at the policy-assignment level to address Moulton-type clustering.
- **Tools & Libraries:** `fixest`, `broom`, `ggplot2`, `stargazer`.

### [HW8: Synthetic Control Method & HEIS Microdata Analysis](HW8/)
- **Core Topics:** Comparative case studies with single-treated units and multi-year household welfare analysis.
- **Methodology:**
  - Synthetic Control Method (SCM) analyzing tobacco control policies and cigarette taxation (`Cigar.dta`).
  - Constrained optimization to construct convex combinations of donor pool control units minimizing pre-treatment root mean squared prediction error (RMSPE).
  - Placebo-in-space and placebo-in-time inference ratios (post-RMSPE / pre-RMSPE).
  - Iranian Household Expenditure and Income Survey (HEIS 1397–1398) empirical welfare analysis.
  - Modular analytical helper package (`Farnam` package in R) providing automated diagnostic plotting and publication-grade summary tables.
- **Tools & Libraries:** `Synth`, `ggplot2`, `haven`, `Farnam` (internal course helper package).

### [HW9: Regression Discontinuity Design & Propensity Score Matching](HW9/)
- **Core Topics:** Local randomized experiments at cutoff thresholds and selection-on-observables matching.
- **Methodology:**
  - Sharp Regression Discontinuity Design (RDD): Local polynomial estimation, boundary kernel weighting (triangular vs. uniform).
  - Data-driven optimal bandwidth selection using Imbens-Kalyanaraman and Calonico-Cattaneo-Titiunik (CCT / `rdrobust`).
  - Density continuity testing (McCrary test) to detect sorting / manipulation of the running variable around the cutoff.
  - Propensity Score Matching (PSM): Nearest-neighbor matching with replacement, caliper bounds, and common support evaluation.
- **Tools & Libraries:** `rdrobust`, `rdd`, `MatchIt`, `haven`, `ggplot2`.

---

## Software & Reproducibility Stack

- **Statistical Environment:** R 4.x / RStudio
- **Report Generation:** R Markdown, `knitr`, Pandoc, HTML5, LaTeX equations
- **Core Econometrics Packages:** `AER`, `plm`, `gmm`, `margins`, `MASS`, `glm2`, `dagitty`, `rdrobust`, `MatchIt`, `Synth`
- **Data Wrangling & Visuals:** `tidyverse` (`dplyr`, `ggplot2`, `tidyr`, `readr`), `haven`, `broom`, `stargazer`

---

## Author & Academic Affiliation

- **Author:** Amirreza (Farnam) Taheri
- **Program:** M.Sc. in Economics, Tehran Institute for Advanced Studies (TeIAS)
- **Portfolio:** [amirrezafarnamtaheri.github.io/portfolio](https://amirrezafarnamtaheri.github.io/portfolio/)
- **Email:** [TaheriFarnam@Gmail.com](mailto:TaheriFarnam@Gmail.com)
