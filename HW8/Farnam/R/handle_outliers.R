#' Handle Outliers
#'
#' This function handles outliers in a data frame.
#'
#' @param data A data frame with outliers.
#' @param method Method to handle outliers ('remove', 'cap', 'replace') (default: 'remove').
#' @param columns A vector of column names to apply the method to (default: NULL).
#' @param threshold Threshold to define outliers (default: 1.5).
#' 
#' @return Data frame with outliers handled.
#' @examples
#' handle_outliers(mtcars, method = 'cap', columns = c('mpg', 'hp'))
handle_outliers <- function(data, method = 'remove', columns = NULL, threshold = 1.5) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  for (col in columns) {
    Q1 <- quantile(data[[col]], 0.25, na.rm = TRUE)
    Q3 <- quantile(data[[col]], 0.75, na.rm = TRUE)
    IQR <- Q3 - Q1
    lower_bound <- Q1 - threshold * IQR
    upper_bound <- Q3 + threshold * IQR
    
    if (method == 'remove') {
      data <- data[data[[col]] >= lower_bound & data[[col]] <= upper_bound, ]
    } else if (method == 'cap') {
      data[[col]][data[[col]] < lower_bound] <- lower_bound
      data[[col]][data[[col]] > upper_bound] <- upper_bound
    } else if (method == 'replace') {
      data[[col]][data[[col]] < lower_bound] <- mean(data[[col]], na.rm = TRUE)
      data[[col]][data[[col]] > upper_bound] <- mean(data[[col]], na.rm = TRUE)
    }
  }
  
  return(data)
}
