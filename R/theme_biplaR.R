#' ggplot-Theme für die Bildungsplanung Kanton Zürich
#'
#' @param grid_x boolean Anzeige der Gridlinien für die X-Achse
#' @param grid_y boolean Anzeige der Gridlinien für die X-Achse
#'
#' @returns ggplot-Theme
#' @export
#'
#' @examples theme_biplaR()
theme_biplaR <- function(grid_x = TRUE, grid_y = TRUE) {

    assertthat::assert_that(assertthat::is.flag(grid_x) & assertthat::is.flag(grid_y))

    gridline <- ggplot2::element_line(
        linetype = "dashed",
        linewidth = 0.15,
        color = "#999999"
    )

    grid_x <- if (isTRUE(grid_x)) {
        gridline
    } else {
        ggplot2::element_blank()
    }

    grid_y <- if (isTRUE(grid_y)) {
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

        # Text elements ==========================================================
        axis.text = ggplot2::element_text(
            size = 11,
            color = "#333333"
        ),

        plot.title = ggplot2::element_text(family = "Arial Black"),
        plot.title.position = "plot",
        plot.caption.position = "plot",

        # Line elements ==========================================================
        panel.grid.minor = ggplot2::element_blank(),
        panel.grid.major.x = grid_x,
        panel.grid.major.y = grid_y,

        axis.ticks = ggplot2::element_blank(),

        legend.text = ggplot2::element_text(size = 11),

        panel.border = ggplot2::element_blank(),

        geom = ggplot2::element_geom(pointsize = 3,
                            linewidth = 1.1)
    )
}

