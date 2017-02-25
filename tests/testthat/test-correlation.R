context("correlation")

bound <- function(x, min = -1, max = 1){
  x[x > max] <- max
  x[x < min] <- min
  x
}

test_that("correlation metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_mat <- sqrt((1 - bound(cor(t(x))))/2)
  dist_dist <- as.dist(dist_mat)
  # check pdist and cdist 
  expect_equal(dist_dist, rdist(x, metric = "correlation"), tolerance = 1e-7, check.attributes = FALSE)
  expect_equal(dist_mat, pdist(x, metric = "correlation"), tolerance = 1e-7)
  expect_equal(dist_mat, cdist(x, x, metric = "correlation"), tolerance = 1e-7)
  expect_equal(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ], metric = "correlation"), tolerance = 1e-7)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ], metric = "correlation"), tolerance = 1e-7)
})

test_that("angular metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_mat <- acos(bound(cor(t(x))))
  dist_dist <- as.dist(dist_mat)
  # check pdist and cdist 
  expect_equal(dist_dist, rdist(x, metric = "angular"), tolerance = 1e-7, check.attributes = FALSE)
  expect_equal(dist_mat, pdist(x, metric = "angular"), tolerance = 1e-7)
  expect_equal(dist_mat, cdist(x, x, metric = "angular"), tolerance = 1e-7)
  expect_equal(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ], metric = "angular"), tolerance = 1e-7)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ], metric = "angular"), tolerance = 1e-7)
})

test_that("absolute correlation metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_mat <- sqrt((1 - bound(cor(t(x)))^2))
  dist_dist <- as.dist(dist_mat)
  # check pdist and cdist 
  expect_equal(dist_dist, rdist(x, metric = "absolute_correlation"), tolerance = 1e-7, check.attributes = FALSE)
  expect_equal(dist_mat, pdist(x, metric = "absolute_correlation"), tolerance = 1e-7)
  expect_equal(dist_mat, cdist(x, x, metric = "absolute_correlation"), tolerance = 1e-7)
  expect_equal(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ], metric = "absolute_correlation"), tolerance = 1e-7)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ], metric = "absolute_correlation"), tolerance = 1e-7)
})
