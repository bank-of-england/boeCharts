% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/themes.R
\name{boetheme}
\alias{theme_boe_identity}
\alias{theme_overground}
\alias{theme_mpr}
\alias{theme_fsr}
\alias{theme_mcg_pub}
\title{Bank of England [ggplot2] themes}
\usage{
theme_boe_identity(
  axis = "X",
  grid = "X",
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
  legend_position = c("top-left", "top-right", "bottom-left", "bottom-right", "top",
    "right", "bottom", "left", "none"),
  legend_direction = c("vertical", "horizontal"),
  caption_position = c("left", "right"),
  plot_title_position = c("plot", "panel")
)

theme_overground(
  base_family = "Calibri",
  base_size = 11.5,
  base_colour = "#657581",
  plot_title_face = "bold",
  plot_title_size = 18,
  plot_title_colour = "#005e6e",
  plot_title_position = c("plot", "panel"),
  subtitle_face = "bold",
  subtitle_colour = base_colour,
  subtitle_size = 14,
  axis_title_size = base_size,
  axis_title_colour = base_colour,
  axis_title_face = "plain",
  axis_title_just = "mc",
  axis_text_size = base_size,
  axis_text_colour = base_colour,
  legend_title_size = base_size,
  legend_title_colour = base_colour,
  legend_title_face = "plain",
  legend_text_size = base_size,
  legend_text_colour = base_colour,
  legend_position = "top",
  legend_just = "left",
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain",
  caption_colour = "#1e1e1e",
  caption_size = base_size,
  caption_position = c("plot", "panel"),
  strip_text_face = "plain",
  strip_text_colour = base_colour,
  strip_text_size = subtitle_size,
  grid = "X",
  grid_col = "#C8CCCF",
  axis = "X",
  axis_col = grid_col,
  ticks = axis,
  plot_margin = c(base_size/2, base_size/2, base_size/2, base_size * 2)
)

theme_mpr(
  base_family = "Calibri",
  base_size = 11.5,
  base_colour = "#1e1e1e",
  plot_title_face = "plain",
  plot_title_size = 18,
  plot_title_colour = "#005e6e",
  plot_title_position = c("panel", "plot"),
  subtitle_face = "plain",
  subtitle_colour = base_colour,
  subtitle_size = 14,
  axis_title_size = base_size,
  axis_title_colour = base_colour,
  axis_title_just = "mc",
  axis_text_size = base_size,
  axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size,
  legend_title_colour = base_colour,
  legend_text_size = base_size,
  legend_text_colour = base_colour,
  legend_position = "top",
  legend_just = "left",
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain",
  caption_colour = base_colour,
  caption_size = base_size,
  caption_position = c("panel", "plot"),
  strip_text_face = "plain",
  strip_text_colour = base_colour,
  strip_text_size = 13,
  plot_margin = c(base_size/2, base_size/2, base_size/2, base_size * 2)
)

theme_fsr(
  base_family = "Calibri",
  base_size = 11.5,
  base_colour = "#1e1e1e",
  plot_title_face = "plain",
  plot_title_size = 18,
  plot_title_colour = "#005e6e",
  plot_title_position = c("panel", "plot"),
  subtitle_face = "plain",
  subtitle_colour = base_colour,
  subtitle_size = 14,
  axis_title_size = base_size,
  axis_title_colour = base_colour,
  axis_title_just = "mc",
  axis_text_size = base_size,
  axis_text_colour = base_colour,
  axis_ticks_length = 0.35,
  legend_title_size = base_size,
  legend_title_colour = base_colour,
  legend_text_size = base_size,
  legend_text_colour = base_colour,
  legend_position = "top",
  legend_just = "left",
  legend_margin = c(base_size/2, base_size/2, base_size/2, 0),
  caption_face = "plain",
  caption_colour = base_colour,
  caption_size = base_size,
  caption_position = c("panel", "plot"),
  strip_text_face = "plain",
  strip_text_colour = base_colour,
  strip_text_size = 13,
  plot_margin = c(base_size/2, base_size/2, base_size/2, base_size * 2)
)

theme_mcg_pub(
  base_family = "",
  base_size = 11.5,
  base_colour = "#2b2b2b",
  plot_title_face = "bold",
  plot_title_size = 18,
  plot_title_position = c("plot", "panel"),
  subtitle_face = "plain",
  subtitle_size = 14,
  axis_title_face = "plain",
  axis_title_size = base_size,
  axis_title_colour = base_colour,
  axis_text_size = base_size,
  axis_text_colour = base_colour,
  legend_title_size = base_size,
  legend_title_colour = base_colour,
  legend_title_face = "plain",
  legend_text_size = base_size,
  legend_text_colour = base_colour,
  legend_position = "bottom",
  legend_just = "center",
  legend_margin = c(base_size/2, base_size/2, base_size/2, base_size/2),
  caption_face = "plain",
  caption_size = base_size,
  caption_colour = base_colour,
  strip_text_face = "plain",
  strip_text_size = subtitle_size,
  axis_colour = base_colour,
  ticks_colour = base_colour,
  plot_margin = c(base_size/2, base_size/2, base_size/2, base_size * 2)
)
}
\arguments{
\item{axis}{add x or y axes? `TRUE` (or `XY`), `FALSE`, `X` or `Y`}

\item{grid}{panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)}

