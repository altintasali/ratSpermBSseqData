
# ratSpermBSseqData <https://img.shields.io/badge/data-package-blue.svg>

## Overview

`ratSpermBSseqData` is an **R data package** that provides the
[`BSseq`](https://bioconductor.org/packages/release/bioc/html/bsseq.html)
object with the methylation data by [Altintas et
al. 2021](https://faseb.onlinelibrary.wiley.com/doi/10.1096/fj.202100215R)
from the GEO database
[GSE173898](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE173898).

Placebo (Ctrl) and nicotine (Nico) treated F0 mothers. Sperm cells are
isolated from F1 generation (n = 10 per group).

## The dataset was constructed from Bismark coverage files using `bsseq::read.bismark()`.

## Installation

You can install the development version from GitHub using one of the
following methods:

``` r
if (!require("pak")) install.packages("pak")
```

    ## Loading required package: pak

    ## Warning: package 'pak' was built under R version 4.4.3

``` r
#pak::pak("altintasali/ratSpermBSseqData")
```

# Usage

## Loading data

``` r
library(ratSpermBSseqData)

# Load the BSseq object
data("bsseq_rat_sperm")

# Inspect the object
bsseq_rat_sperm
```

    ## An object of type 'BSseq' with
    ##   5225806 methylation loci
    ##   20 samples
    ## has not been smoothed
    ## All assays are in-memory

## Extract information

``` r
library(bsseq)
```

    ## Loading required package: BiocGenerics

    ## 
    ## Attaching package: 'BiocGenerics'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     IQR, mad, sd, var, xtabs

    ## The following objects are masked from 'package:base':
    ## 
    ##     Filter, Find, Map, Position, Reduce, anyDuplicated, aperm, append,
    ##     as.data.frame, basename, cbind, colnames, dirname, do.call,
    ##     duplicated, eval, evalq, get, grep, grepl, intersect, is.unsorted,
    ##     lapply, mapply, match, mget, order, paste, pmax, pmax.int, pmin,
    ##     pmin.int, rank, rbind, rownames, sapply, saveRDS, setdiff, table,
    ##     tapply, union, unique, unsplit, which.max, which.min

    ## Loading required package: GenomicRanges

    ## Loading required package: stats4

    ## Loading required package: S4Vectors

    ## 
    ## Attaching package: 'S4Vectors'

    ## The following object is masked from 'package:utils':
    ## 
    ##     findMatches

    ## The following objects are masked from 'package:base':
    ## 
    ##     I, expand.grid, unname

    ## Loading required package: IRanges

    ## Loading required package: GenomeInfoDb

    ## Loading required package: SummarizedExperiment

    ## Loading required package: MatrixGenerics

    ## Loading required package: matrixStats

    ## 
    ## Attaching package: 'MatrixGenerics'

    ## The following objects are masked from 'package:matrixStats':
    ## 
    ##     colAlls, colAnyNAs, colAnys, colAvgsPerRowSet, colCollapse,
    ##     colCounts, colCummaxs, colCummins, colCumprods, colCumsums,
    ##     colDiffs, colIQRDiffs, colIQRs, colLogSumExps, colMadDiffs,
    ##     colMads, colMaxs, colMeans2, colMedians, colMins, colOrderStats,
    ##     colProds, colQuantiles, colRanges, colRanks, colSdDiffs, colSds,
    ##     colSums2, colTabulates, colVarDiffs, colVars, colWeightedMads,
    ##     colWeightedMeans, colWeightedMedians, colWeightedSds,
    ##     colWeightedVars, rowAlls, rowAnyNAs, rowAnys, rowAvgsPerColSet,
    ##     rowCollapse, rowCounts, rowCummaxs, rowCummins, rowCumprods,
    ##     rowCumsums, rowDiffs, rowIQRDiffs, rowIQRs, rowLogSumExps,
    ##     rowMadDiffs, rowMads, rowMaxs, rowMeans2, rowMedians, rowMins,
    ##     rowOrderStats, rowProds, rowQuantiles, rowRanges, rowRanks,
    ##     rowSdDiffs, rowSds, rowSums2, rowTabulates, rowVarDiffs, rowVars,
    ##     rowWeightedMads, rowWeightedMeans, rowWeightedMedians,
    ##     rowWeightedSds, rowWeightedVars

    ## Loading required package: Biobase

    ## Welcome to Bioconductor
    ## 
    ##     Vignettes contain introductory material; view with
    ##     'browseVignettes()'. To cite Bioconductor, see
    ##     'citation("Biobase")', and for packages 'citation("pkgname")'.

    ## 
    ## Attaching package: 'Biobase'

    ## The following object is masked from 'package:MatrixGenerics':
    ## 
    ##     rowMedians

    ## The following objects are masked from 'package:matrixStats':
    ## 
    ##     anyMissing, rowMedians

``` r
cov <- getCoverage(bsseq_rat_sperm, type = "Cov")
meth <- getCoverage(bsseq_rat_sperm, type = "M")

dim(cov)    # rows = CpG loci, columns = samples
```

    ## [1] 5225806      20

``` r
head(cov)
```

    ##      Ctrl-1 Ctrl-2 Ctrl-3 Ctrl-4 Ctrl-5 Ctrl-6 Ctrl-7 Ctrl-8 Ctrl-9 Ctrl-10
    ## [1,]      0      0      0      0      0      0      0      0      0       0
    ## [2,]      0      0      0      0      0      0      0      0      0       0
    ## [3,]      0      0      0      0      0      0      0      0      0       0
    ## [4,]      0      0      0      0      0      0      0      0      0       0
    ## [5,]      0      0      0      0      0      0      0      0      0       0
    ## [6,]      0      0      0      0      0      0      0      0      0       0
    ##      Nico-1 Nico-2 Nico-3 Nico-4 Nico-5 Nico-6 Nico-7 Nico-8 Nico-9 Nico-10
    ## [1,]      0      0      0      1      0      0      0      0      0       0
    ## [2,]      0      0      0      1      0      0      0      0      0       0
    ## [3,]      0      0      0      1      0      0      0      0      0       0
    ## [4,]      0      0      0      1      0      0      0      0      0       0
    ## [5,]      0      0      0      1      0      0      0      0      0       0
    ## [6,]      0      0      0      1      0      0      0      0      0       0
