
<!-- README.md is generated from README.Rmd. Please edit that file -->

# package6

<!-- badges: start -->

[![R-CMD-check](https://github.com/DSCI-310/DSCI-310-Group-6-Package/workflows/R-CMD-check/badge.svg)](https://github.com/DSCI-310/DSCI-310-Group-6-Package/actions)
<!-- badges: end -->

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

### `get_RMSE()`

Calculates the RMSE given predicted and actual value. TODO

### `split_data()`

TODO

<br/>

## Dependencies

TODO

<br/>

## License

[![codecov](https://codecov.io/gh/DSCI-310/DSCI-310-Group-6-Package/branch/main/graph/badge.svg?token=QRIHLUGBLT)](https://codecov.io/gh/DSCI-310/DSCI-310-Group-6-Package)
