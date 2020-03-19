#' A \code{ggplot2} theme that approximates Bank Overground charts
#'
#' @description Provides a theme to produce
#' \href{https://www.bankofengland.co.uk/bank-overground}{Bank Overground} 
#' style visualisations in \code{ggplot2}.
#' See \code{left_align_titles()} for full left-alignment of chart titles.
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
#' @param plot_title_face,plot_title_size,plot_title_colour,plot_title_margin 
#' plot title face, size, colour and margin
#' @param plot_title_position Alignment of the plot title/subtitle and caption.
#' A value of "plot" (the default) means that titles and/or caption are aligned to 
#' the entire plot (minus any space for margins and plot tag).
#' A value of "panel" means that titles and/or caption are aligned to the plot panels 
#' @param subtitle_face,subtitle_size,subtitle_colour plot subtitle face, size and colour
#' @param subtitle_margin plot subtitle bottom margin (single numeric value)
#' @param axis_title_face,axis_title_size,axis_title_colour axis title font face, 
#' size and colour
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param axis_text_size,axis_text_colour axis text size and colour
#' @param legend_title_face,legend_title_size,legend_title_colour legend title 
#' font face, size and colour
#' @param legend_text_size,legend_text_colour legend text size and colour
#' @param legend_position legend position ("none", "left", "right", "bottom", 
#' "top", or two-element numeric vector)
#' @param caption_face,caption_size,caption_colour,caption_margin plot caption 
#' face, size, colour and margin
#' @param strip_text_face,strip_text_size,strip_text_colour facet label font 
#' face, size and colour
#' @param plot_margin plot margin (top, right, bottom, left)
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis add x or y axes? `TRUE` (or `XY`), `FALSE`, `X` or `Y`
#' @param grid_col,axis_col grid & axis colors; both default to `#cccccc`
#' @param ticks axis ticks (`TRUE` (or `XY`), `FALSE`, `X` or `Y`)
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
  base_family = "Calibri", base_size = 18, base_colour = "#6B7E87",
  plot_title_face = "bold", plot_title_size = 28, plot_title_colour = "#00294E", 
  plot_title_margin = 10, plot_title_position = c("plot", "panel"),
  subtitle_face = "plain", subtitle_colour = "#1e1e1e", subtitle_size = 22,  
  subtitle_margin = 15,
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "bottom",
  caption_face = "plain", caption_colour = base_colour, caption_size = 16,  
  caption_margin = 15,
  strip_text_face = "plain", strip_text_colour = base_colour, strip_text_size = 22, 
  plot_margin = c(10, 10, 10, 10),
  grid = "X", grid_col = "#C8CCCF", 
  axis = "X", axis_col = grid_col, 
  ticks = axis
  ) {

  # base theme
  p <- theme_minimal(base_family = base_family, base_size = base_size) +
    
    # legend
    theme(legend.background = element_blank(), legend.key = element_blank(),
          legend.position = legend_position)

  # chart grid
  if (inherits(grid, "character") | grid == TRUE) {
    
    p <- p + theme(panel.grid = element_line(colour = grid_col, size = 0.2),
                   panel.grid.major = element_line(colour=grid_col, size = 0.2),
                   panel.grid.minor = element_line(colour=grid_col, size = 0.15))

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

  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  # chart text + margins
  
  title_pos <- match.arg(plot_title_position)
  
  p <- p + theme(
    axis.text.x = element_text(size = axis_text_size, colour = axis_text_colour, 
                               margin = margin(t=10), family = base_family),
    axis.text.y = element_text(size = axis_text_size, colour = axis_text_colour, 
                               margin = margin(r=10), family = base_family),
    axis.text = element_text(size = axis_text_size, colour = axis_text_colour, 
                             family = base_family),
    axis.title = element_text(size = axis_title_size, family = base_family, 
                              colour = axis_title_colour),
    axis.title.x = element_text(hjust = xj, size=axis_title_size, family=base_family, 
                                face=axis_title_face, colour = axis_title_colour),
    axis.title.y = element_text(hjust = yj, size=axis_title_size, family=base_family, 
                                face = axis_title_face, colour = axis_title_colour),
    axis.title.y.right = element_text(hjust = yj, size=axis_title_size, angle=90, 
                                      family=base_family, face = axis_title_face,
                                      colour = axis_title_colour),
    strip.text = element_text(hjust = 0, size = strip_text_size, colour = strip_text_colour,
                              face = strip_text_face, family = base_family),
    panel.spacing = grid::unit(2, "lines"),
    plot.title = element_text(
      hjust=0, size=plot_title_size, margin=margin(b=plot_title_margin),
      family=base_family, face=plot_title_face, colour = plot_title_colour),
    plot.title.position = title_pos,
    plot.subtitle = element_text(
      hjust=0, size=subtitle_size, margin=margin(b=subtitle_margin),
      family=base_family, face=subtitle_face, colour = subtitle_colour
      ),
    plot.caption=element_text(
      hjust = 1, size = caption_size, margin = margin(t=caption_margin),
      family = base_family, face = caption_face, colour = caption_colour
    ),
    legend.title = element_text(
      hjust = 0, size = legend_title_size, family = base_family, 
      face=legend_title_face, colour = legend_title_colour
    ),
    legend.text = element_text(
      hjust=0, size=legend_text_size, family=base_family, 
      face="plain", colour = legend_text_colour
    ),
    plot.margin = ggplot2::margin(plot_margin)
  )

  p
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
#' @param base_size Sets the base size of text for the plot.
#' Defaults to \code{12}
#' @param base_colour Sets the default colour of titles and labels.
#' Must be a named R colour or hexadecimal colour code
#' (e.g. "#FF0000"). Defaults to \code{#2b2b2b}
#' @param plot_title_size,plot_title_face plot title size and face
#' @param plot_title_position Alignment of the plot title/subtitle and caption.
#' A value of "plot" (the default) means that titles and/or caption are aligned to 
#' the entire plot (minus any space for margins and plot tag).
#' A value of "panel" means that titles and/or caption are aligned to the plot panels 
#' @param subtitle_size,subtitle_face subtitle size and face
#' @param caption_size,caption_margin,caption_face caption size, margin (top) and face
#' @param axis_title_size,axis_title_face axis title size and face
#' @param axis_text_size axis text size
#' @param strip_text_size,strip_text_face facet label size and face
#' @param plot_margin plot margin (top, right, bottom, left)
#' @param axis_col,ticks_col axis & ticks colours; both default to `#2b2b2b`
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
  base_size = 12, base_colour = "#2b2b2b",
  plot_title_size = 18, plot_title_face = "bold",
  plot_title_position = c("plot", "panel"),
  subtitle_size = 12, subtitle_face = "plain",
  axis_title_size = base_size, axis_title_face = "plain",
  axis_text_size = base_size,
  caption_size = 9, caption_margin = 10, caption_face = "plain",
  strip_text_size = 12, strip_text_face = "plain",
  plot_margin = c(10, 10, 10, 10),
  axis_col = "#2b2b2b", ticks_col = "#2b2b2b"
) {

  title_pos <- match.arg(plot_title_position)
  
  # create theme, based on classic
  theme_classic(base_size = base_size) +
    
    theme(
    
    # grid
    panel.grid = element_blank(),
    
    # background attributes
    panel.background = element_blank(),
    plot.margin = ggplot2::margin(plot_margin),

    # tick marks
    axis.ticks.length = unit(4, "pt"),
    axis.ticks = element_line(size = 0.5, colour = ticks_col),

    # axis lines
    axis.line.x = element_line(size = 0.5, colour = axis_col),
    axis.line.y = element_line(size = 0.5, colour = axis_col),

    # chart text
    text = element_text(
      colour = base_colour, size = base_size,
      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.8
      ),
    axis.text.x = element_text(colour = base_colour, size = axis_text_size, 
                               margin = ggplot2::margin(t=3)),
    axis.text.y = element_text(colour = base_colour, size = axis_text_size, 
                               margin = ggplot2::margin(r=3)),
    axis.text.y.right = element_text(colour = base_colour, size = axis_text_size, 
                                     margin = ggplot2::margin(l=3)),
    plot.title = element_text(size = plot_title_size, face = plot_title_face, 
                              hjust = 0, colour = base_colour),
    plot.title.position = title_pos,
    plot.subtitle = element_text(colour = base_colour, face = subtitle_face, 
                                      hjust = 0, size = subtitle_size),
    plot.caption = element_text(colour = base_colour, hjust = 1, face = caption_face, 
                                size = caption_size, 
                                margin = ggplot2::margin(t = caption_margin)),
    axis.title.x = element_text(angle = 0, vjust = 1, face = axis_title_face, 
                                size = axis_title_size, colour = base_colour),
    axis.title.y = element_text(angle = 0, vjust = 1, face = axis_title_face, 
                                size = axis_title_size, colour = base_colour),
    axis.title.y.right = element_text(angle = 0, vjust = 1, hjust = 1, 
                                      face = axis_title_face, 
                                      size = axis_title_size, colour = base_colour),
    
    # legend
    legend.position = "bottom",
    legend.title = element_blank(),
    legend.background = element_blank(),
    legend.key = element_rect(fill = "transparent", colour = "transparent"),
    legend.spacing.x = ggplot2::unit(5, 'pt'),
    legend.spacing.y = ggplot2::unit(5, 'pt'),
    legend.spacing = ggplot2::unit(5, 'pt'),

    # facet attributes
    strip.background = element_blank(),
    strip.text = element_text(color = base_colour, size = strip_text_size, 
                              face = strip_text_face),
    strip.text.x = element_text(color = base_colour, size = strip_text_size, 
                                face = strip_text_face),
    strip.text.y = element_text(color = base_colour, size = strip_text_size, 
                                face = strip_text_face, angle = -90)
  )
}


#' A \code{ggplot2} theme for Monetary Policy Report (MPR) chart styling
#' 
#' @description Provides a theme to produce
#' Monetary Policy Report (FKA Inflation Report) style visualisations in \code{ggplot2}.
#' See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#' 
#' @inheritParams theme_overground
#' @param axis_ticks_length length of axis ticks (in centimetres)
#' @param legend_just,legend_margin legend justification and margins
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
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot", subtitle = "Something insightful",
#'    caption = "Source: R") +
#'    theme_mpr() +
#'    scale_y_continuous(position = "right", 
#'                       sec.axis = dup_axis(labels = NULL))
#' }
#' 
#' @name theme_mpr

theme_mpr <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#00294E", 
  plot_title_margin = 5, plot_title_position = c("panel", "plot"),
  subtitle_face = "plain", subtitle_colour = "#1e1e1e", subtitle_size = 13,  
  subtitle_margin = 10,
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "top", legend_just = "left", legend_margin = c(0, base_size/2, 0, 0),
  caption_face = "plain", caption_colour = base_colour, caption_size = base_size,  
  caption_margin = 15,
  strip_text_face = "plain", strip_text_colour = base_colour, 
  strip_text_size = 13, 
  plot_margin = c(10, 10, 10, 30)) 
{

  half_line <- base_size/2
  
  tickLabelMargin = 100 * axis_ticks_length - 20
  
  title_pos <- match.arg(plot_title_position)
  
  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  # create theme, based on ggplot2's theme_bw
  theme_bw() +
    theme(
      
      # titling
      plot.title = element_text(
        hjust = 0, size = plot_title_size, 
        margin = ggplot2::margin(b = plot_title_margin),
        family = base_family, face = plot_title_face, colour = plot_title_colour
      ),
      plot.title.position = title_pos,
      plot.subtitle = element_text(
        hjust = 0, size = subtitle_size, margin = ggplot2::margin(b = subtitle_margin),
        family = base_family, face = subtitle_face, colour = subtitle_colour
      ),
      
      # axis text
      axis.text.x = element_text(size = axis_text_size, colour = axis_text_colour, 
                                 margin = ggplot2::margin(t = tickLabelMargin), 
                                 family = base_family),
      axis.text.y = element_text(size = axis_text_size, colour = axis_text_colour, 
                                 margin = ggplot2::margin(r = tickLabelMargin), 
                                 family = base_family),
      axis.text.y.right = element_text(size = axis_text_size, colour = axis_text_colour, 
                                       margin = ggplot2::margin(l = tickLabelMargin), 
                                       family = base_family),
      axis.text = element_text(size = axis_text_size, colour = axis_text_colour, 
                               family = base_family),
      
      # axis titles
      axis.title = element_text(
        size = axis_title_size, family = base_family, colour = axis_title_colour
        ),
      axis.title.x = element_text(
        hjust = xj, size = axis_title_size, family = base_family, 
        face=axis_title_face, colour = axis_title_colour
        ),
      axis.title.y = element_text(
        hjust = yj, size = axis_title_size, family = base_family, 
        face = axis_title_face, colour = axis_title_colour
        ),
      axis.title.y.left = element_blank(),
      axis.title.y.right = element_text(
        hjust = yj, size=axis_title_size, angle=90, family = base_family, 
        face = axis_title_face, colour = axis_title_colour
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
        hjust = 0, size = caption_size, margin = ggplot2::margin(t = caption_margin),
        family = base_family, face = caption_face, colour = caption_colour
        ),
      
      # legend
      legend.title = element_text(
        hjust=0, size = legend_title_size, family = base_family, 
        face=legend_title_face, colour = legend_title_colour
        ),
      legend.text = element_text(
        hjust=0, size=legend_text_size, family=base_family, 
        face="plain", colour = legend_text_colour
        ),
      legend.margin = margin(legend_margin),
      legend.justification = legend_just, legend.position = legend_position,
      legend.box.just = "left",

      # strip attributes (for facetting)
      strip.background =   element_blank(),
      strip.text = element_text(
        hjust = 0, size = strip_text_size, colour = strip_text_colour,
        face = strip_text_face, family = base_family
        ),
      strip.text.x =       element_text(color = base_colour, size = base_size),
      strip.text.y =       element_text(color = base_colour, size = base_size, 
                                        angle = -90)
      )
}

