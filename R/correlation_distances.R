bound <- function(x, min = -1, max = 1){
  x[x > max] <- max
  x[x < min] <- min
  x
}

# correlation distances
correlation_rdist <- function(X){
  as.dist(sqrt((1 - bound(cor(t(X))))/2))
}
correlation_pdist <- function(X){
  sqrt((1 - bound(cor(t(X))))/2)
}
correlation_cdist <- function(X, Y){
  sqrt((1 - bound(cor(t(X), t(Y))))/2)
}

# angular distances
angular_rdist <- function(X){
  as.dist(acos(bound(cor(t(X)))))
}
angular_pdist <- function(X){
  acos(bound(cor(t(X))))
}
angular_cdist <- function(X, Y){
  acos(bound(cor(t(X), t(Y))))
}

# absolute correlation distances
absolute_correlation_rdist <- function(X){
  as.dist(sqrt(1 - bound(cor(t(X))) ^ 2))
}
absolute_correlation_pdist <- function(X){
  sqrt(1 - bound(cor(t(X))) ^ 2)
}
absolute_correlation_cdist <- function(X, Y){
  sqrt(1 - bound(cor(t(X), t(Y))) ^ 2)
}