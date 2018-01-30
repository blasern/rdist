#ifndef CANBERRA_
#define CANBERRA_

#include <RcppArmadillo.h>

Rcpp::NumericVector canberra_rdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix canberra_pdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix canberra_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B);

#endif // CANBERRA_