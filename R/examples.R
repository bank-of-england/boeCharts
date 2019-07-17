# ## Examples
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#   geom_point() +
#   scale_colour_discrete_boe("boe_highlights")
# 
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#   geom_point() +
#   scale_colour_discrete_boe(boe_highlights)
# 
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#   geom_point() +
#   scale_colour_discrete_boe(boe_vibrant_palettes$vibrant_f)
# 
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
#   geom_point() +
#   scale_colour_continuous_boe(boe_palettes$harmoniousGreen, reverse = T)
# 
# ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
#   geom_point() +
#   scale_colour_continuous_boe(boe_palettes$vibrantA, midpoint = 5)
# 
# boe_pal(boe_highlights, 7)
# 
# 
# ggplot(mtcars, aes(mpg, wt, fill = disp)) +
#   geom_col() +
#   scale_continuous_boe(aesthetic="fill", palette="red_yellow_green")
# 
# tryCatch(
#   ggplot(mtcars, aes(mpg, wt, colour = wt)) +
#     geom_point() +
#     scale_continuous_boe(aesthetic = "bob", palette=boe_diverging_palettes$red_green),
#   error = function(e) message(e)
# )
# 
# ggplot(mtcars, aes(mpg, wt, fill = disp)) +
#   geom_col() +
#   scale_fill_continuous_boe(palette=boe_diverging_palettes$red_green)
# 
# ggplot(mtcars, aes(mpg, wt, fill = disp)) +
#   geom_col() +
#   scale_fill_continuous_boe("red_yellow_blue")
# 
# ggplot(mtcars, aes(mpg, wt, colour = disp)) +
#   geom_point() +
#   scale_colour_continuous_boe(palette=boe_diverging_palettes$red_green)
# 
# ggplot(mtcars, aes(mpg, wt, colour = disp)) +
#   geom_point() +
#   scale_colour_continuous_boe(palette=boe_diverging_palettes$red_green, midpoint = 200)
# 
# show_palette_cols(boe_palettes$harmonious_purple)

# library(ggplot2)
# library(boeCharts)
# 
# ggplot(mtcars, aes(mpg, wt, colour = disp)) +
#   geom_point() +
#   scale_colour_continuous_boe(boe_diverging_palettes$red_green, midpoint = 200)
# 
