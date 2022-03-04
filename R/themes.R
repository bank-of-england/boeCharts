#' Bank of England [ggplot2] themes
#' 
#' These are complete chart styles to produce approximations of charts found in
#' the Bank. Use [ggplot2::theme()] if you just need to tweak the display of an 
#' existing theme.
#' 
#' @details 
#' \describe{
#'
#' \item{`theme_boe_identity()`}{
#' A ggplot2 theme for the Bank's 
#' \href{https://boeguidelines.frontify.com/d/KN5KRtH8qzXF/design-guidelines#/brand-applications/chart-design-for-staff}{2022 brand update chart design guidelines} 
#' }
#' 
#' \item{`theme_overground()`}{
#' A ggplot2 theme to produce
#' \href{https://www.bankofengland.co.uk/bank-overground}{Bank Overground} 
#' style visualisations}
#' 
#' \item{`theme_mpr()`}{
#' A ggplot2 theme for Monetary Policy Report (MPR) chart styling}
#' 
#' \item{`theme_fsr()`}{
#' A ggplot2 theme for Financial Stability Report (FSR) chart styling}
#' 
#' \item{`theme_mcg_pub()`}{
#' A ggplot2 theme for Money & Credit Group (MCG) publication chart styling}
#' 
#' }
#' 
#' @details See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#'
#' @param base_family,base_size,base_colour base font family, size and colour
#' @param plot_title_face,plot_title_size,plot_title_colour 
#' plot title face, size and colour
#' @param plot_title_position Alignment of the plot title/subtitle.
#' A value of "plot" (the default) means that titles are aligned to 
#' the entire plot (minus any space for margins and plot tag).
#' A value of "panel" means that titles are aligned to the plot panels 
#' @param subtitle_face,subtitle_size,subtitle_colour plot subtitle face, size and colour
#' @param axis_title_face,axis_title_size,axis_title_colour axis title font face, 
#' size and colour
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param axis_text_size,axis_text_colour axis text size and colour
#' @param axis_ticks_length,ticks_colour axis ticks length and colour
#' @param legend_title_face,legend_title_size,legend_title_colour legend title 
#' font face, size and colour
#' @param legend_text_size,legend_text_colour legend text size and colour
#' @param legend_position,legend_just,legend_margin,legend_direction 
#' legend position, justification, margin and direction
#' @param caption_face,caption_size,caption_colour plot caption 
#' face, size, and colour
#' @param caption_position Alignment of the plot caption
#' @param strip_text_face,strip_text_size,strip_text_colour facet label font 
#' face, size and colour
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis add x or y axes? `TRUE` (or `XY`), `FALSE`, `X` or `Y`
#' @param grid_col,axis_col,grid_colour,axis_colour,axis_line_colour 
#' grid & axis colours
#' @param ticks axis ticks (`TRUE` (or `XY`), `FALSE`, `X` or `Y`)
#' @param plot_margin plot margin (top, right, bottom, left)
#' @param background_colour plot background colour
#' 
#' @examples \dontrun{
#' 
#' library(ggplot2)
#' 
#' p1 <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot", subtitle = "Something insightful")
#'    
#' p1 + theme_boe_identity()
#' p1 + theme_overground()
#' p1 + theme_mpr()
#' p1 + theme_fsr()
#' p1 + theme_mcg_pub()
#' 
#' p2 <- ggplot(mtcars, aes(x = mpg, y = wt, colour = factor(cyl))) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot", subtitle = "Something insightful") +
#'    scale_y_continuous(position = "right")
#' 
#' p2 + 
#'   theme_boe_identity() +
#'   scale_colour_discrete_boe(palette = "boe_identity", name = NULL) +
#'   guides(colour = guide_legend(override.aes = list(size = 4)))
#'    
#' }
#' 
#' @name boetheme
#' @aliases NULL
NULL

