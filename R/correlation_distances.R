# correlation distances
correlation_rdist <- function(X){
  as.dist(sqrt((1 - cor(t(X)))/2))
}
correlation_pdist <- function(X){
  sqrt((1 - cor(t(X)))/2)
}
correlation_cdist <- function(X, Y){
  sqrt((1 - cor(t(X), t(Y)))/2)
}

# angular distances
angular_rdist <- function(X){
  as.dist(acos(cor(t(X))))
}
angular_pdist <- function(X){
  acos(cor(t(X)))
}
angular_cdist <- function(X, Y){
  acos(cor(t(X), t(Y))) 
}