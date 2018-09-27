#' List of Bank colour palettes
#'
#' Bank colour palettes made accessible via a single list.
#'
#' @export
boe_palettes <- list(
  `boe` = boe_cols,

  `boe rich` = boe_cols_rich,

  `boe highlights` = boe_cols_highlights,

  `boe soft` = boe_cols_soft,

  `boe neutral` = boe_cols_neutral,

  `mcg` = mcg_pub_cols
)


#' Bank colour palettes
#'
#' Bank colour palettes for plots.
#'
#' @family colour boe
#'
#' @keywords internal
#'
#' @export
boe_pal <- function(palette="boe", reverse = FALSE) {
  function(n) {

    colors <- boe_palettes[[palette]]

    if (reverse == TRUE) colors <- rev(colors)

    unname(colors[seq_len(n)])
  }
}


#' Bank colour scales
#'
#' Colour scales using the Bank colours.
#'
#' @param palette charachter string indicating the palette to use. Options
#' available are in \code{\link{boe_palettes}} (e.g. "boe rich")
#'
#' @param reverse Sets the order of colours in the scale - should they be reversed
#' (defaults to FALSE)
#'
#' @inheritParams ggplot2::scale_colour_hue
#'
#' @family colour boe
#'
#' @rdname scale_boe
#'
#' @seealso \code{\link{theme_mcg_pub}} for examples.
#'
#' @export
scale_colour_boe <- function(palette = "boe", reverse = FALSE, ...) {
  ggplot2::discrete_scale(aesthetics = "colour", scale_name = "boe", palette = boe_pal(palette = palette, reverse = reverse), ...)
}

#' @rdname scale_boe
#' @export
scale_fill_boe <- function(palette = "boe", reverse = FALSE, ...) {
  ggplot2::discrete_scale(aesthetics = "fill", scale_name = "boe", palette = boe_pal(palette = palette, reverse = reverse), ...)
}
