#' get the most recently updated experiments for a given search phrase
#' 
#' @param string  the phrase to search for
#' @param limit   optional, max records to return (default: 10) 
#' @param gpl     optional, specific platform to limit to (default: NULL)
#' 
#' @return      a data.frame, containing between 0 and ((from-to) + 1) rows 
#' 
#' @export
getExperiments <- function(string, limit=10, gpl=NULL) {
  if (!exists("geodb")) checkForUpdates()
  con <- dbConnect(SQLite(), geodb)
  if (!is.null(gpl)) {
    gplstring <- paste("AND gse_gpl.gpl =", paste0("'", gpl, "'"))
  } else {
    gplstring <- ""
  }
  res <- dbGetQuery(con,
                    paste("SELECT substr(title, 1, 60) AS descr,",
                                 "gse.gse AS gse",
                            "FROM gse, gse_gpl",
                           "WHERE title LIKE", paste0("'%", string, "%'"), 
                             "AND gse.gse = gse_gpl.gse",
                                  gplstring,
                           "GROUP BY descr", 
                           "ORDER BY gse.last_update_date DESC", 
                           "LIMIT", limit))
  dbDisconnect(con)
  return(res)
}

#' @describeIn getExperiments   two-letter shortcut for lazy typists
#'
#' @export
gE <- getExperiments
