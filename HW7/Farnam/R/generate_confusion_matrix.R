#' Generate a Confusion Matrix
#'
#' This function generates a confusion matrix for a given set of actual and predicted values.
#'
#' @param actual A vector of actual values.
#' @param predicted A vector of predicted values.
#' @param labels A vector of class labels (default: NULL).
#' @param title The title of the plot (default: 'Confusion Matrix').
#' 
#' @return Confusion matrix plot.
#' @examples
#' actual <- factor(c(1, 0, 1, 1, 0, 1, 0, 0, 1, 0))
#' predicted <- factor(c(1, 0, 1, 1, 0, 1, 1, 0, 0, 0))
#' generate_confusion_matrix(actual, predicted)
generate_confusion_matrix <- function(actual, predicted, labels = NULL, title = 'Confusion Matrix') {
  if (is.null(labels)) labels <- sort(unique(c(actual, predicted)))
  
  cm <- table(factor(actual, levels = labels), factor(predicted, levels = labels))
  
  cm_plot <- ggplot(data = as.data.frame(cm), aes(Var1, Var2, fill = Freq)) +
    geom_tile() +
    geom_text(aes(label = Freq), vjust = 1) +
    scale_fill_gradient(low = "white", high = "blue") +
    labs(title = title, x = 'Actual', y = 'Predicted') +
    theme_minimal()
  
  return(cm_plot)
}
