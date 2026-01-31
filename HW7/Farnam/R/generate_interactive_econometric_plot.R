#' Generate an Interactive Econometric Plot Using Plotly
#'
#' This function generates an interactive plot for econometric models using the Plotly package.
#'
#' @param data A data frame containing the data.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param model A fitted econometric model.
#' @param type The type of plot (e.g., 'scatter', 'line') (default: "scatter").
#' @param color The name of the variable for color coding (default: NULL).
#' @param title The title of the plot (default: NULL).
#' @param xaxis_title The title for the x-axis (default: NULL).
#' @param yaxis_title The title for the y-axis (default: NULL).
#' @param show_residuals Logical, whether to show residuals (default: FALSE).
#' @param show_predictions Logical, whether to show model predictions (default: FALSE).
#' 
#' @return Interactive plot.
#' @examples
#' lm_model <- lm(mpg ~ hp + wt, data = mtcars)
#' generate_interactive_econometric_plot(mtcars, x = "hp", y = "mpg", model = lm_model, show_residuals = TRUE, show_predictions = TRUE)
generate_interactive_econometric_plot <- function(data, x, y, model, type = "scatter", color = NULL, title = NULL,
                                                  xaxis_title = NULL, yaxis_title = NULL, 
                                                  show_residuals = FALSE, show_predictions = FALSE) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (missing(model)) stop("Please provide a fitted econometric model.")
  
  plot <- plot_ly(data, x = ~get(x), y = ~get(y), type = type, color = ~get(color))
  
  if (show_predictions) {
    predictions <- predict(model, newdata = data)
    plot <- plot %>% add_trace(y = predictions, mode = 'lines', name = 'Predicted')
  }
  
  if (show_residuals) {
    residuals <- resid(model)
    plot <- plot %>% add_trace(y = residuals, mode = 'markers', name = 'Residuals', marker = list(color = 'red'))
  }
  
  if (!is.null(title)) plot <- plot %>% layout(title = title)
  if (!is.null(xaxis_title)) plot <- plot %>% layout(xaxis = list(title = xaxis_title))
  if (!is.null(yaxis_title)) plot <- plot %>% layout(yaxis = list(title = yaxis_title))
  
  return(plot)
}
