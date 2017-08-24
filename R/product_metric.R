#' Product metric
#' 
#' Returns the p-product metric of two metric spaces. 
#' Works for output of `rdist`, `pdist` or `cdist`.
#' 
#' @param ... Distance matrices or dist objects
#' @param p The power of the Minkowski distance
#' 
#' @examples 
#' # generate data
#' df <- matrix(runif(200), ncol = 2)
#' # distance matrices
#' dist_mat <- pdist(df)
#' dist_1 <- pdist(df[, 1])
#' dist_2 <- pdist(df[, 2])
#' # product distance matrix
#' dist_prod <- product_metric(dist_1, dist_2)
#' # check equality
#' all.equal(dist_mat, dist_prod)
#' @importFrom methods is
#' @export
product_metric <- function(..., p = 2){
  metrics <- list(...)
  # check for equal dimension
  stopifnot(length(unique(lapply(metrics, dim))) == 1, 
            length(unique(lapply(metrics, length))) == 1)
  if (p < Inf){
    p_metrics <- lapply(metrics, `^`, p)
    p_result <- Reduce(`+`, p_metrics)
    res <- p_result ^ (1/p)
  }
  else {
    res <- pmax(...)
  }
  if (methods::is(metrics[[1]], "dist")) {
    attr(res, "call") <- match.call()
  } 
  return(res)
}