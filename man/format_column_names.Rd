% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_column_names.R
\name{format_column_names}
\alias{format_column_names}
\title{Formats Column Names}
\usage{
format_column_names(df)
}
\arguments{
\item{df}{A data frame}
}
\value{
A data frame with no " " in its column names
}
\description{
Substitutes blank space " " in column names of the input data frame with "_".
If there is no " " in the column names, return the data frame.
}
\examples{
df <- data.frame(`col Name 1` = c(1, 2),
                 `col Name 2` = c(3, 4), 
                 check.names = FALSE)
format_column_names(df)
}
