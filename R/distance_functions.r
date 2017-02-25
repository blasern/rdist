#' Pairwise distances
#' 
#' Computes pairwise distance between observations.
#' 
#' @param X A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @seealso \code{\link{pdist}}, \code{\link{cdist}}
#' @export
rdist <- function(X, metric = c("euclidean", "minkowski", "manhattan"), p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  ans <- switch(metric, 
                "euclidean" = euclidean_rdist(X), 
                "minkowski" = minkowski_rdist(X, p = p), 
                "manhattan" = manhattan_rdist(X))
  # change attributes
  attributes(ans) <- NULL
  attr(ans, "Size") <- nrow(X)
  attr(ans, "call") <- match.call()
  attr(ans, "method") <- metric
  class(ans) <- "dist"
  return(ans)
}

#' Pairwise distances
#' 
#' Computes pairwise distance between observations.
#' 
#' @param X A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @seealso \code{\link{rdist}}, \code{\link{cdist}}
#' @export
pdist <- function(X, metric = c("euclidean", "minkowski", "manhattan"), p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  switch(metric, 
         "euclidean" = euclidean_pdist(X), 
         "minkowski" = minkowski_pdist(X, p = p), 
         "manhattan" = manhattan_pdist(X))
}

#' Pairwise distances
#' 
#' Computes distance between each pair of the two collections of inputs. Returns a \code{matrix}.
#' 
#' @param X,Y A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @seealso \code{\link{rdist}}, \code{\link{pdist}}
#' @export
cdist <- function(X, Y, metric = c("euclidean", "minkowski", "manhattan"), p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  Y <- as.matrix(Y)
  stopifnot(ncol(X) == ncol(Y))
  # use metric
  switch(metric, 
         "euclidean" = euclidean_cdist(X, Y), 
         "minkowski" = minkowski_cdist(X, Y, p = p), 
         "manhattan" = manhattan_cdist(X, Y))
}