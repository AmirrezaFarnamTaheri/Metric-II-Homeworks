#' Handle Missing Values
#'
#' This function handles missing values in a data frame.
#'
#' @param data A data frame with missing values.
#' @param method Method to handle missing values ('remove', 'mean', 'median', 'mode') (default: 'remove').
#' @param columns A vector of column names to apply the method to (default: NULL).
#' 
#' @return Data frame with missing values handled.
#' @examples
#' handle_missing_values(mtcars, method = 'mean', columns = c('mpg', 'hp'))
handle_missing_values <- function(data, method = 'remove', columns = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  for (col in columns) {
    if (method == 'remove') {
      data <- data[!is.na(data[[col]]), ]
    } else if (method == 'mean') {
      data[[col]][is.na(data[[col]])] <- mean(data[[col]], na.rm = TRUE)
    } else if (method == 'median') {
      data[[col]][is.na(data[[col]])] <- median(data[[col]], na.rm = TRUE)
    } else if (method == 'mode') {
      mode_val <- as.numeric(names(sort(table(data[[col]]), decreasing = TRUE)[1]))
      data[[col]][is.na(data[[col]])] <- mode_val
    }
  }
  
  return(data)
}
