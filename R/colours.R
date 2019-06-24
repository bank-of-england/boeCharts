#' @title A vector of colours from the Bank's colour palette.
#'
#' @description \code{\link{boe_cols}} Provides a vector of named colours taken from the Bank's
#' \href{http://intranet/BankNews/Pages/Updated-visual-identity-g-636195499604295252.aspx}{visual identity guidelines}.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols["fuschia"]) +
#'    theme_mcg_pub()
#'
#' @export
boe_cols <- c(
  red            = "#A51140",
  black          = "#1E1E1E",
  stone          = "#CAC0B6",
  dark_teal      = "#005E6E",
  dark_blue      = "#002A42",
  light_blue     = "#63B1E5",
  mid_blue       = "#165788",
  teal           = "#00839D",
  maroon         = "#6C0721",
  lavender       = "#AC98DB",
  purple         = "#4E3780",
  fuchsia        = "#A31A7E",
  plum           = "#752864",
  light_green    = "#7AB800",
  dark_green     = "#50882E",
  yellow         = "#EEAF30",
  orange         = "#E05206"
)


#' @title A vector of colours from the Bank's 'Rich' colour palette.
#'
#' @description \code{\link{boe_cols_rich}} Provides a vector of named colours
#' taken from the 'Rich' colour palette, as part of the Bank of England
#' 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_rich["rich_red"]) +
#'    theme_mcg_pub()
#'
#' @export
boe_cols_rich <- c(
  rich_blue = "#00294E",
  rich_teal = "#005E6E",
  rich_green = "#3A7130",
  rich_orange = "#C94D1B",
  rich_purple = "#2B1E56",
  rich_plum = "#5D2049",
  rich_red = "#AA0B3C"
)


#' @title A vector of colours from the Bank's 'Highlights' colour palette.
#'
#' @description \code{\link{boe_cols_highlights}} Provides a vector of named colours
#' taken from the 'Highlights' colour palette, as part of the Bank of England
#' 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_highlights["fuchsia"]) +
#'    theme_mcg_pub()
#'
#' @export
boe_cols_highlights <- c(
  red = "#E9496A",
  fuchsia = "#B0358B",
  purple = "#706CB0",
  orange = "#EF7B00",
  green = "#A2C617",
  teal = "#47AA9C",
  blue = "#1488CA"
)


#' @title A vector of colours from the Bank's 'Soft' colour palette.
#'
#' @description \code{\link{boe_cols_soft}} Provides a vector of named colours
#' taken from the 'Soft' colour palette, as part of the Bank of England
#' 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_soft["peach"]) +
#'    theme_mcg_pub()
#'
#' @export
boe_cols_soft <- c(
  peach = "#FAD0C5",
  light_pink = "#DA9CC6",
  mauve = "#D2CDE8",
  yellow = "#FDC41F",
  light_green = "#DCE169",
  light_teal = "#B3DBCD",
  light_blue = "#85C9F0"
)


#' @title A vector of colours from the Bank's 'Neutral' colour palette.
#'
#' @description \code{\link{boe_cols_neutral}} Provides a vector of named colours
#' taken from the 'Neutral' colour palette, as part of the Bank of England
#' 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_neutral["dark_grey"]) +
#'    theme_mcg_pub()
#'
#' @export
boe_cols_neutral <- c(
  light_grey = "#EBEBEB",
  grey = "#C8CCCF",
  dark_grey = "#6B7E87",
  black = "#1E1E1E",
  stone = "#D9CEC1"
)


#' @title A vector of colours from the Bank's 'Screen-use' colour palette.
#'
#' @description \code{\link{boe_cols_screen}} Provides a vector of named colours
#' taken from the 'Screen-use' colour palette, as part of the Bank of England
#' 2018 brand update. For use as background colours on screens only.
#'
#' @return A list of named hexadecimal colours.
#'
#' @export
boe_cols_screen <- c(
  boe_background = "#F6F6F6"
)


#' @title A vector of the current MCG publication colours
#'
#' @description \code{\link{mcg_pub_cols}} Provides a vector of named colours
#' from current Money & Credit Group (MCG) publication colours.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=mcg_pub_cols["fuschia"]) +
#'    theme_mcg_pub()
#'
#' @export
mcg_pub_cols <- c(
  fuschia        = "#ff00ff",
  dark_blue      = "#000066",
  green          = "#008000",
  aqua_blue      = "#39f9f9",
  maroon         = "#993366",
  orange         = "#fd9900"
)
