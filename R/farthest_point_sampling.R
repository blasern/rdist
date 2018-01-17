#' Farthest point sampling
#' 
#' Farthest point sampling returns a reordering of the metric 
#' space P = {p_1, ..., p_k}, such that each p_i is the farthest 
#' point from the first i-1 points. 
#' 
#' @param mat Original distance matrix
#' @param metric Distance metric to use (either "precomputed" or a metric from \code{\link{rdist}})
#' @param k Number of points to sample
#' @param initial_point_index Index of p_1
#' @param return_clusters Should the indices of the closest farthest points be returned? 
#' 
#' @examples 
#' 
#' # generate data
#' df <- matrix(runif(200), ncol = 2)
#' dist_mat <- pdist(df)
#' # farthest point sampling
#' fps <- farthest_point_sampling(dist_mat)
#' fps2 <- farthest_point_sampling(df, metric = "euclidean")
#' all.equal(fps, fps2)
#' # have a look at the fps distance matrix
#' rdist(df[fps[1:5], ])
#' dist_mat[fps, fps][1:5, 1:5]
#' @export
farthest_point_sampling <- function(mat,
                                    metric = "precomputed", 
                                    k = nrow(mat), 
                                    initial_point_index = 1L, 
                                    return_clusters = FALSE){
  metric <- match.arg(metric, c("precomputed", available_metrics))
  mat <- as.matrix(mat)
  initial_point_index <- as.integer(initial_point_index)
  k <- as.integer(k)
  # sanity check
  if (metric == "precomputed"){
    stopifnot(nrow(mat) == ncol(mat))
  }
  stopifnot(initial_point_index >= 0L)
  # farthest point sampling
  fps <- farthest_point_sampling_cpp(mat, metric, k, initial_point_index, return_clusters)
  if (return_clusters){
    clusters <- as.integer(attr(fps, "clusters"))
    fps <- as.integer(fps)
    return(list(fps, clusters))
  }
  else {
    fps <- as.integer(fps)
    return(fps)
  }
}