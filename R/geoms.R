#' A wrapper for the text geometry in ggplot2
#'
#' This function is identical to \code{\link[ggplot2]{geom_text}} in ggplot2.
#' The only difference is that the default arguments implement the Bank chart
#' design style.
#'
#' @param colour An RGB hex string indicating the color to use for the text 
#' ("#ffffff" by default)
#' @param family font family ("Arial" by default)
#' @param fontface font face ("bold" by default)
#' @param ... Any other arguments passed to \code{geom_text}.
#' @export

geom_text_boe_identity <- function(
  colour = "#ffffff",
  family = "Arial",
  fontface = "bold",
  ...) {
  
  ggplot2::geom_text(
    colour = colour,
    family = family,
    fontface = fontface,
    ...)
}

#' A wrapper for the annotate function in ggplot2
#'
#' This function is identical to \code{\link[ggplot2]{annotate}} in ggplot2.
#' The only difference is that the default arguments implement the pilot chart
#' style.
#'
#' @inheritParams geom_text_boe_identity
#' @param size size of the text (5 by default)
#' @param ... Any other arguments passed to \code{annotate}.
#' @export

annotate_boe_identity <- function(
  colour = "#ffffff",
  family = "Arial",
  fontface = "bold",
  size = 5,
  ...) {
  
  ggplot2::annotate(
    "text",
    family = family,
    fontface = fontface,
    colour = colour,
    size = size,
    ...)
}