// adjusted from https://www.r-bloggers.com/pairwise-distances-in-r/
#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
 
using namespace Rcpp;
 
// [[Rcpp::export]]
NumericMatrix euclidean_distance(NumericMatrix A, NumericMatrix B) {
    int m = A.nrow(), 
        n = B.nrow(),
        k = A.ncol();
    arma::mat Ar = arma::mat(A.begin(), m, k, false); 
    arma::mat Br = arma::mat(B.begin(), n, k, false); 
 
    arma::colvec An =  sum(square(Ar),1);
    arma::colvec Bn =  sum(square(Br),1);
 
    arma::mat C = -2 * (Ar * Br.t());
    C.each_col() += An;
    C.each_row() += Bn.t();
 
    return wrap(sqrt(C)); 
}

// [[Rcpp::export]]
NumericMatrix pairwise_euclidean_distance(NumericMatrix A) {
    int n = A.nrow(), 
        k = A.ncol();
    arma::mat Ar = arma::mat(A.begin(), n, k, false); 
 
    arma::colvec An =  sum(square(Ar),1);
 
    arma::mat C = -2 * (Ar * Ar.t());
    C.each_col() += An;
    C.each_row() += An.t();
 
    return wrap(sqrt(C)); 
}