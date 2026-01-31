#' Generate Violin Plot
#'
#' This function generates a violin plot for a given data frame.
#'
#' @param data A data frame.
#' @param x The name of the x variable.
#' @param y The name of the y variable.
#' @param title Title of the plot.
#'
#' @return A ggplot object of the violin plot.
#' @examples
#' generate_violin_plot(mtcars, x = "cyl", y = "mpg", title = "Violin Plot of MPG by Cylinder")
#' @export
generate_violin_plot <- function(data, x, y, title = "Violin Plot") {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  ggplot(data, aes_string(x = x, y = y)) +
    geom_violin() +
    labs(title = title) +
    theme_minimal()
}
