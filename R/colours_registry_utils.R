#' Reset the zhweb project colour registry
#'
#' Clears all assigned domain colours stored in zhweb_project_colours.
#' This is useful when starting a new plot session within a project or document.
#'
#' @export
reset_zhweb_colours <- function() {
  zhweb_project_colours$registry <- list()
}
