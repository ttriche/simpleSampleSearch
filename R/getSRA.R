#' get SRA entries, minus hassling with the database downloads
#' 
#' @param ... arguments for SRAdb::getSRA (besides sra_con, which is automated)
#' 
#' @export
getSRA <- function(...) {
  if (!exists("sradb")) sradb <- checkForUpdates("SRA")
  con <- dbConnect(dbDriver("SQLite"), sradb)
  res <- SRAdb::getSRA(..., sra_con=con)
  dbDisconnect(con)
  return(res)
}

#' @describeIn getSRA shortcut for lazy typists
#' 
#' @export
gSRA <- getSRA
