% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{ggplot2-scales-discrete}
\alias{ggplot2-scales-discrete}
\alias{scale_colour_discrete_boe}
\alias{scale_color_discrete_boe}
\alias{scale_fill_discrete_boe}
\alias{scale_discrete_boe}
\alias{scale_colour_boe}
\alias{scale_fill_boe}
\title{Discrete scales to use with ggplot2}
\usage{
scale_colour_discrete_boe(palette = "boe", reverse = FALSE, ...)

scale_color_discrete_boe(palette = "boe", reverse = FALSE, ...)

scale_fill_discrete_boe(palette = "boe", reverse = FALSE, ...)

scale_discrete_boe(
  palette = "boe",
  aesthetics = c("colour", "fill"),
  reverse = FALSE,
  ...
)

scale_colour_boe(palette = "boe", reverse = FALSE, ...)

scale_fill_boe(palette = "boe", reverse = FALSE, ...)
}
\arguments{
\item{palette}{A palette function that when called with a numeric vector with
values between 0 and 1 returns the corresponding output values
(e.g., \code{\link[scales:area_pal]{scales::area_pal()}}).}

\item{reverse}{Logical, sets the order of colours in the scale. If TRUE,
the n colours will be returns in reverse order (FALSE by default).}

\item{...}{additional arguments to pass to \link[ggplot2]{discrete_scale}}

\item{aesthetics}{The names of the aesthetics that this scale works with.}
}
\description{
These functions provide the option to use \code{boeCharts} colours inside discrete
palettes with the `ggplot2` package.
}
\examples{

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species)) +
    geom_point() +
    scale_colour_discrete_boe("boe_highlights")
    

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species)) +
    geom_point() +
    scale_color_discrete_boe("boe_highlights")
    
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species)) +
    geom_col() +
    scale_fill_discrete_boe(boe_palettes$vibrant_a)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species, fill=Species)) +
    geom_point() +
    geom_col() +
    scale_discrete_boe(boe_palettes$vibrant_a)  ## set colour and fill simultaneously
}
\seealso{
\code{\link{theme_overground}} for examples.

Other colour boe: 
\code{\link{boe_pal}()},
\code{\link{ggplot2-scales-continuous}}
}
\concept{colour boe}
