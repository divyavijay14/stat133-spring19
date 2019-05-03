library(testthat)
context("check summary measures")

test_that('aux_mean with valid length', {
  expect_length(aux_mean(10, 0.3), 1)
  expect_length(aux_mean(5, 0.1), 1)
})

test_that('aux_mean with invalid length', {
  expect_error(aux_mean(10, 0.3, 2))
  expect_error(aux_mean(5, 0.1, 0))
})

test_that('aux_mean with invalid numbers', {
  expect_error(aux_mean(-1, 1))
})

test_that('aux_variance with valid length', {
  expect_length(aux_variance(10, 0.3), 1)
  expect_length(aux_variance(5, 0.1), 1)
})

test_that('aux_variance with invalid length', {
  expect_error(aux_variance(10, 0.3, 2))
  expect_error(aux_mean(5, 0.1, 0))
})

test_that('aux_variance with invalid numbers', {
  expect_error(aux_variance(-1, 0))
})

test_that('aux_mode with valid length', {
  expect_length(aux_mode(10, 0.3), 1)
  expect_length(aux_mode(5, 0.1), 1)
})


test_that('aux_mode with invalid length', {
  expect_error(aux_mode(10, 0.3, 2))
  expect_error(aux_mode(5, 0.1, 0))
})

test_that('aux_mode with invalid numbers', {
  expect_error(aux_mode(-1, 0))
})

test_that('aux_skewness with valid length', {
  expect_length(aux_skewness(10, 0.3), 1)
  expect_length(aux_skewness(5, 0.1), 1)
})

test_that('aux_skewness with invalid length', {
  expect_error(aux_skewness(10, 0.3, 2))
  expect_error(aux_skewness(5, 0.1, 0))
})

test_that('aux_skewness with invalid numbers', {
  expect_error(aux_skewness(-1, 0))
})

test_that('aux_kurtosis with valid length', {
  expect_length(aux_kurtosis(10, 0.3), 1)
  expect_length(aux_kurtosis(5, 0.1), 1)
})

test_that('aux_kurtosis with invalid length', {
  expect_error(aux_kurtosis(10, 0.3, 2))
  expect_error(aux_kurtosis(5, 0.1, 0))
})

test_that('aux_kurtosis with invalid numbers', {
  expect_error(aux_kurtosis(-1, 0))
})

