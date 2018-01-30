#ifndef MAXIMUM_
#define MAXIMUM_

#include <RcppArmadillo.h>

Rcpp::NumericVector maximum_rdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix maximum_pdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix maximum_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B);

#endif // MAXIMUM_