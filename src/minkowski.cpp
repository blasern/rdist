// adjusted from https://www.r-bloggers.com/pairwise-distances-in-r/
#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;
 
// [[Rcpp::export]]
NumericMatrix minkowski_distance(NumericMatrix A, NumericMatrix B, float p) {
  int m = A.nrow(), n = B.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), m, k, false); 
  arma::mat Br = arma::mat(B.begin(), n, k, false); 
  
  arma::mat C(m, n);
  
  for (int i = 0; i < m; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      C(i, j) = sum(pow(abs(Arow - Br.row(j)), p)); 
    }
  }
  
  return wrap(pow(C, 1/p)); 
}

// [[Rcpp::export]]
NumericMatrix pairwise_minkowski_distance(NumericMatrix A, float p) {
  int n = A.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  arma::mat C(n, n);
  
  for (int i = 0; i < n; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      C(i, j) = sum(pow(abs(Arow - Ar.row(j)), p)); 
    }
  }
  
  return wrap(pow(C, 1/p)); 
}