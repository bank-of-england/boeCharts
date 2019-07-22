#' @title Show colours in a Bank colour palette
#'
#' @description \code{\link{show_palette_cols}} produces a pie chart of colours
#' that make up a \code{boeCharts} palette.
#'
#' @param x a named character vector of colours e.g. \code{\link{boe_cols_rich}}
#'
#' @return A pie chart displaying the colour scheme.
#'
#' @examples
#'
#' library(boeCharts)
#'
#' show_palette_cols(
#' x = boe_cols_rich
#' )
#'
#' @export
show_palette_cols <- function(x) {
  graphics::pie(
    rep(1, length(x)),
    col = x,
    labels = names(x))
}

#' Convert list or named vector of colours for use in ggplot manual scale
#' 
#' @description Convert colours from a palette into an unnamed vector,
#' of a specified length, for use in \code{ggplot} - particularly manual
#' scales e.g. \code{scale_colour_manual()}.
#'
#' @param palette List or vector of colours (e.g. \code{boe_cols})
#' 
#' @param n Number of colours to return
#'
#' @return unnamed vector of n colours
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'   
#' ggplot(mtcars, aes(hp, mpg, colour = as.factor(cyl))) +
#'   geom_point(shape = 16) +
#'   scale_colour_manual(values = ggplotise(boe_cols, 3))

ggplotise <- function(palette, n = -1) {
  
  palette <- unlist(palette)

  if (n > 0) {
    n <- min(length(palette), n)
    palette <- palette[1:n]
  }
  unname(palette)
}

# check palette length
check_pal_n <- function(n, pal) {
  if (n > length(pal)) {
    warning("This palette can handle a maximum of ", length(pal), " values.",
            "You have supplied ", n, ".")
  } else if (n < 0) {
    stop("`n` must be a non-negative integer.")
  }
}

# left-align text
left_align_titles <- function(chart) {
  
  grob <- ggplotGrob(chart)
  grob$layout$l[grob$layout$name %in% c("title", "subtitle")] <- 2
  
  grob
}
