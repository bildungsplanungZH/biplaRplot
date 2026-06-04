ex_data <- data.frame(
  group = c("A", "B", "C"),
  n = c(.7234, .4597, .9346)
)

p <- ex_data |>
  ggplot2::ggplot(ggplot2::aes(n, group)) +
  ggplot2::geom_col() +
  scale_x_pct(limits = c(0, 1))


test_that("Erzeugt ggplot-Objekt", {
  expect_s3_class(p, "ggplot")
})

test_that("Plot ausgeben funktioniert", {
  expect_error(print(p), NA)
})

test_that("Default Achsenbeschriftung = Anteil in Prozent", {
  expect_equal(p$scales$scales[[1]]$name, "Anteil in Prozent")
})

test_that("Achsenbeschriftung kann überschrieben werden", {
  p2 <- ex_data |>
    ggplot2::ggplot(ggplot2::aes(n, group)) +
    ggplot2::geom_col() +
    scale_x_pct(limits = c(0, 1), name = "Testlabel")
  expect_equal(p2$scales$scales[[1]]$name, "Testlabel")
})
