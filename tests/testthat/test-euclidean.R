context("euclidean")

test_that("euclidean metric works as expected", {
  x <- as.matrix(runif(100))
  expect_equivalent(as.matrix(dist(x)), pairwise_euclidean_distance(x))
})
