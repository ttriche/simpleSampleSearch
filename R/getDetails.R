#' get details for a specific series (experiment)
#' 
#' @param gse   the series identifier
#' 
#' @return      a short list of details
#'
#' @aliases gD 
#' 
#' @export
getDetails <- function(gse) {
  if (!exists("geodb")) checkForUpdates()
  con <- dbConnect(SQLite(), geodb)
  res <- dbGetQuery(con, 
                    paste0("SELECT title, submission_date, type ",
                             "FROM gse WHERE gse = '", gse, "'"))
  dbDisconnect(con)
  return(as.list(res))
}

#' @describeIn getDetails   two-letter shortcut for lazy typists
#' 
#' @export
gD <- getDetails
