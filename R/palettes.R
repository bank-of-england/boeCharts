#' Colour palette collections
#' 
#' These are lists of colour palettes.
#' 
#' @details 
#' \describe{
#' 
#' \item{`boe_palettes`}{
#' All colour palettes 
#' }
#'
#' \item{`boe_identity_palettes`}{
#' Brand identity colour palettes 
#' }
#' 
#' \item{`boe_shades_palettes`}{
#' Shades colour palettes 
#' }
#' 
#' \item{`boe_standard_palettes`}{
#' Standard colour palettes 
#' }
#' 
#' \item{`boe_harmonious_palettes`}{
#' Harmonious colour palettes 
#' }
#' 
#' \item{`boe_vibrant_palettes`}{
#' Vibrant colour palettes 
#' }
#' 
#' \item{`boe_diverging_palettes`}{
#' Diverging colour palettes 
#' }
#' 
#' \item{`boe_publication_palettes`}{
#' Publication colour palettes 
#' }
#' 
#' }
#' @name boepalettes
#' @aliases NULL
NULL

#' @export
#' @rdname boepalettes
boe_identity_palettes <- list(
  boe_identity = boe_identity,
  boe_brand_main = boe_brand_main,
  boe_brand_secondary = boe_brand_secondary
)

#' @export
#' @rdname boepalettes
boe_shades_palettes <- list(
  boe_shades_aqua = boe_shades_aqua
)

#' @export
#' @rdname boepalettes
boe_standard_palettes <- list(
  boe = boe,
  boe_rich = boe_rich,
  boe_highlights = boe_highlights,
  boe_soft = boe_soft,
  boe_neutral = boe_neutral
)

#' @export
#' @rdname boepalettes
boe_harmonious_palettes <- list(
  harmonious_blue = harmonious_blue,
  harmonious_teal = harmonious_teal,
  harmonious_green = harmonious_green,
  harmonious_orange = harmonious_orange,
  harmonious_purple = harmonious_purple,
  harmonious_pink = harmonious_pink,
  harmonious_red = harmonious_red,
  harmonious_grey = harmonious_grey
)


#' @export
#' @rdname boepalettes
boe_vibrant_palettes = list(
  vibrant_a = vibrant_a,
  vibrant_b = vibrant_b,
  vibrant_c = vibrant_c,
  vibrant_d = vibrant_d,
  vibrant_e = vibrant_e,
  vibrant_f = vibrant_f,
  vibrant_g = vibrant_g,
  vibrant_h = vibrant_h
)

#' @export
#' @rdname boepalettes
boe_diverging_palettes <- list(
  red_blue = red_blue,
  red_green = red_green,
  red_gray = red_gray,
  red_yellow_green = red_yellow_green,
  red_yellow_blue = red_yellow_blue,
  purple_green = purple_green,
  pink_green = pink_green
)

#' @export
#' @rdname boepalettes
boe_publication_palettes = list(
  boe_website = boe_website,
  boe_overground = boe_overground,
  pre_mpc = pre_mpc, 
  pre_mpc_light = pre_mpc_light,
  fsr = fsr,
  fsr_main = fsr_main,
  fsr_currency = fsr_currency, 
  fsr_average = fsr_average,
  mpr_main = mpr_main,
  mcg = mcg
)

#' @export
#' @rdname boepalettes
boe_palettes <- c(
  boe_identity_palettes,
  boe_shades_palettes,
  boe_standard_palettes,
  boe_harmonious_palettes,
  boe_vibrant_palettes,
  boe_diverging_palettes,
  boe_publication_palettes
)
