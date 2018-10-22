#' @title A \code{ggplot2} theme for MCG publication-ready charts
#'
#' @description Provides a theme to produce
#' Money & Credit Group (MCG) publication style visualisations in \code{ggplot2}.
#' See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#'
#' @details Builds on the 'grammar of graphics' framework implement in
#' ggplot2. Applying \code{theme_mcg_pub()} will adjust graphical parameters
#' to give a plot a feel more in line with MCG publications.
#'
#' @param base_size Sets the base size of text for the plot.
#' Defaults to \code{12}
#'
#' @param base_colour Sets the default colour of titles and labels.
#' Must be a named R colour or hexadecimal colour code
#' (e.g. "#FF0000"). Defaults to \code{#2b2b2b}
#'
#' @param plot_title_size,plot_title_face plot title size and face
#'
#' @param subtitle_size,subtitle_face subtitle size and face
#'
#' @param caption_size,caption_margin,caption_face caption size, margin and face
#'
#' @param axis_title_size,axis_title_face axis title size and face
#' 
#' @param axis_text_size axis text size
#'
#' @param strip_text_size,strip_text_face facet label size and face
#'
#' @param plot_margin plot margin (specify with \code{ggplot2::margin()})
#' 
#' @param axis_col,ticks_col axis & ticks colours; both default to `#2b2b2b`
#' 
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' 
#' @param grid_col grid colour, defaults to `#cccccc`
#'
#'
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#' p <- ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point() +
#'     labs(title = "A Lovely Plot",
#'          subtitle = "What can the subtitle tell us?")
#'
#' # Plot without any theme applied
#'
#' p
#'
#' # Now apply mcg pub theme
#'
#' p +
#'  theme_mcg_pub() +
#'  scale_y_continuous(position = "right")
#'
#' @import ggplot2
#' @export
#'

theme_mcg_pub <- function(base_size = 12, base_colour = "#2b2b2b",
                          plot_title_size = 18, plot_title_face = "bold",
                          subtitle_size = 12, subtitle_face = "plain",
                          caption_size = 9, caption_margin = 10, caption_face = "plain",
                          axis_title_size = base_size, axis_title_face = "plain",
                          axis_text_size = base_size,
                          strip_text_size = 12, strip_text_face = "plain",
                          plot_margin = ggplot2::margin(30, 30, 30, 30),
                          axis_col = "#2b2b2b", ticks_col = "#2b2b2b",
                          grid = FALSE, grid_col = "#cccccc") {

  # create theme based on classic
  mcg_theme <- ggplot2::theme_classic(base_size = base_size)
  
  # grid
  if (inherits(grid, "character") | grid == TRUE) {
    
    mcg_theme <- mcg_theme + ggplot2::theme(panel.grid=element_line(color=grid_col, size=0.2))
    mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.major=element_line(color=grid_col, size=0.2))
    mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.minor=element_line(color=grid_col, size=0.15))
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) mcg_theme <- mcg_theme + ggplot2::theme(panel.grid.minor.y=element_blank())
    }
    
  } else {
    mcg_theme <- mcg_theme + theme(panel.grid=element_blank())
  }

  mcg_theme + ggplot2::theme(

    # legend
    legend.position = "bottom",
    legend.title =     ggplot2::element_blank(),
    legend.background= ggplot2::element_blank(),
    legend.key =       ggplot2::element_rect(fill = "transparent", colour = "transparent"),
    legend.spacing.x = ggplot2::unit(5, 'pt'),
    legend.spacing.y = ggplot2::unit(5, 'pt'),
    legend.spacing =   ggplot2::unit(5, 'pt'),

    # tick marks
    axis.ticks.length = ggplot2::unit(4, "pt"),
    axis.ticks = ggplot2::element_line(size = 0.5, colour = ticks_col),

    # axis lines
    axis.line.x = ggplot2::element_line(size = 0.5, colour = axis_col),
    axis.line.y = ggplot2::element_line(size = 0.5, colour = axis_col),

    # titling
    text = ggplot2::element_text(
      colour = base_colour, size = base_size,
      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.8),
    axis.text.x =        ggplot2::element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(t=3)),
    axis.text.y =        ggplot2::element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(r=3)),
    axis.text.y.right =  ggplot2::element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(l=3)),
    plot.title =         ggplot2::element_text(size = plot_title_size, face = plot_title_face, hjust = 0, colour = base_colour),
    plot.subtitle =      ggplot2::element_text(colour = base_colour, face = subtitle_face, hjust = 0, size = subtitle_size),
    plot.caption =       ggplot2::element_text(colour = base_colour, hjust = 1, face = caption_face, size = caption_size, 
                                               margin = ggplot2::margin(t=caption_margin)),
    axis.title.x =       ggplot2::element_text(angle = 0, vjust = 1, face = axis_title_face, size = axis_title_size, colour = base_colour),
    axis.title.y =       ggplot2::element_text(angle = 0, vjust = 1, face = axis_title_face, size = axis_title_size, colour = base_colour),
    axis.title.y.right = ggplot2::element_text(angle = 0, vjust = 1, hjust = 1, face = axis_title_face, size = axis_title_size, 
                                               colour = base_colour),

    # background attributes
    panel.background = ggplot2::element_blank(),
    plot.margin =      plot_margin,

    # strip attributes (for facetting)
    strip.background =   ggplot2::element_blank(),
    strip.text =         ggplot2::element_text(color = base_colour, size = strip_text_size, face = strip_text_face),
    strip.text.x =       ggplot2::element_text(color = base_colour, size = strip_text_size, face = strip_text_face),
    strip.text.y =       ggplot2::element_text(color = base_colour, size = strip_text_size, face = strip_text_face, angle = -90),

    complete = FALSE

  )
}


