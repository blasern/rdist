#ifndef HAMMING_
#define HAMMING_

#include <RcppArmadillo.h>

Rcpp::NumericVector hamming_rdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix hamming_pdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix hamming_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B);

#endif // HAMMING_