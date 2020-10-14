#' A \code{ggplot2} theme that approximates Bank Overground charts
#'
#' @description Provides a theme to produce
#' \href{https://www.bankofengland.co.uk/bank-overground}{Bank Overground} 
#' style visualisations in \code{ggplot2}.
#'
#' @details Builds on the 'grammar of graphics' framework implement in
#' ggplot2. Applying \code{theme_overground()} will adjust graphical parameters
#' to give a plot a feel more in line with Bank Overground publications.
#' 
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#'
#' @param base_family,base_size,base_colour base font family, size and colour
#' @param plot_title_face,plot_title_size,plot_title_colour 
#' plot title face, size and colour
#' @param plot_title_position Alignment of the plot title/subtitle and caption.
#' A value of "plot" (the default) means that titles and/or caption are aligned to 
#' the entire plot (minus any space for margins and plot tag).
#' A value of "panel" means that titles and/or caption are aligned to the plot panels 
#' @param subtitle_face,subtitle_size,subtitle_colour plot subtitle face, size and colour
#' @param axis_title_face,axis_title_size,axis_title_colour axis title font face, 
#' size and colour
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param axis_text_size,axis_text_colour axis text size and colour
#' @param legend_title_face,legend_title_size,legend_title_colour legend title 
#' font face, size and colour
#' @param legend_text_size,legend_text_colour legend text size and colour
#' @param legend_position,legend_just,legend_margin legend position, justification and margins
#' @param caption_face,caption_size,caption_colour plot caption 
#' face, size, and colour
#' @param strip_text_face,strip_text_size,strip_text_colour facet label font 
#' face, size and colour
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis add x or y axes? `TRUE` (or `XY`), `FALSE`, `X` or `Y`
#' @param grid_col,axis_col grid & axis colors; both default to `#cccccc`
#' @param ticks axis ticks (`TRUE` (or `XY`), `FALSE`, `X` or `Y`)
#' @param plot_margin plot margin (top, right, bottom, left)
#' 
#' @examples \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#' geom_point() +
#' labs(title = "A Lovely Plot",
#' subtitle = "A thought-provoking subtitle.") +
#' theme_overground()
#' }
#' 
#' @export

theme_overground <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#6B7E87",
  plot_title_face = "bold", plot_title_size = 18, plot_title_colour = "#00294E", 
  plot_title_position = c("plot", "panel"),
  subtitle_face = "plain", subtitle_colour = "#1e1e1e", subtitle_size = 14,  
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "top", legend_just = "left", 
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain", caption_colour = base_colour, caption_size = base_size,  
  strip_text_face = "plain", strip_text_colour = base_colour, strip_text_size = subtitle_size, 
  grid = "X", grid_col = "#C8CCCF", axis = "X", axis_col = grid_col, 
  ticks = axis, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {
  
  half_line <- base_size / 2
  
  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  title_pos <- match.arg(plot_title_position)

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
        hjust = xj, margin = margin(t = half_line / 2), vjust = 1
        ),
      axis.title.y = element_text(
        hjust = yj, margin = margin(r = half_line / 2), vjust = 1, angle = 90
        ),
      axis.title.y.right = element_text(
        hjust = yj, angle = -90, margin = margin(l = half_line / 2), vjust = 0
        ),
      
      # axis text
      axis.text = element_text(
        size = axis_text_size, colour = axis_text_colour, family = base_family
        ),

      # plot margin
      plot.margin = ggplot2::margin(plot_margin),
      
      # caption
      plot.caption = element_text(
        hjust = 1, size = caption_size, margin = margin(t = half_line),
        face = caption_face, colour = caption_colour, family = base_family
      ),
      
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

