#' @title Count of missing values in one column
#'
#' @export
#' @description The goal of `countNA` is to count missing values (NA) in the specified column `col_name` of the given data set `data`.
#'
#' @param data data set to get the specific column from.
#' @param col_name name of the column (string input) to count missing values.
#'
#' @return A 1 x 1 tibble with variable `col_name` and its value `integer count of missing values`.
#' @importFrom dplyr as_tibble
#' @importFrom dplyr summarise
#' @importFrom dplyr across
#' @importFrom dplyr %>%
#' @examples
#' # penguins is a data set from palmerpenguins that has columns "sex" and "year".
#' library(palmerpenguins)
#' count_na(penguins, "sex")
#' count_na(penguins, "year")
count_na <- function(data, col_name) {
  if (!is.character(col_name)) {
    stop("col_name should be a string.")
  } else if (!(col_name %in% colnames(data))) {
    stop("'", col_name, "' does not exist in the data.")
  } else {
    return(dplyr::as_tibble(data %>% dplyr::summarise(dplyr::across(col_name, ~ sum(is.na(.x))))))
  }
}
