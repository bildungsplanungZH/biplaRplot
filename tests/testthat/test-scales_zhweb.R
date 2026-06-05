#######################################
##### Test Scale Colour Functions #####
#######################################


# zhweb_palettes: ----------------------------------------------------------

# Test the the function returns a palette object
test_that("zhweb_palettes returns a palette object with correct attributes", {
  test_object <- zhweb_palettes("zhweb", 3)

  expect_s3_class(test_object, "palette")
  expect_equal(attr(test_object, "name"), "zhweb")
  expect_length(test_object, 3)
})


# scale_colour_zhweb: ------------------------------------------------------

# Test that default arguments work
test_that("scale_colour_zhweb() does not throw errors", {
  result <- scale_colour_zhweb()
  expect_no_error(result)
})


# Test that the function returns the correct ggplot2 scale class
# For discrete scales
test_that("scale_colour_zhweb(discrete = TRUE)
          returns a scale_colour_manual", {
  result <- scale_colour_zhweb(discrete = TRUE)
  expect_true(inherits(result, "ScaleDiscrete"))
})

# (1) For discrete scales
test_that("scale_colour_zhweb(discrete = FALSE
          returns a scale_colour_gradientn", {
  result <- scale_colour_zhweb(discrete = FALSE)
  expect_true(inherits(result, "ScaleContinuous"))
})


# Test that reverse=FALSE keeps the colour order
test_that("scale_colour_zhweb(discrete = TRUE, reverse=FALSE)
          keeps the colour order", {
  result <- scale_colour_zhweb("zhweb_divergingRedBlue",
    discrete = TRUE, reverse = FALSE
  )
  colours <- as.vector(result$palette(15))
  expect_equal(
    toupper(colours),
    toupper(c(
      "#9e1d4d", "#bf2960", "#d94274",
      "#e26d8d", "#e594a7", "#e8b7c1",
      "#eed6db", "#f1f1f1", "#cfdfef",
      "#aacae9", "#80b4e6", "#559ee1",
      "#2c88d3", "#1b72b6", "#125c96"
    ))
  )
})

# Test that reverse=TRUE flips the colour order
test_that("scale_colour_zhweb(discrete = TRUE, reverse=FALSE)
          reverses the colour order", {
  result <- scale_colour_zhweb("zhweb_divergingRedBlue",
    discrete = TRUE, reverse = TRUE
  )
  colours <- as.vector(result$palette(15))
  expect_equal(
    toupper(colours),
    toupper(c(
      "#125c96", "#1b72b6", "#2c88d3",
      "#559ee1", "#80b4e6", "#aacae9",
      "#cfdfef", "#f1f1f1", "#eed6db",
      "#e8b7c1", "#e594a7", "#e26d8d",
      "#d94274", "#bf2960", "#9e1d4d"
    ))
  )
})

# (2) For continous scales, where colours are interpolated
# Note: only test based on the first and last colours
# This way we can test it without making assumptions about the interpolation

# Test that reverse = FALSE keeps first and last colour of the palette
test_that("scale_colour_zhweb(discrete = FALSE, reverse=FALSE)
          keeps the colour order", {
  result <- scale_colour_zhweb("zhweb_divergingRedBlue",
    discrete = FALSE, reverse = FALSE
  )
  colours <- result$palette(c(0, 1))
  expect_equal(
    toupper(colours),
    toupper(c("#9e1d4d", "#125c96"))
  )
})

# Test that reverse = TRUE flips first and last colour of the palette
test_that("scale_colour_zhweb(discrete = FALSE, reverse=TRUE)
          reverses the colour order", {
  result <- scale_colour_zhweb("zhweb_divergingRedBlue",
    discrete = FALSE, reverse = TRUE
  )
  colours <- result$palette(c(0, 1))
  expect_equal(
    toupper(colours),
    toupper(c("#125c96", "#9e1d4d"))
  )
})

# Test if adding arguments from ggplot2::scale_colour_manual and
# ggplot2::scale_colour_gradientn works

test_that("forwards additional arguments to discrete scale", {
  scale <- scale_colour_zhweb(
    discrete = TRUE,
    na.value = "hotpink"
  )
  expect_equal(scale$na.value, "hotpink")
  expect_s3_class(scale, "ScaleDiscrete")
})