\item{base_family, base_size, base_colour}{base font family, size and colour}

\item{axis_text_size, axis_text_colour}{axis text size and colour}

\item{legend_text_size, legend_text_colour}{legend text size and colour}

\item{axis_ticks_length, ticks_colour}{axis ticks length and colour}

\item{background_colour}{plot background colour}

\item{legend_position, legend_just, legend_margin, legend_direction}{legend position, justification, margin and direction}

\item{caption_position}{Alignment of the plot caption}

\item{plot_title_position}{Alignment of the plot title/subtitle.
A value of "plot" (the default) means that titles are aligned to 
the entire plot (minus any space for margins and plot tag).
A value of "panel" means that titles are aligned to the plot panels}

\item{plot_title_face, plot_title_size, plot_title_colour}{plot title face, size and colour}

\item{subtitle_face, subtitle_size, subtitle_colour}{plot subtitle face, size and colour}

\item{axis_title_face, axis_title_size, axis_title_colour}{axis title font face, 
size and colour}

\item{axis_title_just}{axis title font justification, one of `[blmcrt]`}

\item{legend_title_face, legend_title_size, legend_title_colour}{legend title 
font face, size and colour}

\item{caption_face, caption_size, caption_colour}{plot caption 
face, size, and colour}

\item{strip_text_face, strip_text_size, strip_text_colour}{facet label font 
face, size and colour}

\item{grid_col, axis_col, grid_colour, axis_colour, axis_line_colour}{grid & axis colours}

\item{ticks}{axis ticks (`TRUE` (or `XY`), `FALSE`, `X` or `Y`)}

\item{plot_margin}{plot margin (top, right, bottom, left)}
}
\description{
These are complete chart styles to produce approximations of charts found in
the Bank. Use [ggplot2::theme()] if you just need to tweak the display of an 
existing theme.
}
\details{
\describe{

\item{`theme_boe_identity()`}{
A ggplot2 theme for the Bank's 
\href{https://boeguidelines.frontify.com/d/KN5KRtH8qzXF/design-guidelines#/brand-applications/chart-design-for-staff}{2022 brand update chart design guidelines} 
}

\item{`theme_overground()`}{
A ggplot2 theme to produce
\href{https://www.bankofengland.co.uk/bank-overground}{Bank Overground} 
style visualisations}

\item{`theme_mpr()`}{
A ggplot2 theme for Monetary Policy Report (MPR) chart styling}

\item{`theme_fsr()`}{
A ggplot2 theme for Financial Stability Report (FSR) chart styling}

\item{`theme_mcg_pub()`}{
A ggplot2 theme for Money & Credit Group (MCG) publication chart styling}

}

See \code{ggplot2::scale_y_continuous} for positioning y-axis on the right.
}
\examples{
\dontrun{

library(ggplot2)

p1 <- ggplot(mtcars, aes(x = mpg, y = wt)) +
   geom_point() +
   labs(title = "A Lovely Plot", subtitle = "Something insightful")
   
p1 + theme_boe_identity()
p1 + theme_overground()
p1 + theme_mpr()
p1 + theme_fsr()
p1 + theme_mcg_pub()

p2 <- ggplot(mtcars, aes(x = mpg, y = wt, colour = factor(cyl))) +
   geom_point() +
   labs(title = "A Lovely Plot", subtitle = "Something insightful") +
   scale_y_continuous(position = "right")

p2 + 
  theme_boe_identity() +
  scale_colour_discrete_boe(palette = "boe_identity", name = NULL) +
  guides(colour = guide_legend(override.aes = list(size = 4)))
   
}

}
