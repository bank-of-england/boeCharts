test_that("label_year_short works", {
  expect_equal(
    unique(label_year_short()(gold_holdings$date)), 
    c("2011", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21")
    )
})
