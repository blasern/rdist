# rdist 0.0.2
- Fixed bug in jaccard distance
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