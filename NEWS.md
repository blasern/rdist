# rdist 0.0.6
- Minor fix for CRAN

# rdist 0.0.5
- Minor fix for CRAN

# rdist 0.0.4
- Some bugfixes to make CRAN compatible

# rdist 0.0.3
- Added documentation pages
- Added `product_metric` 
- Added `farthest_point_sampling` 
- Added `is_distance_matrix` and `triangle_inequality` checks

# rdist 0.0.2
- Fixed bug in jaccard distance
- Fixed bug in euclidean distance
- Added labels to rdist output

# rdist 0.0.1
An R package to calculate distances. This provide a common framework to calculate distances.  
There are three main functions: 
- `rdist` computes the pairwise distances between observations in one matrix and returns a `dist` object,
- `pdist` computes the pairwise distances between observations in one matrix and returns a `matrix`, and
- `cdist` computes the distances between observations in two matrices and returns a `matrix`. 

All functions have an argument `metric` that can be used to specify the distance function. Available metrics are `"euclidean"`, `"minkowski"`, `"manhattan"`, `"maximum"`, `"canberra"`, `"angular"`, `"correlation"`, `"absolute_correlation"`, `"hamming"`, and `"jaccard"`. 
All functions will return NA or NaN when one of the compared vectors contains NAs.

## Installation 

To install the latest released version from CRAN:

    install.packages("rdist")

To install the latest development version from github:

    install.packages("devtools")
    devtools::install_github("blasern/rdist")

## Development
 
If you find issues, please [let me know](https://github.com/blasern/rdist/issues). 
If you would like to contribute, please [create a pull request](https://github.com/blasern/rdist/compare).