#' @export
#' @rdname boetheme
theme_boe_identity <- function(
  axis = "X", grid = "X",
  base_family = "Arial", 
  plot_title_size = 18,
  subtitle_size = 18,
  axis_title_size = 16,
  axis_text_size = 16,
  legend_title_size = 16,
  legend_text_size = 16,
  strip_text_size = 16,
  caption_size = 16,
  axis_ticks_length = 8,
  base_colour = "#C4C9CE",
  plot_title_colour = "#ffffff",
  subtitle_colour = "#ffffff",
  axis_title_colour = "#C4C9CE",
  axis_text_colour = "#C4C9CE",
  legend_title_colour = "#ffffff",
  legend_text_colour = "#ffffff",
  strip_text_colour = "#ffffff",
  caption_colour = "#C4C9CE",
  background_colour = "#12273F",
  axis_line_colour = "#C4C9CE",
  grid_colour = "#C4C9CE",
  legend_position = c("top-left", "top-right", "bottom-left", "bottom-right",
                      "top", "right", "bottom", "left", "none"),
  legend_direction = c("vertical", "horizontal"),
  caption_position = c("left", "right"),
  plot_title_position = c("plot", "panel")
  ) {
  
  gridline_size <- 0.5
  axis_tick_size <- 0.5
  legend_position <- match.arg(legend_position)
  caption_position <- match.arg(caption_position)
  legend_direction <- match.arg(legend_direction)
  plot_title_position <- match.arg(plot_title_position)
  
  # Set the caption horizontal justification
  if (caption_position == "left") {
    caption_hjust = 0
  } else if (caption_position == "right") {
    caption_hjust = 1
  }
  
  p <- ggplot2::theme_grey(base_family = base_family) %+replace%
    ggplot2::theme(
      
      # global
      text = ggplot2::element_text(
        family = base_family, face = "plain",
        hjust = 0.5, vjust = 0.5, angle = 0,
        debug = FALSE
        ),
      
      # background
      panel.background = ggplot2::element_rect(
        fill = background_colour, colour = NA
        ),
      plot.background = ggplot2::element_rect(
        fill = background_colour, colour = NA
        ),
      panel.border = ggplot2::element_blank(),
      plot.margin = ggplot2::margin(20, 20, 20, 20, unit = "pt"),

      # titling
      plot.title = ggplot2::element_text(
        colour = plot_title_colour, size = plot_title_size, face = "bold", 
        hjust = 0, margin = ggplot2::margin(b = 5)
      ),
      plot.title.position = plot_title_position,
      plot.subtitle = ggplot2::element_text(
        colour = subtitle_colour, size = subtitle_size, face = "plain", 
        hjust = 0, margin = ggplot2::margin(b = 24)
      ),
      plot.caption = ggplot2::element_text(
        colour = caption_colour, size = caption_size,
        hjust = caption_hjust, margin = ggplot2::margin(t = 24, l = 0)
      ),
      plot.caption.position = "plot",
      
      # axes
      axis.title = ggplot2::element_text(
        colour = axis_title_colour, size = axis_title_size
        ),
      axis.title.x = ggplot2::element_text(
        margin = ggplot2::margin(t = 12), vjust = 1
      ),
      axis.title.y = ggplot2::element_text(
        margin = ggplot2::margin(r = 12), vjust = 1, angle = 90
      ),
      axis.title.y.right = ggplot2::element_text(
        angle = -90, margin = ggplot2::margin(l = 12), vjust = 0
      ),
      axis.text = ggplot2::element_text(
        colour = axis_text_colour, size = axis_text_size
        ),
      
      # legend
      legend.title = ggplot2::element_text(
        colour = legend_title_colour, size = legend_title_size, face = "bold"
      ),
      legend.text = ggplot2::element_text(
        colour = legend_text_colour, size = legend_text_size, face = "bold",
      ),
      legend.background = ggplot2::element_rect(fill = NA, colour = NA),
      legend.box.background = ggplot2::element_rect(fill = NA, colour = NA),
      legend.key = ggplot2::element_rect(fill = NA, colour = NA),
      legend.direction = legend_direction,
      legend.margin = ggplot2::margin(l = 0),
      legend.box.margin = ggplot2::margin(l = 0),
      # legend.box.spacing = ggplot2::unit(half_line, "pt"),
      
      # facets
      strip.background = ggplot2::element_rect(
        colour = background_colour,
        fill = background_colour
        ),
      strip.text = ggplot2::element_text(
        family = base_family,
        colour = strip_text_colour,
        size = strip_text_size,
        face = "bold"
        )
    )
  
  # legend position
  if (legend_position %in% c("top", "right", "bottom", "left", "none")) {
    
    p <- p %+replace%
      ggplot2::theme(legend.position = legend_position)
    
  } else if (legend_position == "top-right") {
    
    p <- p %+replace%
      ggplot2::theme(
        legend.position = "top",
        legend.direction = legend_direction,
        legend.justification = c(1, 0))
    
  } else if (legend_position == "top-left") {
    
    p <- p %+replace%
      ggplot2::theme(
        legend.position = "top",
        legend.direction = legend_direction,
        legend.justification = c(0,1))
    
  } else if (legend_position == "bottom-right") {
    
    p <- p %+replace%
      ggplot2::theme(
        legend.position = "bottom",
        legend.direction = legend_direction,
        legend.justification = c(1,0))
    
  } else if (legend_position == "bottom-left") {
    
    p <- p %+replace%
      ggplot2::theme(
        legend.position = "bottom",
        legend.direction = legend_direction,
        legend.justification = c(0,1))
    
  }
  
  # chart grid
  if (inherits(grid, "character") | grid == TRUE) {
    
    p <- p + ggplot2::theme(
      panel.grid = ggplot2::element_line(colour = grid_colour, size = gridline_size / .pt),
      panel.grid.major = ggplot2::element_line(colour=grid_colour, size = gridline_size / .pt),
      panel.grid.minor = ggplot2::element_line(colour=grid_colour, size = gridline_size / .pt)
    )
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) p <- p + ggplot2::theme(panel.grid.major.y = element_blank())
      if (regexpr("Y", grid)[1] < 0) p <- p + ggplot2::theme(panel.grid.major.x = element_blank())
      if (regexpr("x", grid)[1] < 0) p <- p + ggplot2::theme(panel.grid.minor.y = element_blank())
      if (regexpr("y", grid)[1] < 0) p <- p + ggplot2::theme(panel.grid.minor.x = element_blank())
    }
    
  } else {
    p <- p + ggplot2::theme(panel.grid = ggplot2::element_blank())
  }
  
  # axis lines
  if (inherits(axis, "character") | axis == TRUE) {
    p <- p + ggplot2::theme(
      axis.line.y = ggplot2::element_line(
        colour=axis_line_colour, size = gridline_size / .pt
        ),
      axis.line.x = ggplot2::element_line(
        colour=axis_line_colour, size = gridline_size / .pt
        )
      )
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        p <- p + ggplot2::theme(axis.line.x = ggplot2::element_blank())
      } else {
        p <- p + ggplot2::theme(
          axis.line.x = ggplot2::element_line(
            colour=axis_line_colour, size = gridline_size / .pt
            )
          )
      }
      if (regexpr("y", axis)[1] < 0) {
        p <- p + ggplot2::theme(axis.line.y = ggplot2::element_blank())
      } else {
        p <- p + ggplot2::theme(
          axis.line.y = ggplot2::element_line(
            colour=axis_line_colour, size = gridline_size / .pt
            )
          )
      }
    } else {
      p <- p + ggplot2::theme(
        axis.line.x = ggplot2::element_line(
          colour=axis_line_colour, size = gridline_size / .pt
          ),
        axis.line.y = ggplot2::element_line(
          colour=axis_line_colour, size = gridline_size / .pt)
        )
    }
  } else {
    p <- p + ggplot2::theme(axis.line = ggplot2::element_blank())
  }
  
  # axis ticks
  if (inherits(axis, "character") | axis == TRUE) {
    p <- p + ggplot2::theme(
      axis.ticks = ggplot2::element_line(
        size = axis_tick_size / .pt, colour = axis_line_colour
        ),
      axis.ticks.length = grid::unit(axis_ticks_length, "pt"))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        p <- p + ggplot2::theme(axis.ticks.x = ggplot2::element_blank())
      } else {
        p <- p + ggplot2::theme(
          axis.ticks.x = ggplot2::element_line(
            colour=axis_line_colour, size = axis_tick_size / .pt
            ),
          axis.ticks.length = grid::unit(axis_ticks_length, "pt")
          )
      }
      if (regexpr("y", axis)[1] < 0) {
        p <- p + ggplot2::theme(axis.ticks.y = ggplot2::element_blank())
      } else {
        p <- p + ggplot2::theme(
          axis.ticks.y = ggplot2::element_line(
            colour=axis_line_colour, size = axis_tick_size / .pt
            ),
          axis.ticks.length = grid::unit(axis_ticks_length, "pt"))
      }
    } else {
      p <- p + ggplot2::theme(
        axis.ticks.x = ggplot2::element_line(
          colour=axis_line_colour, size = axis_tick_size / .pt
          ),
        axis.ticks.y = ggplot2::element_line(
          colour=axis_line_colour, size = axis_tick_size / .pt
          ),
        axis.ticks.length = grid::unit(axis_ticks_length, "pt")
        )
    }
  } else {
    p <- p + ggplot2::theme(axis.ticks = ggplot2::element_blank())
  }
  
  p
}

