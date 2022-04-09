predicted = c(12, 5, 19, 3)
actual = c(11, 4, 15, 6)
long_vector = c(12, 5, 19, 3, 11)
faulty_vector = c(12, 5, 19, 3, "eleventeen")

result = get_RMSE(predicted, actual)

test_that("RMSE properly calculated", {
  expect_equal(2.6, result)})

test_that("Error detected when non-numeric input given",{
  expect_error(get_RMSE(faulty_vector, actual))
  expect_error(get_RMSE(predicted, faulty_vector))})


test_that("Error detected when input vectors have different lengths", {
  expect_error(get_RMSE(predicted, faulty_vector))
  expect_error(get_RMSE(predicted, faulty_vector))})
