#' Opinionated scales for date/time data
#' 
#' Opinionated presets for date/time [ggplot2] scales. 
#'
#' @param labels formatting specification for the labels ([label_year_short()] 
#' by default)
#' @param ... Other arguments passed on to [ggplot2::scale_x_date()]
#'
#' @export
#'
#' @examples
#' ggplot(gold_holdings, aes(x = date, y = amount)) +
#' geom_line() +
#' scale_x_year()
#' @name scale_date
#' @aliases NULL
NULL

#' @export
#' @rdname scale_date
scale_x_year <- function(labels = label_year_short(), ...) {
  
  ggplot2::scale_x_date(labels = labels, ...)
  
}

#' @export
#' @rdname scale_date
scale_y_year <- function(labels = label_year_short(), ...) {
  
  ggplot2::scale_y_date(labels = labels, ...)
  
}