test_that("forwards additional arguments to continuous scale", {
  scale <- scale_colour_zhweb(
    discrete = FALSE,
    na.value = "hotpink"
  )
  expect_equal(scale$na.value, "hotpink")
  expect_s3_class(scale, "ScaleContinuous")
})

# scale_fill_zhweb: --------------------------------------------------------

# Test that default arguments work
test_that("scale_fill_zhweb() does not throw errors", {
  result <- scale_fill_zhweb()
  expect_no_error(result)
})


# Test that the function returns the correct ggplot2 scale class
# For discrete scales
test_that("scale_fill_zhweb(discrete = TRUE)
          returns a scale_colour_manual", {
  result <- scale_fill_zhweb(discrete = TRUE)
  expect_true(inherits(result, "ScaleDiscrete"))
})

# (1) For discrete scales
test_that("scale_fill_zhweb(discrete = FALSE)
          returns a scale_colour_gradientn", {
  result <- scale_fill_zhweb(discrete = FALSE)
  expect_true(inherits(result, "ScaleContinuous"))
})

# Test that reverse=FALSE keeps the colour order
test_that("scale_fill_zhweb(discrete = TRUE, reverse=FALSE)
          keeps the colour order", {
  result <- scale_fill_zhweb("zhweb_divergingRedBlue",
    discrete = TRUE, reverse = FALSE
  )
  colours <- as.vector(result$palette(15))
  expect_equal(
    toupper(colours),
    toupper(c(
      "#9e1d4d", "#bf2960", "#d94274",
      "#e26d8d", "#e594a7", "#e8b7c1",
      "#eed6db", "#f1f1f1", "#cfdfef",
      "#aacae9", "#80b4e6", "#559ee1",
      "#2c88d3", "#1b72b6", "#125c96"
    ))
  )
})

# Test that reverse=TRUE flips the colour order
test_that("scale_fill_zhweb(discrete = TRUE, reverse=FALSE)
          reverses the colour order", {
  result <- scale_fill_zhweb("zhweb_divergingRedBlue",
    discrete = TRUE, reverse = TRUE
  )
  colours <- as.vector(result$palette(15))
  expect_equal(
    toupper(colours),
    toupper(c(
      "#125c96", "#1b72b6", "#2c88d3",
      "#559ee1", "#80b4e6", "#aacae9",
      "#cfdfef", "#f1f1f1", "#eed6db",
      "#e8b7c1", "#e594a7", "#e26d8d",
      "#d94274", "#bf2960", "#9e1d4d"
    ))
  )
})

# (2) For continous scales, where colours are interpolated
# Note: only test based on the first and last colours
# This way we can test it without making assumptions about the interpolation

# Test that reverse = FALSE keeps first and last colour of the palette
test_that("scale_fill_zhweb(discrete = FALSE, reverse=FALSE)
          keeps the colour order", {
  result <- scale_fill_zhweb("zhweb_divergingRedBlue",
    discrete = FALSE, reverse = FALSE
  )
  colours <- result$palette(c(0, 1))
  expect_equal(
    toupper(colours),
    toupper(c("#9e1d4d", "#125c96"))
  )
})

# Test that reverse = TRUE flips first and last colour of the palette
test_that("scale_fill_zhweb(discrete = FALSE, reverse=TRUE)
          reverses the colour order", {
  result <- scale_fill_zhweb("zhweb_divergingRedBlue",
    discrete = FALSE, reverse = TRUE
  )
  colours <- result$palette(c(0, 1))
  expect_equal(
    toupper(colours),
    toupper(c("#125c96", "#9e1d4d"))
  )
})

# Test if adding arguments from ggplot2::scale_fill_manual and
# ggplot2::scale_fill_gradientn works

test_that("forwards additional arguments to discrete scale", {
  scale <- scale_fill_zhweb(
    discrete = TRUE,
    na.value = "hotpink"
  )
  expect_equal(scale$na.value, "hotpink")
  expect_s3_class(scale, "ScaleDiscrete")
})

test_that("forwards additional arguments to continuous scale", {
  scale <- scale_fill_zhweb(
    discrete = FALSE,
    na.value = "hotpink"
  )
  expect_equal(scale$na.value, "hotpink")
  expect_s3_class(scale, "ScaleContinuous")
})
