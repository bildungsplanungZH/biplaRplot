test_that("X-Achse zeigt Schuljahre", {

    ex_data <- data.frame(
        jahr = c(2023, 2024, 2025),
        n = c(7, 4, 9))

    p <- ex_data |>
        ggplot2::ggplot(ggplot2::aes(jahr, n)) +
        ggplot2::geom_col() +
        scale_x_syear()

})
