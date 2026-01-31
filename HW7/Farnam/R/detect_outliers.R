#' Detect Outliers
#'
#' This function detects outliers in a given numeric vector or data frame.
#'
#' @param data A numeric vector or a data frame.
#' @param method The method to use for outlier detection ("iqr" or "z-score") (default: "iqr").
#' @param threshold The threshold for outlier detection (default: 1.5 for "iqr", 3 for "z-score").
#' @param columns A vector of column names to check for outliers (default: NULL, meaning all numeric columns).
#' 
#' @return A data frame with an additional column indicating whether each observation is an outlier.
#' @examples
#' detect_outliers(mtcars, method = "z-score", threshold = 2)
detect_outliers <- function(data, method = "iqr", threshold = NULL, columns = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  if (method == "iqr") {
    if (is.null(threshold)) threshold <- 1.5
    detect_iqr_outliers <- function(x) {
      Q1 <- quantile(x, 0.25, na.rm = TRUE)
      Q3 <- quantile(x, 0.75, na.rm = TRUE)
      IQR <- Q3 - Q1
      (x < (Q1 - threshold * IQR)) | (x > (Q3 + threshold * IQR))
    }
    outlier_matrix <- sapply(data[, columns, drop = FALSE], detect_iqr_outliers)
  } else if (method == "z-score") {
    if (is.null(threshold)) threshold <- 3
    detect_zscore_outliers <- function(x) {
      z_scores <- (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
      abs(z_scores) > threshold
    }
    outlier_matrix <- sapply(data[, columns, drop = FALSE], detect_zscore_outliers)
  } else {
    stop("Invalid method. Use 'iqr' or 'z-score'.")
  }
  
  outliers <- apply(outlier_matrix, 1, any)
  data$outlier <- outliers
  return(data)
}
