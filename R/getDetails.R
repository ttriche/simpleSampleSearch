#' get details for a specific series (experiment)
#' 
#' @param gse   the series identifier
#' 
#' @return      a short list of details
#'
#' @export
#' 
getDetails <- function(gse) {
  con <- dbConnect(SQLite(), geodb)
  res <- dbGetQuery(con, 
                    paste0("SELECT title, submission_date, type ",
                             "FROM gse WHERE gse = '", gse, "'"))
  dbDisconnect(con)
  return(as.list(res))
}

#' @describeIn getDetails
#' 
#' @export
#'
gD <- getDetails
