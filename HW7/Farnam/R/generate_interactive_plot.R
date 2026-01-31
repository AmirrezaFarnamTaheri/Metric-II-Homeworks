#' Generate an Interactive Plot Using Plotly
#'
#' This function generates an interactive plot using the Plotly package.
#'
#' @param data A data frame containing the data.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param type The type of plot (e.g., 'scatter', 'bar') (default: "scatter").
#' @param color The name of the variable for color coding (default: NULL).
#' @param title The title of the plot (default: NULL).
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' @param theme Custom theme for the plot (default: NULL).
#' @param legend_title The title for the legend (default: NULL).
#' @param tooltip Additional information to display on hover (default: NULL).
#' 
#' @return Interactive plot.
#' @examples
#' generate_interactive_plot(mtcars, x = "mpg", y = "hp", type = "scatter", title = "MPG vs HP")
generate_interactive_plot <- function(data, x, y, type = "scatter", color = NULL, title = NULL,
                                      xaxis_title = NULL, yaxis_title = NULL, theme = NULL,
                                      legend_title = NULL, tooltip = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  plot <- plot_ly(data, x = ~get(x), y = ~get(y), type = type, color = ~get(color), text = ~get(tooltip), hoverinfo = 'text')
  
  if (!is.null(title)) plot <- plot %>% layout(title = title)
  if (!is.null(xaxis_title)) plot <- plot %>% layout(xaxis = list(title = xaxis_title))
  if (!is.null(yaxis_title)) plot <- plot %>% layout(yaxis = list(title = yaxis_title))
  if (!is.null(theme)) plot <- plot %>% layout(theme)
  if (!is.null(legend_title)) plot <- plot %>% layout(legend = list(title = list(text = legend_title)))
  
  return(plot)
}
