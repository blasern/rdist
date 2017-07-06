context("canberra")

test_that("canberra metric works as expected", {
  x <- matrix(sample(1:6, 200, replace = TRUE), nrow = 100)
  
  dist_dist <- dist(x, method = "canberra")
  dist_mat <- as.matrix(dist_dist)
  attr(dist_mat, "dimnames") <- NULL
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = "canberra"))
  expect_equivalent(dist_mat, pdist(x, metric = "canberra"))
  expect_equivalent(dist_mat, cdist(x, x, metric = "canberra"))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = "canberra"))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "canberra"))
})
