library(tidyverse)
library(assertthat)

#' Scatter plot function
#'
#' Given a dataframe, two columns and other tunning parameters,
#' creates a scatter plot
#'
#' @param dataframe A data frame or data frame extension (e.g. a tibble).
#' @param x_var Unquoted column name of column containing the x values
#' @param y_var Unquoted column name of column containing the y values
#' @param title String containing the title of the plot
#' @param x_label String containing the name of the x axis
#' @param y_label String containing the name of the y axis
#' @param axis_text_size Integer to indicate the axis values size, default 20
#' @param axis_title_size Integer indicating the axis labels size, default 20
#' @param plot_title_size Integer indicating the title text size, default 25
#' @param legend Boolean to add/remove legend, default TRUE
#'
#' @return A ggplot2 scatter plot instance
#'
#' @examples
#' scatter_plot(
#'     df, Height, Width,
#'     "Heigth to Width comparison", "Heigth", "Width"
#' )


scatter_plot <- function(
  dataframe, x_var, y_var,
  title, x_label, y_label,
  axis_text_size=20, axis_title_size=20,
  plot_title_size=25, legend=TRUE) {


  #? Could consider joining "if" using > any() but could loose
  #? detailed error messages

  if (!dataframe %>% pull({{x_var}}) %>% is.numeric) {
    stop("Column for variable X doesn't contain numerical values")
  }
  else if (!dataframe %>% pull({{y_var}}) %>% is.numeric) {
    stop("Column for variable Y doesn't contain numerical values")
  }
  else if (!is.string(title)) {
    stop("Title is not a string variable")
  }
  else if (!is.string(x_label)) {
    stop("X axis label is not a string variable")
  }
  else if (!is.string(y_label)) {
    stop("Y axis label is not a string variable")
  }

  dataframe %>%
    ggplot() +
    geom_point(aes(x = {{x_var}}, y = {{y_var}})) +
    labs(x = x_label, y = y_label, title = title) +
    theme(
      axis.text = element_text(size = axis_text_size),
      axis.title = element_text(size = axis_title_size),
      plot.title = element_text(size = plot_title_size, hjust = 0.5)) +
    guides(fill = legend)
}
