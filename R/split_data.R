#' Split data into 3 data frames
#'
#' @param dataset a data set or data frame
#' @param train_perc percentage of train data, default value is 0.6
#' @param vs_prec percentage of variable selection data, default value is 0.2
#' @param test_perc percentage of test data, default value is 0.2
#'
#' @return a list of 3 data frame: train data sets, test data sets, variable selection data sets
#'
#' @export
#'
#' @examples
#' (dataset, 7 , train_perc = 0.6, vs_prec = 0.2, test_perc = 0.2)
#' return a list of 6 data frame:  X,Y train data sets, X, Y test data set
#'        X, Y data set for variable selection
#'
split_data <- function(dataset, y, train_perc = 0.6, vs_prec = 0.2, test_perc = 0.2) {

  if (!is.data.frame(dataset)) {
    stop("`dataset` should be a data frame or data frame extension")
  }

  m <- nrow(dataset)
  n <- ncol(dataset)

  #Sort the data randomly
  data_perm <- dataset[sample(m),]

  # list to store all data.frames
  out <- list()

  #Split data into training, CV, and test sets
  out$train <- data_perm[1:round(train_perc*m),]
  out$cv <- data_perm[(round(train_perc*m)+1):round((train_perc+vs_prec)*m),]
  out$test <- data_perm[(round((train_perc+vs_prec)*m)+1):round((train_perc+vs_prec+test_perc)*m),]


  return(out)
}
