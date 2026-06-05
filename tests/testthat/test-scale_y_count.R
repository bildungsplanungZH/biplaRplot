ex_data <- data.frame(
  group = c("A", "B", "C"),
  n = c(7234, 4597, 9346)
)

p <- ex_data |>
  ggplot2::ggplot(ggplot2::aes(group, n)) +
  ggplot2::geom_col() +
  scale_y_count()

test_that("Erzeugt ggplot-Objekt", {
  expect_s3_class(p, "ggplot")
})

test_that("Plot ausgeben funktioniert", {
  expect_error(print(p), NA)
})

test_that("Default Achsenbeschriftung = Anzahl Lernende", {
  expect_equal(p$scales$scales[[1]]$name, "Anzahl Lernende")
})

test_that("Achsenbeschriftung kann überschrieben werden", {
  p2 <- ex_data |>
    ggplot2::ggplot(ggplot2::aes(group, n)) +
    ggplot2::geom_col() +
    scale_y_count(name = "Testlabel")
  expect_equal(p2$scales$scales[[1]]$name, "Testlabel")
})
