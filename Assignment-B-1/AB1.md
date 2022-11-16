Assignment B-1: Making a function
================

This assignment covers making a function in R, documenting it, and
testing it.

## Getting Started

Load the requirements for this assignment:

``` r
library(palmerpenguins)
library(gapminder)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
    ## ✔ readr   2.1.3      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null
    ## 
    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition
    ## 
    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

## Exercise 1 & 2: Make a Function & Document your Function

In this exercise, I’ll make a function, fortify it, and document the
function using roxygen2 tags.

Notice that in the return statement, we used `as_tibble` to ensure the
output type is consistent despite the type of input.

``` r
#' Count of missing values
#'
#' @description `count_na` returns the count of missing values(NA) in the specified column `col_name` of the given data set `data`
#'
#' @param data data set to get the specific column from
#' @param col_name name of the column (string input) to count missing values.
#'
#' @return A 1 x 1 tibble with variable "col_name" and its value "integer count of missing values"
count_na <- function(data, col_name) {
  if (!is.character(col_name)) {
    stop("col_name should be a string.")
  } else if (!(col_name %in% colnames(data))) {
    stop("'", col_name, "' does not exist in the data.")
  } else {
    return(as_tibble(data %>% summarise(across(col_name, ~ sum(is.na(.x))))))
  }
}
```

## Exercise 3: Include examples

First, we need to check if we have the data set we want to test with.
We’re gonna use `penguins` data set from `palmerpenguins` package.

``` r
head(penguins)
```

    ## # A tibble: 6 × 8
    ##   species island    bill_length_mm bill_depth_mm flipper_l…¹ body_…² sex    year
    ##   <fct>   <fct>              <dbl>         <dbl>       <int>   <int> <fct> <int>
    ## 1 Adelie  Torgersen           39.1          18.7         181    3750 male   2007
    ## 2 Adelie  Torgersen           39.5          17.4         186    3800 fema…  2007
    ## 3 Adelie  Torgersen           40.3          18           195    3250 fema…  2007
    ## 4 Adelie  Torgersen           NA            NA            NA      NA <NA>   2007
    ## 5 Adelie  Torgersen           36.7          19.3         193    3450 fema…  2007
    ## 6 Adelie  Torgersen           39.3          20.6         190    3650 male   2007
    ## # … with abbreviated variable names ¹​flipper_length_mm, ²​body_mass_g

For example, I would like to see how many missing values are there in
`sex`, `bill_length_mm`, and `year` variables in data set `penguins`,
respectively.

``` r
count_na(penguins, "sex")
```

    ## Note: Using an external vector in selections is ambiguous.
    ## ℹ Use `all_of(col_name)` instead of `col_name` to silence this message.
    ## ℹ See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This message is displayed once per session.

    ## # A tibble: 1 × 1
    ##     sex
    ##   <int>
    ## 1    11

``` r
count_na(penguins, "bill_length_mm")
```

    ## # A tibble: 1 × 1
    ##   bill_length_mm
    ##            <int>
    ## 1              2

``` r
count_na(penguins, "year")
```

    ## # A tibble: 1 × 1
    ##    year
    ##   <int>
    ## 1     0

To show the error messages this function deliberately throws, we can
look at the following two examples:

1.  We pass in a column name `col_name` that is not a string. It will
    throw error with message `col_name should be a string.`

2.  We pass in a column name `col_name` that does not exist in the data.
    It will give error with message
    `'{col_name}' does not exist in the data.`

``` r
count_na(penguins, 22)
```

    ## Error in count_na(penguins, 22): col_name should be a string.

``` r
count_na(penguins, "month")
```

    ## Error in count_na(penguins, "month"): 'month' does not exist in the data.

## Exercise 4: Test the Function

The first three tests are testing if the function gives the expected
output. The last three tests are testing whether the function throws the
expected errors. The output and errors are similar to the examples shown
above.

``` r
test_that("Test the function 'count_na' with data set 'penguins'", {
  expect_equal(count_na(penguins, "sex"), as_tibble(summarise(penguins, across(sex, ~ sum(is.na(.x))))))
  expect_equal(count_na(penguins, "bill_length_mm"), as_tibble(summarise(penguins, across(bill_length_mm, ~ sum(is.na(.x))))))
  expect_equal(count_na(penguins, "year"), as_tibble(summarise(penguins, across(year, ~ sum(is.na(.x))))))
  expect_error(count_na(penguins, 22), "col_name should be a string.")
  expect_error(count_na(penguins, ""), "'' does not exist in the data.")
  expect_error(count_na(penguins, "month"), "'month' does not exist in the data.")
})
```

    ## Test passed 🎊

The following test cases test the function with the data set `mtcars`,
which is a data frame. We can then use these test cases to see if the
output is consistent.

``` r
head(mtcars)
```

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

``` r
test_that("Test the function 'count_na' with data set 'mtcars'", {
  expect_equal(count_na(mtcars, "cyl"), as_tibble(summarise(mtcars, across(cyl, ~ sum(is.na(.x))))))
  expect_equal(count_na(mtcars, "disp"), as_tibble(summarise(mtcars, across(disp, ~ sum(is.na(.x))))))
  expect_equal(count_na(mtcars, "vs"), as_tibble(summarise(mtcars, across(vs, ~ sum(is.na(.x))))))
  expect_error(count_na(mtcars, 22), "col_name should be a string.")
  expect_error(count_na(mtcars, ""), "'' does not exist in the data.")
  expect_error(count_na(mtcars, "month"), "'month' does not exist in the data.")
})
```

    ## Test passed 😸
