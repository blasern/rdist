context("euclidean")

test_that("euclidean metric works as expected", {
  x <- matrix(runif(200), nrow = 100)
  
  # reference results
  dist_dist <- dist(x)
  dist_mat <- as.matrix(dist_dist)
  # check pdist and cdist 
  expect_equivalent(dist_dist, rdist(x))
  expect_equivalent(dist(rbind(x[1:5, ], x[1:5,])), rdist(rbind(x[1:5, ], x[1:5,])))
  expect_equivalent(dist_mat, pdist(x))
  expect_equivalent(dist_mat, cdist(x, x))
  expect_equivalent(dist_mat[1:2, 3:100], cdist(x[1:2, ], x[3:100, ]))
  expect_equivalent(dist_mat[1, 2:100, drop = FALSE], cdist(x[1, , drop = FALSE], x[2:100, ]))
})