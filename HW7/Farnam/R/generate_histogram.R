#' Generate a Histogram
#'
#' This function generates a histogram for a given data frame.
#'
#' @param data A data frame to analyze.
#' @param column The name of the column to plot.
#' @param bins Number of bins for the histogram (default: 30).
#' @param title The title of the histogram (default: 'Histogram').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Histogram.
#' @examples
#' generate_histogram(mtcars, column = 'mpg')
generate_histogram <- function(data, column, bins = 30, title = 'Histogram', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  histogram <- ggplot(data, aes_string(x = column)) +
    geom_histogram(bins = bins, fill = 'blue', color = 'black', alpha = 0.7) +
    labs(title = title, x = xaxis_title, y = yaxis_title) +
    theme_minimal()
  
  return(histogram)
}
