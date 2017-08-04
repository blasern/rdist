#include <Rcpp.h>

// [[Rcpp::export]]
bool cpp_triangle_inequality(Rcpp::NumericMatrix mat, double tolerance = 0) {
  int n = mat.nrow();
  
  for (int i = 0; i < n; ++i){
    for (int j = 0; j < i; ++j){
      for (int k = 0; k < n; ++k){
        bool ieq = mat(i, j) <= mat(i, k) + mat(k, j) + tolerance;
        if (!ieq){
          Rcpp::Rcout << "mat[" << i+1 << ", " << j+1 << "] > mat[" << i+1 << ", " << k+1 << "] + mat[" << k+1 << ", " << j+1 << "]" << std::endl;
          return false;
        }
      }
    }
  }
  
  return true; 
}