context("minkowski")

test_that("minkowski metric works as expected", {
  x <- structure(c(0.96, 0.17, 0.88, 0.92, 0.1, 0.6, 0.15, 0.73, 0.22, 
                   0.97, 0.98, 0.42, 0.41, 0.23, 0.39, 0.66, 0.09, 0.6, 0.15, 0.99, 
                   0.63, 1, 0.18, 0.07, 0.09, 0.78, 0.89, 0.33, 0.78, 0.03, 0.88, 
                   0.03, 0.67, 0.05, 0.25, 0.96, 0.51, 0.65, 0.8, 0.53, 0.54, 0.78, 
                   0.48, 0.67, 0.52, 0.88, 0.4, 0.56, 0.71, 0.44, 0.1, 0.87, 0.65, 
                   0.41, 0.02, 0.88, 0.43, 0.09, 0.98, 0.85, 0.48, 0.75, 0.97, 0.29, 
                   0.5, 0.99, 0.14, 0.83, 0.32, 0.31, 0.66, 0.27, 0.61, 0.54, 0.44, 
                   0.65, 0.1, 0.44, 0.33, 0.54, 0.35, 0.95, 0.94, 0.8, 0.32, 0.84, 
                   0.19, 0.16, 0.44, 0.81, 0.08, 0.84, 0.88, 0.81, 0.94, 0.35, 0.6, 
                   0.68, 0.2, 0.82, 0.44, 0.36, 0.34, 0.68, 0.43, 0.37, 0.95, 0.32, 
                   0.7, 0.85, 0.56, 0.67, 0.63, 0.52, 0.37, 0.58, 0.39, 0.47, 0.63, 
                   0.73, 0.45, 0.92, 0.99, 0.95, 0.44, 0.34, 0.78, 0.05, 0.09, 0.48, 
                   0.44, 0.78, 0.74, 0.76, 0.66, 0.78, 0.28, 0.73, 0.78, 0.08, 0.69, 
                   0.64, 0.39, 0.46, 0.99, 0.17, 0.59, 0.63, 0.46, 0.08, 0.42, 0.8, 
                   0.5, 0.15, 0.02, 0.47, 0.79, 0.83, 0.12, 0.08, 0.78, 0.5, 0.57, 
                   0.22, 0.57, 0.27, 0.43, 0.15, 0.15, 0.85, 0.11, 0.92, 0.43, 0.58, 
                   0.2, 0.57, 0.69, 0.92, 0.57, 0.7, 0.86, 0.96, 0.28, 0.92, 0.16, 
                   0.22, 0.12, 0.66, 0.7, 0.26, 0.75, 0.66, 0.01, 0.03, 0.29, 0.62, 
                   0.98, 0.69, 0.37, 0.84), 
                 .Dim = c(100L, 2L))
  
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
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat, 
               cdist(x, x, metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat[1:2, 3:100], 
               cdist(x[1:2, ], x[3:100, ], metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], 
               cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  
  # p = 100:
  p <- 100
  dist_mat <- as.matrix(dist(x, method = "minkowski", p = p))
  # check pdist and cdist 
  expect_equal(dist_mat, 
               pdist(x, metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat, 
               cdist(x, x, metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat[1:2, 3:100], 
               cdist(x[1:2, ], x[3:100, ], metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
  expect_equal(dist_mat[1, 2:100, drop = FALSE], 
               cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "minkowski", p = p), 
               tolerance = 1e-6, 
               check.attributes = FALSE)
})
