####################################
# ----- Update zhweb-Colours ----- #
####################################

# This skript does not contain any functions
# It can be used to update the zhweb_colours.rda colour palette

# Load into environment
load("data/zhweb_colours.rda")

# Empty current colour list
zhweb_colours <- list()

# Edit colour vectors
zhweb_colours$zhweb <- c(
  "#29A1C2",
  "#2885d1",
  "#0864a6",
  "#83cfc6",
  "#22968C",
  "#066F5E",
  "#6A7E30",
  "#ad911f",
  "#D6741F",
  "#D93C1A",
  "#96170F",
  "#D16174",
  "#D4356D",
  "#B01657",
  "#7A0049",
  "#7f33a9",
  "#653289",
  "#54268E"
)
zhweb_colours$zhweb_grey <- c(
  "#000000",
  "#333333",
  "#666666",
  "#949494",
  "#CCCCCC",
  "#F0F0F0",
  "#F7F7F7"
)

zhweb_colours$zhweb_additional <- c(
  "#9dc1e5",
  "#e9bb9d",
  "#bc9dd2",
  "#d8c68a",
  "#FFCC00",
  "#1A7F1F",
  "#8A8C00"
)

zhweb_colours$zhweb_cat <- c(
  "#2885d1",
  "#D4356D",
  "#22968C",
  "#7f33a9",
  "#ad911f",
  "#29A1C2",
  "#7A0049",
  "#066F5E",
  "#0864a6",
  "#D6741F",
  "#6A7E30",
  "#D16174",
  "#653289",
  "#B01657"
)


zhweb_colours$zhweb_divergingRedBlue <- c(
  "#9e1d4d",
  "#bf2960",
  "#d94274",
  "#e26d8d",
  "#e594a7",
  "#e8b7c1",
  "#eed6db",
  "#f1f1f1",
  "#cfdfef",
  "#aacae9",
  "#80b4e6",
  "#559ee1",
  "#2c88d3",
  "#1b72b6",
  "#125c96"
)


zhweb_colours$zhweb_divergingOrangeAquamarine <- c(
  "#86450a",
  "#a4560f",
  "#c26817",
  "#dd7c2f",
  "#e79b65",
  "#eabb9c",
  "#eed8cb",
  "#f1f1f1",
  "#c0e6e1",
  "#8dd6cd",
  "#60c3b8",
  "#22968c",
  "#1b7e75",
  "#15665f"
)


# Save updated palette
save(zhweb_colours, file = "data/zhweb_colours.rda")