#' A \code{ggplot2} theme for Monetary Policy Report (MPR) chart styling
#' 
#' @description Provides a theme to produce
#' Monetary Policy Report (FKA Inflation Report) style visualisations in \code{ggplot2}.
#' 
#' @details See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#' @details See [ylab_mpr()] for help positioning the y-axis title correctly.
#' 
#' @inheritParams theme_overground
#' @param axis_ticks_length length of axis ticks (in centimetres)
#' 
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#' 
#' @export
#'
#' @examples \dontrun{
#' 
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot", subtitle = "Something insightful",
#'    caption = "Source: R") +
#'    theme_mpr() +
#'    scale_y_continuous(
#'    position = "right", sec.axis = dup_axis(labels = NULL)
#'    )
#'    
#' move_ylab(p)
#' }
#' 
#' @name theme_mpr

theme_mpr <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#00294E", 
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
  strip_text_face = "plain", strip_text_colour = base_colour, 
  strip_text_size = 13, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {

  half_line <- base_size / 2
  
  tickLabelMargin = 100 * axis_ticks_length - 20
  
  title_pos <- match.arg(plot_title_position)
  
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
      axis.title.x = element_text(hjust = xj),
      axis.title.y = element_text(hjust = yj),
      axis.title.y.left = element_blank(),
      axis.title.y.right = element_text(angle=-90),
      
      # axis text
      axis.text = element_text(
        size = axis_text_size, colour = axis_text_colour, family = base_family
        ),
      axis.text.x = element_text(margin = ggplot2::margin(t = tickLabelMargin)),
      axis.text.y = element_text(margin = ggplot2::margin(r = tickLabelMargin)),
      axis.text.y.right = element_text(
        margin = ggplot2::margin(l = tickLabelMargin)
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
#' @rdname theme_mpr
theme_inflation_report <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#00294E", 
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
  strip_text_face = "plain", strip_text_colour = base_colour, 
  strip_text_size = 13, plot_margin = c(base_size/2, base_size/2, base_size/2, base_size*2)
  ) {
    
  .Deprecated("theme_mpr")
    
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

#' A \code{ggplot2} theme for Financial Stability Report (FSR) chart styling
#'
#' @description Provides a theme to produce
#' Financial Stability Report style visualisations in \code{ggplot2}.
#'
#' @details See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#' @details See [ylab_fsr()] for help positioning the y-axis title correctly.
#'
#' @param axis_ticks_length length of axis ticks (in centimetres)
#'
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#'
#' @export
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot", subtitle = "Something insightful",
#'    caption = "Source: R") +
#'    theme_fsr() +
#'    scale_y_continuous(
#'    position = "right", sec.axis = dup_axis(labels = NULL)
#'    )
#'    
#' move_ylab(p)
#' }
#'
#' @name theme_fsr
theme_fsr <- function(
  base_family = "Arial", base_size = 12, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#165788",
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

#' A \code{ggplot2} theme for MCG publication-ready charts
#'
#' @description Provides a theme to produce
#' Money & Credit Group (MCG) publication style visualisations in \code{ggplot2}.
#' See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#'
#' @details Builds on the 'grammar of graphics' framework implement in
#' ggplot2. Applying \code{theme_mcg_pub()} will adjust graphical parameters
#' to give a plot a feel more in line with MCG publications.
#' 
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#' 
#' @inheritParams theme_overground
#' @param axis_colour,ticks_colour axis & ticks colours
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot",
#'         subtitle = "A thought-provoking subtitle.") +
#'    theme_mcg_pub() +
#'    scale_y_continuous(position = "right")
#' }
#'
#' @export

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
    
      # caption 
      plot.caption = element_text(
        colour = caption_colour, hjust = 1, face = caption_face, size = caption_size,
        margin = ggplot2::margin(t = half_line), family = base_family
        ),

      # legend
      legend.position = legend_position,
      legend.justification = legend_just,
      legend.background = element_blank(),
      legend.key = element_blank(),
      legend.margin = ggplot2::margin(legend_margin),

      # strip text (facetting)
      strip.background = element_blank(),
      strip.text = element_text(color = base_colour, size = strip_text_size, 
                                face = strip_text_face, family = base_family),
      strip.text.x = element_text(color = base_colour, size = strip_text_size, 
                                  face = strip_text_face),
      strip.text.y = element_text(color = base_colour, size = strip_text_size, 
                                  face = strip_text_face, angle = -90)
    )
}

