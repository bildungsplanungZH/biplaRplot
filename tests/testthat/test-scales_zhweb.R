#######################################
##### Test Scale Colour Functions #####
#######################################


# zhweb_palettes: ----------------------------------------------------------

# Test the the function returns a palette object
test_that("returns a palette object with correct attributes", {
    test_object <- zhweb_palettes("zhweb", 3)

    expect_s3_class(test_object, "palette")
    expect_equal(attr(test_object, "name"), "zhweb")
    expect_length(test_object, 3)
})


# scale_colour_zhweb: ------------------------------------------------------

# Test that the function returns the correct ggplot2 scale class
# For discrete scales
test_that("discrete = TRUE returns a scale_colour_manual", {
    result <- scale_colour_zhweb(discrete = TRUE)
    expect_true(inherits(result, "ScaleDiscrete"))
})

# (1) For discrete scales
test_that("discrete = FALSE returns a scale_colour_gradientn", {
    result <- scale_colour_zhweb(discrete = FALSE)
    expect_true(inherits(result, "ScaleContinuous"))
})

# Test that reverse=FALSE keeps the colour order
test_that("reverse=FALSE keeps the colour order", {
    result <- scale_colour_zhweb("zhweb_divergingRedBlue",
                                 discrete = TRUE, reverse = FALSE)
    colours <- as.vector(result$palette(15))
    expect_equal(toupper(colours),
                 toupper(c("#9e1d4d", "#bf2960", "#d94274",
                           "#e26d8d", "#e594a7", "#e8b7c1",
                           "#eed6db", "#f1f1f1", "#cfdfef",
                           "#aacae9", "#80b4e6", "#559ee1",
                           "#2c88d3", "#1b72b6", "#125c96")))
})

# Test that reverse=TRUE flips the colour order
test_that("reverse=TRUE flips the colour order", {
    result <-scale_colour_zhweb("zhweb_divergingRedBlue",
                                discrete= TRUE, reverse = TRUE)
    colours <- as.vector(result$palette(15))
    expect_equal(toupper(colours),
                 toupper(c("#125c96", "#1b72b6", "#2c88d3",
                           "#559ee1", "#80b4e6", "#aacae9",
                           "#cfdfef", "#f1f1f1", "#eed6db",
                           "#e8b7c1", "#e594a7", "#e26d8d",
                           "#d94274", "#bf2960", "#9e1d4d")))
})

# (2) For continous scales, where colours are interpolated
# Note: only test based on the first and last colours
# This way we can test it without making assumptions about the interpolation

# Test that reverse = FALSE keeps first and last colour of the palette
test_that("reverse=FALSE keeps the colour order", {
    result <- scale_colour_zhweb("zhweb_divergingRedBlue",
                                 discrete = FALSE, reverse = FALSE)
    colours <- result$palette(c(0, 1))
    expect_equal(toupper(colours),
                 toupper(c("#9e1d4d", "#125c96")))

})

# Test that reverse = TRUE flips first and last colour of the palette
test_that("reverse=FALSE keeps the colour order", {
    result <- scale_colour_zhweb("zhweb_divergingRedBlue",
                                 discrete = FALSE, reverse = TRUE)
    colours <- result$palette(c(0, 1))
    expect_equal(toupper(colours),
                 toupper(c("#125c96", "#9e1d4d")))

})



# scale_fill_zhweb: --------------------------------------------------------
