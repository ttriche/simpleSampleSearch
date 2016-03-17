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
  paste(getDetails(gse), collapse=collapse)
}

#' @describeIn getDetails   two-letter shortcut for lazy typists
#' 
#' @export
gS <- getSummary
