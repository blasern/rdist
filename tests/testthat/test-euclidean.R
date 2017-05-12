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

test_that("euclidean metric works when distance is 0", {
  a <- c(-1.18541558816627, -1.37865753930762, -0.413418072278032, -0.327468637225544)
  b <- rnorm(4)
  amat <- matrix(c(a, a), nrow = 2, byrow = TRUE)
  bmat <- matrix(c(b, b), nrow = 2, byrow = TRUE)
  
  expect_equivalent(
    dist(amat, method="euclidean"), 
    rdist::rdist(amat, metric="euclidean")
  )
  expect_equivalent(
    dist(amat, method = "euclidean"),
    rdist::rdist(amat, metric="minkowski")
  )
  expect_equivalent(
    dist(bmat, method="euclidean"), 
    rdist::rdist(bmat, metric="euclidean")
  )
  expect_equivalent(
    dist(bmat, method = "euclidean"),
    rdist::rdist(bmat, metric="minkowski")
  )
})