#' Monetary Policy Report y axis label positioning
#' 
#' Creates a text element containing the y-axis title, positioned
#' as found in the Monetary Policy Report (MPR).
#'
#' @param x a ggplot object
#'
#' @return a ggplot object
#' @export
#'
#' @examples \dontrun{
#' 
#' p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#' geom_point() +
#' labs(title = "A Lovely Plot", subtitle = "Something insightful", x = NULL) +
#' theme_mpr() +
#' scale_y_continuous(
#' position = "right", sec.axis = dup_axis(labels = NULL)
#' )
#' 
#' ylab_mpr(p)
#' }

ylab_mpr <- function(x) {
  
  b <- ggplot_build(x)
  g <- ggplotGrob(x)
  
  right =  textGrob(
    b$plot$labels$y, x = 1, y = 1, just = c("right", "top"), 
    gp = gpar(
      fontsize = b$plot$theme$text$size, col =  b$plot$theme$text$colour
      )
    )
  labs = gTree("Labs", children = gList(right))
  
  g <- gtable_filter(g, pattern = "ylab", invert = TRUE)
  
  pos = g$layout[grepl("panel", g$layout$name), c('t', 'l')]
  height = unit(1.5, "grobheight", right)
  g <- gtable_add_rows(g, height, pos$t-1)
  
  g = gtable_add_grob(g, labs, t = pos$t, l = pos$l, r = pos$l)
  
  g = g[, -2]
  
  g <- gtable_trim(g)
  
  wrap_ggplot_grob(g)
}

