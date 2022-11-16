
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
#> Downloading GitHub repo stat545ubc-2022/assignment-b1-and-b2-ymart1n@HEAD
#> vctrs (0.4.2 -> 0.5.1) [CRAN]
#> Installing 1 packages: vctrs
#> Installing package into 'C:/Users/user/AppData/Local/R/win-library/4.2'
#> (as 'lib' is unspecified)
#> 
#>   There is a binary version available but the source version is later:
#>       binary source needs_compilation
#> vctrs  0.5.0  0.5.1              TRUE
#> installing the source package 'vctrs'
#> Warning in i.p(...): installation of package 'vctrs' had non-zero exit status
#>          checking for file 'C:\Users\user\AppData\Local\Temp\RtmpmKs8CO\remotes21ec506a4bca\stat545ubc-2022-assignment-b1-and-b2-ymart1n-cb6b4d8/DESCRIPTION' ...  ✔  checking for file 'C:\Users\user\AppData\Local\Temp\RtmpmKs8CO\remotes21ec506a4bca\stat545ubc-2022-assignment-b1-and-b2-ymart1n-cb6b4d8/DESCRIPTION'
#>       ─  preparing 'countNA':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building 'countNA_0.1.0.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/user/AppData/Local/R/win-library/4.2'
#> (as 'lib' is unspecified)
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
