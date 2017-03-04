#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector jaccard_rdist(NumericMatrix A) {
  int n = A.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  NumericVector C(n * (n-1) / 2);
  
  int l = 0;
  for (int i = 0; i < n; ++i){
    arma::rowvec Arow = Ar.row(i);
    for (int j = i + 1; j < n; ++j){
      arma::urowvec zerovec = (Arow == 0);
      zerovec.elem( find(Ar.row(j) != 0) ).zeros();
      C(l) = (double)sum(Arow != Ar.row(j)) / (double)sum(zerovec != 1); 
      l++;
    }
  }
  
  return wrap(C); 
}

// [[Rcpp::export]]
NumericMatrix jaccard_pdist(NumericMatrix A) {
  int n = A.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), n, k, false); 
  
  arma::mat C(n, n);
  
  for (int i = 0; i < n; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      arma::urowvec zerovec = (Arow == 0);
      zerovec.elem( find(Ar.row(j) != 0) ).zeros();
      C(i, j)  = (double)sum(Arow != Ar.row(j)) / (double)sum(zerovec != 1); 
    }
  }
  
  return wrap(C); 
}

// [[Rcpp::export]]
NumericMatrix jaccard_cdist(NumericMatrix A, NumericMatrix B) {
  int m = A.nrow(), n = B.nrow(), k = A.ncol();
  
  arma::mat Ar = arma::mat(A.begin(), m, k, false); 
  arma::mat Br = arma::mat(B.begin(), n, k, false); 
  
  arma::mat C(m, n);
  
  for (int i = 0; i < m; ++i){
    arma::mat Arow = Ar.row(i);
    for (int j = 0; j < n; ++j){
      arma::urowvec zerovec = (Arow == 0);
      zerovec.elem( find(Br.row(j) != 0) ).zeros();
      C(i, j)  = (double)sum(Arow != Br.row(j)) / (double)sum(zerovec != 1); 
    }
  }
  
  return wrap(C); 
}