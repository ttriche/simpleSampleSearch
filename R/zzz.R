## FIXME: refactor a bunch of this crap so that it triggers upon calling a fn
## FIXME: actually, just make it a function
if (interactive()) {

  message("The simpleSampleSearch author is a degenerate, should use options()")
  
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

}
