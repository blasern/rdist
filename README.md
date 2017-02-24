# fastmetrics

An R package to calculate pairwise distances. This should provide a framework to calculate most common distance functions. 
There are two main functions: 
- `pdist` computes the pairwise distances between observations in one matrix, and
- `cdist` computes the distances between observations two matrices. 
Both functions have an argument `metric` that can be used to specify the distance function that should be calculated. 

## Installation 

To install the latest version of this R package directly from github:

    install.packages("devtools")
    devtools::install_github("blasern/fastmetrics")

## Development

This package currently includes the metrics `"euclidean"` and `"minkowski"` and further metrics are planned. 
If you would like to contribute, please [create a pull request](https://github.com/blasern/fastmetrics/compare).