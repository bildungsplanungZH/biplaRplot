ex_data <- data.frame(
  group = c("A", "B", "C"),
  n = c(.7234, .4597, .9346)
)

p <- ex_data |>
  ggplot2::ggplot(ggplot2::aes(group, n)) +
  ggplot2::geom_col() +
  scale_y_pct(limits = c(0, 1))


test_that("Erzeugt ggplot-Objekt", {
  expect_s3_class(p, "ggplot")
})

test_that("Plot ausgeben funktioniert", {
  expect_error(print(p), NA)
})
