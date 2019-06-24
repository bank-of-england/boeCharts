#' Discrete scales to use with ggplot2
#'
#' These functions provide the option to use \code{boeCharts} colours inside discrete
#' palettes with the `ggplot2` package.
#'
#' @inheritParams boe_pal
#' 
#' @param ... additional arguments to pass to \link[ggplot2]{discrete_scale}
#'
#' @family colour boe
#'
#' @rdname ggplot2-scales
#'
#' @seealso \code{\link{theme_mcg_pub}} for examples.
#'
#' @export
#' 
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'     geom_point() +
#'     scale_colour_boe()
#'     
scale_colour_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  discrete_scale("colour", scale_name = palette, 
                 pal_pal(palette = palette, reverse = reverse), ...)
}

#' @rdname ggplot2-scales
#' @export
scale_fill_boe <- function(palette = "boe", reverse = FALSE, ...) {
  
  discrete_scale(aesthetics = "fill", scale_name = palette, 
                 pal_pal(palette = palette, reverse = reverse), ...)
}
