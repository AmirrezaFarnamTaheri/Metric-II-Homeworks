#' Impute Missing Values
#'
#' This function imputes missing values in a data frame.
#'
#' @param data A data frame with missing values.
#' @param method The method to use for imputation ("mean", "median", or "mode") (default: "mean").
#' @param columns A vector of column names to impute (default: NULL, meaning all columns).
#' 
#' @return A data frame with imputed values.
#' @examples
#' impute_missing_values(mtcars, method = "median")
impute_missing_values <- function(data, method = "mean", columns = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  impute_mean <- function(x) {
    x[is.na(x)] <- mean(x, na.rm = TRUE)
    return(x)
  }
  
  impute_median <- function(x) {
    x[is.na(x)] <- median(x, na.rm = TRUE)
    return(x)
  }
  
  impute_mode <- function(x) {
    mode_val <- as.numeric(names(sort(table(x), decreasing = TRUE)[1]))
    x[is.na(x)] <- mode_val
    return(x)
  }
  
  if (method == "mean") {
    data[, columns] <- lapply(data[, columns, drop = FALSE], impute_mean)
  } else if (method == "median") {
    data[, columns] <- lapply(data[, columns, drop = FALSE], impute_median)
  } else if (method == "mode") {
    data[, columns] <- lapply(data[, columns, drop = FALSE], impute_mode)
  } else {
    stop("Invalid method. Use 'mean', 'median', or 'mode'.")
  }
  
  return(data)
}
