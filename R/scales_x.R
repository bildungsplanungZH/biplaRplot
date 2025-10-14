#' Formatiert die Beschriftungen auf der X-Achse als Schuljahre
#'
#' @param ... generische Argumente für ggplot2::scale_x_continous()
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
scale_x_syear <- function(...) {
  ggplot2::scale_x_continuous(
    labels = \(x) paste0(x, "/", stringr::str_sub(x + 1, start = -2, end = -1)),
    ...
  )
}
