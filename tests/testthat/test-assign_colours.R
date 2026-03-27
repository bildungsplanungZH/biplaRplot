#################################
##### Test Colour Functions #####
#################################

# 0 reset_zhweb_colours: ---------------------------------------------------

# 0.1 Test if resetting the colour registry works
test_that("reset_zhweb_colours:
          registry is empty after reset", {
              # Add something to the registry
              assign_project_colours("singers", c("Madonna", "Prince", "Elvis"))

              # 0.1.1 Registry exists
              expect_true(is.list(zhweb_project_colours$registry))

              # 0.1.2 Registry contains an entry
              expect_gt(length(zhweb_project_colours$registry), 0)

              # 0.1.3 Expect empty registry after reset.
              reset_zhweb_colours()
              expect_length(zhweb_project_colours$registry, 0)

          })

# 1 assign_project_colours: ------------------------------------------------

# Empty colour registry before tests
reset_zhweb_colours()

# 1.1 Test unique colour assignment
test_that("assign_project_colours:
          returns named unique palette colours per domain", {

            result1 <- assign_project_colours("reptilia", c("alligator", "turtle"))

            # 1.1.1 Expect named vector as output
            expect_named(result1, c("alligator", "turtle"))

            # 1.1.2 Expect output-vector length equal to categories-length
            expect_length(result1, 2)

            # 1.1.3 Expect first and second argument in vector to be different
            expect_false(result1[1]==result1[2])

            # 1.1.4 Expect colours to come from zhweb palette
            expect_true(all(result1 %in% zhweb_colours$zhweb))

            # 1.1.5 Add second domain and ensure there is no overlap to first domain
            result2 <- assign_project_colours("fruit", c("banana", "pear", "apple"))
            expect_false(all(result2 %in% result1))

})

# 1.2 Test use of zhweb_additional for long vectors
# Empty colour registry before tests
reset_zhweb_colours()

test_that("assign_project_colours:
          uses zhweb_additional if necessary", {
              categories <- paste0("num_", 1:20)
              result3 <- assign_project_colours("numbers", categories)

              # 1.2.1 Expect first 18 colours from zhweb palette
              expect_true(all(result3[1:18] %in% zhweb_colours$zhweb))

              # 1.2.1 Expect last 2 colours from zhweb_additional
              expect_true(all(result3[19:20] %in% zhweb_colours$zhweb_additional))

              # 1.2.3 Ensure all colours are unique
              expect_equal(length(unique(result3)), length(result3))
})



# preview_zhweb_colours: --------------------------------------------------



#list_zhweb_colour_domains: -----------------------------------------------
