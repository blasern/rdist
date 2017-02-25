context("correlation")

test_that("correlation metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_mat <- sqrt((1 - cor(t(x)))/2)
  dist_dist <- as.dist(dist_mat)
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = "correlation"))
  expect_equal(dist_mat, pdist(x, metric = "correlation"))
  expect_equal(dist_mat, cdist(x, x, metric = "correlation"))
  expect_equal(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ], metric = "correlation"))
  expect_equal(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ], metric = "correlation"))
})
