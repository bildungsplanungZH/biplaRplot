#################################
##### Test Colour Functions #####
#################################


# reset_zhweb_colours: -----------------------------------------------------

# Test if resetting the colour registry works
test_that("reset_zhweb_colours:
          registry is empty after reset", {
  # Add something to the registry
  assign_project_colours("singers", c("Madonna", "Prince", "Elvis"))

  # Registry exists
  expect_true(is.list(zhweb_project_colours$registry))

  # Registry contains an entry
  expect_gt(length(zhweb_project_colours$registry), 0)

  # Expect empty registry after reset.
  reset_zhweb_colours()
  expect_length(zhweb_project_colours$registry, 0)
})


# assign_project_colours: --------------------------------------------------

reset_zhweb_colours()

# Test unique colour assignment
test_that("assign_project_colours:
          returns named unique palette colours per domain", {
  result1 <- assign_project_colours(
    "reptilia",
    c("alligator", "turtle")
  )

  # Expect named vector as output
  expect_named(result1, c("alligator", "turtle"))

  # Expect output-vector length equal to categories-length
  expect_length(result1, 2)

  # Expect first and second argument in vector to be different
  expect_false(result1[1] == result1[2])

  # Expect colours to come from zhweb palette
  expect_true(all(result1 %in% zhweb_colours$zhweb))

  # Add second domain
  result2 <- assign_project_colours(
    "fruit",
    c("banana", "pear", "apple")
  )

  # Ensure there is no overlap to first domain
  expect_equal(intersect(result1, result2), character(0))
})

reset_zhweb_colours()

# Test use of zhweb_additional for long vectors
test_that("assign_project_colours:
          uses zhweb_additional if necessary", {
  categories <- paste0("num_", 1:20)
  result <- assign_project_colours("numbers", categories)

  # Expect first 18 colours from zhweb palette
  expect_true(all(result[1:18] %in% zhweb_colours$zhweb))

  # Expect last 2 colours from zhweb_additional
  expect_true(all(result[19:20] %in% zhweb_colours$zhweb_additional))

  # Ensure all colours are unique
  expect_equal(length(unique(result)), length(result))
})

reset_zhweb_colours()

# Test leaving out zhweb_additional, but having too many categories
test_that("assign_project_colours:
         use_additional = FALSE errors when zhweb palette is exhausted", {
  categories <- paste0("num_", 1:20)
  expect_error(
    assign_project_colours("numbers",
      categories,
      use_additional = FALSE
    ),
    "Not enough unused colours available for domain"
  )
})


# preview_zhweb_colours: --------------------------------------------------

reset_zhweb_colours()

# Error if domain has no colours
test_that("preview_zhweb_colours:
          error when domain has no colours", {
  expect_error(
    preview_zhweb_colours("empty_domain"),
    "No colours assigned for domain:"
  )
})

# Test that it runs with no error when colours are defined
test_that("preview_zhweb_colours:
          output is a ggplot object", {
  palette <- assign_project_colours(
    "vegetables",
    c("carrots", "cucumbers")
  )
  expect_no_error(preview_zhweb_colours("vegetables"))
})


# list_zhweb_colour_domains: -----------------------------------------------

reset_zhweb_colours()

# Test that it returns the correct domain names
test_that("list_zhweb_colour_domains:
          returns correct domain names", {
  # Create multiple palettes
  assign_project_colours(
    "drinks",
    c("water", "fanta", "wine")
  )
  assign_project_colours(
    "cooking_utensils",
    c("spatula", "knive", "whisk")
  )
  assign_project_colours(
    "ice_cream",
    c("vanilla", "chocolate", "pistacchio")
  )

  result <- list_zhweb_colour_domains()
  expect_equal(
    result,
    c("drinks", "cooking_utensils", "ice_cream")
  )
})


reset_zhweb_colours()

# Test returns NULL vector, if registry is empty
test_that("list_zhweb_colour_domains:
          returns empty vector if no domains saved", {
  result <- list_zhweb_colour_domains()
  expect_null(result)
})
