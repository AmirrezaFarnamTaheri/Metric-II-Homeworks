#' Generate a Heatmap
#'
#' This function generates a heatmap for a given data frame.
#'
#' @param data A data frame to analyze.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param fill The name of the variable for fill values.
#' @param title The title of the heatmap (default: 'Heatmap').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Heatmap plot.
#' @examples
#' generate_heatmap(mtcars, x = 'gear', y = 'carb', fill = 'mpg')
generate_heatmap <- function(data, x, y, fill, title = 'Heatmap', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  heatmap_plot <- ggplot(data, aes_string(x = x, y = y, fill = fill)) +
    geom_tile() +
    labs(title = title, x = xaxis_title, y = yaxis_title) +
    theme_minimal()
  
  return(heatmap_plot)
}
