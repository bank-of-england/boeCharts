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
#' @param subtitle_size subtitle size
#'
#' @param caption_size,caption_margin caption size and margin
#'
#' @param axis_title_size axis title size
#'
#' @param facet_text_size facet label size
#'
#' @param plot_margin plot margin (specify with \code{ggplot2::margin()})
#'
#'
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_point}} from the
#' package \code{ggplot2}, will apply styling to a plot.
#'
#' @examples
#'
#'
#' library(ggplot2)
#' library(boeChartr)
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
#'  theme_mcg_pub()
#'
#' @import ggplot2
#' @export
#'

theme_mcg_pub <- function(base_size = 12,
                          base_colour = "#2b2b2b",
                          plot_title_size = 18,
                          plot_title_face = "bold",
                          subtitle_size = 12,
                          caption_size = 9,
                          caption_margin = 10,
                          axis_title_size = 12,
                          facet_text_size = 12,
                          plot_margin = ggplot2::margin(10, 10, 10, 50)) {

  # create theme based on classic
  mcg_theme <- ggplot2::theme_classic(base_size = base_size)

  mcg_theme + ggplot2::theme(

    # legend
    legend.position = "bottom",
    legend.title =     ggplot2::element_blank(),
    legend.key =       ggplot2::element_rect(fill = "transparent", colour = "transparent"),
    legend.spacing.x = ggplot2::unit(5, 'pt'),
    legend.spacing.y = ggplot2::unit(5, 'pt'),
    legend.spacing =   ggplot2::unit(5, 'pt'),

    # tick marks
    axis.ticks.length = ggplot2::unit(4, "pt"),
    axis.ticks = ggplot2::element_line(size = 0.5),

    # axis lines
    axis.line.x = ggplot2::element_line(size = 0.5),
    axis.line.y = ggplot2::element_line(size = 0.5),

    # titling
    text = ggplot2::element_text(
      face = "plain", colour = base_colour, size = base_size,
      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.8),
    axis.text.x =        ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(t=3)),
    axis.text.y =        ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(r=3)),
    axis.text.y.right =  ggplot2::element_text(colour = base_colour, margin = ggplot2::margin(l=3)),
    plot.title =         ggplot2::element_text(size = plot_title_size, face = plot_title_face, hjust = 0, colour = base_colour),
    plot.subtitle =      ggplot2::element_text(colour = base_colour, hjust = 0, size = subtitle_size),
    plot.caption =       ggplot2::element_text(colour = base_colour, hjust = 1, size = caption_size, margin = ggplot2::margin(t=caption_margin)),
    axis.title.x =       ggplot2::element_text(angle = 0, vjust = 1, size = axis_title_size, colour = base_colour),
    axis.title.y =       ggplot2::element_text(angle = 0, vjust = 1, size = axis_title_size, colour = base_colour),
    axis.title.y.right = ggplot2::element_text(angle = 0, vjust = 1, hjust = 1, size = axis_title_size, colour = base_colour),

    # background attributes
    panel.background = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    plot.margin =      plot_margin,

    # strip attributes (for facetting)
    strip.background =   ggplot2::element_blank(),
    strip.text =         ggplot2::element_text(color = base_colour, size = facet_text_size),
    strip.text.x =       ggplot2::element_text(),
    strip.text.y =       ggplot2::element_text(angle = -90),

    complete = FALSE

  )
}

