test_that("Palettes populate as expected", {
  
  pal <- boe_pal(palette = "boe", n = 4)
  
  pal2 <- boe_pal(palette = "boe_rich", n = 5)
  
  expect_identical(pal[1], "#A51140")
  expect_length(pal, 4)
  expect_identical(pal2[4], "#C94D1B")
  expect_length(pal2, 5)
})

test_that("Palette reversal works", {
  
  pal <- boe_pal(palette = "boe", n = 4, reverse = TRUE)
  
  expect_identical(pal[1], "#E05206") #"#1E1E1E")
  expect_length(pal, 4)
})

test_that("Palettes that aren't big enough throw a warning", {
  
  expect_warning(boe_pal(palette = "vibrant_a", n = 4))
})

test_that("Unknown palettes fail", {
  
  expect_error(boe_pal(palette = "foo", n = 4))
})


