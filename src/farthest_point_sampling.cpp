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
NumericMatrix farthest_point_sampling_cpp(NumericMatrix mat,
                                          String metric,
                                          int k, 
                                          int initial_point_index = 0) {
  /*
  Farthest Point Sampling

  Parameters
  ==========
  NumericMatrix mat
    Original data or distance matrix
  String metric
    Metric used
  int k 
    Number of points to sample
  int initial_point_index (default: 0)
    Index of point to start farthest point sampling with

  Return value
  ============
  The indices of the first k furthest points.
  */
  // initialize 
  int n = mat.nrow();
  int m = mat.ncol();
  arma::mat amat = arma::mat(mat.begin(), n, m, false); 
  arma::uvec reordering(k, arma::fill::ones);
  reordering *= initial_point_index - 1;
  arma::uvec preordering = arma::linspace<arma::uvec>(0, n-1, n);
  //return wrap(preordering);
  
  // find ordered indices
  if (metric == "precomputed"){
    for (int i = 1; i < k; ++i){
      preordering = remove_element(preordering, reordering(i-1)); 
      arma::uvec indices = reordering.rows(0, i-1);
      arma::mat local_dist = amat.submat(indices, preordering);
      arma::mat local_min_dist = arma::min(local_dist, 0);
      reordering(i) = preordering(local_min_dist.index_max());
    }
  }
  else {
    Environment rdist("package:rdist");
    Function cdist = rdist["cdist"];
    arma::mat local_min_dist;
    
    for (int i = 1; i < k; ++i){
      preordering = remove_element(preordering, reordering(i-1)); 
      arma::uvec indices = reordering.rows(0, i-1);
      
      arma::mat m_indices = amat.row(reordering(i-1));
      NumericMatrix mat_indices = wrap(m_indices);
      
      NumericMatrix n_dist = cdist(mat_indices, mat, metric);
        
      arma::mat new_dist = arma::mat(n_dist.begin(), n_dist.ncol(), 1, false); 
      if (i == 1){
        local_min_dist = new_dist;
      }
      arma::mat local_dist = arma::join_rows(local_min_dist, new_dist);
      local_min_dist = arma::min(local_dist, 1);
      arma::mat local_local_min_dist = local_min_dist.elem(preordering);
      reordering(i) = preordering(local_local_min_dist.index_max());
    }
  }
  
  // return updated distance
  return wrap(reordering + 1);
}
