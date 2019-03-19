#' List of Bank colour palettes
#'
#' Bank colour palettes made accessible via a single list.
#'
#' @export
boe_palettes <- list(
  `boe` = boe_cols,
  `boeRich` = boe_cols_rich,
  `boeHighlights` = boe_cols_highlights,
  `boeSoft` = boe_cols_soft,
  `boeNeutral` = boe_cols_neutral,
  `harmoniousBlue` = harmonious_blue,
  `harmoniousTeal` = harmonious_teal,
  `harmoniousGreen` = harmonious_green,
  `harmoniousOrange` = harmonious_orange,
  `harmoniousPurple` = harmonious_purple,
  `harmoniousPink` = harmonious_pink,
  `harmoniousRed` = harmonious_red,
  `harmoniousGrey` = harmonious_grey,
  `vibrantA` = vibrant_a,
  `vibrantB` = vibrant_b,
  `vibrantC` = vibrant_c,
  `vibrantD` = vibrant_d,
  `vibrantE` = vibrant_e,
  `vibrantF` = vibrant_f,
  `vibrantG` = vibrant_g,
  `vibrantH` = vibrant_h,
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
