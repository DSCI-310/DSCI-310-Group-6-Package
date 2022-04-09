#TEST DATA
data <- tibble(
  Name = c("Arthur", "Glenda", "Jemma", "James"),
  Height = c(1.90, 1.78, 1.82, 1.67),
  Weight = c(81, 72, 77, 62)
)

# PLOT FUNCTION INSTANCE

scatter_plot_fun <- scatter_plot(
  data, Height, Weight,
  "Height vs Weight", "Height", "Weight",
  20, 20, 25, TRUE
)

### - - - TESTS - - - ###

test_that("`scatter_plot` should return an exact copy of the provided plot", {
  vdiffr::expect_doppelganger("scatter-plot-doppl", scatter_plot_fun)
})

test_that("`scatter_plot` should throw an error when columns are not numeric", {
  expect_error(scatter_plot(
    data, Height, Name,
    "Height vs Name", "Height", "Name")
  )
})

test_that("`scatter_plot` should throw an error when labels are not string", {
  expect_error(scatter_plot(
    data, Height, Weight,
    "Height vs Weight", 200, 100)
  )
})
