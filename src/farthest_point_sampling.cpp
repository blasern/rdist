#include "dist.h"
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
                                          int initial_point_index = 0, 
                                          bool return_clusters = false) {
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
  arma::urowvec cluster_mat(n);
  cluster_mat.fill(0);
  
  // find ordered indices
  if (metric == "precomputed"){
    arma::mat local_dist;
    for (int i = 1; i < k; ++i){
      preordering = remove_element(preordering, reordering(i-1)); 
      arma::uvec indices = reordering.rows(0, i-1);
      local_dist = amat.submat(indices, preordering);
      arma::mat local_min_dist = arma::min(local_dist, 0);
      reordering(i) = preordering(local_min_dist.index_max());
    }
    if (return_clusters){
      arma::mat complete_local_dist = amat.rows(reordering);
      cluster_mat = arma::index_min(complete_local_dist, 0);
    }
  }
  else {
    arma::mat local_min_dist;
    
    for (int i = 1; i <= k; ++i){
      preordering = remove_element(preordering, reordering(i-1)); 
      arma::uvec indices = reordering.rows(0, i-1);
      
      arma::mat m_indices = amat.row(reordering(i-1));
      NumericMatrix mat_indices = wrap(m_indices);
      
      NumericMatrix n_dist = cdist_cpp(mat_indices, mat, metric, 2);
        
      arma::mat new_dist = arma::mat(n_dist.begin(), n_dist.ncol(), 1, false); 
      if (i == 1){
        local_min_dist = new_dist;
      }
      arma::mat local_dist = arma::join_rows(local_min_dist, new_dist);
      local_min_dist = arma::min(local_dist, 1);
      if (return_clusters){
        arma::urowvec pre_cluster_mat = arma::find(arma::index_min(local_dist, 1)).t();
        arma::urowvec new_clusters(pre_cluster_mat.n_elem);
        new_clusters.fill(i-1);
        cluster_mat.elem(pre_cluster_mat) = new_clusters;
      }
      arma::mat local_local_min_dist = local_min_dist.elem(preordering);
      if (i < k){
        reordering(i) = preordering(local_local_min_dist.index_max());
      }
    }
  }
  
  // return reordering
  NumericMatrix output = wrap(reordering + 1);
  if (return_clusters){
    NumericVector clusters = wrap(cluster_mat + 1);
    output.attr("clusters") = clusters;
  }
  return output;
}
