#ifndef DIST_
#define DIST_

#include <RcppArmadillo.h>

Rcpp::NumericVector rdist_cpp(Rcpp::NumericMatrix A, Rcpp::String metric, double p);
Rcpp::NumericMatrix pdist_cpp(Rcpp::NumericMatrix A, Rcpp::String metric, double p);
Rcpp::NumericMatrix cdist_cpp(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B, Rcpp::String metric, double p);

#endif // DIST_
