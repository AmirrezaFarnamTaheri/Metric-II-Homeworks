#' Generate Summary Statistics
#'
#' This function generates summary statistics for a given data frame.
#'
#' @param data A data frame to summarize.
#' @param columns A vector of column names to include in the summary (default: NULL).
#' @param include Optional statistics to include (e.g., 'mean', 'sd') (default: c("mean", "sd", "min", "max", "median", "IQR")).
#' @param notes Notes to add to the summary table (default: NULL).
#' 
#' @return Data frame of summary statistics.
#' @examples
#' generate_summary_stats(mtcars, columns = c("mpg", "hp"))
generate_summary_stats <- function(data, columns = NULL, include = c("mean", "sd", "min", "max", "median", "IQR"), notes = NULL) {
  if (!is.data.frame(data)) stop("Input data must be a data frame.")
  if (is.null(columns)) columns <- names(data)
  
  stats <- data %>% select(any_of(columns)) %>%
    summarise(across(everything(), list(
      mean = ~ mean(.x, na.rm = TRUE),
      sd = ~ sd(.x, na.rm = TRUE),
      min = ~ min(.x, na.rm = TRUE),
      max = ~ max(.x, na.rm = TRUE),
      median = ~ median(.x, na.rm = TRUE),
      IQR = ~ IQR(.x, na.rm = TRUE)
    ), .names = "{col}_{fn}"))
  
  if (!is.null(notes)) {
    stats <- rbind(stats, c("Notes", notes))
  }
  
  return(stats)
}
