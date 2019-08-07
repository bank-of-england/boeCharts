#' @title Lists of colours from the Bank's harmonious colour combinations
#'
#' @description Lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{Harmonious colour combinations}.
#'
#' @return A list of named hexadecimal colours.
#'
#' @name harmonious-palettes
NULL

#' @rdname harmonious-palettes
#' @export
harmonious_blue <- list(
  rich_blue = boe_rich$rich_blue,
  blue = boe_highlights$blue,
  light_blue = boe_soft$light_blue
)

#' @rdname harmonious-palettes
#' @export
harmonious_teal <- list(
  rich_teal = boe_rich$rich_teal,
  teal = boe_highlights$teal,
  light_teal = boe_soft$light_teal
)

#' @rdname harmonious-palettes
#' @export
harmonious_green <- list(
  rich_green = boe_rich$rich_green,
  green = boe_highlights$green,
  light_green = boe_soft$light_green
)

#' @rdname harmonious-palettes
#' @export
harmonious_orange <- list(
  rich_orange = boe_rich$rich_orange,
  orange = boe_highlights$orange,
  yellow = boe_soft$yellow
)

#' @rdname harmonious-palettes
#' @export
harmonious_purple <- list(
  rich_purple = boe_rich$rich_purple,
  purple = boe_highlights$purple,
  mauve = boe_soft$mauve
)

#' @rdname harmonious-palettes
#' @export
harmonious_pink <- list(
  rich_plum = boe_rich$rich_plum,
  fuchsia = boe_highlights$fuchsia,
  light_pink = boe_soft$light_pink
)

#' @rdname harmonious-palettes
#' @export
harmonious_red <- list(
  rich_red = boe_rich$rich_red,
  red = boe_highlights$red,
  peach = boe_soft$peach
)

#' @rdname harmonious-palettes
#' @export
harmonious_grey <- list(
  black = boe_neutral$black,
  dark_grey = boe_neutral$dark_grey,
  grey = boe_neutral$grey
)


#' @title Lists of colours from the Bank's vibrant colour combinations
#'
#' @description Lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{Vibrant colour combinations}.
#'
#' @return A list of named hexadecimal colours.
#' 
#' @name vibrant-palettes
NULL

#' @rdname vibrant-palettes
#' @export
vibrant_a <- list(
  rich_blue = boe_rich$rich_blue,
  red = boe_highlights$red,
  peach = boe_soft$peach
)

#' @rdname vibrant-palettes
#' @export
vibrant_b <- list(
  rich_blue = boe_rich$rich_blue,
  teal = boe_highlights$teal,
  light_green = boe_soft$light_green
)

#' @rdname vibrant-palettes
#' @export
vibrant_c <- list(
  rich_purple = boe_rich$rich_purple,
  purple = boe_highlights$purple,
  yellow = boe_soft$yellow
)

#' @rdname vibrant-palettes
#' @export
vibrant_d <- list(
  rich_plum = boe_rich$rich_plum,
  blue = boe_highlights$blue,
  light_blue = boe_soft$light_blue
)

#' @rdname vibrant-palettes
#' @export
vibrant_e <- list(
  rich_teal = boe_rich$rich_teal,
  red = boe_highlights$red,
  grey = boe_neutral$grey
)

#' @rdname vibrant-palettes
#' @export
vibrant_f <- list(
  rich_red = boe_rich$rich_red,
  orange = boe_highlights$orange,
  peach = boe_soft$peach
)

#' @rdname vibrant-palettes
#' @export
vibrant_g <- list(
  rich_green = boe_rich$rich_green,
  teal = boe_highlights$teal,
  mauve = boe_soft$mauve
)

#' @rdname vibrant-palettes
#' @export
vibrant_h <- list(
  orange = boe_rich$orange,
  fuchsia = boe_highlights$fuchsia,
  yellow = boe_soft$yellow
)

#' @title Lists of ColorBrewer style diverging colour combinations
#'
#' @description Lists of named colours taken from the Bank's
#' \href{https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette/colour-combinations}{colour palettes}.
#'
#' @return A list of named hexadecimal colours.
#' 
#' @name diverging-palettes
NULL

#' @rdname diverging-palettes
#' @export
red_blue <- list(
  red = boe_rich$rich_red, 
  grey = boe_neutral$light_grey, 
  blue = boe_rich$rich_blue
)

#' @rdname diverging-palettes
#' @export
red_green <- list(
  red = boe_rich$rich_red, 
  grey = boe_neutral$light_grey, 
  green = boe_rich$rich_green
)

#' @rdname diverging-palettes
#' @export
red_gray <- list(
  red = boe_rich$rich_red, 
  grey = boe_neutral$light_grey, 
  dark_grey = boe_neutral$dark_grey
)

#' @rdname diverging-palettes
#' @export
red_yellow_green <- list(
  red = boe_rich$rich_red, 
  yellow = boe_soft$yellow,
  green = boe_rich$rich_green
)

#' @rdname diverging-palettes
#' @export
red_yellow_blue <- list(
  red = boe_rich$rich_red, 
  yellow = boe_soft$yellow, 
  blue = boe_rich$rich_blue
)

#' @rdname diverging-palettes
#' @export
purple_green <- list(
  purple = boe_highlights$purple, 
  grey = boe_neutral$light_grey,
  green = boe_rich$rich_green
)

#' @rdname diverging-palettes
#' @export
pink_green <- list(
  pink = boe_highlights$fuchsia, 
  grey = boe_neutral$light_grey, 
  green = boe_rich$rich_green
)
