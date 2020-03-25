#' Import Calibri font for use in charts
#' 
#' Import Calibri font for use in charts
#' 
#' There is an option `boeCharts.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @export
import_calibri <- function() {
  
  install_rttf2pt1()
  
  font_import(pattern = "calibri", prompt = FALSE)
}

#' @rdname Calibri
#' @md
#' @title Calibri font name R variable aliases
#' @description `font_calibri` == "`Calibri`"
#' @format length 1 character vector
#' @export
font_calibri <- "Calibri"

#' @rdname Calibri
#' @md
#' @description `font_calibri_light` == "`Calibri Light`"
#' @export
font_calibri_light <- "Calibri Light"
