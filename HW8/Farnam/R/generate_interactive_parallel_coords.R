#' Generate an Interactive Parallel Coordinates Plot
#'
#' This function generates an interactive parallel coordinates plot using Plotly.
#'
#' @param data A data frame to visualize.
#' @param dimensions A vector of column names to include as dimensions.
#' @param color The name of the column for color coding (default: NULL).
#' @param title The title of the plot (default: 'Interactive Parallel Coordinates Plot').
#' 
#' @return Interactive parallel coordinates plot.
#' @examples
#' generate_interactive_parallel_coords(mtcars, dimensions = c('mpg', 'hp', 'wt', 'qsec'), color = 'cyl')
generate_interactive_parallel_coords <- function(data, dimensions, color = NULL, title = 'Interactive Parallel Coordinates Plot') {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(dimensions)) stop("Please provide dimensions to plot.")
  
  plot <- plot_ly(data, type = 'parcoords', line = list(color = ~get(color), colorscale = 'Viridis'),
                  dimensions = lapply(dimensions, function(col) list(label = col, values = ~get(col)))) %>%
    layout(title = title)
  
  return(plot)
}
