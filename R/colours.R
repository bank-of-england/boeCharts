#' @title A vector of colours from the Bank's colour palette.
#'
#' @description \code{\link{boe_cols}} Provides a vector of named colours taken from the Bank's
#' \href{http://intranet/BankNews/Pages/Updated-visual-identity-g-636195499604295252.aspx}{visual identity guidelines}.
#' Note: BoE colours that don't comply to Web Content Accessibility Guidelines
#' (WCAG) 2.0 standards are excluded.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeChartr)
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
#'

boe_cols <- c(
  red            = "#A51140",
  black          = "#1E1E1E",
  stone          = "#CAC0B6",
  dark_teal      = "#005E6E",
  dark_blue      = "#002A42",
  plum           = "#752864",
  mid_blue       = "#165788",
  maroon         = "#6C0721",
  purple         = "#4E3780"
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
#' library(boeChartr)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_rich["deep_pink"]) +
#'    theme_mcg_pub()
#'
#' @export
#'

boe_cols_rich <- c(
  dark_blue = "#002b4c",
  dark_teal = "#00566a",
  green = "#3a7030",
  dark_orange = "#c94c1a",
  dark_violet = "#180639",
  dark_purple = "#5c1f48",
  deep_pink = "#a90a3c"
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
#' library(boeChartr)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_highlights["cyan"]) +
#'    theme_mcg_pub()
#'
#' @export
#'

boe_cols_highlights <- c(
  cyan = "#1488c9",
  persian_green = "#00a091",
  lime_green = "#a2c516",
  mango = "#ef7a00",
  mauve = "#6f6baf",
  purple = "#b0348b",
  vivid_pink = "#e61b57"
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
#' library(boeChartr)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_soft["mabel"]) +
#'    theme_mcg_pub()
#'
#' @export
#'

boe_cols_soft <- c(
  cyan = "#84c9f0",
  mabel = "#cae7e9",
  gold = "#dce069",
  bold_yellow = "#fcc41e",
  lilac = "#d2cde7",
  pink = "#da9cc5",
  light_pink = "#facfc5"
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
#' library(boeChartr)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_cols_neutral["black"]) +
#'    theme_mcg_pub()
#'
#' @export
#'

boe_cols_neutral <- c(
  black = "#000000",
  regal_blue = "#869ba7",
  blue_gray = "#c8cccf",
  light_gray = "#ebebeb",
  white_smoke = "#f6f6f6",
  link_water = "#d9cec1"
)


#' @title A vector of the current MCG publication colours
#'
#' @description \code{\link{mcg_pub_cols}} Provides a vector of named colours
#' from current MCG publication colours.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeChartr)
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
#'

mcg_pub_cols <- c(
  fuschia        = "#ff00ff",
  dark_blue      = "#000066",
  green          = "#008000",
  aqua_blue      = "#39f9f9",
  maroon         = "#993366",
  orange         = "#fd9900"
)