#' @export
#' @rdname boetheme
theme_overground <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#657581",
  plot_title_face = "bold", plot_title_size = 18, plot_title_colour = "#005e6e", 
  plot_title_position = c("plot", "panel"),
  subtitle_face = "bold", subtitle_colour = base_colour, subtitle_size = 14,  
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "top", legend_just = "left", 
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain", caption_colour = "#1e1e1e", caption_size = base_size, 
  caption_position = c("plot", "panel"),
  strip_text_face = "plain", strip_text_colour = base_colour, strip_text_size = subtitle_size, 
  grid = "X", grid_col = "#C8CCCF", axis = "X", axis_col = grid_col, 
  ticks = axis, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {
  
  half_line <- base_size / 2
  
  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  title_pos <- match.arg(plot_title_position)
  caption_pos <- match.arg(caption_position)

  # base theme
  p <- theme_minimal(base_family = base_family, base_size = base_size) %+replace% 
    theme(
      
      # text elements
      text = element_text(
        family = base_family, colour = base_colour, face = "plain", size = base_size
      ),
      
      # titling
      plot.title = element_text(
        hjust = 0, size = plot_title_size, margin = ggplot2::margin(b=half_line),
        face = plot_title_face, colour = plot_title_colour, family = base_family
        ),
      plot.title.position = title_pos,
      plot.subtitle = element_text(
        hjust = 0, size = subtitle_size, margin = ggplot2::margin(b=half_line),
        face = subtitle_face, colour = subtitle_colour, family = base_family
      ),
      
      # axis titles
      axis.title = element_text(
        size = axis_title_size, colour = axis_title_colour, face = axis_title_face,
        family = base_family
        ),
      axis.title.x = element_text(
        hjust = xj, margin = margin(t = half_line), vjust = 1
        ),
      axis.title.y = element_text(
        hjust = yj, margin = margin(r = half_line), vjust = 1, angle = 90
        ),
      axis.title.y.right = element_text(
        hjust = yj, angle = -90, margin = margin(l = half_line), vjust = 0
        ),
      
      # axis text
      axis.text = element_text(
        size = axis_text_size, colour = axis_text_colour, family = base_family
        ),

      # plot margin
      plot.margin = ggplot2::margin(plot_margin),
      
      # caption
      plot.caption = element_text(
        hjust = 0, size = caption_size, margin = margin(t = half_line),
        face = caption_face, colour = caption_colour, family = base_family
      ),
      plot.caption.position = caption_pos,
      
      # legend
      legend.title = element_text(
        hjust = 0, size = legend_title_size, family = base_family,
        face = legend_title_face, colour = legend_title_colour
      ),
      legend.text = element_text(
        hjust = 0, size=legend_text_size, colour = legend_text_colour,
        family = base_family
      ),
      legend.background = element_blank(), 
      legend.key = element_blank(),
      legend.position = legend_position,
      legend.justification = legend_just,
      legend.margin = ggplot2::margin(legend_margin),

      # strip text (facetting)
      strip.text = element_text(
        size = strip_text_size, colour = strip_text_colour,
        face = strip_text_face, family = base_family,
        margin = margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 
                        0.8 * half_line)
        )
    )

  # chart grid
  if (inherits(grid, "character") | grid == TRUE) {
    
    p <- p + theme(
      panel.grid = element_line(colour = grid_col, size = 0.2),
      panel.grid.major = element_line(colour=grid_col, size = 0.2),
      panel.grid.minor = element_line(colour=grid_col, size = 0.15)
      )

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) p <- p + theme(panel.grid.major.y = element_blank())
      if (regexpr("Y", grid)[1] < 0) p <- p + theme(panel.grid.major.x = element_blank())
      if (regexpr("x", grid)[1] < 0) p <- p + theme(panel.grid.minor.y = element_blank())
      if (regexpr("y", grid)[1] < 0) p <- p + theme(panel.grid.minor.x = element_blank())
    }
    
  } else {
    p <- p + theme(panel.grid = element_blank())
  }
  
  # axis lines
  if (inherits(axis, "character") | axis == TRUE) {
    p <- p + theme(axis.line = element_line(colour=axis_col, size = 0.15))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        p <- p + theme(axis.line.x = element_blank())
      } else {
        p <- p + theme(axis.line.x = element_line(colour=axis_col, size = 0.15))
      }
      if (regexpr("y", axis)[1] < 0) {
        p <- p + theme(axis.line.y = element_blank())
      } else {
        p <- p + theme(axis.line.y = element_line(colour=axis_col, size=0.15))
      }
    } else {
      p <- p + theme(axis.line.x = element_line(colour=axis_col, size=0.15),
                     axis.line.y = element_line(colour=axis_col, size=0.15))
    }
  } else {
    p <- p + theme(axis.line = element_blank())
  }
  
  # axis ticks
  if (inherits(axis, "character") | axis == TRUE) {
    p <- p + theme(axis.ticks = element_line(size = 0.15, colour = axis_col),
                   axis.ticks.length = grid::unit(10, "pt"))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        p <- p + theme(axis.ticks.x = element_blank())
      } else {
        p <- p + theme(axis.ticks.x = element_line(colour=axis_col, size = 0.15),
                       axis.ticks.length = grid::unit(10, "pt"))
      }
      if (regexpr("y", axis)[1] < 0) {
        p <- p + theme(axis.ticks.y = element_blank())
      } else {
        p <- p + theme(axis.ticks.y = element_line(colour=axis_col, size = 0.15),
                       axis.ticks.length = grid::unit(10, "pt"))
      }
    } else {
      p <- p + theme(axis.ticks.x = element_line(colour=axis_col, size = 0.15),
                     axis.ticks.y = element_line(colour=axis_col, size = 0.15),
                     axis.ticks.length = grid::unit(10, "pt"))
    }
  } else {
    p <- p + theme(axis.ticks = element_blank())
  }

  p
}

