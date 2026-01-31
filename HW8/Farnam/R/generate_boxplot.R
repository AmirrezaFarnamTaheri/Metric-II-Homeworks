#' Generate a Boxplot
#'
#' This function generates a boxplot for a given data frame.
#'
#' @param data A data frame to analyze.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param color The name of the variable for color coding (default: NULL).
#' @param title The title of the boxplot (default: 'Boxplot').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Boxplot.
#' @examples
#' generate_boxplot(mtcars, x = 'gear', y = 'mpg')
generate_boxplot <- function(data, x, y, color = NULL, title = 'Boxplot', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  boxplot <- ggplot(data, aes_string(x = x, y = y, fill = color)) +
    geom_boxplot() +
    labs(title = title, x = xaxis_title, y = yaxis_title) +
    theme_minimal()
  
  return(boxplot)
}
