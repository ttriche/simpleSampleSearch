#' get SummarizedExperiment(s) for a GSE(s) (usually expression, maybe DNA meth)
#' 
#' @param gse     the series identifier
#' @param map     try to map the rows to sensible symbols? (don't use this yet)
#' @param combine try to combine the list of SEs? (don't do this either yet) 
#' 
#' @return      a list of the SE(s) or subclass(es) thereof
#'
#' @aliases     gG
#' 
#' @export
getGSE <- function(gse, map=FALSE, combine=FALSE) {
  res <- lapply(getGEO(gse), function(gset) {
    SE <- as(gset, "SummarizedExperiment") 
    colnames(SE) <- SE$title
    # FIXME: prompt for this if the user does not have it
    if (map == TRUE) library(unique(SE$organism_ch1), as.character=TRUE) 
    if (map == TRUE) rownames(SE) <- mapIds(rownames(SE), "affy", "ENSEMBL")
    return(SE)
  }) 
  if (combine == TRUE) res <- do.call(cbind, res)  
  return(res) 
}

#' @describeIn getGSE  shortcut for lazy typists
#' 
#' @export
gG <- getGSE
