% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generateReport.R
\name{generateReport}
\alias{generateReport}
\title{Create a report a given set of packages}
\usage{
generateReport(packages, gh_org, since_date, outdir = ".", overwrite = FALSE)
}
\arguments{
\item{packages}{\code{character()} A vector of valid package names}

\item{gh_org}{\code{character(1)} The GitHub organization from which to read
issue and commit data from.}

\item{since_date}{\code{character(1)} The date from when to start looking at
commit and issue history. This should be specified in the year, month, and
day format, 'YYYY-MM-DD'.}

\item{outdir}{\code{character(1)} The directory in which to place rendered
RMarkdown documents, by default they will be placed in the current working
directory.}

\item{overwrite}{\code{logical(1)} Whether to overwrite an existing rendered
product, i.e., a runnable RMarkdown document.}
}
\description{
The function compiles statistics for Bioconductor packages that
have GitHub repositories. It uses functionality in \code{BiocPkgTools} to
extract commit and issue history. A token is required to access the
GitHub commit and issue history.
}
\section{Authentication}{

The package uses the \code{gh} package calls from \code{BiocPkgTools}. Users must
authenticate with a GitHub Fine Grained Token and add the token using
\code{gitcreds::gitcreds_set()}.
}

\examples{
if (interactive()) {

generateReport(
    c(
        "MultiAssayExperiment", "cBioPortalData", "SingleCellMultiModal"
    ),
    gh_org = "waldronlab",
    since_date = "2017-05-01",
    overwrite = TRUE
)

generateReport(
    "RaggedExperiment",
    gh_org = "Bioconductor",
    since_date = "2017-05-01",
    overwrite = TRUE
)

}

}
