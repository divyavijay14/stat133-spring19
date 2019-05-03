library(testthat)
context("check checker functions")


test_that('check_prob with invalid numbers', {
  expect_error(check_prob(1.2))
  expect_error(check_prob(-0.3))
})

test_that('check_prob with valid length', {

  expect_error(check_prob(0.3, 0.4))
  expect_error(check_prob(0.1, 0.2, 0.3))
})

test_that('check_prob with valid number', {
  expect_true(check_prob(0.3))
  expect_true(check_prob(0.4))
})


test_that('check_trials with valid number', {
  expect_true(check_trials(4))
  expect_true(check_trials(8))
})

test_that('check_trials with invalid numbers', {
  expect_error(check_trials(-4))
  expect_error(check_trials(0))
})

test_that('check_trials with valid length', {
  expect_error(check_trials(3, 4))
  expect_error(check_trials(4, 5, 6))
})

test_that('check_success with valid number', {
  expect_true(check_success(2, 4))
  expect_true(check_success(3, 3))
})


test_that('check_success with invalid number', {
  expect_error(check_success(4, 3))
  expect_error(check_success(-3, 2))
})

test_that('check_success with invalid length', {
  expect_error(check_success(2, 4, 3))
  expect_error(check_success(3))
})
