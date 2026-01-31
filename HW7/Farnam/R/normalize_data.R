#' Normalize Data
#'
#' This function normalizes numeric columns in a data frame.
#'
#' @param data A data frame to normalize.
#' @param columns A vector of column names to normalize (default: NULL, meaning all numeric columns).
#' @param method The method to use for normalization ("min-max" or "z-score") (default: "min-max").
#' 
#' @return A normalized data frame.
#' @examples
#' normalize_data(mtcars, method = "z-score")
normalize_data <- function(data, columns = NULL, method = "min-max") {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  normalize_min_max <- function(x) {
    (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
  }
  
  normalize_z_score <- function(x) {
    (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
  }
  
  if (method == "min-max") {
    data[, columns] <- lapply(data[, columns, drop = FALSE], normalize_min_max)
  } else if (method == "z-score") {
    data[, columns] <- lapply(data[, columns, drop = FALSE], normalize_z_score)
  } else {
    stop("Invalid method. Use 'min-max' or 'z-score'.")
  }
  
  return(data)
}
