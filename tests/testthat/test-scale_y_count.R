test_that("Hochkomma wird eingefügt", {

    ex_data <- data.frame(
        group = c("A", "B", "C"),
        n = c(7234, 4597, 9346))

    p <- ex_data |>
        ggplot2::ggplot(ggplot2::aes(group, n)) +
        ggplot2::geom_col() +
        scale_y_count()
})
