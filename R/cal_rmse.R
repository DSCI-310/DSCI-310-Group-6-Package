#' RMSE calculator function
#'
#' @param predicted predicted a numeric vector representing the values
#' @param actual actual the numeric vector representing the actual values from data
#'
#' @return an int value indicating the RMSE
#' @export
#' @import tidyverse
#' @examples
#' x <- seq(-10, 10, by = .1)
#' y <- dnorm(x, mean = 2.5, sd = 0.5)
#' cal_rmse(x,y)
cal_rmse = function(predicted, actual) {
  if((!is.numeric(predicted)) |  (!is.numeric(actual)))  {
    stop("cal_rmse expects two vectors of numeric values")
  }
  if(length(predicted) != length(actual)) {
    stop("Provided vectors must be of equal length")
  }
  result = sqrt(mean((actual - predicted)^2))
  return(round(result, digits = 2))
}
