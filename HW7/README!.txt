## Title: Metrics II - Homework 6: Capital Punishment and Murder Rates

### Purpose
This R Markdown document enables a detailed examination of the relationship between "Capital Punishment and Murder Rates", "Fertility and Education", "401k Participation and IRA".

---
### Prerequisites
The analysis assumes the following conditions are met before execution:

- A properly installed version of R with the necessary packages.
- The following R packages installed:
  - `dplyr`
  - `tidyr`
  - `haven`
  - `tidyverse`
  - `knitr`
  - `stargazer`
  - `ivreg`
  - `broom`
  - `kableExtra`
  - `ggplot2`
  - `plotly`
  - `DT`
  - `htmltools`
  - `sandwich`
  - `lmtest`

You can install the packages using:

```r
install.packages(c("dplyr", "tidyr", "haven", "tidyverse", "knitr", "stargazer", "ivreg", "broom", "kableExtra", "ggplot2", "plotly", "DT", "htmltools", "sandwich", "lmtest"))
```
---------------
### Documentation
Find comprehensive details of the analysis in the following files:

- `Taheri.Farnam.HW06.Rmd`: The main R Markdown file containing the analysis.
- `styles.css`: Custom CSS for styling the HTML output.
- `navbar.html`: HTML file for navigation bar.
- `./Data`: The datasets' folder used for the analysis.

---------------
### Instructions
1. **Set Up Working Directory**: Ensure that your working directory is set to the location where the data files are stored. Set the working directory in R:
   ```{r}
   setwd("./Data")
   working_dir <- getwd()
   ```

2. **Run the Analysis**: Knit the R Markdown document to generate the HTML report. This can be done by clicking the "Knit" button in RStudio or by running:
   ```{r}
   rmarkdown::render("Taheri.Farnam.HW06.Rmd")
   ```

---------------
### Analysis Breakdown
The analysis is divided into the following sections, each addressing specific questions:

#### Part I: Capital Punishment and Murder Rates


#### Part II: Fertility and Education


#### Part III: 401k Participation and IRA

---------------
### Disclaimer
This work is submitted for academic purposes only. The analysis reflects the complexity inherent within the study's scope and is specifically designed for use within an educational context only.

---------------
### Contact Information
If you have any questions regarding the execution of the script or the interpretation of the findings, please feel free to contact:

**Author:** Amirreza "Farnam" Taheri  
**Email:** TaheriFarnam@gmail.com  
**Telegram ID:** UCanCallMeFarnam  
**Date:** May 21, 2024