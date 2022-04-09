# RMSE calculator function
#
# Given two numeric vectors, one representing actual values
# and one representing predicted, calculates the RMSE.
#
# @param predicted a numeric vector representing the values
# predicted(by some model)
# @param actual the numeric vector representing the actual values from data
#
# @return an int value indicating the RMSE
#
# @example get_RMSE()


get_RMSE = function(predicted, actual) {
  if((!is.numeric(predicted)) |  (!is.numeric(actual)))  {
    stop("get_RMSE expects two vectors of numeric values")
  }
  if(length(predicted) != length(actual)) {
    stop("Provided vectors must be of equal length")
  }
  result = sqrt(mean((actual - predicted)^2))
  return(round(result, digits = 2))
}
