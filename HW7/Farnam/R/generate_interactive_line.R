#' Generate an Interactive Line Chart
#'
#' This function generates an interactive line chart using Plotly.
#'
#' @param data A data frame to analyze.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param group The name of the grouping variable (default: NULL).
#' @param title The title of the line chart (default: 'Interactive Line Chart').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Interactive line chart.
#' @examples
#' generate_interactive_line(mtcars, x = 'hp', y = 'mpg', group = 'cyl')
generate_interactive_line <- function(data, x, y, group = NULL, title = 'Interactive Line Chart', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  plot <- plot_ly(data, x = ~get(x), y = ~get(y), type = 'scatter', mode = 'lines+markers',
                  color = ~get(group), colors = 'Viridis') %>%
    layout(title = title, xaxis = list(title = xaxis_title), yaxis = list(title = yaxis_title))
  
  return(plot)
}
