#' get samples (or other stuff) for an SRA series (SRP) or other identifier
#' 
#' @param SRP   the series identifier
#' @param ...   other arguments to pass to SRAdb::sraConvert
#' 
#' @return      the samples and some descriptions
#'
#' @aliases gSRP
#' 
#' @export
getSRP <- function(SRP, ...) {
  if (!exists("sradb")) sradb <- checkForUpdates("SRA")
  con <- dbConnect(dbDriver("SQLite"), sradb)
  res <- sraConvert(SRP, sra_con=con, ...)
  dbDisconnect(con)
  return(res)
}

#' @describeIn getSRP shortcut for lazy typists
#' 
#' @export
gSRP <- getSRP
