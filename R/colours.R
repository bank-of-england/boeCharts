#' @title Colours from the Bank's colour palette
#'
#' @description Provides a vector of named colours taken from the Bank's
#' \href{http://intranet/BankNews/Pages/Updated-visual-identity-g-636195499604295252.aspx}{visual identity guidelines}.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe$fuchsia) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
boe <- list(
  red            = "#A51140",
  light_green    = "#7AB800",
  mid_blue       = "#165788",
  orange         = "#E05206",
  teal           = "#00839D",
  purple         = "#4E3780",
  fuchsia        = "#A31A7E",
  dark_green     = "#50882E",
  dark_blue      = "#002A42",
  yellow         = "#EEAF30",
  dark_teal      = "#005E6E",
  lavender       = "#AC98DB",
  maroon         = "#6C0721",
  light_blue     = "#63B1E5",
  plum           = "#752864",
  stone          = "#CAC0B6",
  black          = "#1E1E1E"
)

#' @title Colours from the Bank's 'Rich' colour palette
#'
#' @description Provides a vector of named colours taken from the 
#' 'Rich' colour palette, as part of the Bank of England 2018 brand 
#' update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_rich$rich_red) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
boe_rich <- list(
  rich_blue = "#00294E",
  rich_teal = "#005E6E",
  rich_green = "#3A7130",
  rich_orange = "#C94D1B",
  rich_purple = "#2B1E56",
  rich_plum = "#5D2049",
  rich_red = "#AA0B3C"
)


#' @title Colours from the Bank's 'Highlights' colour palette
#'
#' @description Provides a vector of named colours taken from the 'Highlights' 
#' colour palette, as part of the Bank of England 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_highlights$fuchsia) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
boe_highlights <- list(
  red = "#E9496A",
  fuchsia = "#B0358B",
  purple = "#706CB0",
  orange = "#EF7B00",
  green = "#A2C617",
  teal = "#47AA9C",
  blue = "#1488CA"
)


#' @title Colours from the Bank's 'Soft' colour palette
#'
#' @description Provides a vector of named colours taken from the 'Soft' 
#' colour palette, as part of the Bank of England 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_soft$peach) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
boe_soft <- list(
  peach = "#FAD0C5",
  light_pink = "#DA9CC6",
  mauve = "#D2CDE8",
  yellow = "#FDC41F",
  light_green = "#DCE169",
  light_teal = "#B3DBCD",
  light_blue = "#85C9F0"
)


#' @title Colours from the Bank's 'Neutral' colour palette
#'
#' @description Provides a vector of named colours taken from the 'Neutral' 
#' colour palette, as part of the Bank of England 2018 brand update.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour=boe_neutral$dark_grey) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
boe_neutral <- list(
  light_grey = "#EBEBEB",
  grey = "#C8CCCF",
  dark_grey = "#6B7E87",
  black = "#1E1E1E",
  stone = "#D9CEC1"
)


#' @title Colours from the Bank's 'Screen-use' colour palette
#'
#' @description Provides a vector of named colours
#' taken from the 'Screen-use' colour palette, as part of the Bank of England
#' 2018 brand update. For use as background colours on screens only.
#'
#' @return A list of named hexadecimal colours.
#'
#' @export
boe_screen <- list(
  boe_background = "#F6F6F6"
)


#' @title Colours from MCG publication's colour palette
#'
#' @description Provides a vector of named colours
#' from current Money & Credit Group (MCG) publication colours.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#'    ggplot(mtcars) +
#'    aes(
#'    x = mpg,
#'    y = wt
#'    ) +
#'    geom_point(colour = mcg_pub$fuchsia) +
#'    theme_mcg_pub()
#' }
#' 
#' @export
mcg_pub <- list(
  fuchsia        = "#ff00ff",
  dark_blue      = "#000066",
  green          = "#008000",
  aqua_blue      = "#39f9f9",
  maroon         = "#993366",
  orange         = "#fd9900"
)


#' @title Colours from the pre-MPC colour palette
#'
#' @description Provides a vector of named colours taken from the Bank's
#' pre Monetary Policy Committee (MPC) guidelines.
#'
#' @return A list of named hexadecimal colours.
#'
#' @export
pre_mpc <- list(
  boe$red,
  boe$dark_blue,
  stone = "#B39F87",
  boe$dark_green,
  boe$yellow,
  boe$fuchsia,
  boe$orange
)


#' @title Colours from the pre-MPC light colour palette
#'
#' @description Provides a vector of named colours taken from the Bank's
#' pre Monetary Policy Committee (MPC) guidelines.
#' 
#' @return A list of named hexadecimal colours.
#'
#' @export
pre_mpc_light <- list(
  light_red = "#D182AB",
  light_blue = "#6199CB",
  light_stone = "#D9CEC1"
)
