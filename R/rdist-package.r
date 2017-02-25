#' rdist: an R package for distances
#'
#' \code{rdist} provide a common framework to calculate distances. There are three main functions: 
#' \itemize{
#' \item \code{\link{rdist}} computes the pairwise distances between observations in one matrix and returns a \code{dist} object,
#' \item \code{\link{pdist}} computes the pairwise distances between observations in one matrix and returns a \code{matrix}, and
#' \item \code{\link{cdist}} computes the distances between observations in two matrices and returns a \code{matrix}. 
#' }
#' All functions have an argument \code{metric} that can be used to specify the distance function. 
#' @name rdist-package
#' @docType package
#' @useDynLib rdist
#' @importFrom Rcpp sourceCpp
NULL

