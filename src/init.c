#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP _rdist_canberra_cdist(SEXP, SEXP);
extern SEXP _rdist_canberra_pdist(SEXP);
extern SEXP _rdist_canberra_rdist(SEXP);
extern SEXP _rdist_euclidean_cdist(SEXP, SEXP);
extern SEXP _rdist_euclidean_pdist(SEXP);
extern SEXP _rdist_euclidean_rdist(SEXP);
extern SEXP _rdist_farthest_point_sampling_cpp(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _rdist_hamming_cdist(SEXP, SEXP);
extern SEXP _rdist_hamming_pdist(SEXP);
extern SEXP _rdist_hamming_rdist(SEXP);
extern SEXP _rdist_jaccard_cdist(SEXP, SEXP);
extern SEXP _rdist_jaccard_pdist(SEXP);
extern SEXP _rdist_jaccard_rdist(SEXP);
extern SEXP _rdist_manhattan_cdist(SEXP, SEXP);
extern SEXP _rdist_manhattan_pdist(SEXP);
extern SEXP _rdist_manhattan_rdist(SEXP);
extern SEXP _rdist_maximum_cdist(SEXP, SEXP);
extern SEXP _rdist_maximum_pdist(SEXP);
extern SEXP _rdist_maximum_rdist(SEXP);
extern SEXP _rdist_minkowski_cdist(SEXP, SEXP, SEXP);
extern SEXP _rdist_minkowski_pdist(SEXP, SEXP);
extern SEXP _rdist_minkowski_rdist(SEXP, SEXP);
extern SEXP _rdist_cpp_triangle_inequality(SEXP, SEXP);
extern SEXP _rdist_rdist_cpp(SEXP, SEXP, SEXP);
extern SEXP _rdist_pdist_cpp(SEXP, SEXP, SEXP);
extern SEXP _rdist_cdist_cpp(SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"_rdist_canberra_cdist",              (DL_FUNC) &_rdist_canberra_cdist,              2},
    {"_rdist_canberra_pdist",              (DL_FUNC) &_rdist_canberra_pdist,              1},
    {"_rdist_canberra_rdist",              (DL_FUNC) &_rdist_canberra_rdist,              1},
    {"_rdist_euclidean_cdist",             (DL_FUNC) &_rdist_euclidean_cdist,             2},
    {"_rdist_euclidean_pdist",             (DL_FUNC) &_rdist_euclidean_pdist,             1},
    {"_rdist_euclidean_rdist",             (DL_FUNC) &_rdist_euclidean_rdist,             1},
    {"_rdist_farthest_point_sampling_cpp", (DL_FUNC) &_rdist_farthest_point_sampling_cpp, 5},
    {"_rdist_hamming_cdist",               (DL_FUNC) &_rdist_hamming_cdist,               2},
    {"_rdist_hamming_pdist",               (DL_FUNC) &_rdist_hamming_pdist,               1},
    {"_rdist_hamming_rdist",               (DL_FUNC) &_rdist_hamming_rdist,               1},
    {"_rdist_jaccard_cdist",               (DL_FUNC) &_rdist_jaccard_cdist,               2},
    {"_rdist_jaccard_pdist",               (DL_FUNC) &_rdist_jaccard_pdist,               1},
    {"_rdist_jaccard_rdist",               (DL_FUNC) &_rdist_jaccard_rdist,               1},
    {"_rdist_manhattan_cdist",             (DL_FUNC) &_rdist_manhattan_cdist,             2},
    {"_rdist_manhattan_pdist",             (DL_FUNC) &_rdist_manhattan_pdist,             1},
    {"_rdist_manhattan_rdist",             (DL_FUNC) &_rdist_manhattan_rdist,             1},
    {"_rdist_maximum_cdist",               (DL_FUNC) &_rdist_maximum_cdist,               2},
    {"_rdist_maximum_pdist",               (DL_FUNC) &_rdist_maximum_pdist,               1},
    {"_rdist_maximum_rdist",               (DL_FUNC) &_rdist_maximum_rdist,               1},
    {"_rdist_minkowski_cdist",             (DL_FUNC) &_rdist_minkowski_cdist,             3},
    {"_rdist_minkowski_pdist",             (DL_FUNC) &_rdist_minkowski_pdist,             2},
    {"_rdist_minkowski_rdist",             (DL_FUNC) &_rdist_minkowski_rdist,             2},
    {"_rdist_cpp_triangle_inequality",     (DL_FUNC) &_rdist_cpp_triangle_inequality,     2},
    {"_rdist_rdist_cpp", 		   (DL_FUNC) &_rdist_rdist_cpp,                   3},	
    {"_rdist_pdist_cpp", 		   (DL_FUNC) &_rdist_pdist_cpp,                   3},	
    {"_rdist_cdist_cpp", 		   (DL_FUNC) &_rdist_cdist_cpp,                   4},	
    {NULL, NULL, 0}
};

void R_init_rdist(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
