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


#' A Bank colour palette generator
#'
#' Create Bank colour palettes for plots.
#' 
#' @param palette character string indicating the palette to use. Options
#' available are in \code{\link[boeCharts]{boe_palettes}} (e.g. "boe rich").
#' 
#' @param n Number of palette colours to use
#' 
#' @param reverse Logical, sets the order of colours in the scale. If TRUE,
#' the palette will be reversed (FALSE by default).
#'
#' @family colour boe
#'
#' @export
#' 
#' @examples
#' pal <- boe_pal(palette = "boe", n = 4)
boe_pal <- function(palette, n, reverse = FALSE) {
  
  if (!is.logical(reverse)) stop("reverse must be TRUE or FALSE.")
  
  pal <- unname(boe_palettes[[palette]])
  
  if (is.null(pal)) stop("Palette not found.")
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  check_pal_n(n, pal)
  
  out <- pal[1:n]
  
  if (!reverse) out <- rev(out)
  
  structure(out, class = "palette", palette = palette)
}

pal_pal <- function(palette, reverse) {
  
  function(n) {
    boe_pal(palette = palette, reverse = reverse)
  }
  
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "palette"), cex = 1, family = "serif")
}
