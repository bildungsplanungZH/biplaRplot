#' Erzeugt eine Palette mithilfe einer Liste von Farbvektoren aus einer Liste
#'
#' @param name Name des Farbvektors
#' @param n Anzahl Farben, alle falls nicht angegeben
#' @param all_palettes Liste mit den Farbvektoren
#' @param type diskrete oder stetige Palette
#'
#' @return Objekt der Klasse palette mit Namen name
#' @export
#'
#' @examples biplaRplot::zhweb_palettes("zhweb", 3, type = "continuous")
zhweb_palettes <- function(name, n, all_palettes = biplaRplot::zhweb_colours,
                           type = c("discrete", "continuous")) {
  palette <- all_palettes[[name]]
  if (missing(n)) {
    n <- length(palette)
  }
  type <- match.arg(type)
  out <- switch(type,
    continuous = grDevices::colorRampPalette(palette[1:n])(n),
    discrete = palette[1:n]
  )
  structure(out, name = name, class = "palette")
}


#' Erzeugt eine colour-Farbskala für ggplot2
#'
#' @param name Name des Farbvektors aus der Liste biplaRplot::zhweb_colours,
#' default ist "zhweb_cat"
#' @param n Anzahl Farben, alle falls nicht angegeben
#' @param discrete diskrete oder stetige Variable, default ist diskret
#'
#' @return colour-Skala
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = disp, colour = hp)) +
#'   ggplot2::geom_point() +
#'   biplaRplot::scale_colour_zhweb("zhweb_grey", discrete = FALSE)
scale_colour_zhweb <- function(name = "zhweb_cat", n, discrete = TRUE) {
  if (discrete) {
    ggplot2::scale_colour_manual(
      values = zhweb_palettes(name = name, n = n, type = "discrete")
    )
  } else {
    ggplot2::scale_colour_gradientn(
      colours = zhweb_palettes(name = name, n = n, type = "continuous")
    )
  }
}


#' Erzeugt eine fill-Farbskala für ggplot2
#'
#' @param name Name des Farbvektors aus der Liste biplaRplot::zhweb_colours,
#'     default ist "zhweb_cat"
#' @param n Anzahl Farben, alle falls nicht angegeben
#' @param discrete diskrete oder stetige Variable, default ist diskret
#'
#' @return fill-Skala
#' @export
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = gear, fill = as.character(gear))) +
#'   ggplot2::geom_bar() +
#'   biplaRplot::scale_fill_zhweb("zhweb_cat")
scale_fill_zhweb <- function(name = "zhweb_cat", n, discrete = TRUE) {
  if (discrete) {
    ggplot2::scale_fill_manual(
      values = zhweb_palettes(name, n = n, type = "discrete")
    )
  } else {
    ggplot2::scale_fill_gradientn(
      colours = zhweb_palettes(name = name, n = n, type = "continuous")
    )
  }
}

# Alias für American English
scale_color_zhweb <- scale_colour_zhweb
