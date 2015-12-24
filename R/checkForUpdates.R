#' Download an up-to-date GEOmetadb SQLite file if it has been more than a day
#' FIXME: look at the actual filename to determine whether it's been updated!
#'
#' @param whatKind  either "GEO" or "SRA" (the latter is not well supported yet)
#'
#' @export
checkForUpdates <- function(whatKind=c("GEO","SRA")) {

  ## FIXME: refactor a bunch of this crap so that it triggers upon calling a fn
  message("Please remind the author not to write filthy hardcoded functions")

  ## cache dir
  ## FIXME: set this in options()$geodbpath / options$sradbpath
  geodbpath <- paste(Sys.getenv("HOME"), "R", "GEOmetadb", sep="/")
  if (!dir.exists(geodbpath)) dir.create(geodbpath, recursive=TRUE)

  ## important to include the trailing .gz or it will error out!
  ## cache file (today only; should it instead check for newness?)
  today <- format(Sys.time(), "%Y%m%d")
  geodbfile <- paste("GEOmetadb", today, "sqlite", sep=".")
  geogzipped <- paste(geodbfile, "gz", sep=".")
  ## FIXME: refactor so that this works for SRAdb too
  if (!file.exists(paste0(geodbpath, "/", geodbfile))) {
    unlink(list.files(geodbpath, pattern="^GEOmetadb.*.sqlite$"))
    getSQLiteFile(destdir=geodbpath, destfile=geogzipped)
  }

  ## FIXME: this is terrible
  geodb <<- paste(geodbpath, geodbfile, sep="/")
  return(geodb)

}