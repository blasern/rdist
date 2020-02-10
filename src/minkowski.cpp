#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector minkowski_rdist(NumericMatrix A, double p) {
  int n = A.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  arma::mat C(1, n * (n-1) / 2);
  
  int l = 0;
  for (int i = 0; i < n; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = i + 1; j < n; ++j){
      C(l) = sum(pow(abs(Arow - Ar.row(j)), p)); 
      l++;
    }
  }
  
  return wrap(pow(C, 1/p)); 
}

// [[Rcpp::export]]
NumericMatrix minkowski_pdist(NumericMatrix A, double p) {
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

// [[Rcpp::export]]
NumericMatrix minkowski_cdist(NumericMatrix A, NumericMatrix B, double p) {
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
