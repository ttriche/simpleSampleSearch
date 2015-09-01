#' get the most recently updated series for a given platform
#' 
#' @param gpl   the platform identifier
#' @param from  index for the first returned record (default: 1)
#' @param to    index for the last returned record (default: 10) 
#' 
#' @return      a data.frame, containing between 0 and ((from-to) + 1) rows 
#' 
#' @export
#'
getRecent <- function(gpl, from=1, to=10) {
  con <- dbConnect(SQLite(), geodb)
  res <- dbGetQuery(con,
                    paste("SELECT substr(title, 1, 60) AS descr,", 
                                " gse.gse AS gse", 
                            "FROM gse, gse_gpl",
                           "WHERE gse.gse = gse_gpl.gse",
                             "AND gse_gpl.gpl =", paste0("'", gpl, "'"), 
                           "GROUP BY descr", 
                           "ORDER BY gse.last_update_date DESC", 
                           "LIMIT ", from + to - 1, " OFFSET", from - 1))
  dbDisconnect(con)
  return(res)
}

#' @describeIn getRecent 
#' 
#' @export
#'
gR <- getRecent
