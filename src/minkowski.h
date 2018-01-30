#ifndef MINKOWSKI_
#define MINKOWSKI_

#include <RcppArmadillo.h>

Rcpp::NumericVector minkowski_rdist(Rcpp::NumericMatrix A, double p);
Rcpp::NumericMatrix minkowski_pdist(Rcpp::NumericMatrix A, double p);
Rcpp::NumericMatrix minkowski_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B, double p);

#endif // MINKOWSKI_
