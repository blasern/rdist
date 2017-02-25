#' @rdname rdist
#' @export
rdist <- function(X, 
                  metric = c("euclidean", "minkowski", "manhattan", "chebyshev", "maximum", 
                             "cosine"), 
                  p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  ans <- switch(metric, 
                "euclidean" = euclidean_rdist(X), 
                "minkowski" = minkowski_rdist(X, p = p), 
                "manhattan" = manhattan_rdist(X), 
                "chebyshev" = maximum_rdist(X), 
                "maximum" = maximum_rdist(X), 
                "cosine" = cosine_rdist(X))
  # change attributes
  attributes(ans) <- NULL
  attr(ans, "Size") <- nrow(X)
  attr(ans, "call") <- match.call()
  attr(ans, "method") <- metric
  class(ans) <- "dist"
  return(ans)
}

#' @rdname rdist
#' @export
pdist <- function(X, 
                  metric = c("euclidean", "minkowski", "manhattan", "chebyshev", "maximum", 
                             "cosine"), 
                  p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  # use metric
  switch(metric, 
         "euclidean" = euclidean_pdist(X), 
         "minkowski" = minkowski_pdist(X, p = p), 
         "manhattan" = manhattan_pdist(X), 
         "chebyshev" = maximum_pdist(X), 
         "maximum" = maximum_pdist(X), 
         "cosine" = cosine_pdist(X))
}

#' @rdname rdist
#' @export
cdist <- function(X, Y, 
                  metric = c("euclidean", "minkowski", "manhattan", "chebyshev", "maximum", 
                             "cosine"),
                  p = 2){
  # make sure input is well-defined
  metric <- match.arg(metric)
  X <- as.matrix(X)
  Y <- as.matrix(Y)
  stopifnot(ncol(X) == ncol(Y))
  # use metric
  switch(metric, 
         "euclidean" = euclidean_cdist(X, Y), 
         "minkowski" = minkowski_cdist(X, Y, p = p), 
         "manhattan" = manhattan_cdist(X, Y),
         "chebyshev" = maximum_cdist(X, Y),
         "maximum" = maximum_cdist(X, Y), 
         "cosine" = cosine_cdist(X, Y))
}