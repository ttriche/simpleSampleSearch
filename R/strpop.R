#' a convenience function to pop pieces off of a string
#' 
#' this should really just go in timlib or whatever the hell I end up calling it
#' 
#' @param x     the string
#' @param y     the split
#' @param z     (optional) post-split elements to return (default: the last one)
#' 
#' @return      a character vector, possibly of length greater than one
#' 
#' @export 
strpop <- function(x, y=" ", z=NULL) {
  str2vec <- function(x, y=" ") strsplit(basename(x), y)[[1]]
  vec <- str2vec(x, y)
  if (is.null(z)) z <- length(vec)
  paste(vec[z], collapse=y)
}
