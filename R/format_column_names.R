#' Formats Column Names
#'
#' Substitutes blank space " " in column names of the input data frame with "_".
#' If there is no " " in the column names, return the data frame.
#'
#' @param df A data frame
#'
#' @return A data frame with no " " in its column names
#'
#' @export
#'
#' @examples
#' df <- data.frame (`colName1`  = c("value_1", "value_2"),`colName2` = c("value_1", "value_2"))
#' format_column_names(df)
format_column_names <- function(df) {
  if (!is.data.frame(df)) {
    stop("`data_frame` should be a data frame or data frame extension (e.g. a tibble)")
  }

  names(df) <- gsub(" ", "_", names(df))
  df
}
