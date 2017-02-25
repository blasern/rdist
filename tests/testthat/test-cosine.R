context("cosine")

test_that("cosine metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_mat <- 1 - x%*%t(x)/(sqrt(rowSums(x^2) %*% t(rowSums(x^2))))
  dist_dist <- as.dist(dist_mat)
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = "cosine"))
  expect_equal(dist_mat, pdist(x, metric = "cosine"))
  expect_equal(dist_mat, cdist(x, x, metric = "cosine"))
  expect_equal(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ], metric = "cosine"))
  expect_equal(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ], metric = "cosine"))
})