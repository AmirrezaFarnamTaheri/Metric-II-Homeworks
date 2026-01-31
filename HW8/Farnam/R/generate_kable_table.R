#' Generate a Styled HTML Table Using kableExtra
#'
#' This function generates a styled HTML table using the kableExtra package.
#'
#' @param data A data frame to display.
#' @param caption The caption for the table (default: NULL).
#' @param col_names Column names for the table (default: NULL).
#' @param format The format of the table (default: "html").
#' @param digits Number of decimal places to display (default: 2).
#' @param table_attr Attributes for the table tag (default: "style='width:100%;'").
#' @param font_size Font size for the table text (default: 12).
#' @param row_colors Colors for table rows (default: NULL).
#' @param full_width Whether the table should take the full width of the page (default: TRUE).
#' @param note Note to add below the table (default: NULL).
#' @param footnote Footnote to add below the table (default: NULL).
#' 
#' @return Styled HTML table.
#' @examples
#' generate_kable_table(mtcars, caption = "Car Dataset")
generate_kable_table <- function(data, caption = NULL, col_names = NULL, format = "html", digits = 2,
                                 table_attr = "style='width:100%;'", font_size = 12, row_colors = NULL,
                                 full_width = TRUE, note = NULL, footnote = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  
  table <- kable(data, format = format, caption = caption, col.names = col_names, digits = digits) %>%
    kable_styling(full_width = full_width, position = "center", font_size = font_size, table.attr = table_attr)
  
  if (!is.null(row_colors)) {
    table <- table %>% row_spec(0, background = row_colors)
  }
  
  if (!is.null(note)) {
    table <- table %>% add_footnote(note, notation = "none")
  }
  
  if (!is.null(footnote)) {
    table <- table %>% add_footnote(footnote, notation = "none", footnote_as_chunk = TRUE)
  }
  
  return(table)
}
