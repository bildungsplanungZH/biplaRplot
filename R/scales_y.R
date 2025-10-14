#' Formatiert Y-Achse für Prozentangaben
#'
#' @param accuracy numeric Argument für scales::percent()
#' @param ... generische Argumente für ggplot2::scale_y_continous()
#'
#' @returns Y-Skala
#' @export
#'
#' @examples
#' ex_data <- data.frame(
#'   group = c("A", "B", "C"),
#'   n = c(.7234, .4597, .9346)
#' )
#'
#' p <- ex_data |>
#'   ggplot2::ggplot(ggplot2::aes(group, n)) +
#'   ggplot2::geom_col() +
#'   scale_y_pct(limits = c(0, 1))
scale_y_pct <- function(accuracy = 1, ...) {
  ggplot2::scale_y_continuous(
    labels = \(x) scales::percent(x, accuracy = accuracy),
    ...
  )
}



#' Formatiert Y-Achse ohne Nachkommastellen und mit Hochkomma für Tausender
#'
#' @param digits numeric Anzahl Nachkommastellen, default ist 0
#' @param big.mark charcter Zeichen für Tausender, default ist Hochkomma (')
#' @param ... generische Argumente für ggplot2::scale_y_continous()
#'
#' @returns Y-Skala
#' @export
#'
#' @examples ex_data <- data.frame(
#'   group = c("A", "B", "C"),
#'   n = c(7234, 4597, 9346)
#' )
#'
#' p <- ex_data |>
#'   ggplot2::ggplot(ggplot2::aes(group, n)) +
#'   ggplot2::geom_col() +
#'   scale_y_count()
scale_y_count <- function(digits = 0, big_mark = "'", ...) {
  ggplot2::scale_y_continuous(
    labels = \(x) format(round(x, digits), big.mark = big_mark),
    ...
  )
}


#' Formatiert Y-Achse für Prozente oder mit Hochkomma/Nachkommastellen
#'
#' @param type character, "count" oder "pct"
#' @param ... generische Argumente für ggplot2::scale_y_continous()
#' oder scale_y_count()/scale_y_pct()
#'
#' @returns Y-Skala
#' @export
#'
#' @examples
#' ex_data <- data.frame(
#'   group = c("A", "B", "C"),
#'   n = c(.7234, .4597, .9346)
#' )
#'
#' p <- ex_data |>
#'   ggplot2::ggplot(ggplot2::aes(group, n)) +
#'   ggplot2::geom_col() +
#'   scale_y("pct")
scale_y <- function(type = "count", ...) {
  assertthat::assert_that(type %in% c("count", "pct"))

  switch(type,
    count = scale_y_count(...),
    pct = scale_y_pct(...)
  )
}
