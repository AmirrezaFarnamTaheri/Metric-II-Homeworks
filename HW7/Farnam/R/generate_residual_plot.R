#' Generate a Residual Plot
#'
#' This function generates a residual plot for a given regression model.
#'
#' @param model A fitted regression model.
#' @param title The title of the plot (default: 'Residual Plot').
#' @param xaxis_title The title for the x-axis (default: 'Fitted Values').
#' @param yaxis_title The title for the y-axis (default: 'Residuals').
#' 
#' @return Residual plot.
#' @examples
#' lm_model <- lm(mpg ~ hp + wt, data = mtcars)
#' generate_residual_plot(lm_model)
generate_residual_plot <- function(model, title = 'Residual Plot', xaxis_title = 'Fitted Values', yaxis_title = 'Residuals') {
  if (!inherits(model, 'lm')) stop("Input model must be a fitted regression model.")
  
  residuals <- resid(model)
  fitted <- fitted(model)
  
  residual_plot <- ggplot(data.frame(fitted = fitted, residuals = residuals), aes(x = fitted, y = residuals)) +
    geom_point() +
    geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
    labs(title = title, x = xaxis_title, y = yaxis_title) +
    theme_minimal()
  
  return(residual_plot)
}
