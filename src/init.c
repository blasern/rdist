#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP rdist_canberra_cdist(SEXP, SEXP);
extern SEXP rdist_canberra_pdist(SEXP);
extern SEXP rdist_canberra_rdist(SEXP);
extern SEXP rdist_euclidean_cdist(SEXP, SEXP);
extern SEXP rdist_euclidean_pdist(SEXP);
extern SEXP rdist_euclidean_rdist(SEXP);
extern SEXP rdist_hamming_cdist(SEXP, SEXP);
extern SEXP rdist_hamming_pdist(SEXP);
extern SEXP rdist_hamming_rdist(SEXP);
extern SEXP rdist_jaccard_cdist(SEXP, SEXP);
extern SEXP rdist_jaccard_pdist(SEXP);
extern SEXP rdist_jaccard_rdist(SEXP);
extern SEXP rdist_manhattan_cdist(SEXP, SEXP);
extern SEXP rdist_manhattan_pdist(SEXP);
extern SEXP rdist_manhattan_rdist(SEXP);
extern SEXP rdist_maximum_cdist(SEXP, SEXP);
extern SEXP rdist_maximum_pdist(SEXP);
extern SEXP rdist_maximum_rdist(SEXP);
extern SEXP rdist_minkowski_cdist(SEXP, SEXP, SEXP);
extern SEXP rdist_minkowski_pdist(SEXP, SEXP);
extern SEXP rdist_minkowski_rdist(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"rdist_canberra_cdist",  (DL_FUNC) &rdist_canberra_cdist,  2},
    {"rdist_canberra_pdist",  (DL_FUNC) &rdist_canberra_pdist,  1},
    {"rdist_canberra_rdist",  (DL_FUNC) &rdist_canberra_rdist,  1},
    {"rdist_euclidean_cdist", (DL_FUNC) &rdist_euclidean_cdist, 2},
    {"rdist_euclidean_pdist", (DL_FUNC) &rdist_euclidean_pdist, 1},
    {"rdist_euclidean_rdist", (DL_FUNC) &rdist_euclidean_rdist, 1},
    {"rdist_hamming_cdist",   (DL_FUNC) &rdist_hamming_cdist,   2},
    {"rdist_hamming_pdist",   (DL_FUNC) &rdist_hamming_pdist,   1},
    {"rdist_hamming_rdist",   (DL_FUNC) &rdist_hamming_rdist,   1},
    {"rdist_jaccard_cdist",   (DL_FUNC) &rdist_jaccard_cdist,   2},
    {"rdist_jaccard_pdist",   (DL_FUNC) &rdist_jaccard_pdist,   1},
    {"rdist_jaccard_rdist",   (DL_FUNC) &rdist_jaccard_rdist,   1},
    {"rdist_manhattan_cdist", (DL_FUNC) &rdist_manhattan_cdist, 2},
    {"rdist_manhattan_pdist", (DL_FUNC) &rdist_manhattan_pdist, 1},
    {"rdist_manhattan_rdist", (DL_FUNC) &rdist_manhattan_rdist, 1},
    {"rdist_maximum_cdist",   (DL_FUNC) &rdist_maximum_cdist,   2},
    {"rdist_maximum_pdist",   (DL_FUNC) &rdist_maximum_pdist,   1},
    {"rdist_maximum_rdist",   (DL_FUNC) &rdist_maximum_rdist,   1},
    {"rdist_minkowski_cdist", (DL_FUNC) &rdist_minkowski_cdist, 3},
    {"rdist_minkowski_pdist", (DL_FUNC) &rdist_minkowski_pdist, 2},
    {"rdist_minkowski_rdist", (DL_FUNC) &rdist_minkowski_rdist, 2},
    {NULL, NULL, 0}
};

void R_init_rdist(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}