#' @export
#' @rdname theme_mpr
theme_inflation_report <- function(
  base_family = "Calibri", base_size = 11.5, base_colour = "#1e1e1e",
  plot_title_face = "plain", plot_title_size = 18, plot_title_colour = "#00294E", 
  plot_title_margin = 5, plot_title_position = c("plot", "panel"),
  subtitle_face = "plain", subtitle_colour = "#1e1e1e", subtitle_size = 13,  
  subtitle_margin = 10,
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "mc",
  axis_text_size = base_size, axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size, legend_title_colour = base_colour, 
  legend_title_face = "plain", 
  legend_text_size = base_size, legend_text_colour = base_colour, 
  legend_position = "top", legend_just = "left", legend_margin = c(0, base_size/2, 0, 0),
  caption_face = "plain", caption_colour = base_colour, caption_size = base_size,  
  caption_margin = 15,
  strip_text_face = "plain", strip_text_colour = base_colour, 
  strip_text_size = 22, 
  plot_margin = c(30, 30, 30, 30)
  ) {
    
  .Deprecated("theme_mpr")
    
  theme_mpr(base_family = base_family, base_size = base_size, base_colour = base_colour,
            plot_title_face = plot_title_face, plot_title_size = plot_title_size, 
            plot_title_colour = plot_title_colour, plot_title_margin = plot_title_margin,
            plot_title_position = match.arg(plot_title_position),
            subtitle_face = subtitle_face, subtitle_colour = subtitle_colour, 
            subtitle_size = subtitle_size, subtitle_margin = subtitle_margin,
            axis_title_size = axis_title_size, axis_title_colour = axis_title_colour,
            axis_title_face = axis_title_face, axis_title_just = axis_title_just,
            axis_text_size = axis_text_size, axis_text_colour = axis_text_colour,
            axis_ticks_length = axis_ticks_length,
            legend_title_size = legend_title_size, legend_title_colour = legend_title_colour, 
            legend_title_face = legend_title_face, 
            legend_text_size = legend_text_size, legend_text_colour = legend_text_colour, 
            legend_position = legend_position, legend_just = legend_just, legend_margin = legend_margin,
            caption_face = caption_face, caption_colour = caption_colour, 
            caption_size = caption_size, caption_margin = caption_margin,
            strip_text_face = strip_text_face, strip_text_colour = strip_text_colour, 
            strip_text_size = strip_text_size, 
            plot_margin = plot_margin)
}
  