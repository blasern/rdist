# distances with user-defined functions
FUN_rdist <- function(X, metric = function(x, y) sqrt(sum((x-y)^2))){
  as.dist(FUN_pdist(X, metric = metric))
}

FUN_pdist <- function(X, metric = function(x, y) sqrt(sum((x-y)^2))){
  res <- apply(X, 1, function(x){
    apply(X, 1, function(y){
      metric(x, y)
    })
  })
  # fixing dimensions
  dim(res) <- rep(nrow(X), 2)
  res
}

FUN_cdist <- function(X, Y, metric = function(x, y) sqrt(sum((x-y)^2))){
  res <- apply(Y, 1, function(y){
    apply(X, 1, function(x){
      metric(x, y)
    })
  })
  # fixing dimensions
  dim(res) <- c(nrow(X), nrow(Y))
  res
}
