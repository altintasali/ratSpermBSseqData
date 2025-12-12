#' Download a GEO Series tarball to a temporary file and extract to data-raw/raw
#'
#' @param acc GEO Series accession (e.g., "GSE173898").
#' @param out_dir The extraction root (default "data-raw/raw").
#' @param overwrite Logical; if FALSE and files already exist, skip re-extraction.
#' @return (invisible) list with `temp_tar` (path to temp file) and `extract_dir`.
#' @importFrom curl curl_download
#' @examples
#' \dontrun{
#'     download_geo_to_data_raw("GSE173898")
#' }
#'
download_geo_to_data_raw <- function(acc,
                                     out_dir = file.path("data-raw", "raw"),
                                     overwrite = FALSE) {
  stopifnot(is.character(acc), length(acc) == 1, grepl("^GSE\\d+$", acc))

  # Build URL for the series tarball
  url <- sprintf("https://www.ncbi.nlm.nih.gov/geo/download/?acc=%s&format=file", acc)

  # Ensure output directory exists: data-raw/raw/<ACC>/
  extract_dir <- file.path(out_dir, acc)
  if (!dir.exists(extract_dir)) {
    dir.create(extract_dir, recursive = TRUE, showWarnings = FALSE)
  } else if (!overwrite) {
    message("Target directory exists: ", extract_dir, "\nSet overwrite = TRUE to re-download/extract.")
    return(invisible(list(temp_tar = NULL, extract_dir = extract_dir)))
  }

  # Temporary file for the tarball
  temp_tar <- tempfile(pattern = acc, fileext = ".tar")

  # Download with curl (binary mode)
  message("Downloading GEO tarball for ", acc, " ...")
  curl::curl_download(url, destfile = temp_tar, mode = "wb")

  # Basic sanity check on file size
  info <- file.info(temp_tar)
  if (is.na(info$size) || info$size < 1024) {
    stop("Downloaded file seems too small (", info$size, " bytes). ",
         "Check accession or network connectivity.")
  }

  # Clean extraction directory if overwriting
  if (overwrite) {
    unlink(list.files(extract_dir, full.names = TRUE), recursive = TRUE, force = TRUE)
  }

  # Extract
  message("Extracting into: ", extract_dir)
  utils::untar(temp_tar, exdir = extract_dir)

  # Optional: list what was extracted
  extracted <- list.files(extract_dir, recursive = TRUE, all.files = TRUE)
  message("Done. Extracted ", length(extracted), " files.")

  invisible(list(temp_tar = temp_tar, extract_dir = extract_dir))
}
