#' Generate an Interactive Bar Chart
#'
#' This function generates an interactive bar chart using Plotly.
#'
#' @param data A data frame to analyze.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param color The name of the variable for color coding (default: NULL).
#' @param title The title of the bar chart (default: 'Interactive Bar Chart').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Interactive bar chart.
#' @examples
#' generate_interactive_bar(mtcars, x = 'gear', y = 'mpg', color = 'cyl')
generate_interactive_bar <- function(data, x, y, color = NULL, title = 'Interactive Bar Chart', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  plot <- plot_ly(data, x = ~get(x), y = ~get(y), type = 'bar', color = ~get(color), colors = 'Viridis') %>%
    layout(title = title, xaxis = list(title = xaxis_title), yaxis = list(title = yaxis_title))
  
  return(plot)
}
