#' Farthest point sampling
#' 
#' Farthest point sampling returns a reordering of the metric 
#' space P = {p_1, ..., p_k}, such that each p_i is the farthest 
#' point from the first i-1 points. 
#' 
#' @param dist Original distance matrix
#' @param k Number of points to sample
#' @param initial_point_index Index of p_1
#' 
#' @examples 
#' 
#' # generate data
#' df <- matrix(runif(200), ncol = 2)
#' dist_mat <- pdist(df)
#' # farthest point sampling
#' fps <- farthest_point_sampling(dist_mat)
#' # have a look at the fps distance matrix
#' rdist(df[fps[1:5], ])
#' dist_mat[fps, fps][1:5, 1:5]
#' @export
farthest_point_sampling <- function(dist,
                                    k = nrow(dist), 
                                    initial_point_index = 1L){
  dist <- as.matrix(dist)
  initial_point_index <- as.integer(initial_point_index)
  k <- as.integer(k)
  # sanity check
  stopifnot(nrow(dist) == ncol(dist))
  stopifnot(initial_point_index >= 0L)
  # farthest point sampling
  as.integer(farthest_point_sampling_cpp(dist, k, initial_point_index))
}