# Abgeschrieben bei R for the rest of us:
# https://rfortherestofus.com/2025/04/ggplot2-theme

theme_biplaR <- function() {
    # Set base theme and font family =============================================
    theme_bw(
        base_family = "Helvetica"
    ) +
        # Overwrite base theme defaults ============================================
    theme(
        plot.title.position = "plot",
        plot.caption.position = "plot",

        # Line elements ==========================================================
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(
            linetype = "dashed",
            linewidth = 0.15,
            color = "#7f7f7f"
        ),
        axis.ticks = element_line(
            linetype = "solid",
            linewidth = 0.25,
            color = "#7f7f7f"
        ),
        axis.ticks.length = unit(4, units = "pt")
    )
}
