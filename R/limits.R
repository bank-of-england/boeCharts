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

#' Extended limits for numeric axes
#'
#' @inheritParams scales::breaks_extended
#'
#' @export
boe_limits_numeric <- function(n = 5, ...) {
  
  function(x) {
    
    rng <- range(x)
    
    breaks <- labeling::extended(rng[1], rng[2], m = n, only.loose = TRUE)
    
    c(breaks[1], breaks[length(breaks)])
  }
}

#' Pretty limits for date/time axes
#'
#' @inheritParams scales::breaks_pretty
#'
#' @export
boe_limits_date <- function(n = 5, ...) {
  
  function(x) {
    
    breaks <- pretty(x, m = n)
    
    c(breaks[1], breaks[length(breaks)])
  }
}
