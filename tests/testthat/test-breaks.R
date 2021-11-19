
num_vec <- c(0, 9)
num_vec_rev <- -num_vec
b1 <- boe_breaks_numeric()(num_vec)
b2 <- boe_breaks_numeric()(num_vec_rev)

date_vec <- seq.Date(from = as.Date("2000-01-01"), to = as.Date("2001-10-01"),
                     by = "1 month")
b3 <- boe_breaks_date()(date_vec)

test_that("numeric breaks are calculated correctly", {
  expect_equal(b1, seq(0, 10, by = 2.5))
  expect_equal(b2, seq(-10, 0, by = 2.5))
})

test_that("date breaks are calculated correctly", {
  expect_equivalent(
    b3, 
    as.Date(
      c("2000-01-01", "2000-07-01", "2001-01-01", "2001-07-01", "2002-01-01")
      )
    )
})
