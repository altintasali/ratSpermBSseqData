
``` r
options(usethis.quiet = TRUE)
```

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
if (!require("remotes")) install.packages("remotes")
```

    ## Loading required package: remotes

``` r
remotes::install_github("altintasali/ratSpermBSseqData", dependencies = TRUE)
```

    ## Using GitHub PAT from the git credential store.

    ## Downloading GitHub repo altintasali/ratSpermBSseqData@HEAD

    ## Skipping 1 packages not available: bsseq

    ## -- R CMD build -----------------------------------------------------------------
    ## * checking for file '/private/var/folders/kw/_1qc90r520x9lb5gdc83ct5m0000gn/T/RtmpRW7h1f/remotesf39929686bd1/altintasali-ratSpermBSseqData-aedeee0/DESCRIPTION' ... OK
    ## * preparing 'ratSpermBSseqData':
    ## * checking DESCRIPTION meta-information ... OK
    ## * checking for LF line-endings in source and make files and shell scripts
    ## * checking for empty or unneeded directories
    ## * looking to see if a 'data/datalist' file should be added
    ## * building 'ratSpermBSseqData_0.1.0.tar.gz'

    ## Installing package into '/private/var/folders/kw/_1qc90r520x9lb5gdc83ct5m0000gn/T/Rtmpn9wZqJ/temp_libpathef313b37744f'
    ## (as 'lib' is unspecified)

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
