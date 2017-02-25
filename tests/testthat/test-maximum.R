context("maximum")

test_that("maximum metric works as expected", {
  x <- matrix(rnorm(200), nrow = 100)
  
  dist_dist <- dist(x, method = "maximum")
  dist_mat <- as.matrix(dist_dist)
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = "maximum"))
  expect_equivalent(dist_mat, pdist(x, metric = "maximum"))
  expect_equivalent(dist_mat, cdist(x, x, metric = "maximum"))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = "maximum"))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "maximum"))
})
