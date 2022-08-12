#' Import Arial font for use in charts
#' 
#' Import Arial font for use in charts
#' 
#' There is an option `boeCharts.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @export
import_arial <- function() {
  
  font_import(pattern = "arial", prompt = FALSE)
}

#' @rdname Arial
#' @md
#' @title Arial font name R variable aliases
#' @description `font_arial` == "`Arial`"
#' @format length 1 character vector
#' @export
font_arial <- "Arial"
