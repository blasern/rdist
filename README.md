# rdist

An R package to calculate pairwise distances. This should provide a framework to calculate most common distance functions.  
There are two main functions: 
- `pdist` computes the pairwise distances between observations in one matrix, and
- `cdist` computes the distances between observations in two matrices. 

Both functions have an argument `metric` that can be used to specify the distance function and both functions return a `matrix`. 

## Installation 

To install the latest version of this R package directly from github:

    install.packages("devtools")
    devtools::install_github("blasern/rdist")

## Development

This package currently includes the metrics `"euclidean"`, `"minkowski"` and `"manhattan"`. The inclusion of further metrics are planned. 
If you would like to contribute, please [create a pull request](https://github.com/blasern/fastmetrics/compare).