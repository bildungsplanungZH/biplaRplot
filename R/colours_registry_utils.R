#' Reset the zhweb project colour registry
#'
#' Clears all assigned domain colours stored in zhweb_project_colours.
#' This is useful when starting a new plot session within a project or document.
#'
#' @examples
#' assign_project_colours("subject", c("MINT", "Wirtschaft", "Kunst"))
#' list_zhweb_colour_domains()
#' reset_zhweb_colours()
#' list_zhweb_colour_domains()
#'
#' @export
reset_zhweb_colours <- function() {
  zhweb_project_colours$registry <- list()
}
