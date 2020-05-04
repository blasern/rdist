#include "canberra.h"
#include "minkowski.h"
#include "manhattan.h"
#include "maximum.h"
#include "hamming.h"
#include "jaccard.h"
#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector rdist_cpp(NumericMatrix A, String metric, double p=2.0) {
  NumericMatrix res;
  if (metric == "euclidean"){
    return minkowski_rdist(A, 2.0);
  }
  if (metric == "minkowski"){
    return minkowski_rdist(A, p);
  }
  if (metric == "manhattan"){
    return manhattan_rdist(A);
  }
  if (metric == "chebyshev"){
    return maximum_rdist(A);
  }
  if (metric == "maximum"){
    return maximum_rdist(A);
  }
  if (metric == "canberra"){
    return canberra_rdist(A);
  }
  if (metric == "angular"){ 
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function angular_rdist = package_env["angular_rdist"];
    return angular_rdist(A); 
  }
  if (metric == "correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function correlation_rdist = package_env["correlation_rdist"];
    return correlation_rdist(A);
  }
  if (metric == "absolute_correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function absolute_correlation_rdist = package_env["absolute_correlation_rdist"];
    return absolute_correlation_rdist(A);
  }
  if (metric == "hamming"){
    return hamming_rdist(A);
  }
  if (metric == "jaccard"){
    return jaccard_rdist(A);
  }
  Rcpp::stop("metric not recognized.");
  return NumericMatrix(0);
}

// [[Rcpp::export]]
NumericMatrix pdist_cpp(NumericMatrix A, String metric, double p=2.0) {
  NumericMatrix res;
  if (metric == "euclidean"){
    return minkowski_pdist(A, 2.0);
  }
  if (metric == "minkowski"){
    return minkowski_pdist(A, p);
  }
  if (metric == "manhattan"){
    return manhattan_pdist(A);
  }
  if (metric == "chebyshev"){
    return maximum_pdist(A);
  }
  if (metric == "maximum"){
    return maximum_pdist(A);
  }
  if (metric == "canberra"){
    return canberra_pdist(A);
  }
  if (metric == "angular"){ 
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function angular_pdist = package_env["angular_pdist"];
    return angular_pdist(A); 
  }
  if (metric == "correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function correlation_pdist = package_env["correlation_pdist"];
    return correlation_pdist(A);
  }
  if (metric == "absolute_correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function absolute_correlation_pdist = package_env["absolute_correlation_pdist"];
    return absolute_correlation_pdist(A);
  }
  if (metric == "hamming"){
    return hamming_pdist(A);
  }
  if (metric == "jaccard"){
    return jaccard_pdist(A);
  }
  Rcpp::stop("metric not recognized.");
  return NumericMatrix(0);
}

// [[Rcpp::export]]
NumericMatrix cdist_cpp(NumericMatrix A, NumericMatrix B, String metric, double p=2.0) {
  NumericMatrix res;
  if (metric == "euclidean"){
    return minkowski_cdist(A, B, 2.0);
  }
  if (metric == "minkowski"){
    return minkowski_cdist(A, B, p);
  }
  if (metric == "manhattan"){
    return manhattan_cdist(A, B);
  }
  if (metric == "chebyshev"){
    return maximum_cdist(A, B);
  }
  if (metric == "maximum"){
    return maximum_cdist(A, B);
  }
  if (metric == "canberra"){
    return canberra_cdist(A, B);
  }
  if (metric == "angular"){ 
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function angular_cdist = package_env["angular_cdist"];
    return angular_cdist(A, B); 
  }
  if (metric == "correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function correlation_cdist = package_env["correlation_cdist"];
    return correlation_cdist(A, B);
  }
  if (metric == "absolute_correlation"){
    Rcpp::Environment package_env("package:rdist");
    Rcpp::Function absolute_correlation_cdist = package_env["absolute_correlation_cdist"];
    return absolute_correlation_cdist(A, B);
  }
  if (metric == "hamming"){
    return hamming_cdist(A, B);
  }
  if (metric == "jaccard"){
    return jaccard_cdist(A, B);
  }
  Rcpp::stop("metric not recognized.");
  return NumericMatrix(0);
}

