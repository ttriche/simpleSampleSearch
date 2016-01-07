#' try to extract the associated SRP study from a GEO GSE, if one exists 
#' 
#' @param GSE   the GSE
#' 
#' @return      the SRP or SRPs, if found
#'
#' @export
getSRPfromGSE <- function(GSE) {
  supps <- strsplit(getDetails(GSE)$supplementary_file, ";")[[1]]
  SRAlinks <- grep("SRP", supps, value=TRUE)
  return(sapply(SRAlinks, strpop, y="/"))
}

#' @describeIn getSRPfromGSE  shortcut for lazy typists
#' 
#' @export
GSE2SRP <- getSRPfromGSE
