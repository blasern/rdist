#ifndef MANHATTAN_
#define MANHATTAN_

#include <RcppArmadillo.h>

Rcpp::NumericVector manhattan_rdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix manhattan_pdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix manhattan_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B);

#endif // MANHATTAN_