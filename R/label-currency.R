#' Label currencies
#' 
#' Helper functions to format numbers as currency.
#'
#' @param prefix Symbol to display before amount, defaults to 
#' \code{intToUtf8(0x00A3)} (aka a pound sign)
#' @inheritParams scales::label_dollar
#'
#' @return All [label_()] functions return a "labelling" function, i.e. a function 
#' that takes a vector x and returns a character vector of [length(x)] giving a 
#' label for each input value.
#' Labelling functions are designed to be used with the labels argument of 
#' ggplot2 scales. The examples demonstrate their use with x scales, but they 
#' work similarly for all scales, including those that generate legends rather 
#' than axes.
#' 
#' @export
#' 
#' @examples
#' label_currency()(100)
#' label_currency(prefix ="EUR")(100)
#' 
#' label_pound()(100.75)
#' label_pound(negative_parens = TRUE)(c(100.75, 251))
#' 
#' label_euro()(100.75)
#' label_euro(negative_parens = TRUE)(c(100.75, 251))
label_currency <- function(
  prefix = intToUtf8(0x00A3), suffix = "", largest_with_pence = 1e+05, ...,
  big.mark = ",", negative_parens = FALSE
  ) {
  
  scales::label_dollar(
    prefix = prefix, suffix = suffix, largest_with_cents = largest_with_pence,
    ..., big.mark = big.mark, negative_parens = negative_parens
    )
}

#' @export
#' @rdname label_currency
label_pound = function(suffix = "", largest_with_pence = 1e+05, ...,
                        big.mark = ",", negative_parens = FALSE) {
  
  label_currency(
    suffix = suffix,
    largest_with_pence = largest_with_pence,
    ...,
    big.mark = big.mark,
    negative_parens = negative_parens
  )
}

#' @export
#' @rdname label_currency
label_euro = function(
  prefix = intToUtf8(0x20AC), suffix = "", largest_with_pence = 1e+05, ...,
  big.mark = ",", negative_parens = FALSE) {
  
  label_currency(
    prefix = prefix,
    suffix = suffix,
    largest_with_pence = largest_with_pence,
    ...,
    big.mark = big.mark,
    negative_parens = negative_parens
  )
}

#' @export
#' @rdname label_currency
format_currency <- label_currency

#' @export
#' @rdname label_currency
format_pound <- label_pound
