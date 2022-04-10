
<!-- README.md is generated from README.Rmd. Please edit that file -->

# package6

<!-- badges: start -->

[![R-CMD-check](https://github.com/DSCI-310/DSCI-310-Group-6-Package/workflows/R-CMD-check/badge.svg)](https://github.com/DSCI-310/DSCI-310-Group-6-Package/actions)
[![codecov](https://codecov.io/gh/DSCI-310/DSCI-310-Group-6-Package/branch/main/graph/badge.svg?token=QRIHLUGBLT)](https://codecov.io/gh/DSCI-310/DSCI-310-Group-6-Package)
<!-- badges: end -->

------------------------------------------------------------------------

The goal of package6 is to encapsulate useful helper functions used for
data analysis projects similar to [New Taipei City Real Estate Value
Prediction](https://github.com/DSCI-310/DSCI-310-Group-6).

<br/>

## Installation

You can install the development version of package6 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DSCI-310/DSCI-310-Group6-Package")
```

<br/>

## Usage

### `format_column_names()`

Sometimes raw data set have column names with blank spaces in the column
names.

``` r
df <- data.frame(`col Name1`= c(1,2),`col Name2` = c("3", "4"),  check.names = FALSE)
df
#>   col Name1 col Name2
#> 1         1         3
#> 2         2         4
```

it is generally a good idea to remove the blank spaces. This is what
`base::gsub()` do.

``` r
names(df) <- gsub(" ", "_", names(df))
df
#>   col_Name1 col_Name2
#> 1         1         3
#> 2         2         4
```

Notice how `gsub()` requires three arguments and modifies the original
data frame.Also the return value is not a data frame.
`package6::format_column_names()` requires only one argument. It does
not modify the original data frame and returns the data frame with
formatted column names.

``` r
df <- data.frame(`col Name1`= c(1,2),`col Name2` = c("3", "4"),  check.names = FALSE)
formatted_df <- format_column_names(df)
formatted_df
#>   col_Name1 col_Name2
#> 1         1         3
#> 2         2         4
```

### `split_data(dataset, train_perc, vs_prec, test_perc)`

To split a data set/ date frame into 3 parts:train data, test data and
variable selection data

``` r
df <- mtcars
glimpse(df)
#> Rows: 32
#> Columns: 11
#> $ mpg  <dbl> 21.0, 21.0, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, 22.8, 19.2, 17.8,…
#> $ cyl  <dbl> 6, 6, 4, 6, 8, 6, 8, 4, 4, 6, 6, 8, 8, 8, 8, 8, 8, 4, 4, 4, 4, 8,…
#> $ disp <dbl> 160.0, 160.0, 108.0, 258.0, 360.0, 225.0, 360.0, 146.7, 140.8, 16…
#> $ hp   <dbl> 110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123, 180, 180, 180…
#> $ drat <dbl> 3.90, 3.90, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, 3.92, 3.92, 3.92,…
#> $ wt   <dbl> 2.620, 2.875, 2.320, 3.215, 3.440, 3.460, 3.570, 3.190, 3.150, 3.…
#> $ qsec <dbl> 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20.00, 22.90, 18…
#> $ vs   <dbl> 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0,…
#> $ am   <dbl> 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0,…
#> $ gear <dbl> 4, 4, 4, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 3, 3,…
#> $ carb <dbl> 4, 4, 1, 1, 2, 1, 4, 2, 2, 4, 4, 3, 3, 3, 4, 4, 4, 1, 2, 1, 1, 2,…
```

Let’s start with mtcars data frame

``` r
train<-split_data(mtcars)$train
cv<-split_data(mtcars)$cv
test<-split_data(mtcars)$test
glimpse(train)
#> Rows: 19
#> Columns: 11
#> $ mpg  <dbl> 10.4, 15.2, 17.8, 26.0, 21.5, 33.9, 13.3, 30.4, 24.4, 15.8, 14.7,…
#> $ cyl  <dbl> 8, 8, 6, 4, 4, 4, 8, 4, 4, 8, 8, 4, 8, 8, 6, 6, 4, 8, 8
#> $ disp <dbl> 472.0, 275.8, 167.6, 120.3, 120.1, 71.1, 350.0, 75.7, 146.7, 351.…
#> $ hp   <dbl> 205, 180, 123, 91, 97, 65, 245, 52, 62, 264, 230, 95, 175, 245, 1…
#> $ drat <dbl> 2.93, 3.07, 3.92, 4.43, 3.70, 4.22, 3.73, 4.93, 3.69, 4.22, 3.23,…
#> $ wt   <dbl> 5.250, 3.780, 3.440, 2.140, 2.465, 1.835, 3.840, 1.615, 3.190, 3.…
#> $ qsec <dbl> 17.98, 18.00, 18.90, 16.70, 20.01, 19.90, 15.41, 18.52, 20.00, 14…
#> $ vs   <dbl> 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0
#> $ am   <dbl> 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0
#> $ gear <dbl> 3, 3, 4, 5, 3, 4, 3, 4, 4, 5, 3, 4, 3, 3, 5, 4, 4, 3, 3
#> $ carb <dbl> 4, 3, 4, 2, 1, 1, 4, 2, 2, 4, 4, 2, 2, 4, 6, 4, 1, 2, 2
glimpse(cv)
#> Rows: 7
#> Columns: 11
#> $ mpg  <dbl> 19.2, 15.2, 10.4, 21.0, 32.4, 15.2, 16.4
#> $ cyl  <dbl> 6, 8, 8, 6, 4, 8, 8
#> $ disp <dbl> 167.6, 275.8, 460.0, 160.0, 78.7, 304.0, 275.8
#> $ hp   <dbl> 123, 180, 215, 110, 66, 150, 180
#> $ drat <dbl> 3.92, 3.07, 3.00, 3.90, 4.08, 3.15, 3.07
#> $ wt   <dbl> 3.440, 3.780, 5.424, 2.875, 2.200, 3.435, 4.070
#> $ qsec <dbl> 18.30, 18.00, 17.82, 17.02, 19.47, 17.30, 17.40
#> $ vs   <dbl> 1, 0, 0, 0, 1, 0, 0
#> $ am   <dbl> 0, 0, 0, 1, 1, 0, 0
#> $ gear <dbl> 4, 3, 3, 4, 4, 3, 3
#> $ carb <dbl> 4, 3, 4, 4, 1, 2, 3
glimpse(test)
#> Rows: 6
#> Columns: 11
#> $ mpg  <dbl> 15.5, 10.4, 15.2, 13.3, 21.4, 32.4
#> $ cyl  <dbl> 8, 8, 8, 8, 6, 4
#> $ disp <dbl> 318.0, 460.0, 304.0, 350.0, 258.0, 78.7
#> $ hp   <dbl> 150, 215, 150, 245, 110, 66
#> $ drat <dbl> 2.76, 3.00, 3.15, 3.73, 3.08, 4.08
#> $ wt   <dbl> 3.520, 5.424, 3.435, 3.840, 3.215, 2.200
#> $ qsec <dbl> 16.87, 17.82, 17.30, 15.41, 19.44, 19.47
#> $ vs   <dbl> 0, 0, 0, 0, 1, 1
#> $ am   <dbl> 0, 0, 0, 0, 0, 1
#> $ gear <dbl> 3, 3, 3, 3, 3, 4
#> $ carb <dbl> 2, 4, 2, 4, 1, 1
```

### `cal_rmse(x,y)`

To calculate RMSE

``` r
predicted = c(12, 5, 19, 3)
actual = c(11, 4, 15, 6)

cal_rmse(predicted, actual)
#> [1] 2.6
```

<br/>

## Dependencies

| Package   | Version |
|-----------|---------|
| tidyverse | 1.3.1   |

<br/>

## License

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
