#' get FASTQs for an SRA series (SRP)
#' 
#' @param SRP   the series identifier
#' @param ...   optional arguments, e.g. destDir
#'
#' @aliases gFQ
#' 
#' @export
getFASTQ <- function(SRP, ...) {
  if (!exists("sradb")) sradb <- checkForUpdates("SRA")
  con <- dbConnect(dbDriver("SQLite"), sradb)
  getFASTQfile(in_acc=SRP, ..., sra_con=con)
  dbDisconnect(con)
}

#' @describeIn getFASTQ   shortcut for lazy typists
#' 
#' @export
gFQ <- getFASTQ
