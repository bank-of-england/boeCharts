single_source <- "foo"
two_source <- c("foo", "bar")
multi_source <- c("foo", "bar", "mmm")

test_that("caption_source() formats sources correctly", {
  expect_equal(caption_source(single_source), "Source: foo.")
  expect_equal(
    caption_source(single_source, manipulated_data = TRUE), 
    "Sources: foo and Bank calculations."
    )
  expect_equal(caption_source(two_source), "Sources: bar and foo.")
  expect_equal(
    caption_source(two_source, manipulated_data = TRUE), 
    "Sources: bar, foo and Bank calculations."
    )
  expect_equal(caption_source(multi_source), "Sources: bar, foo and mmm.")
})

test_that("caption_footnote() formats footnotes correctly", {
  expect_equal(caption_footnote(single_source), "(a) foo")
  expect_equal(caption_footnote(two_source), "(a) foo\n(b) bar")
  expect_equal(caption_footnote(multi_source), "(a) foo\n(b) bar\n(c) mmm")
})

test_that("caption_boe() formats sources and footnotes correctly", {
  expect_equal(
    caption_boe(single_source, footnote = two_source), "Source: foo.\n(a) foo\n(b) bar"
    )
})