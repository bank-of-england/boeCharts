#' Convert list or named vector of colours for use in ggplot manual scale
#' 
#' @description Convert colours from a palette into an unnamed vector,
#' of a specified length, for use in \code{ggplot} - particularly manual
#' scales e.g. \code{scale_colour_manual()}.
#'
#' @param palette List or vector of colours (e.g. \code{boe_cols})
#' 
#' @param n Number of colours to return
#'
#' @return unnamed vector of n colours
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'   
#' ggplot(mtcars, aes(hp, mpg, colour = as.factor(cyl))) +
#'   geom_point(shape = 16) +
#'   scale_colour_manual(values = ggplotise(boe_cols, 3))

ggplotise <- function(palette, n = -1) {
  
  palette <- unlist(palette)

  if (n > 0) {
    n <- min(length(palette), n)
    palette <- palette[1:n]
  }
  unname(palette)
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

# left-align text
left_align_titles <- function(chart) {
  
  grob <- ggplotGrob(chart)
  grob$layout$l[grob$layout$name %in% c("title", "subtitle")] <- 2
  
  grob
}

# map font on windows sys
map_font_win <- function(base_family) {
  
  if (.Platform$OS.type == "windows") {
    
    # check if font already mapped
    if (base_family %in% names(windowsFonts())) return(NULL)
    
    # map font to system
    args <- list()
    args[[base_family]] <- windowsFont(base_family)
    do.call(windowsFonts, args)
    
  }
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family="Calibri", face="plain", size=3.5,
                                      color = "#1e1e1e") {
  update_geom_defaults("text", list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", list(family=family, face=face, size=size, color=color))
}

