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
  old <- graphics::par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(graphics::par(old))
  
  graphics::image(1:n, 1, as.matrix(1:n), col = x,
                  ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  graphics::rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "palette"), cex = 1, family = "serif")
}
