test_that("theme font defaults are applied correctly", {
  theme_over <- theme_overground()
  
  expect_that(theme_over$plot.title$family, equals("Calibri"))
  expect_that(theme_over$plot.subtitle$family, equals("Calibri"))
  expect_that(theme_over$axis.title$family, equals("Calibri"))
  expect_that(theme_over$axis.title.x$family, equals("Calibri"))
  expect_that(theme_over$axis.title.y$family, equals("Calibri"))
  expect_that(theme_over$axis.text$family, equals("Calibri"))
  expect_that(theme_over$axis.text.x$family, equals("Calibri"))
  expect_that(theme_over$axis.text.y$family, equals("Calibri"))
  expect_that(theme_over$plot.caption$family, equals("Calibri"))
  expect_that(theme_over$legend.text$family, equals("Calibri"))
})

test_that("theme font choices are applied correctly", {

  theme_over <- theme_overground(base_family = "Arial")
  
  expect_that(theme_over$plot.title$family, equals("Arial"))
  expect_that(theme_over$plot.subtitle$family, equals("Arial"))
  expect_that(theme_over$axis.title$family, equals("Arial"))
  expect_that(theme_over$axis.title.x$family, equals("Arial"))
  expect_that(theme_over$axis.title.y$family, equals("Arial"))
  expect_that(theme_over$axis.text$family, equals("Arial"))
  expect_that(theme_over$axis.text.x$family, equals("Arial"))
  expect_that(theme_over$axis.text.y$family, equals("Arial"))
  expect_that(theme_over$plot.caption$family, equals("Arial"))
  expect_that(theme_over$legend.text$family, equals("Arial"))
})