context("minkowski")

test_that("minkowski metric works as expected", {
  x <- matrix(rnorm(200), nrow = 100)
  
  # p = 2
  p <- 2
  dist_mat <- as.matrix(dist(x, method = "minkowski", p = p))
  # check pdist and cdist 
  expect_equivalent(dist_mat, pdist(x, metric = "minkowski", p = p))
  expect_equivalent(dist_mat, cdist(x, x, metric = "minkowski", p = p))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = "minkowski", p = p))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "minkowski", p = p))
  
  # p = 1:
  p <- 1
  dist_mat <- as.matrix(dist(x, method = "minkowski", p = p))
  # check pdist and cdist 
  expect_equal(dist_mat, 
               pdist(x, metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat, 
               cdist(x, x, metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat[1:2, 3:100], 
               cdist(x[1:2, ], x[3:100, ], metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], 
               cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "minkowski", p = p), 
               check.attributes = FALSE)
  
  # p = 100:
  p <- 100
  dist_mat <- as.matrix(dist(x, method = "minkowski", p = p))
  # check pdist and cdist 
  expect_equal(dist_mat, 
               pdist(x, metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat, 
               cdist(x, x, metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat[1:2, 3:100], 
               cdist(x[1:2, ], x[3:100, ], metric = "minkowski", p = p), 
               check.attributes = FALSE)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], 
               cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "minkowski", p = p), 
               check.attributes = FALSE)
})
