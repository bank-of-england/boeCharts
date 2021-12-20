#' Import fonts for use in charts
#' 
#' [import_arial()] imports Arial font for use in charts. [import_calibri()]
#' imports Calibri.
#' 
#' There is an option `boeCharts.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @export
import_arial <- function() {
  
  install_rttf2pt1()
  
  extrafont::font_import(pattern = "arial", prompt = FALSE)
}

#' @export
#' @rdname import_arial
import_calibri <- function() {
  
  install_rttf2pt1()
  
  extrafont::font_import(pattern = "calibri", prompt = FALSE)
}

#' @rdname Arial
#' @md
#' @title Arial font name R variable aliases
#' @description `font_arial` == "`Arial`"
#' @format length 1 character vector
#' @export
font_arial <- "Arial"

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

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family, face="plain", size=3.5,
                                      color = "#1e1e1e") {
  ggplot2::update_geom_defaults(
    "text", list(family=family, face=face, size=size, color=color)
    )
  ggplot2::update_geom_defaults(
    "label", list(family=family, face=face, size=size, color=color)
    )
}
