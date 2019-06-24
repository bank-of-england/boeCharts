#' @title A \code{ggplot2} theme to approximate style of Bank Overground charts
#'
#' @description Provides a theme to produce
#' Bank Overground style visualisations in \code{ggplot2}.
#' 
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg,y = wt)) +
#' geom_point() +
#' labs(title = "A Lovely Plot",
#' subtitle = "What can the subtitle tell us?") +
#' theme_boe_overground()

theme_boe_overground <- function(
  base_family = "Arial Narrow", base_size = 18, base_colour = "#1e1e1e",
  plot_title_family = base_family, plot_title_size = 28, 
  plot_title_colour = base_colour, plot_title_face = "bold", plot_title_margin = 10,
  subtitle_family = base_family, subtitle_colour = base_colour,
  subtitle_size = 22, subtitle_face = "plain", subtitle_margin = 15,
  strip_text_family = base_family, strip_text_colour = base_colour,
  strip_text_size = 22, strip_text_face = "plain",
  caption_family = base_family, caption_colour = base_colour,
  caption_size = 16, caption_face = "plain", caption_margin = 15,
  axis_text_size = base_size, axis_text_colour = base_colour,
  axis_title_family = subtitle_family,
  axis_title_size = base_size, axis_title_colour = base_colour,
  axis_title_face = "plain", axis_title_just = "rt",
  legend_title_family = base_family, legend_title_size = base_size, 
  legend_title_colour = base_colour, legend_title_face = "plain",
  legend_text_family = base_family, legend_text_size = base_size, 
  legend_text_colour = base_colour, legend_text_face = "plain",
  plot_margin = margin(10, 10, 10, 10),
  grid = "Y", grid_col = "#EBEBEB", 
  axis = FALSE, axis_col = "#2b2b2b", ticks = TRUE
  ) {
  
  # base theme
  ret <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)
  
  # legend
  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())
  
  # chart grid
  if (inherits(grid, "character") | grid == TRUE) {
    
    ret <- ret + theme(panel.grid=element_line(colour=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.major=element_line(colour=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.minor=element_line(colour=grid_col, size=0.15))
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }
    
  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }
  
  # axis lines
  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line=element_line(colour="#2b2b2b", size=0.15))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x=element_blank())
      } else {
        ret <- ret + theme(axis.line.x=element_line(colour=axis_col, size=0.15))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(colour=axis_col, size=0.15))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(colour=axis_col, size=0.15))
      ret <- ret + theme(axis.line.y=element_line(colour=axis_col, size=0.15))
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }
  
  # axis ticks
  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.15, colour = grid_col))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.15, colour = grid_col))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.15, colour = grid_col))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }
  
  # title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  # chart text + margins
  ret <- ret + theme(axis.text.x=element_text(size=axis_text_size, colour = axis_text_colour, margin=margin(t=10)))
  ret <- ret + theme(axis.text.y=element_text(size=axis_text_size, colour = axis_text_colour, margin=margin(r=10)))
  ret <- ret + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family, 
                                             colour = axis_title_colour))
  ret <- ret + theme(axis.title.x=element_text(hjust=xj, size=axis_title_size, family=axis_title_family, 
                                               face=axis_title_face, colour = axis_title_colour))
  ret <- ret + theme(axis.title.y=element_text(hjust=yj, size=axis_title_size, family=axis_title_family, 
                                               face=axis_title_face, colour = axis_title_colour))
  ret <- ret + theme(axis.title.y.right=element_text(hjust=yj, size=axis_title_size, angle=90, family=axis_title_family, 
                                                     face=axis_title_face, colour = axis_title_colour))
  ret <- ret + theme(strip.text=element_text(hjust=0, size=strip_text_size, colour = strip_text_colour,
                                             face=strip_text_face, family=strip_text_family))
  ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
  ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size, margin=margin(b=plot_title_margin),
                                             family=plot_title_family, face=plot_title_face, colour = plot_title_colour))
  ret <- ret + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size, margin=margin(b=subtitle_margin),
                                                family=subtitle_family, face=subtitle_face, colour = subtitle_colour))
  ret <- ret + theme(plot.caption=element_text(hjust=1, size=caption_size, margin=margin(t=caption_margin),
                                               family=caption_family, face=caption_face, colour = caption_colour))
  ret <- ret + theme(legend.title = element_text(hjust=0, size=legend_title_size, family = legend_title_family, 
                                                 face=legend_title_face, colour = legend_title_colour))
  ret <- ret + theme(legend.text = element_text(hjust=0, size=legend_text_size, family=legend_text_family, 
                                                 face=legend_text_face, colour = legend_text_colour))
  ret <- ret + theme(plot.margin=plot_margin)
  
  ret
  
}


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
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#'
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot",
#'         subtitle = "An enticing subtitle.") +
#'    theme_mcg_pub() +
#'    scale_y_continuous(position = "right")
#'
#' @export

