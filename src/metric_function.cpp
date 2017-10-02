#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix FUN_pdist(NumericMatrix A, Function FUN) {
  int n = A.nrow(), k = A.ncol();

  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  arma::mat out(n, n);
  
  for (int i = 0; i < n; ++i){
    arma::rowvec Ar_i = Ar.row(i);
    NumericVector A_i = Rcpp::NumericVector(Ar_i.begin(), Ar_i.end());
    
    for (int j = 0; j < n; ++j){
      arma::rowvec Ar_j = Ar.row(j);
      NumericVector A_j = Rcpp::NumericVector(Ar_j.begin(), Ar_j.end());
      out(i, j) = Rcpp::as<double>(FUN(A_i, A_j)); 
    }
  }
  
  return wrap(out); 
}