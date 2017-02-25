#' rdist: an R package for distances
#'
#' \code{rdist} provide a common framework to calculate distances. There are three main functions: 
#' \itemize{
#' \item \code{rdist} computes the pairwise distances between observations in one matrix and returns a \code{dist} object,
#' \item \code{pdist} computes the pairwise distances between observations in one matrix and returns a \code{matrix}, and
#' \item \code{cdist} computes the distances between observations in two matrices and returns a \code{matrix}. 
#' }
#' 
#' @details Available distance measures are (written for two vectors v and w):
#' \itemize{
#' \item \code{"euclidean"}: ...
#' \item \code{"minkowski"}: ...
#' \item \code{"manhattan"}: ...
#' \item \code{"maximum"} or \code{"chebyshev"}: ...
#' \item \code{"cosine"}: ...
#' }
#' @param X,Y A matrix
#' @param metric The distance metric to use
#' @param p The power of the Minkowski distance
#' @name rdist
#' @docType package
#' @useDynLib rdist
#' @importFrom Rcpp sourceCpp
NULL

