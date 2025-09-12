# Grafikfarben gemäss Designstandards
# https://www.zh.ch/de/webangebote-entwickeln-und-gestalten/inhalt/designsystem/design-grundlagen/infografiken-und-visualisierungen.html
# Implementiert durch Res Marti in den Grundkonfiguationen für die Webgrafiken der Bildungsplanung des Kantons Zürich vom 18.12.2024
# https://observablehq.com/@bildungsplanungzh/general

zhweb_colours <- list(

    zhweb = c(
        "#009EE0", "#0070B4", "#00407C",
        "#0FA693", "#00797B", "#00544C",
        "#DC7700", "#D93C1A", "#96170F",
        "#D40053", "#B01657", "#7A0049",
        "#9572D5", "#7F3DA7", "#54268E"),

    zhweb_additional = c(
        "#7AB6E2", "#6BC9CB", "#FFAE73", "#FF94BA", "#B590F9", "#FFCC00", "#1A7F1F", "#8A8C00"),

    zhweb_grey = c(
        "#000000", "#333333", "#666666", "#949494", "#CCCCCC", "#F0F0F0", "#F7F7F7"),

    zhweb_cat = c(
        "#0070B4", "#DC7700", "#96170F", "#54268E", "#0FA693", "#009EE0", "#00544C", "#7A0049", "#00407C",
        "#D40053", "#00797B", "#D93C1A", "#9572D5", "#B01657")

    )

usethis::use_data(zhweb_colours)
