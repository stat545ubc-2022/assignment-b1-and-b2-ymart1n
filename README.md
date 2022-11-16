
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countNA

<!-- badges: start -->
<!-- badges: end -->

The goal of countNA is to count missing values (NA) in the specified
column `col_name` of the given data set `data`.

## Installation

You can install the development version of countNA from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-ymart1n")
```

## Example

This is a basic example which shows you how to count missing values (NA)
in columns `sex` and `year` of the data set `penguins`:

``` r
library(countNA)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: palmerpenguins
## penguins is a data set from palmerpenguins that has columns "sex" and "year"
library(palmerpenguins)
count_na(penguins, "sex")
#> # A tibble: 1 × 1
#>     sex
#>   <int>
#> 1    11
count_na(penguins, "year")
#> # A tibble: 1 × 1
#>    year
#>   <int>
#> 1     0
```
