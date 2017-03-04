# rdist

An R package to calculate distances. This provide a common framework to calculate distances.  
There are three main functions: 
- `rdist` computes the pairwise distances between observations in one matrix and returns a `dist` object,
- `pdist` computes the pairwise distances between observations in one matrix and returns a `matrix`, and
- `cdist` computes the distances between observations in two matrices and returns a `matrix`. 

All functions have an argument `metric` that can be used to specify the distance function. All functions will return NA or NaN when one of the compared vectors contains NAs.

## Installation 

To install the latest version of this R package directly from github:

    install.packages("devtools")
    devtools::install_github("blasern/rdist")

## Development

This package currently includes the metrics `"euclidean"`, `"minkowski"`, `"manhattan"`, `"maximum"`, `"angular"`, `"correlation"`, `"absolute_correlation"`, `"hamming"`, and `"jaccard"`. The inclusion of further metrics are planned. 
If you find issues, please [let me know](https://github.com/blasern/rdist/issues). 
If you would like to contribute, please [create a pull request](https://github.com/blasern/rdist/compare).