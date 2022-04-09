vector_class = c(2, 3)
string_class = "string"

test_that("`split_data` should return a list", {
  expect_type(split_data(mtcars), "list")
})

test_that("Data frame must have the correct columns", {
  expect_equal(colnames(split_data(mtcars)$train),  colnames(mtcars))
  expect_equal(colnames(split_data(mtcars)$cv),  colnames(mtcars))
  expect_equal(colnames(split_data(mtcars)$test),  colnames(mtcars))

})

test_that("The train, test data set must be smaller than the original data", {
  expect_gt(nrow(mtcars), nrow(split_data(mtcars)$train))
  expect_gt(nrow(mtcars), nrow(split_data(mtcars)$cv))
  expect_gt(nrow(mtcars), nrow(split_data(mtcars)$test))
})

test_that("When inappropriate types are given to the 'dataset',
          'split data' should throw an error.", {
            expect_error(split_data(vector_class))
            expect_error(split_data(string_class))
          })

