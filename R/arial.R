# load arial fonts
import_arial <- function() {
  
  install_rttf2pt1()
  
  font_import(pattern = "arial", prompt = FALSE)
}

#' @rdname Arial
#' @md
#' @title Arial font name R variable aliases
#' @description `font_arial` == "`Arial`"
#' @format length 1 character vector
#' @export
font_arial <- "Arial"
