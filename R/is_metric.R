#' Metric and triangle inequality
#' 
#' Does the distance matric come from a metric
#' 
#' @param mat The matrix to evaluate
#' @param tolerance Differences smaller than tolerance are not reported.
#' @name is_metric
#' @export
is_distance_matrix <- function(mat, tolerance = .Machine$double.eps ^ 0.5){
  mat <- as.matrix(mat)
  msg <- character(0)
  # 
  not_square <- nrow(mat) != ncol(mat)
  if (not_square){
    msg <- c(msg, "Matrix is not square.")
    assymetric <- TRUE
  }
  else {
    assymetric <- all.equal(mat, t(mat), tolerance = tolerance)
    if (assymetric){
      msg <- c(msg, "Matrix is not symmetric.")
    }
  }
  negative <- any(mat < 0 - tolerance)
  if (negative){
    msg <- c(msg, "Matrix is not positive.")
  }
  identity <- !all.equal(diag(mat), rep(0, nrow(mat)))
  if (identity){
    msg <- c(msg, "Diagonal is not zero.")
  }
  if (!(not_square | assymetric | negative | identity)){
    triangle <- triangle_inequality(mat, tolerance = tolerance)
    if (!triangle){
      msg <- c(msg, "Matrix does not satisfy triangle inequality.")
    }
  }
  dm <- length(msg) == 0
  if (!dm){
    cat(paste(msg, "\n", collapse = ""))
  }
  return(dm)  
}

#' @rdname is_metric
#' @export
triangle_inequality <- function(mat, tolerance = .Machine$double.eps ^ 0.5){
  mat <- as.matrix(mat)
  stopifnot(nrow(mat) == ncol(mat), 
            !all.equal(mat, t(mat), tolerance = tolerance))
  cpp_triangle_inequality(mat, tolerance)
}