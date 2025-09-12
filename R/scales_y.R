#' Title
#'
#' @param accuracy
#' @param ...
#'
#' @returns
#' @export
#'
#' @examples
scale_y_pct <- function(accuracy = 1, ...) {
  ggplot2::scale_y_continuous(
    labels = \(x) scales::percent(x, accuracy = accuracy, ...)
  )
}



#' Title
#'
#' @param digits
#' @param big.mark
#' @param ...
#'
#' @returns
#' @export
#'
#' @examples
scale_y_count <- function(digits = 0, big.mark = "'", ...) {
  ggplot2::scale_y_continuous(
    labels = \(x) format(round(x, digits), big.mark = big.mark, ...),
    ...
  )
}


#' Title
#'
#' @param type
#' @param ...
#'
#' @returns
#' @export
#'
#' @examples
scale_y <- function(type = "count", ...) {
  assertthat::assert_that(type %in% c("count", "pct"))

  switch(type,
    count = scale_y_count(...),
    pct = scale_y_pct(...)
  )
}

