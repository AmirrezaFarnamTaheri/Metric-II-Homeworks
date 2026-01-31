#' Generate a Correlation Matrix
#'
#' This function generates a correlation matrix for a given data frame.
#'
#' @param data A data frame to analyze.
#' @param method Correlation method ('pearson', 'spearman', 'kendall') (default: 'pearson').
#' @param plot Whether to plot the correlation matrix (default: FALSE).
#' @param digits Number of decimal places to display (default: 2).
#' @param title The title for the plot (default: 'Correlation Matrix').
#' 
#' @return Correlation matrix (and plot if requested).
#' @examples
#' generate_correlation_matrix(mtcars)
generate_correlation_matrix <- function(data, method = 'pearson', plot = FALSE, digits = 2, title = 'Correlation Matrix') {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  corr_matrix <- round(cor(data, method = method, use = "complete.obs"), digits)
  
  if (plot) {
    corrplot::corrplot(corr_matrix, method = "circle", type = "upper", title = title, tl.col = "black", tl.srt = 45)
  }
  
  return(corr_matrix)
}
