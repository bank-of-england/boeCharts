#' @title Show colours in a Bank colour palette
#'
#' @description \code{\link{show_palette_cols}} produces a pie chart of colours
#' that make up a \code{boeChartr} palette.
#'
#' @param x a named character vector of colours e.g. \code{\link{boe_cols_rich}}
#'
#' @return A pie chart displaying the colour scheme.
#'
#' @examples
#'
#' library(boeChartr)
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
