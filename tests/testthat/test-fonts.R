theme_over <- theme_overground()
theme_mcg <- theme_mcg_pub()
theme_over_arial <- theme_overground(base_family = "Arial")

test_that("theme font defaults are applied correctly", {
  expect_equal(theme_over$text$family, "Calibri")
  expect_equal(theme_over$text$size, 11.5)
  expect_equal(theme_over$text$colour, "#657581")
  expect_equal(theme_over$plot.title$colour, "#005e6e")
  expect_equal(theme_over$plot.title$size, 18)
  expect_equal(theme_mcg$plot.title$family, "")
})

test_that("theme font choices are applied correctly", {
  expect_equal(theme_over_arial$text$family, "Arial")
})