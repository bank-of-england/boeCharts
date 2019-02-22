#' List of Bank colour palettes
#'
#' Bank colour palettes made accessible via a single list.
#'
#' @export
boe_palettes <- list(
  `boe` = boe_cols,
  `harmonious blue` = harmonious_blue,
  `harmonious teal` = harmonious_teal,
  `harmonious green` = harmonious_green,
  `harmonious orange` = harmonious_orange,
  `harmonious purple` = harmonious_purple,
  `harmonious pink` = harmonious_pink,
  `harmonious red` = harmonious_red,
  `harmonious grey` = harmonious_grey,
  `vibrant A` = vibrant_a,
  `vibrant B` = vibrant_b,
  `vibrant C` = vibrant_c,
  `vibrant D` = vibrant_d,
  `vibrant E` = vibrant_e,
  `vibrant F` = vibrant_f,
  `vibrant G` = vibrant_g,
  `vibrant H` = vibrant_h,
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
boe_pal <- function(palette = "boe", reverse = FALSE) {
  function(n) {

    colors <- boe_palettes[[palette]]
    
    check_pal_n(n, max_n = length(colors))

    if (reverse == TRUE) colors <- rev(colors)

    unname(colors[seq_len(n)])
  }
}


#' Bank colour scales
#'
#' Colour scales using the Bank colours.
#'
#' @param palette character string indicating the palette to use. Options
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
