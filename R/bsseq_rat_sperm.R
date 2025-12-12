#' Rat sperm BSseq dataset
#'
#' A \code{BSseq} object built from Bismark coverage files (GEO: GSE173898).
#'
#' @format A \code{BSseq} object with:
#' \itemize{
#'   \item \code{rowRanges}: CpG loci (\code{GRanges})
#'   \item \code{assays}: matrices \code{Cov} (coverage) and \code{M} (methylated counts)
#'   \item \code{colData}: sample metadata (20 samples)
#' }
#'
#' @source GEO accession \href{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE173898}{GSE173898}.
#' @import bsseq
#' @docType data
#' @name bsseq_rat_sperm
#' @usage data("bsseq_rat_sperm")
#' @keywords datasets
#' @examples
#' data("bsseq_rat_sperm")
#' bsseq_rat_sperm
"bsseq_rat_sperm"