#' A \code{ggplot2} theme for BOE Inflation Report chart styling
#' 
#' @description Provides a theme to produce
#' Inflation Report style visualisations in \code{ggplot2}.
#' See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
#' 
#' @param base_size Sets the base size of text for the plot.
#' Defaults to \code{12}
#'
#' @param base_colour Sets the default colour of titles and labels.
#' Must be a named R colour or hexadecimal colour code
#' (e.g. "#FF0000"). Defaults to \code{#2b2b2b}
#' 
#' @param plot_title_size plot title size
#' 
#' @param plot_margin plot margin (specify with \code{ggplot2::margin()})
#'
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#' library(boeCharts)
#'
#' p <- ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point() +
#'     labs(title = "A Lovely Plot")
#'
#' # Plot without any theme applied
#'
#' p
#'
#' # Now apply mcg pub theme
#'
#' p +
#'  theme_inflation_report() +
#'  scale_y_continuous(position = "right", sec.axis = dup_axis(labels=NULL))

theme_inflation_report = function(base_size = 12,
                                  base_colour = "#2b2b2b",
                                  plot_title_size = 12,
                                  plot_margin = ggplot2::margin(30, 30, 30, 30)) {
  
  # set global parameters
  fontSize = base_size
  allText = ggplot2::element_text(size = fontSize, colour = base_colour, family = "sans", color= "black")
  
  tickLength = 0.4
  tickLabelMargin = 100 * tickLength - 20
  
  # create theme, based on ggplot2's theme_bw
  ggplot2::theme_bw() +
    ggplot2::theme(
      
      # legend
      legend.text = allText,
      legend.title = allText,
      
      # axes
      axis.text = allText,
      axis.text.x = ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(t = tickLabelMargin)),
      axis.text.y.right = ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(l = tickLabelMargin)),
      axis.text.y.left = ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(r = tickLabelMargin)),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      axis.ticks.length = ggplot2::unit(-tickLength, "cm"),
      
      # titling
      plot.title = ggplot2::element_text(size = plot_title_size, family = "sans", color= base_colour, hjust = 1.0),
      plot.subtitle = ggplot2::element_text(size = plot_title_size, family = "sans", color= base_colour, hjust = 1.0),
      
      # grid
      panel.background = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      plot.margin = plot_margin,
      
      # strip attributes (for facetting)
      strip.background =   ggplot2::element_blank(),
      strip.text =         ggplot2::element_text(color = base_colour, size = fontSize),
      strip.text.x =       ggplot2::element_text(color = base_colour, size = fontSize),
      strip.text.y =       ggplot2::element_text(color = base_colour, size = fontSize, angle = -90),
      
      complete = FALSE
    )
}