#' @export
#' @rdname boetheme
theme_mpr <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#005e6e", 
  plot_title_position = c("panel", "plot"),
  subtitle_face = "plain", subtitle_colour = base_colour, subtitle_size = 14,  
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "top", legend_just = "left", 
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain", caption_colour = base_colour, caption_size = base_size, 
  caption_position = c("panel", "plot"),
  strip_text_face = "plain", strip_text_colour = base_colour, 
  strip_text_size = 13, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {

  half_line <- base_size / 2
  
  title_pos <- match.arg(plot_title_position)
  caption_pos <- match.arg(caption_position)
  
  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  # create theme, based on ggplot2's theme_bw
  theme_bw() %+replace% 
    theme(
      
      # text elements
      text = element_text(
        family = base_family, colour = base_colour, face = "plain", size = base_size
        ),
      
      # titling
      plot.title = element_text(
        hjust = 0, size = plot_title_size, margin = ggplot2::margin(b = half_line),
        face = plot_title_face, colour = plot_title_colour, family = base_family
      ),
      plot.title.position = title_pos,
      plot.subtitle = element_text(
        hjust = 0, size = subtitle_size, margin = ggplot2::margin(b = half_line),
        face = subtitle_face, colour = subtitle_colour, family = base_family
      ),
      
      # axis titles
      axis.title = element_text(
        size = axis_title_size, colour = axis_title_colour, family = base_family
      ),
      axis.title.x = element_text(hjust = xj, margin = ggplot2::margin(t = half_line)),
      axis.title.y = element_text(hjust = yj),
      axis.title.y.left = element_blank(),
      axis.title.y.right = element_text(angle = -90, margin = ggplot2::margin(l = half_line)),
      
      # axis text
      axis.text = element_text(
        size = axis_text_size, colour = axis_text_colour, family = base_family
        ),
      axis.text.x = element_text(
        margin = ggplot2::margin(t = half_line)
        ),
      axis.text.y = element_text(margin = ggplot2::margin(r = half_line)),
      axis.text.y.right = element_text(
        margin = ggplot2::margin(l = half_line), hjust = 1
        ),
      
      # axis ticks
      axis.ticks.length = ggplot2::unit(-axis_ticks_length, "cm"),

      # grid
      panel.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = ggplot2::margin(plot_margin),
      
      # caption
      plot.caption=element_text(
        hjust = 0, size = caption_size, margin = ggplot2::margin(t = half_line),
        face = caption_face, colour = caption_colour, family = base_family
        ),
      plot.caption.position = caption_pos,
      
      # legend
      legend.title = element_text(
        hjust = 0, size = legend_title_size, colour = legend_title_colour
        ),
      legend.text = element_text(
        hjust=0, size=legend_text_size, face="plain", colour = legend_text_colour
        ),
      legend.margin = margin(legend_margin),
      legend.justification = legend_just, legend.position = legend_position,
      legend.box.just = "left",

      # strip attributes (for facetting)
      strip.background =   element_blank(),
      strip.text = element_text(
        size = strip_text_size, colour = strip_text_colour,
        face = strip_text_face, family = base_family,
        margin = ggplot2::margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 
                                 0.8 * half_line)
        )
      )
}

