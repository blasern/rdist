context("hamming")

test_that("hamming metric works as expected", {
  # generate data
  x <- matrix(sample(1:5, 200, replace = TRUE), nrow = 100)

  # reference result
  n <- nrow(x)
  m <- matrix(0, nrow=n, ncol=n)
  for(i in seq_len(n - 1))
    for(j in seq(i, n))
      m[j, i] <- m[i, j] <- sum(x[i,] != x[j,])
  dist_mat <- m/ncol(x)
  dist_dist <- as.dist(dist_mat)
  
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x, metric = "hamming"))
  expect_equivalent(dist_mat, pdist(x, metric = "hamming"))
  expect_equivalent(dist_mat, cdist(x, x, metric = "hamming"))
  expect_equivalent(dist_mat[1:2, 3:100], 
                    cdist(x[1:2, ], x[3:100, ], metric = "hamming"))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], 
                    cdist(x[1, , drop = FALSE], x[2:100, , drop = FALSE], metric = "hamming"))
})
