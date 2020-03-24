test_that("theme font defaults are applied correctly", {
  theme_over <- theme_overground()
  theme_mcg <- theme_mcg_pub()
  
  expect_equal(theme_over$plot.title$family, "Calibri")
  expect_equal(theme_mcg$plot.title$family, "")
})

test_that("theme font choices are applied correctly", {

  theme_over <- theme_overground(base_family = "Arial")
  
  expect_equal(theme_over$plot.title$family, "Arial")
})