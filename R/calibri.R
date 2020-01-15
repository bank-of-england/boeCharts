# load calibri fonts
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