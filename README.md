# rdist

An R package to calculate distances. This provide a common framework to calculate distances.  
There are three main functions: 
- `rdist` computes the pairwise distances between observations in one matrix and returns a `dist` object,
- `pdist` computes the pairwise distances between observations in one matrix and returns a `matrix`, and
- `cdist` computes the distances between observations in two matrices and returns a `matrix`. 

All functions have an argument `metric` that can be used to specify the distance function. 

## Installation 

To install the latest version of this R package directly from github:

    install.packages("devtools")
    devtools::install_github("blasern/rdist")

## Development

This package currently includes the metrics `"euclidean"`, `"minkowski"`, `"manhattan"`, `"maximum"`, `"angular"` and `"correlation"`. The inclusion of further metrics are planned. 
If you would like to contribute, please [create a pull request](https://github.com/blasern/fastmetrics/compare).