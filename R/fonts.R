# register a windows font
register_family_win <- function(family, quiet = TRUE, cfonts = character()) {
  
  # check if font already registered
  if (family %in% cfonts) {
    if (!quiet) {
      message(family, " already registered with ", "windowsFonts", "().")
    }
    return(NULL)
  }
  # otherwise, register font message
  if (!quiet) {
    message("Registering font with R using ", "windowsFonts", "(): ", family)
  }
  
  # register font
  args <- list()
  args[[family]] <- windowsFont(family)
  do.call(windowsFonts, args)
  
}

# load font
load_font_win <- function(family, quiet = TRUE) {
  
  # dont do anything if not windows
  if (.Platform$OS.type != "windows") {
    warning("OS is not Windows. No fonts registered with ", "windowsFonts", "().")
    return(NULL)
  }
  
  # get existing fonts
  cfonts <- names(windowsFonts())

  # load fonts
  register_family_win(family = family, cfonts = cfonts, quiet = quiet)
  
}


#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family, face="plain", size=3.5,
                                      color = "#1e1e1e") {
  update_geom_defaults("text", list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", list(family=family, face=face, size=size, color=color))
}