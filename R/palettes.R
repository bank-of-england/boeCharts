boe_identity_palettes <- list(
  boe_identity = boe_identity,
  boe_brand_main = boe_brand_main,
  boe_brand_secondary = boe_brand_secondary
)

#' @title List of boe standard colour palettes: boe, boe_rich, boe_soft, boe_highlights, boe_neutral
#'
#' @description List of lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{colours}.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
boe_standard_palettes <- list(boe = boe,
                              boe_rich = boe_rich,
                              boe_highlights = boe_highlights,
                              boe_soft = boe_soft,
                              boe_neutral = boe_neutral)

#' @title List of harmonious colour palettes
#'
#' @description List of lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{Harmonious colour combinations}.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
boe_harmonious_palettes <- list(harmonious_blue = harmonious_blue,
                                harmonious_teal = harmonious_teal,
                                harmonious_green = harmonious_green,
                                harmonious_orange = harmonious_orange,
                                harmonious_purple = harmonious_purple,
                                harmonious_pink = harmonious_pink,
                                harmonious_red = harmonious_red,
                                harmonious_grey = harmonious_grey)


#' @title List of vibrant colour palettes
#'
#' @description List of lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{Vibrant colour combinations}.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
boe_vibrant_palettes = list(vibrant_a = vibrant_a,
                            vibrant_b = vibrant_b,
                            vibrant_c = vibrant_c,
                            vibrant_d = vibrant_d,
                            vibrant_e = vibrant_e,
                            vibrant_f = vibrant_f,
                            vibrant_g = vibrant_g,
                            vibrant_h = vibrant_h)

#' @title List of pre-MPC colour palettes
#'
#' @description List of lists of named colours taken from the Bank's
#' pre Monetary Policy Committee (MPC) guidelines.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
pre_mpc_palettes = list(pre_mpc = pre_mpc, pre_mpc_light = pre_mpc_light)

#' @title List of FSR colour palettes
#'
#' @description List of lists of named colours taken from the Bank's
#' Financial Stability Report (FSR) guidelines.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
fsr_palettes = list(fsr = fsr, fsr_currency = fsr_currency, fsr_average = fsr_average)

#' @title List of diverging ColorBrewer-style colour palettes
#'
#' @description List of lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{colours}.
#'
#' @return A named list of lists of named hexadecimal colours.
#' 
#' @keywords internal
#'
#' @export
boe_diverging_palettes <- list(red_blue = red_blue,
                               red_green = red_green,
                               red_gray = red_gray,
                               red_yellow_green = red_yellow_green,
                               red_yellow_blue = red_yellow_blue,
                               purple_green = purple_green,
                               pink_green = pink_green)

#' List of Bank colour palettes
#'
#' Bank colour palettes made accessible via a single list.
#'
#' @export
boe_palettes <- c(
  boe_identity_palettes,
  boe_standard_palettes,
  boe_harmonious_palettes,
  boe_vibrant_palettes,
  boe_diverging_palettes,
  mcg = list(mcg_pub),
  pre_mpc_palettes,
  fsr_palettes
)


# Functions ---------------------------------------------------------------

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
#' the n colours will be returns in reverse order (FALSE by default).
#'
#' @family colour boe
#'
#' @export
#' 
#' @examples
#' boe_pal(palette = "boe", n = 4)
boe_pal <- function(palette, n, reverse = FALSE) {
  
  if (!is.logical(reverse)) stop("reverse must be TRUE or FALSE.")
  
  pal <- colours_from_palette(palette)
  
  if (is.null(pal)) stop("Palette not found.")
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  check_pal_n(n, pal)
  
  out <- pal[1:n]
  
  # returns the same colours in reverse order
  if (reverse) out <- rev(out)
  
  structure(out, class = "palette", palette = palette)
}

pal_pal <- function(palette, reverse) {
  
  function(n) {
    boe_pal(palette = palette, reverse = reverse)
  }
  
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

#' Display colours when printing palette objects
#'
#' @param x a palette object
#' @param ... ignored
#' @export
print.palette <- function(x, ...) {
  
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "palette"), cex = 1, family = "serif")
}
