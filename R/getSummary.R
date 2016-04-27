#' get a summary for a specific series (experiment)
#' 
#' @param gse       the series identifier
#' @param collapse  optional string to use for collapsing fields ("; ")
#' 
#' @return          a string with the collapsed details
#'
#' @aliases gS 
#' 
#' @export
getSummary <- function(gse, collapse="; ") {
  c(getDetails(gse)[c("gse","status","title","type","summary","contributor")],
    URL=paste0("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=", gse))
}

#' @describeIn getDetails   two-letter shortcut for lazy typists
#' 
#' @export
gS <- getSummary
