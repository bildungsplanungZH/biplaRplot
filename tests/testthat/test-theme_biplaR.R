test_that("theme_biplaR() returns a ggplot theme", {
    expect_s3_class(theme_biplar(grid_x = FALSE),
                    c("theme", "gg"))
})

test_that("ssz_theme returns errors if incorrect parameters specified", {
    expect_error(theme_biplar(grid_x = "a"))
})
