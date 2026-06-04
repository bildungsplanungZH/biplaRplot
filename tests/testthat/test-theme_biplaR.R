###############################
##### Test Theme Function #####
###############################


# theme_biplar: ----------------------------------------------------------

# Returns ggplot theme
test_that("theme_biplaR() returns a ggplot theme", {
  expect_s3_class(
    theme_biplar(grid_x = FALSE),
    c("theme", "gg")
  )
})

# Returns error if parameter incorrecctly specified
test_that("ssz_theme returns errors if incorrect parameters specified", {
  expect_error(theme_biplar(grid_x = "a"))
})

# Passes arguments to ggplot2::theme()
test_that("theme_biplar can pass theme() arguments", {
  theme <- theme_biplar(
    plot.caption =
      ggplot2::element_text(colour = "hotpink")
  )

  expect_s3_class(theme$plot.caption, "element_text")
  expect_equal(theme$plot.caption$colour, "hotpink")
})
