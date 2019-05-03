library(testthat)
context("check binomial functions")

test_that('bin_choose with invalid numbers', {
  expect_error(bin_choose(5, 12))
})

test_that('bin_choose with valid length',{
  expect_length(bin_choose(5, 1:3), 3)
})

test_that('bin_choose with invalid length',{
  expect_error(bin_choose(5, 1:3, 1))
})

test_that('bin_probability with invalid numbers', {
  expect_error(bin_probability(10, 5, 2))
})

test_that('bin_probability with valid length',{
  expect_length(bin_probability(2, 5, 0.5), 1)
})

test_that('bin_probability with invalid length',{
  expect_error(bin_probability(2, 5))
})

test_that('bin_distribution with invalid numbers', {
  expect_error(bin_distribution(5, -0.1))
})

test_that('bin_distribution with valid class',{
  expect_is(bin_distribution(5, 0.5), 'bindis')
})

test_that('bin_distribution with invalid length',{
  expect_error(bin_distribution(5))
})

test_that('bin_cumulative with invalid numbers', {
  expect_error(bin_cumulative(5, -0.1))
})

test_that('bin_cumulative with valid class',{
  expect_is(bin_cumulative(5, 0.5), 'bincum')
})

test_that('bin_cumulative with invalid length',{
  expect_error(bin_cumulative(5))
})
