#' Pairwise distances
#' 
#' Computes distance between each pair of the two collections of inputs.
#' 
#' @param X,Y A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @export
cdist <- function(X, Y, metric = c("euclidean", "minkowski", "manhattan"), p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  Y <- as.matrix(Y)
  stopifnot(ncol(X) == ncol(Y))
  # use metric
  switch(metric, 
         "euclidean" = euclidean_distance(X, Y), 
         "minkowski" = minkowski_distance(X, Y, p = p), 
         "manhattan" = manhattan_distance(X, Y))
}

#' Pairwise distances
#' 
#' Computes pairwise distance between observations.
#' 
#' @param X A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @export
pdist <- function(X, metric = c("euclidean", "minkowski", "manhattan"), p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  switch(metric, 
         "euclidean" = pairwise_euclidean_distance(X), 
         "minkowski" = pairwise_minkowski_distance(X, p = p), 
         "manhattan" = pairwise_manhattan_distance(X))
}