test_that("Test the function 'count_na' with data set 'penguins'", {
  expect_equal(count_na(penguins, "sex"), as_tibble(summarise(penguins, across(sex, ~ sum(is.na(.x))))))
  expect_equal(count_na(penguins, "bill_length_mm"), as_tibble(summarise(penguins, across(bill_length_mm, ~ sum(is.na(.x))))))
  expect_equal(count_na(penguins, "year"), as_tibble(summarise(penguins, across(year, ~ sum(is.na(.x))))))
  expect_error(count_na(penguins, 22), "col_name should be a string.")
  expect_error(count_na(penguins, ""), "'' does not exist in the data.")
  expect_error(count_na(penguins, "month"), "'month' does not exist in the data.")
})

test_that("Test the function 'count_na' with data set 'mtcars'", {
  expect_equal(count_na(mtcars, "cyl"), as_tibble(summarise(mtcars, across(cyl, ~ sum(is.na(.x))))))
  expect_equal(count_na(mtcars, "disp"), as_tibble(summarise(mtcars, across(disp, ~ sum(is.na(.x))))))
  expect_equal(count_na(mtcars, "vs"), as_tibble(summarise(mtcars, across(vs, ~ sum(is.na(.x))))))
  expect_error(count_na(mtcars, 22), "col_name should be a string.")
  expect_error(count_na(mtcars, ""), "'' does not exist in the data.")
  expect_error(count_na(mtcars, "month"), "'month' does not exist in the data.")
})
