#' Pairwise distances
#' 
#' Computes distance between each pair of the two collections of inputs.
#' 
#' @param X,Y A matrix
#' @param metric The distance metric to use
#' @export
cdist <- function(X, Y, metric = "euclidean"){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  Y <- as.matrix(Y)
  # use metric
  switch(metric, 
         "euclidean" = euclidean_distance(X, Y))
}

#' Pairwise distances
#' 
#' Computes pairwise distance between observations.
#' 
#' @param X A matrix
#' @param metric The distance metric to use
#' @export
pdist <- function(X, metric = "euclidean"){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  switch(metric, 
         "euclidean" = pairwise_euclidean_distance(X))
}