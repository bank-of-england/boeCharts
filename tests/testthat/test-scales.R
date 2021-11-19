col_boe_rich <- ggplot(mtcars, aes(x = mpg, y = wt, colour = factor(cyl))) +
  geom_jitter() +
  scale_colour_discrete_boe(palette = "boe_rich")
g1 <- ggplot_build(col_boe_rich)

fill_boe_rich <- ggplot(mtcars, aes(x = mpg, y = wt, fill = factor(cyl))) +
  geom_col() +
  scale_fill_discrete_boe(palette = "boe_rich")
g2 <- ggplot_build(fill_boe_rich)

test_that("discrete colour scale works works", {
  expect_setequal(
    unique(g1$data[[1]][["colour"]]), unlist(boe_rich[1:3])
    )
  expect_setequal(
    unique(g2$data[[1]][["fill"]]), unlist(boe_rich[1:3])
  )
})
