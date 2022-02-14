#' Colours from the Bank's 2017 visual identity colour palette (deprecated)
#'
#' Provides a vector of named colours taken from the Bank's
#' \href{http://intranet/BankNews/Pages/Updated-visual-identity-g-636195499604295252.aspx}{2017 visual identity guidelines}.
#'
#' @return A list of named hexadecimal colours.
#' 
#' @name palettes_2017
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

#' Colour palettes from the Bank's 2018 brand update
#'
#' Colour palettes from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette}{2018 brand update}.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt
#'  ) +
#'  geom_point(colour=boe_rich$rich_red) +
#'  theme_mcg_pub()
#'  
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt,
#'    colour = factor(cyl)
#'  ) +
#'  geom_point() +
#'  scale_colour_discrete_boe(palette = "boe_rich") +
#'  theme_mcg_pub()
#' }
#' 
#' @name palettes_2018
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

#' @rdname palettes_2018
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

#' @rdname palettes_2018
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

#' @rdname palettes_2018
#' @export
boe_neutral <- list(
  light_grey = "#EBEBEB",
  grey = "#C8CCCF",
  dark_grey = "#6B7E87",
  black = "#1E1E1E",
  stone = "#D9CEC1"
)

#' @rdname palettes_2018
#' @export
boe_screen <- list(
  boe_background = "#F6F6F6"
)


#' Publication colour palettes 
#'
#' Provides a vector of named colours
#' from current Money & Credit Group (MCG) publication colours.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt,
#'    colour = factor(cyl)
#'  ) +
#'  geom_point() +
#'  scale_colour_discrete_boe(palette = "mcg") +
#'  theme_mcg_pub()
#' }
#' 
#' @name palettes_publication
#' 
#' @export
mcg <- list(
  fuchsia        = "#ff00ff",
  dark_blue      = "#000066",
  green          = "#008000",
  aqua_blue      = "#39f9f9",
  maroon         = "#993366",
  orange         = "#fd9900"
)

#' @rdname palettes_publication
#' @export
pre_mpc <- list(
  red = boe$red,
  dark_blue = boe$dark_blue,
  stone = "#B39F87",
  dark_green = boe$dark_green,
  yellow = boe$yellow,
  fuchsia = boe$fuchsia,
  orange = boe$orange
)

#' @rdname palettes_publication
#' @export
pre_mpc_light <- list(
  light_red = "#D182AB",
  light_blue = "#6199CB",
  light_stone = "#D9CEC1"
)

#' @rdname palettes_publication
#' @export
fsr <- list(
  mid_blue       = "#165788",
  dark_pink      = "#A31A7E",
  golden_yellow  = "#EEAF30",
  lime_green     = "#7AB800",
  light_blue     = "#63B1E5",
  summer_red     = "#d53647",
  violet         = "#6773B6",
  deep_turquoise = "#005E6E",
  leaf_green     = "#69923A",
  khaki          = "#A79E70",
  warm_grey      = "#CAC0B6",
  purple         = "#57068C",
  plum           = "#752864",
  lavender       = "#AC98DB",
  red            = "#A51140",
  dark_orange    = "#E05206",
  light_orange   = "#DF7A00"
)

#' @rdname palettes_publication
#' @export
fsr_currency <- list(
  sterling = "#165788",
  usd = "#A31A7E",
  euro = "#EEAF30",
  yen = "#7AB800"
)

#' @rdname palettes_publication
#' @export
boe_website <- list(
  boe_rich_blue = boe_rich$rich_blue,
  boe_red = boe_highlights$red,
  boe_rich_teal = boe_rich$rich_teal
)

#' @rdname palettes_publication
#' @export
boe_overground <- list(
  boe_purple = boe_highlights$purple,
  boe_red = boe_highlights$red,
  boe_rich_purple = boe_rich$rich_purple
)

#' @rdname palettes_publication
#' @export
mpr_main <- list(
  boe_teal = boe_highlights$teal,
  boe_green = boe_highlights$green
)

#' @rdname palettes_publication
#' @export
fsr_main <- list(
  boe_purple = boe_highlights$purple,
  boe_rich_purple = boe_rich$rich_purple
)

#' @rdname palettes_publication
#' @export
fsr_average <- list(
  light_orange = "#df7a00",
  mid_blue = "#165788",
  light_blue = "#63B1E5"
)

#' Brand colour palettes from the Bank's 2022 brand update
#'
#' Colour palettes taken from the Bank's
#' \href{https://company-140087.frontify.com/document/351383#/brand-elements/colours}{2022 brand update}.
#' 
#' @return A list of named hexadecimal colours.
#' 
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt
#'  ) +
#'  geom_point(colour=boe_identity$boe_purple) +
#'  theme_boe_identity()
#'  
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt,
#'    colour = factor(cyl)
#'  ) +
#'  geom_point() +
#'  scale_colour_discrete_boe(palette = "boe_identity") +
#'  theme_boe_identity()
#' }
#' 
#' @name palettes_identity
#' @export
boe_identity <- list(
  boe_aqua = "#3CD7D9",
  boe_orange = "#FF7300",
  boe_purple = "#9E71FE",
  boe_gold = "#D4AF37",
  boe_green = "#A5D700",
  boe_pink = "#FF50C8",
  boe_azure = "#5297FF",
  boe_yellow = "#FFD200",
  boe_peach = "#FF9173",
  boe_red = "#FD015B"
)

#' @rdname palettes_identity
#' @export
boe_brand_main <- list(
  boe_dark_blue = "#12273F",
  boe_aqua = boe_identity$boe_aqua,
  boe_stone = "#C4C9CF"
)

#' @rdname palettes_identity
#' @export
boe_brand_secondary <- list(
  boe_orange = boe_identity$boe_orange,
  boe_purple = boe_identity$boe_purple,
  boe_gold = boe_identity$boe_gold
)

#' Colour shades palettes from the Bank's 2022 brand update
#'
#' Colour palettes taken from the Bank's
#' \href{https://company-140087.frontify.com/document/351383#/brand-elements/colours}{2022 brand update}.
#' 
#' @return A list of named hexadecimal colours.
#' 
#' @examples \dontrun{
#'
#' library(ggplot2)
#' library(boeCharts)
#'
#' ggplot(mtcars) +
#'  aes(
#'    x = mpg,
#'    y = wt,
#'    colour = factor(cyl)
#'  ) +
#'  geom_point() +
#'  scale_colour_discrete_boe(palette = "boe_shades_aqua") +
#'  theme_boe_identity()
#' }
#' 
#' @name palettes_shades
#' @export
boe_shades_aqua <- list(
  boe_dark_aqua = "#34BCC1",
  boe_aqua = "#3CD7D9",
  boe_mid_aqua = "#77E3E4",
  boe_light_aqua = "#A7EDEE",
  boe_extra_light_aqua = "#CEF5F5"
)

