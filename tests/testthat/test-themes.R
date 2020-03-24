context("themes")
test_that("themes are correct", {

  df <- data.frame(x = 1:3, y = 1:3, z = c("a", "b", "a"), a = 1)
  
  plot <- ggplot(df, aes(x, y, colour = z)) +
    geom_point() +
    facet_wrap(~ a)
  
  vdiffr::expect_doppelganger("theme_mcg_pub", plot + theme_mcg_pub())
  vdiffr::expect_doppelganger("theme_overground", plot + theme_overground())
  vdiffr::expect_doppelganger("theme_mpr", plot + theme_mpr())
})