theme_mcg_pub <- function(base_size = 12, base_colour = "#2b2b2b",
                          plot_title_size = 18, plot_title_face = "bold",
                          subtitle_size = 12, subtitle_face = "plain",
                          caption_size = 9, caption_margin = 10, caption_face = "plain",
                          axis_title_size = base_size, axis_title_face = "plain",
                          axis_text_size = base_size,
                          strip_text_size = 12, strip_text_face = "plain",
                          plot_margin = ggplot2::margin(30, 30, 30, 30),
                          axis_col = "#2b2b2b", ticks_col = "#2b2b2b") {

  # create theme, based on classic
  theme_classic(base_size = base_size) +
    
    theme(
    
    # grid
    panel.grid = element_blank(),

    # legend
    legend.position = "bottom",
    legend.title =      element_blank(),
    legend.background = element_blank(),
    legend.key =        element_rect(fill = "transparent", colour = "transparent"),
    legend.spacing.x =  ggplot2::unit(5, 'pt'),
    legend.spacing.y =  ggplot2::unit(5, 'pt'),
    legend.spacing =    ggplot2::unit(5, 'pt'),

    # tick marks
    axis.ticks.length = unit(4, "pt"),
    axis.ticks = element_line(size = 0.5, colour = ticks_col),

    # axis lines
    axis.line.x = element_line(size = 0.5, colour = axis_col),
    axis.line.y = element_line(size = 0.5, colour = axis_col),

    # titling
    text = ggplot2::element_text(
      colour = base_colour, size = base_size,
      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.8
      ),
    axis.text.x =        element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(t=3)),
    axis.text.y =        element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(r=3)),
    axis.text.y.right =  element_text(colour = base_colour, size = axis_text_size, margin = ggplot2::margin(l=3)),
    plot.title =         element_text(size = plot_title_size, face = plot_title_face, hjust = 0, colour = base_colour),
    plot.subtitle =      element_text(colour = base_colour, face = subtitle_face, hjust = 0, size = subtitle_size),
    plot.caption =       element_text(colour = base_colour, hjust = 1, face = caption_face, size = caption_size, 
                                      margin = ggplot2::margin(t = caption_margin)),
    axis.title.x =       element_text(angle = 0, vjust = 1, face = axis_title_face, size = axis_title_size, colour = base_colour),
    axis.title.y =       element_text(angle = 0, vjust = 1, face = axis_title_face, size = axis_title_size, colour = base_colour),
    axis.title.y.right = element_text(angle = 0, vjust = 1, hjust = 1, face = axis_title_face, size = axis_title_size, 
                                      colour = base_colour),

    # background attributes
    panel.background = element_blank(),
    plot.margin =      plot_margin,

    # strip attributes (for facetting)
    strip.background =   element_blank(),
    strip.text =         element_text(color = base_colour, size = strip_text_size, face = strip_text_face),
    strip.text.x =       element_text(color = base_colour, size = strip_text_size, face = strip_text_face),
    strip.text.y =       element_text(color = base_colour, size = strip_text_size, face = strip_text_face, angle = -90),

    complete = TRUE
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
#'
#' ggplot(mtcars, aes(x = mpg, y = wt)) +
#'    geom_point() +
#'    labs(title = "A Lovely Plot") +
#'    theme_inflation_report() +
#'    scale_y_continuous(position = "right", 
#'                       sec.axis = dup_axis(labels = NULL))

theme_inflation_report = function(base_size = 12,
                                  base_colour = "#2b2b2b",
                                  plot_title_size = 12,
                                  plot_margin = ggplot2::margin(30, 30, 30, 30)) {
  
  # set global parameters
  fontSize = base_size
  allText = element_text(size = fontSize, colour = base_colour, family = "sans", color= "black")
  
  tickLength = 0.4
  tickLabelMargin = 100 * tickLength - 20
  
  # create theme, based on ggplot2's theme_bw
  theme_bw() +
    theme(
      
      # legend
      legend.text = allText,
      legend.title = allText,
      
      # axes
      axis.text = allText,
      axis.text.x = element_text(colour = base_colour, margin = ggplot2::margin(t = tickLabelMargin)),
      axis.text.y.right = element_text(colour = base_colour, margin = ggplot2::margin(l = tickLabelMargin)),
      axis.text.y.left = element_text(colour = base_colour, margin = ggplot2::margin(r = tickLabelMargin)),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.ticks.length = ggplot2::unit(-tickLength, "cm"),
      
      # titling
      plot.title = element_text(size = plot_title_size, family = "sans", color= base_colour, hjust = 1.0),
      plot.subtitle = element_text(size = plot_title_size, family = "sans", color= base_colour, hjust = 1.0),
      
      # grid
      panel.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = plot_margin,
      
      # strip attributes (for facetting)
      strip.background =   element_blank(),
      strip.text =         element_text(color = base_colour, size = fontSize),
      strip.text.x =       element_text(color = base_colour, size = fontSize),
      strip.text.y =       element_text(color = base_colour, size = fontSize, angle = -90),
      
      complete = TRUE
    )
}

