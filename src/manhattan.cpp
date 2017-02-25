#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;
 
// [[Rcpp::export]]
NumericMatrix manhattan_distance(NumericMatrix A, NumericMatrix B) {
  int m = A.nrow(), n = B.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), m, k, false); 
  arma::mat Br = arma::mat(B.begin(), n, k, false); 
  
  arma::mat C(m, n);
  
  for (int i = 0; i < m; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      C(i, j) = sum(abs(Arow - Br.row(j))); 
    }
  }
  
  return wrap(C); 
}

// [[Rcpp::export]]
NumericMatrix pairwise_manhattan_distance(NumericMatrix A) {
  int n = A.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  arma::mat C(n, n);
  
  for (int i = 0; i < n; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      C(i, j) = sum(abs(Arow - Ar.row(j))); 
    }
  }
  
  return wrap(C); 
}