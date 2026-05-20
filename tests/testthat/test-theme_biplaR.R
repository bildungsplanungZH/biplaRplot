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

# Passes arguments from ggplot2::theme_bw
test_that("theme_biplaR can pass theme_bw arguments", {
    theme <- theme_biplar(base_size = 20)
    expect_equal(theme$text$size, 20)
})