#' @export
#' @rdname boetheme
theme_fsr <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#005e6e",
  plot_title_position = c("panel", "plot"),
  subtitle_face = "plain", subtitle_colour = base_colour, subtitle_size = 14,
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size, legend_title_colour = base_colour,
  legend_text_size = base_size, legend_text_colour = base_colour,
  legend_position = "top", legend_just = "left",
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain", caption_colour = base_colour, caption_size = base_size,
  caption_position = c("panel", "plot"),
  strip_text_face = "plain", strip_text_colour = base_colour,
  strip_text_size = 13, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
) {
  
  theme_mpr(
    base_family = base_family, base_size = base_size, base_colour = base_colour,
    plot_title_face = plot_title_face, plot_title_size = plot_title_size, 
    plot_title_colour = plot_title_colour,
    plot_title_position = match.arg(plot_title_position),
    subtitle_face = subtitle_face, subtitle_colour = subtitle_colour, 
    subtitle_size = subtitle_size,
    axis_title_size = axis_title_size, axis_title_colour = axis_title_colour,
    axis_title_just = axis_title_just,
    axis_text_size = axis_text_size, axis_text_colour = axis_text_colour,
    axis_ticks_length = axis_ticks_length,
    legend_title_size = legend_title_size, legend_title_colour = legend_title_colour, 
    legend_text_size = legend_text_size, legend_text_colour = legend_text_colour, 
    legend_position = legend_position, legend_just = legend_just, legend_margin = legend_margin,
    caption_face = caption_face, caption_colour = caption_colour, 
    caption_size = caption_size,
    strip_text_face = strip_text_face, strip_text_colour = strip_text_colour, 
    strip_text_size = strip_text_size, 
    plot_margin = plot_margin
  )
}

