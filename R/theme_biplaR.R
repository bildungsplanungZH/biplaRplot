#' ggplot-Theme für die Bildungsplanung Kanton Zürich
#'
#' Das biplar-Theme basiert auf theme_bw() und überschreibt ausgewählte Elemente
#' Die Darstellung der Gitterlinien lässt sich pro Achse über die Argumente
#' `grid_x` bzw. `grid_y` steuern.
#'
#' @param grid_x boolean Anzeige der Gitterlinien für die X-Achse
#' @param grid_y boolean Anzeige der Gitterlinien für die X-Achse
#'
#' @returns ggplot-Theme
#' @export
#'
#' @examples theme_biplar()
theme_biplar <- function(grid_x = TRUE, grid_y = TRUE) {
  assertthat::assert_that(assertthat::is.flag(grid_x) &
                            assertthat::is.flag(grid_y))

  gridline <- ggplot2::element_line(
    linetype = "22",
    linewidth = 0.5,
    color = "#999999"
  )

  gridline_x <- if (isTRUE(grid_x)) {
    gridline
  } else {
    ggplot2::element_blank()
  }

  gridline_y <- if (isTRUE(grid_y)) {
    gridline
  } else {
    ggplot2::element_blank()
  }

  # Set base theme and font family =============================================
  ggplot2::theme_bw(
    base_family = "Arial",
  ) +

    # Overwrite base theme defaults ============================================
    ggplot2::theme(
      # to plot and panel
      plot.title = ggplot2::element_text(
        family = "Arial Black",
        margin = ggplot2::margin(b = 15)
      ),
      plot.subtitle = ggplot2::element_text(
        family = "Arial",
        margin = ggplot2::margin(b = 20)
      ),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = gridline_x,
      panel.grid.major.y = gridline_y,
      panel.border = ggplot2::element_blank(),
      # to axis and axis text
      axis.title = ggplot2::element_text(size = 12),
      axis.title.x = ggplot2::element_text(hjust = 1),
      axis.title.y = ggplot2::element_text(vjust = 0),
      axis.text = ggplot2::element_text(
        size = 11,
        color = "#333333",
        margin = ggplot2::margin(0, 0, 0, 0)
      ),
      axis.ticks = ggplot2::element_blank(),
      # to legend
      legend.position = "top",
      legend.justification = "left",
      legend.title = ggplot2::element_text(size = 12),
      legend.title.position = "top",
      legend.text = ggplot2::element_text(size = 11),
      # to geoms
      geom = ggplot2::element_geom(
        pointsize = 3,
        linewidth = 1.1,
        colour = "white"
      ),
      # to facet strip and text
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(size = 12)
    )
}
