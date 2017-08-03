#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;


arma::uvec remove_element(arma::uvec& x, int y){
  arma::uvec q1 = arma::find(x == y);
  if (!q1.empty()){
    x.shed_row(q1(0));
  }
  return x;
}

// [[Rcpp::export]]
NumericMatrix farthest_point_sampling_cpp(NumericMatrix dist,
                                          int k, 
                                          int initial_point_index = 0) {
  /*
  Farthest Point Sampling

  Parameters
  ==========
  compressed_lower_distance_matrix dist
    Original distance matrix
  int k 
    Number of points to sample
  int initial_point_index (default: 0)
    Index of point to start farthest point sampling with

  Return value
  ============
  The indices of the first k furthest points.
  */
  // initialize 
  int n = dist.nrow();
  arma::mat adist = arma::mat(dist.begin(), n, n, false); 
  arma::uvec reordering(k, arma::fill::ones);
  reordering *= initial_point_index - 1;
  arma::uvec preordering = arma::linspace<arma::uvec>(0, n-1, n);
  //return wrap(preordering);
  
  // find ordered indices
  for (int i = 1; i < k; ++i){
    preordering = remove_element(preordering, reordering(i-1)); 
    arma::uvec indices = reordering.rows(0, i-1);
    arma::mat local_dist = adist.submat(indices, preordering);
    arma::mat local_min_dist = arma::min(local_dist, 0);
    reordering(i) = preordering(local_min_dist.index_max());
  }
  
  // return updated distance
  return wrap(reordering + 1);
}