#' @export
#' @rdname boetheme
theme_mcg_pub <- function(
  base_family = "", base_size = 11.5, base_colour = "#2b2b2b",
  plot_title_face = "bold", plot_title_size = 18, 
  plot_title_position = c("plot", "panel"),
  subtitle_face = "plain", subtitle_size = 14,
  axis_title_face = "plain", axis_title_size = base_size, 
  axis_title_colour = base_colour,
  axis_text_size = base_size, axis_text_colour = base_colour,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "bottom", legend_just = "center",
  legend_margin = c(base_size/2, base_size/2, base_size/2, base_size/2),
  caption_face = "plain", caption_size = base_size, caption_colour = base_colour,
  strip_text_face = "plain", strip_text_size = subtitle_size, 
  axis_colour = base_colour, ticks_colour = base_colour,
  plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {
  
  half_line <- base_size / 2
  title_pos <- match.arg(plot_title_position)
  
  # create theme, based on classic
  theme_classic(base_size = base_size, base_family = base_family) +
    
    theme(
      
      # grid
      panel.grid = element_blank(),
      
      # background attributes
      panel.background = element_blank(),
      plot.margin = ggplot2::margin(plot_margin),
      
      # chart text
      text = element_text(
        colour = base_colour, size = base_size, family = base_family
      ),
      
      # titling
      plot.title = element_text(
        size = plot_title_size, face = plot_title_face, hjust = 0, 
        colour = base_colour, family = base_family, 
        margin = ggplot2::margin(b = half_line)
        ),
      plot.title.position = title_pos,
      plot.subtitle = element_text(
        colour = base_colour, face = subtitle_face, hjust = 0, family = base_family,
        size = subtitle_size, margin = ggplot2::margin(b = half_line)),
      # caption 
      plot.caption = element_text(
        colour = caption_colour, hjust = 1, face = caption_face, size = caption_size,
        margin = ggplot2::margin(t = half_line), family = base_family
      ),
      
      # axis titles
      axis.title = element_text(
        size = axis_title_size, colour = axis_title_colour, face = axis_title_face,
        family = base_family
      ),

      # axis text
      axis.text = element_text(
        size = axis_text_size, colour = axis_text_colour, family = base_family
      ),

      # axis lines
      axis.line.x = element_line(size = 0.5, colour = axis_colour),
      axis.line.y = element_line(size = 0.5, colour = axis_colour),
      
      # axis tick marks
      axis.ticks.length = unit(4, "pt"),
      axis.ticks = element_line(size = 0.5, colour = ticks_colour),

      # legend
      legend.position = legend_position,
      legend.justification = legend_just,
      legend.background = element_blank(),
      legend.key = element_blank(),
      legend.margin = ggplot2::margin(legend_margin),

      # strip text (facetting)
      strip.background = element_blank(),
      strip.text = element_text(colour = base_colour, size = strip_text_size, 
                                face = strip_text_face, family = base_family),
      strip.text.x = element_text(colour = base_colour, size = strip_text_size, 
                                  face = strip_text_face),
      strip.text.y = element_text(colour = base_colour, size = strip_text_size, 
                                  face = strip_text_face, angle = -90)
    )
}
