#source("../../src/format_column_names.R")
#library(testthat)

# function input for tests
noSpace <- data.frame (`colName1`  = c("value_1", "value_2"),
                       `colName2` = c("value_1", "value_2")
)
OneSpace <- data.frame (`colName 1`  = c("value_1", "value_2"),
                        `colName 2` = c("value_1", "value_2"),
                        check.names = FALSE
)
TwoSpaces <- data.frame (`col Name 1`  = c("value_1", "value_2"),
                         `col Name 2` = c("value_1", "value_2"),
                         check.names = FALSE
)

number <- 3
vector <- rep(c("class1", "class2"), 3)
list <- list(list = rep(c("class1", "class2"), 3))

# expected outputs
noSpace_output <- data.frame (`colName1`  = c("value_1", "value_2"),
                              `colName2` = c("value_1", "value_2")
)
OneSpace_output <- data.frame (`colName_1`  = c("value_1", "value_2"),
                               `colName_2` = c("value_1", "value_2")
)

TwoSpaces_output <- data.frame (`col_Name_1`  = c("value_1", "value_2"),
                                `col_Name_2` = c("value_1", "value_2")
)


test_that("`format_column_names` should return a data frame", {
  expect_true("data.frame" %in% class(format_column_names(noSpace)))
  expect_true("data.frame" %in% class(format_column_names(OneSpace)))
  expect_true("data.frame" %in% class(format_column_names(TwoSpaces)))
})

test_that("`format_column_names` should return a data frame with no ' ' in its column names", {
  res <- format_column_names(noSpace)
  for (cname in colnames(res)) {
    expect_false(grepl(" ", cname))
  }

  res <- format_column_names(OneSpace)
  for (cname in colnames(res)) {
    expect_false(grepl(" ", cname))
  }

  res <- format_column_names(TwoSpaces)
  for (cname in colnames(res)) {
    expect_false(grepl(" ", cname))
  }
})

test_that("`format_column_names` should return a data frame with column names with'_' to substitute ' ' in the input data frame", {
  expect_equal(format_column_names(noSpace), noSpace_output, ignore_attr = TRUE)
  expect_equal(format_column_names(OneSpace), OneSpace_output, ignore_attr = TRUE)
  expect_equal(format_column_names(TwoSpaces), TwoSpaces_output, ignore_attr = TRUE)
})

test_that("`format_column_names` should throw an error when incorrect types are passed to `df` argument", {
  expect_error(format_column_names(number))
  expect_error(format_column_names(vector))
  expect_error(format_column_names(list))
})
