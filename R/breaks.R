#' Automatic breaks for numeric axes
#'
#' @inheritParams scales::breaks_extended
#'
#' @export
boe_breaks_numeric <- function(n = 5, ...) {
  
  scales::breaks_extended(
    n = n, only.loose = TRUE, ...
    )
}

#' Automatic breaks for date/time axes
#'
#' @inheritParams scales::breaks_pretty
#'
#' @export
boe_breaks_date <- function(n = 5, ...) {
  
  scales::breaks_pretty(n = n, ...)
}


