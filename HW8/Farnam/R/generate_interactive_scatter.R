#' Generate an Interactive Scatter Plot
#'
#' This function generates an interactive scatter plot using Plotly.
#'
#' @param data A data frame to analyze.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param color The name of the variable for color coding (default: NULL).
#' @param size The name of the variable for size scaling (default: NULL).
#' @param title The title of the scatter plot (default: 'Interactive Scatter Plot').
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' 
#' @return Interactive scatter plot.
#' @examples
#' generate_interactive_scatter(mtcars, x = 'hp', y = 'mpg', color = 'cyl', size = 'wt')
generate_interactive_scatter <- function(data, x, y, color = NULL, size = NULL, title = 'Interactive Scatter Plot', xaxis_title = NULL, yaxis_title = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  plot <- plot_ly(data, x = ~get(x), y = ~get(y), type = 'scatter', mode = 'markers',
                  marker = list(color = ~get(color), size = ~get(size), colorscale = 'Viridis')) %>%
    layout(title = title, xaxis = list(title = xaxis_title), yaxis = list(title = yaxis_title))
  
  return(plot)
}
