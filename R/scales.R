#' Discrete scales to use with ggplot2
#'
#' These functions provide the option to use \code{boeCharts} colours inside discrete
#' palettes with the `ggplot2` package.
#'
#' @name ggplot2-scales-discrete
#' 
#' @inheritParams boe_pal
#' @param ... additional arguments to pass to \link[ggplot2]{discrete_scale}
#'
#' @family colour boe
#'
#'
#' @seealso \code{\link{theme_overground}} for examples.
NULL

#' @rdname ggplot2-scales-discrete 
#' @export
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'     geom_point() +
#'     scale_colour_discrete_boe("boe_highlights")
#'     
scale_colour_discrete_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  discrete_scale("colour", scale_name = palette, 
                 pal_pal(palette = palette, reverse = reverse), ...)
}

#' @rdname ggplot2-scales-discrete
#' @export
#' 
#' @examples 
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'     geom_point() +
#'     scale_fill_discrete_boe(boe_palettes$vibrant_a)
scale_fill_discrete_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  discrete_scale(aesthetics = "fill", scale_name = palette, 
                 pal_pal(palette = palette, reverse = reverse), ...)
}

#' @rdname ggplot2-scales-discrete 
#' @export
scale_colour_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  .Deprecated("scale_colour_discrete_boe")
  
  scale_colour_discrete_boe(palette = palette, reverse = reverse, ... = ...)
} 

#' @rdname ggplot2-scales-discrete 
#' @export
scale_fill_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  .Deprecated("scale_fill_discrete_boe")
  
  scale_fill_discrete_boe(palette = palette, reverse = reverse, ... = ...)
}

#' Continuous scales for use with ggplot2
#'
#' These functions provide the option to use \code{boeCharts} colours inside continuous
#' palettes with the `ggplot2` package. Specify a midpoint for extra control over a 
#' diverging scale.
#' 
#' @param palette character string indicating the palette to use. Options
#' available are in \code{\link[boeCharts]{boe_palettes}} (e.g. "boe rich").
#' @param reverse Logical, sets the order of colours in the scale. If TRUE,
#' the palette will be reversed (FALSE by default).
#' @inheritParams ggplot2::continuous_scale
#' @inheritDotParams ggplot2::continuous_scale
#' @inheritParams scales::gradient_n_pal
#' @param midpoint If midpoint = NA, colours evenly spread; set this to a value to anchor the middle colour, e.g. midpoint = 0
#' 
#' @return ggplot colour scale
#'
#' @family colour boe
#'
#' @name ggplot2-scales-continuous
NULL

#' @rdname ggplot2-scales-continuous
#' @export
#' @examples
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(mpg, wt, colour=disp)) +
#'   geom_point() +
#'   scale_colour_continuous_boe(palette=boe_harmonious_palettes$harmonious_green)
#'
#' ggplot(mtcars, aes(mpg, wt, colour=disp)) +
#'   geom_point() +
#'   scale_colour_continuous_boe("red_yellow_blue")
#'
scale_colour_continuous_boe <- function(palette,
                                        midpoint = NA,
                                        reverse = FALSE, 
                                        values = NULL,
                                        na.value = "grey50", 
                                        guide = "colourbar",
                                        ...) {
  
  scale_continuous_boe(aesthetics = "colour", 
                       palette = palette, 
                       midpoint = midpoint, 
                       reverse = reverse, 
                       values = values, 
                       na.value = na.value, 
                       guide = guide, 
                       ...)
}

#' @rdname ggplot2-scales-continuous
#' @export
#' @examples
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(mpg, wt, fill=disp)) +
#'   geom_col() +
#'   scale_fill_continuous_boe(palette=boe_harmonious_palettes$harmonious_green)
#'
#' ggplot(mtcars, aes(mpg, wt, fill=disp)) +
#'   geom_col() +
#'   scale_fill_continuous_boe("red_yellow_blue")
#'
scale_fill_continuous_boe <- function(palette,
                                      midpoint = NA,
                                      reverse = FALSE, 
                                      values = NULL,
                                      na.value = "grey50", 
                                      guide = "colourbar",
                                     ...) {
  scale_continuous_boe(aesthetics = "fill",
                       palette = palette, 
                       midpoint = midpoint, 
                       reverse = reverse, 
                       values = values, 
                       na.value = na.value, 
                       guide = guide, 
                       ...)
}

# @param aesthetic Which chart aesthetic are we colouring? "colour" or "fill" 
# @param palette Palette from boe_palettes.  Either provide the palette name e.g. "red_blue" or the palette itself e.g. boe_diverging_palettes$red_blue
# @param reverse Use the colours in the opposite order (e.g. red-blue or blue-red)
# @param ... additional arguments to pass to \link[ggplot2]{continuous_scale}

#' @rdname ggplot2-scales-continuous
#' @export
#' @examples
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(mpg, wt, fill=disp)) + 
#'   geom_col() +
#'   scale_continuous_boe(aesthetic="fill", palette="red_blue")
#'   
#' ggplot(mtcars, aes(mpg, wt, colour = disp)) +
#'   geom_point() +
#'   scale_continuous_boe(aesthetic="colour", palette=boe_diverging_palettes$red_green, midpoint = 200)
#'   
scale_continuous_boe <- function(aesthetics = c("colour", "fill"),
                                palette,
                                midpoint = NA,
                                reverse = FALSE, 
                                values = NULL,
                                na.value = "grey50", 
                                guide = "colourbar",
                                ...) {
  
  cols <- colours_from_palette(palette)
  
  # check aesthetic
  aesthetics <- match.arg(aesthetics)
  
  if (reverse) {
    cols <- rev(cols)
  }
  
  # Call gradientn for a general scale, or gradient2 for one with a specified midpoint value and mid-colour
  if (is.na(midpoint)) {
    
    continuous_scale(aesthetics = aesthetics,
                     scale_name = "gradientn", 
                     scales::gradient_n_pal(cols, values, "Lab"), 
                     na.value = na.value, 
                     guide = guide, 
                     ...)
  } else {
    
    continuous_scale(aesthetics = aesthetics, 
                     scale_name = "gradient2", 
                     palette = scales::div_gradient_pal(cols[[1]], cols[[ceiling((length(cols) + 1)/2)]], cols[[length(cols)]], space = "Lab"), 
                     na.value = na.value, 
                     guide = guide, 
                     ..., 
                     rescaler = function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) { scales::rescale_mid(x, to, from, midpoint) }) #ggplot2:::mid_rescaler(mid = midpoint))
  }
 
}

