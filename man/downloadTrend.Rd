% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/downloadTrend.R
\name{downloadTrend}
\alias{downloadTrend}
\title{Plot the download activity for a package}
\usage{
downloadTrend(package, since_date, include_recent = FALSE)
}
\arguments{
\item{since_date}{\code{character(1)} The date from when to start looking at
commit and issue history. This should be specified in the year, month, and
day format, 'YYYY-MM-DD'.}

\item{include_recent}{\code{logical(1)} Whether to include the latest month of
download data. Usually, the data for the most recent month has incomplete
numbers and is excluded (default is \code{FALSE}).}
}
\description{
Plot the download activity for a package
}
\examples{

downloadTrend("MultiAssayExperiment", "2017-05-01")
downloadTrend("cBioPortalData", "2017-05-01")
downloadTrend("RaggedExperiment", "2017-05-01")


downloadTrend("SingleCellMultiModal", "2017-05-01")
downloadTrend("curatedTCGAData", "2017-05-01")

# low downloads
downloadTrend("TENxIO", "2017-05-01")
downloadTrend("terraTCGAdata", "2017-05-01")

}
