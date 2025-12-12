# Required packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load("curl", "bsseq", "usethis")

# Download data
download_geo_to_data_raw("GSE173898", overwrite = TRUE)
# url <- "https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE173898&format=file"
# temp_dir <- tempdir()
# download.file(url = url, destfile = paste0(temp_dir, "/", "GSE173898_RAW.tar"))

# Cov files
data_dir <- "data-raw/raw/GSE173898"
cov_files <- list.files(data_dir, pattern = "\\.cov\\.gz$", full.names = TRUE)

# Metadata (not necessary, but good to have)
data_dir <- "data-raw/raw"
metadata_file <- list.files(data_dir, pattern = "\\.tsv\\.gz$", full.names = TRUE)
metadata <- read.table(metadata_file, header = TRUE)
rownames(metadata) <- metadata[, "Sample"]

# BSseq object
bs <- bsseq::read.bismark(files = cov_files,
                          colData = metadata,
                          strandCollapse = TRUE,
                          rmZeroCov = TRUE)
bsseq_rat_sperm <- bs

# Create the object
usethis::use_data(bsseq_rat_sperm, compress = "bzip2", version = 2, overwrite = TRUE)

# Remove downloaded cov files
file.remove(cov_files)
