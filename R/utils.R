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


check_pal_n <- function(n, pal) {
  if (n > length(pal)) {
    warning("This palette can handle a maximum of ", length(pal), " values.",
            "You have supplied ", n, ".")
  } else if (n < 0) {
    stop("`n` must be a non-negative integer.")
  }
}