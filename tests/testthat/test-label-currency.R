test_that("label_pound works", {
  expect_equal(label_pound()(100.75), paste0(intToUtf8(0x00A3), 100.75))
})

test_that("label_euro works", {
  expect_equal(label_euro()(100.75), paste0(intToUtf8(0x20AC), 100.75))
})