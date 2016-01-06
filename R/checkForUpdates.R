#' Download an up-to-date GEOmetadb or SRAmetadb file if it has been > 1 day
#'
#' FIXME: look at the actual filename to determine whether it's been updated!
#' FIXME: use options()$simpleSampleSearchCache to determine where to look 
#' 
#' @param whatKind  either "GEO" or "SRA" (the latter is not well supported yet)
#'
#' @return  the path to the updated SQLite file, invisibly
#'
#' @export
checkForUpdates <- function(whatKind=c("GEO","SRA")) {

  whatKind <- match.arg(whatKind)
  today <- format(Sys.time(), "%Y%m%d")
  dbPrefix <- paste0(whatKind, "metadb")
  dbFile <- paste(dbPrefix, today, "sqlite", sep=".")
  oldFilePattern <- paste0("^", dbPrefix, ".*.sqlite$")

  # FIXME: set this in options()$simpleSampleSearchCache
  simpleSampleSearchCache <- paste(Sys.getenv("HOME"), "R", sep="/")
  cachePath <- paste(simpleSampleSearchCache, dbPrefix, sep="/")
  if (!dir.exists(cachePath)) dir.create(cachePath, recursive=TRUE)

  # Fetch the db if needed
  message(paste("Checking for", whatKind, "updates..."))
  if (!file.exists(paste0(cachePath, "/", dbFile))) {
    unlink(list.files(cachePath, pattern=oldFilePattern))
    switch(whatKind,
           GEO=getSQLiteFile(destdir=cachePath, destfile=paste0(dbFile, ".gz")),
           SRA=getSRAdbFile(destdir=cachePath, destfile=paste0(dbFile, ".gz")))
  }
  db <- paste(cachePath, dbFile, sep="/")
  if (whatKind == "GEO") geodb <<- db
  if (whatKind == "SRA") sradb <<- db

  invisible(db)

}
