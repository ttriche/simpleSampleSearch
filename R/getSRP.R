#' get samples for an SRA series (SRP)
#' 
#' @param SRP   the series identifier
#' 
#' @return      the samples and some descriptions
#'
#' @aliases gSRP
#' 
#' @export
getSRP <- function(SRP) {
  if (!exists("sradb")) sradb <- checkForUpdates("SRA")
  con <- dbConnect(dbDriver("SQLite"), sradb)
  samples <- sraConvert(SRP, out_type="sample", sra_con=con)
  dbDisconnect(con)
  return(samples)
}

#' @describeIn getSRP shortcut for lazy typists
#' 
#' @export
gSRP <- getSRP
