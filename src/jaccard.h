#ifndef JACCARD_
#define JACCARD_

#include <RcppArmadillo.h>

Rcpp::NumericVector jaccard_rdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix jaccard_pdist(Rcpp::NumericMatrix A);
Rcpp::NumericMatrix jaccard_cdist(Rcpp::NumericMatrix A, Rcpp::NumericMatrix B);

#endif // JACCARD_