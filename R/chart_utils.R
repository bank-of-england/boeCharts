#' @title Conditional month-year date label format
#'
#' @description Customised month-year date label format for use in \code{ggplot2}. Labels are abbreviated months
#' (\%b) by default, but new year values sees years with century (\%b \%Y) notation.
#'
#' @examples
#'
#' library(ggplot2)
#' library(dsdthemes)
#'
#' ggplot(nfc_deposits, aes(x = date, y = pct_change)) +
#' geom_line(aes(colour=factor(industry)), size=1) +
#' geom_hline(yintercept = 0, size=0.5) +
#' scale_x_datetime(date_breaks = "3 months", labels = boe_date_labels())
#'
#' @export

boe_date_labels <- function() {

  function(x) {

    # month label format
    m <- format(x, "%b")

    # year label format
    y <- format(x, "%Y")

    # if year duplicated, just print month
    date <- ifelse(duplicated(y), m, paste(m, y, sep = "\n"))

    return(date)

  }
}


#' @title Show colours in a Bank colour palette
#'
#' @description \code{\link{check_pal}} produces a pie chart of colours
#' that make up a \code{dsdthemes} palette.
#'
#' @param x a named character vector of colours e.g. \code{\link{boe_cols_rich}}
#'
#' @return A pie chart displaying the colour scheme.
#'
#' @examples
#'
#' library(dsdthemes)
#'
#' check_pal(
#' x = boe_cols_rich
#' )
#'
#' @export

check_pal <- function(x) {

  graphics::pie(
    rep(1, length(x)),
    col = x,
    labels = names(x))

}
