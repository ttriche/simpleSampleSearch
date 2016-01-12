#' get SummarizedExperiment(s) for a GSE(s) (usually expression, maybe DNA meth)
#' 
#' @param gse     the series identifier
#' @param combine try to flatten (cbind) the resulting SEs? (default: FALSE) 
#' @param map     try to map the rows to sensible symbols? (default: FALSE)
#' 
#' @return      a list of the SE(s) or subclass(es) thereof
#'
#' @aliases     gG
#' 
#' @export
getGSE <- function(gse, combine=FALSE, map=FALSE) {
  res <- lapply(getGEO(gse), function(gset) {
    SE <- as(gset, "SummarizedExperiment") 
    colnames(SE) <- SE$title
    # FIXME: prompt for this if the user does not have it
    if (map == TRUE) {
      library(unique(SE$organism_ch1), as.character=TRUE) 
      rownames(SE) <- mapToIds(rownames(SE), "affy", "ENSEMBL") # ??
      rowRanges(SE) <- mapToRanges(rownames(SE)) # ?? 
    }
    return(SE)
  })
  if (combine == TRUE) ifelse(length(res) > 1, do.call(cbind, res), res[[1]])
  return(res) 
}

#' @describeIn getGSE  shortcut for lazy typists
#' 
#' @export
gG <- getGSE
