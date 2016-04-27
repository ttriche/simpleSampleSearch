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
    destFile <- paste(cachePath, paste0(dbFile, ".gz"), sep="/")
    if (whatKind == "GEO") message("Using manually updated GEOmetadb URL... !")
  
    # GEOmetadb getSQLfile stopped working, so here is a fix for it... 
    GEOurl <- "https://dl.dropboxusercontent.com/u/51653511/GEOmetadb.sqlite.gz"
    getGEOmetadb <- function(GEOurl, destfile) { # {{{
      download.file(GEOurl, destfile=destFile)
      gunzip(destfile, overwrite=TRUE)
      con <- dbConnect(SQLite(), gsub("[.]gz$", "", destfile))
      dat <- dbGetQuery(con, "select * from metaInfo")
      dbDisconnect(con)
      cat("Metadata associate with downloaded file:\n")
      print(dat)
      return(unzippedlocalfile)
    } # }}}
    switch(whatKind,
           GEO=getGEOmetadb(GEOurl, destfile=destFile),
           SRA=getSRAdbFile(destdir=cachePath, destfile=paste0(dbFile, ".gz")))
  }
  db <- paste(cachePath, dbFile, sep="/")
  if (whatKind == "GEO") geodb <<- db
  if (whatKind == "SRA") sradb <<- db

  invisible(db)

}
