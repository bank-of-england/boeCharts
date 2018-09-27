#' @title Conditional month-year date label format
#'
#' @description Customised month-year date label format for use in \code{ggplot2}. Labels are abbreviated months
#' (\%b) by default, but new year values sees years with century (\%b \%Y) notation.
#'
#' @examples
#'
#' library(ggplot2)
#' library(boeChartr)
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


#' @title Currency formatter for use in chart axis labels
#' 
#' @description Helper function to format a vector of values as currency.
#' Wraps the \code{dollar_format} function from the \code{scales} package.
#'
#' @param prefix Symbol to display before amount, defaults to 'u00A3', aka the pound sign
#' @param suffix Symbol to display after amount
#' @param largest_with_pence the value that all values of x must be less than in order for the pence to be displayed
#' @param ... Other arguments passed on to format
#' @param big.mark Character used between every 3 digits
#' @param negative_parens Should negative values be shown with parentheses
#'
#' @return a function with single parameter x, a numeric vector, that returns a character vector
#' @export
#' @seealso \link{pound_format}
#'
#' @examples
#' currency_format()(100.75)
#' currency_format(prefix ="EUR")(100.75)
#' currency_format(prefix = "", suffix = "\u20ac")(c(100.75, 251))
currency_format = function(prefix = "\u00A3", suffix = "", largest_with_pence = 1e+05, ...,
                           big.mark = ",", negative_parens = FALSE) {
  
  scales::dollar_format(prefix = prefix, suffix = suffix, largest_with_cents = largest_with_pence,
                        ..., big.mark = big.mark, negative_parens = negative_parens)
}


#' Pounds sterling formatter for use in chart axis labels
#' 
#' @description Helper function to format a vector of values as pounds sterling.
#'
#' @param suffix Symbol to display after amount
#' @param largest_with_pence the value that all values of x must be less than in order for the pence to be displayed
#' @param ... Other arguments passed on to format
#' @param big.mark Character used between every 3 digits
#' @param negative_parens Should negative values be shown with parentheses
#'
#' @return a function with single parameter x, a numeric vector, that returns a character vector
#' @export
#'
#' @seealso \link{currency_format}
#'
#' @examples
#' pound_format()(100.75)
#' pound_format(negative_parens = TRUE)(c(100.75, 251))
pound_format = function(suffix = "", largest_with_pence = 1e+05, ...,
                        big.mark = ",", negative_parens = FALSE) {
  
  currency_format(prefix = "\u00A3",
                  suffix = suffix,
                  largest_with_pence = largest_with_pence,
                  ...,
                  big.mark = big.mark,
                  negative_parens = negative_parens)
}


#' @title Formatter function to round values to a given a number of decimal places and
#' return as strings
#'
#' @description Format chart axis labels to decimal places (particularly via wrappers
#' for specified number of decimal places e.g. \code{format_one_dp()})
#'
#' @param dp Number of decimal places to format to
#'
#' @return a function with single parameter x, a numeric vector, that returns
#' a character vector of values in x formatted to DP decimal places
#' @export
#'
#' @examples
#' ## Example 1: format some numbers
#' format_decimal_places(1)(seq(0, 1, by = 0.01))
#'
#' ## Example 2: format ggplot axis labels
#' if (require(ggplot2)) {
#'   format_4dp = format_decimal_places(4)
#'   ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = format_4dp, position = "right")
#'   }
format_decimal_places = function(dp) {
  function(x) {
    sprintf(paste0("%.", dp, "f"), x)
  }
}


#' Formatter function to round values to one decimal place and
#' return as strings
#'
#' @description Format chart axis labels to one decimal place.
#'
#' @return a function with single parameter x, a numeric vector, that returns
#' a character vector of values in x formatted to one decimal place
#' @export
#'
#' @examples
#' ## Example 1: format some numbers
#' format_one_dp()(seq(0, 1, by = 0.01))
#'
#' ## Example 2: format ggplot axis labels
#' if (require(ggplot2)) {
#'   ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = format_one_dp, position = "right")
#'   }
format_one_dp = format_decimal_places(1)


#' Formatter function to round values to integer and return as strings
#'
#' @description Format chart axis labels to zero decimal places.
#'
#' @return a function with single parameter x, a numeric vector, that returns
#' a character vector of values in x formatted as integers
#' @export
#'
#' @examples
#' ## Example 1: format some numbers
#' format_zero_dp()(seq(0, 1, by = 0.01))
#'
#' ## Example 2: format ggplot axis labels
#' if (require(ggplot2)) {
#'   ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = format_zero_dp, position = "right")
#'   }
format_zero_dp = format_decimal_places(0)

#' Formatter function to display values as percentages and return as strings
#'
#' Helper function to format a vector of values as percentages.
#'
#' @param dp Number of decimal places to format to
#' @param separate_with_space Whether to put a space between the number and the
#' percent sign
#'
#' @return Vector of characters: values in x formatted to dp decimal places with percentages
#' suffixed
#' @export
#'
#' @examples
#' ## Example 1: format some numbers
#' format_pct(dp = 1)(seq(0, 1, by = 0.01))
#'
#' ## Example 2: format ggplot axis labels
#' if (require(ggplot2)) {
#'   percent2DP = format_pct(dp = 2, separate_with_space = TRUE)
#'   ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = percent2dp, position = "right")
#'   }
format_pct = function(dp, separate_with_space = F) {
  
  function(x) {
    suffix = "%%"
    if (separate_with_space) {
      suffix = paste0(" ", suffix)
    }
    sprintf(paste0("%.", dp, "f", suffix), x)
  }
}
