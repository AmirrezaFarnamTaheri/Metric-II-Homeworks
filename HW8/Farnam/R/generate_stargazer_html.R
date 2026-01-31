#' Generate HTML Output Using Stargazer
#'
#' This function generates HTML output for regression models using stargazer.
#'
#' @param model A fitted regression model.
#' @param title The title of the output (default: NULL).
#' @param covariate_labels A vector of covariate labels (default: NULL).
#' @param digits Number of decimal places to display (default: 2).
#' @param style Style of the table (default: "AER").
#' @param omit_stat Statistics to omit from the table (default: NULL).
#' @param align Alignment of the table (default: NULL).
#' @param notes Additional notes to add to the table (default: NULL).
#' @param footnote Footnote to add to the table (default: NULL).
#' @param column_separators Whether to show column separators (default: TRUE).
#' 
#' @return HTML output for the regression model.
#' @examples
#' lm_model <- lm(mpg ~ hp + wt, data = mtcars)
#' generate_stargazer_html(lm_model, title = "Regression Analysis")
generate_stargazer_html <- function(model, title = NULL, covariate_labels = NULL, digits = 2,
                                    style = "AER", omit_stat = NULL, align = NULL, notes = NULL,
                                    footnote = NULL, column_separators = TRUE) {
  if (is.null(model)) stop("The model input is NULL. Please provide a valid model.")
  
  html_output <- stargazer(model, type = "html", title = title, digits = digits, covariate.labels = covariate_labels,
                           style = style, omit.stat = omit_stat, align = align, column.separators = column_separators)
  
  if (!is.null(notes)) {
    html_output <- paste0(html_output, "<br><center><b>Notes:</b> ", notes, "</center>")
  }
  if (!is.null(footnote)) {
    html_output <- paste0(html_output, "<br><center><i>Footnote:</i> ", footnote, "</center>")
  }
  
  cat('<center>', html_output, '</center>')
}
