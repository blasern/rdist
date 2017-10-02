context("minkowski")

test_that("user-defined metric works as expected", {
  x <- matrix(rnorm(200), nrow = 100)
  
  # euclidean metric
  euclidean_function <- function(x, y){
    sqrt(sum((x-y)^2))
  }
  dist_dist <- dist(x, method = "euclidean")
  dist_mat <- as.matrix(dist_dist)
  attr(dist_mat, "dimnames") <- NULL
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = euclidean_function))
  expect_equivalent(dist_mat, pdist(x, metric = euclidean_function))
  expect_equivalent(dist_mat, cdist(x, x, metric = euclidean_function))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = euclidean_function))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = euclidean_function))
  
  # manhattan metric
  manhattan_function <- function(x, y){
    sum(abs(x-y))
  }
  dist_dist <- dist(x, method = "manhattan")
  dist_mat <- as.matrix(dist_dist)
  attr(dist_mat, "dimnames") <- NULL
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = manhattan_function))
  expect_equivalent(dist_mat, pdist(x, metric = manhattan_function))
  expect_equivalent(dist_mat, cdist(x, x, metric = manhattan_function))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = manhattan_function))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = manhattan_function))
  
  # maximum metric 
  maximum_function <- function(x, y){
    max(abs(x-y))
  }
  dist_dist <- dist(x, method = "maximum")
  dist_mat <- as.matrix(dist_dist)
  attr(dist_mat, "dimnames") <- NULL
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = maximum_function))
  expect_equivalent(dist_mat, pdist(x, metric = maximum_function))
  expect_equivalent(dist_mat, cdist(x, x, metric = maximum_function))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = maximum_function))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = maximum_function))
})
