#' quick shortcuts for some platforms; could certainly use more
#' FIXME: add something similar for SRAdb, eg. BISULFITE, RNASEQ, ATACSEQ, etc.
#'
#' @seealso \code{\link{getRecent}}, \code{\link{getDetails}}, \code{\link{getExperiments}}, \code{\link{getGSE}}, \code{\link{getSRA}}, and so forth
#'
#' @aliases shortcuts platforms
#' @name abbreviatedPlatforms
NULL 
#> NULL

#' HUEX1 -- Affy HuEx array
#' 
#' @usage getRecent(HUEX1)
#' @rdname abbreviatedPlatforms
#' @export
HUEX1 <- "GPL5188"

#' PLUS2 -- Affy hgu133plus2 array
#' 
#' @usage getRecent(PLUS2)
#' @rdname abbreviatedPlatforms
#' @export
PLUS2 <- "GPL570"

#' HM27 -- Illumina HumanMethylation27 array
#' 
#' @usage getRecent(HM27)
#' @rdname abbreviatedPlatforms
#' @export
HM27 <- "GPL8490"

#' HM450 -- Illumina HumanMethylation450 array
#' 
#' @usage getRecent(HM450)
#' @rdname abbreviatedPlatforms
#' @export
HM450 <- "GPL13534"

#' HMEPIC -- Illumina HumanMethylationEPIC array
#' 
#' @usage getRecent(HMEPIC)
#' @rdname abbreviatedPlatforms
#' @export
HMEPIC <- "GPL21145"

#' HM850 -- Illumina HumanMethylationEPIC array
#' 
#' @usage getRecent(HM850)
#' @rdname abbreviatedPlatforms
#' @export
HM850 <- HMEPIC
