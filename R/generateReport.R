#' Create a report a given set of packages
#'
#' @param packages `character()` A vector of valid package names
#'
#' @param gh_org `character(1)` The GitHub organization from which to read
#'   issue and commit data from.
#'
#' @param template `character(1)` The file location of the template, this
#'   defaults to the internal template
#'
#' @param overwrite `logical(1)` Whether to overwrite an existing rendered
#'   product, i.e., a runnable RMarkdown document.
#'
#' @examples
#' if (interactive()) {
#'
#' generateReport(
#'     c(
#'         "MultiAssayExperiment", "cBioPortalData", "SingleCellMultiModal"
#'     ),
#'     gh_org = "waldronlab",
#'     since_date = "2021-05-01",
#'     template = "~/test/Pkg_report_template.Rmd",
#'     overwrite = TRUE
#' )
#'
#' generateReport(
#'     "RaggedExperiment",
#'     gh_org = "Bioconductor",
#'     since_date = "2021-05-01",
#'     template = "~/test/Pkg_report_template.Rmd",
#'     overwrite = TRUE
#' )
#'
#' }
#'
#' @export
generateReport <- function(
    packages, gh_org, since_date, template, overwrite = FALSE
) {
    stopifnot(
        BiocBaseUtils::isCharacter(packages),
        BiocBaseUtils::isScalarCharacter(gh_org),
        BiocBaseUtils::isScalarCharacter(template),
        BiocBaseUtils::isTRUEorFALSE(overwrite)
    )

    base_path <- dirname(template)
    temp_char <- readLines(template)

    for (pkg in packages) {

    message("Working on: ", pkg)
    rendered_path <- file.path(
        base_path, paste0(pkg, "_", basename(template))
    )

    rendered <- whisker::whisker.render(
        template = temp_char,
        data = list(
            package = pkg, org = gh_org, sinceDate = since_date, anyPkgs = TRUE
        )
    )

    if (!overwrite && file.exists(rendered_path))
        stop(
            "path to rendered file exists and 'overwrite = FALSE'\n",
            "    rendered file path: '", rendered_path, "'"
        )

    writeLines(rendered, rendered_path)

    }

    invisible(base_path)
}