#' Get names of available palettes
#' 
#' Display available palette names, optionally specifying
#' a subset of palettes to show.
#'
#' @param type type of palette ("all" by default)
#'
#' @return character vector
#' @export
#'
#' @examples
#' palette_names(type = "vibrant")
palette_names <- function(type = c("all", "standard", "harmonious", 
                                   "vibrant", "diverging")) {
  
  palette_type <- match.arg(type)
  
  switch(palette_type,
         all = names(boe_palettes),
         standard = names(boe_standard_palettes),
         harmonious = names(boe_harmonious_palettes),
         vibrant = names(boe_vibrant_palettes),
         diverging = names(boe_diverging_palettes))
  
}


#' @title Show colours in a Bank colour palette
#'
#' @description \code{\link{show_palette_cols}} produces a pie chart of colours
#' that make up a \code{boeCharts} palette.
#'
#' @inheritParams colours_from_palette
#'
#' @return A pie chart displaying the colour scheme.
#'
#' @export
#' 
#' @examples
#' show_palette_cols(boe_rich)
#' show_palette_cols(boe_palettes$vibrant_b)
#' show_palette_cols("harmonious_orange")
show_palette_cols <- function(palette) {
  
  cols <- colours_from_palette(palette, strip_names = F)
  
  pie(
    rep(1, length(cols)),
    col = cols,
    labels = names(cols))
}

#' Display a PDF with colours and names displayed for inbuilt palettes
#'
#' @param palettes Character vector of palette names or list of named palettes to display
#'
#' @return (Temp) file location of PDF
#' @export
#'
#' @examples
#' show_colour_swatches(palettes = c("harmonious_blue", "harmonious_orange"))

show_colour_swatches <- function(palettes = boe_palettes) {
  
  plots <- vector("list", length(palettes))
  
  if (is.list(palettes)) {
    palettes <- names(palettes)
    
    if (is.null(palettes)) {
      stop("No palette names found. 'palettes' should be a vector of palette names or a named list of palettes.")
    }
    
  }
  
  names(plots) <- palettes
  
  for (i in 1:length(palettes)) {
    pal_i <- palettes[[i]]

    cols <- colours_from_palette(pal_i, strip_names = F)
    pal_data <- data.frame(colour_names = names(cols), 
                           colour_codes = unname(cols),
                           y = factor(1:length(cols)), 
                           stringsAsFactors = F)
    
    plot <- 
      ggplot(pal_data) +
      geom_col(aes_string("y", 1, fill = "y")) +
      geom_text(aes_string("y", 0.5, label = "colour_names"), colour = "white", size = 4) +
      coord_flip() +
      scale_fill_discrete_boe(pal_i, guide = F) +
      ggtitle(pal_i) +
      theme_minimal() +
      theme(axis.title = element_blank(),
            axis.ticks = element_blank(),
            axis.text = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.title = element_text(face = "bold", size = "12", hjust=0.5))
    
    plots[[pal_i]] <- plot
  }
  
  pal_image <- gridExtra::marrangeGrob(plots, nrow = 1, ncol = 3)
  
  out_file <- tempfile(fileext = ".pdf")
  ggsave(out_file, pal_image)
  file.show(out_file)
  
  out_file
  
}

#' Get the colour hex values for the given palette/palette name
#'
#' @param palette Palette from boe_palettes.  Either provide the palette name e.g. "red_blue" or the palette itself e.g. diverging_palettes$red_blue
#' @param strip_names Whether to remove names for the vector (TRUE, default, used in ggplot) or return a named vector (FALSE)
#'
#' @return Vector of colour hex values
#' @export
#'
#' @examples
#' colours_from_palette("boe")
#' colours_from_palette(boe_harmonious_palettes$harmonious_blue)
colours_from_palette <- function(palette, strip_names = TRUE) {
  
  # check palette
  if (is.character(palette)) {
    
    if (!palette %in% names(boe_palettes)) {
      stop("Palette '", palette, "' is not recognised.  Choose a palette from boe_palettes: ", paste(names(boe_palettes), collapse = ", "))  
    }
    
    cols <- boe_palettes[[palette]]
    
  } else if (is.list(palette)) {
    
    cols <- palette
    
  } else {
    stop("palette should be a palette name (e.g. 'red_blue') or a palette list from boe_palettes (e.g. diverging_palettes$red_yellow_green)")
  }
  
  cols <- unlist(cols)
  
  if (strip_names) {
    cols <- unname(cols)
  }
  
  cols
}

# convert rgb colours into hexidecimal
rgb2hex <- function(r, g, b) {
  
  rgb(red = r, green = g, blue = b, maxColorValue = 255)
} 

# convert hexidecimal colours into rgb
hex2rgb <- function(x) as.vector(col2rgb(x))

#' Left-align chart titles
#' 
#' Left-align chart title and subtitle.
#' 
#' @details A gtable object is returned by this function.
#' Such objects can be drawn using standard functions 
#' from the \pkg{grid} package
#'
#' @param x a ggplot object
#'
#' @return a gtable object
#' @export
left_align_titles <- function(x) {
  
  .Deprecated(msg = "left_align_titles() is deprecated.\nIf you're using a boeCharts theme, set the `plot_title_position` argument inside the theme_() call.\nOtherwise, set the `plot.title.position` argument inside ggplot2::theme()")
  
  grob <- ggplotGrob(x)
  grob$layout$l[grob$layout$name %in% c("title", "subtitle")] <- 2
  
  grob
}

# Test whether package `package` is available. `fun` provides
# the name of the ggplot2 function that uses this package, and is
# used only to produce a meaningful error message if the
# package is not available.
try_require <- function(package, fun) {
  if (requireNamespace(package, quietly = TRUE)) {
    return(invisible())
  }
  
  stop("Package `", package, "` required for `", fun, "`.\n",
       "Please install and try again.",
       call. = FALSE
  )
}

# Use chartr() for safety since toupper() fails to convert i to I in Turkish locale
lower_ascii <- "abcdefghijklmnopqrstuvwxyz"
upper_ascii <- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
to_lower_ascii <- function(x) chartr(upper_ascii, lower_ascii, x)
to_upper_ascii <- function(x) chartr(lower_ascii, upper_ascii, x)

snakeize <- function(x) {
  x <- gsub("([A-Za-z])([A-Z])([a-z])", "\\1_\\2\\3", x)
  x <- gsub(".", "_", x, fixed = TRUE)
  x <- gsub("([a-z])([A-Z])", "\\1_\\2", x)
  to_lower_ascii(x)
}

snake_class <- function(x) {
  snakeize(class(x)[1])
}
