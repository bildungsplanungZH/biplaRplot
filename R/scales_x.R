#' Formatiert die Beschriftungen auf der X-Achse als Schuljahre
#'
#' @param name Achsenbeschriftung (Default: "Schuljahr")
#' @param ... generische Argumente für ggplot2::scale_x_continuous()
#'
#' @returns X-Skala
#' @export
#'
#' @examples ex_data <- data.frame(
#'   jahr = c(2023, 2024, 2025),
#'   n = c(7, 4, 9)
#' )
#'
#' ex_data |>
#'   ggplot2::ggplot(ggplot2::aes(jahr, n)) +
#'   ggplot2::geom_col() +
#'   scale_x_syear()
scale_x_syear <- function(name = "Schuljahr", ...) {
  ggplot2::scale_x_continuous(
    name = name,
    labels = \(x) paste0(x, "/", stringr::str_sub(x + 1, start = -2, end = -1)),
    ...
  )
}


#' Formatiert X-Achse für Prozentangaben
#'
#' @param accuracy numeric Argument für scales::percent()
#' @param name Achsenbeschriftung (Default: "Anteil in Prozent")
#' @param ... generische Argumente für ggplot2::scale_x_continuous()
#'
#' @returns X-Skala
#' @export
#'
#' @examples
#' ex_data <- data.frame(
#'   group = c("A", "B", "C"),
#'   n = c(.7234, .4597, .9346)
#' )
#'
#' p <- ex_data |>
#'   ggplot2::ggplot(ggplot2::aes(n, group)) +
#'   ggplot2::geom_col() +
#'   scale_x_pct(limits = c(0, 1))
scale_x_pct <- function(accuracy = 1, name = "Anteil in Prozent", ...) {
  ggplot2::scale_x_continuous(
    name = name,
    labels = \(x) scales::percent(x, accuracy = accuracy),
    ...
  )
}
