% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getRecent.R
\name{getRecent}
\alias{gR}
\alias{getRecent}
\title{get the most recently updated series for a given platform}
\usage{
getRecent(gpl, from = 1, to = 10)

gR(gpl, from = 1, to = 10)
}
\arguments{
\item{gpl}{the platform identifier}

\item{from}{index for the first returned record (default: 1)}

\item{to}{index for the last returned record (default: 10)}
}
\value{
a data.frame, containing between 0 and ((from-to) + 1) rows
}
\description{
get the most recently updated series for a given platform
}
\section{Functions}{
\itemize{
\item \code{gR}: two-letter shortcut for lazy typists
}}
\seealso{
\code{\link{platforms}} for shortcuts (aliases for specific GPLs)
}

