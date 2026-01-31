#' Generate an Interactive Pie Chart
#'
#' This function generates an interactive pie chart using Plotly.
#'
#' @param data A data frame to analyze.
#' @param labels The name of the variable for pie slice labels.
#' @param values The name of the variable for pie slice values.
#' @param title The title of the pie chart (default: 'Interactive Pie Chart').
#' 
#' @return Interactive pie chart.
#' @examples
#' generate_interactive_pie(mtcars, labels = 'gear', values = 'mpg')
generate_interactive_pie <- function(data, labels, values, title = 'Interactive Pie Chart') {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  plot <- plot_ly(data, labels = ~get(labels), values = ~get(values), type = 'pie') %>%
    layout(title = title)
  
  return(plot)
}
