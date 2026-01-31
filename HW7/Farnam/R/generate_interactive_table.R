#' Generate an Interactive Table Using DT
#'
#' This function generates an interactive table using the DT package.
#'
#' @param data A data frame to display.
#' @param caption The caption for the table (default: NULL).
#' @param col_names Column names for the table (default: NULL).
#' @param options List of options for the DT::datatable function (default: list(pageLength = 5, scrollX = TRUE)).
#' @param row_colors Row colors for the table (default: NULL).
#' @param note Note to add below the table (default: NULL).
#' @param footnote Footnote to add below the table (default: NULL).
#' 
#' @return Interactive table.
#' @examples
#' generate_interactive_table(mtcars, caption = "Car Dataset")
generate_interactive_table <- function(data, caption = NULL, col_names = NULL,
                                       options = list(pageLength = 5, scrollX = TRUE),
                                       row_colors = NULL, note = NULL, footnote = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  table <- datatable(data, caption = htmltools::tags$caption(
    style = 'caption-side: top; text-align: center;', caption),
    colnames = col_names, options = options)
  
  if (!is.null(row_colors)) {
    table <- table %>% formatStyle(0, target = 'row', backgroundColor = row_colors)
  }
  
  if (!is.null(note)) {
    table <- table %>% formatStyle(columns = 1:ncol(data), valueColumns = note, fontSize = '80%')
  }
  
  if (!is.null(footnote)) {
    table <- table %>% formatStyle(columns = 1:ncol(data), valueColumns = footnote, fontSize = '80%', italic = TRUE)
  }
  
  return(table)
}
