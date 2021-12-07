#' Label date/times
#' 
#' `label_year_short()` automatically constructs a short year format string
#' sufficient to uniquely identify labels, keeping a full year format string for
#' the first label.
#'
#' @return All [label_()] functions return a "labelling" function, i.e. a function 
#' that takes a vector x and returns a character vector of [length(x)] giving a 
#' label for each input value.
#' Labelling functions are designed to be used with the labels argument of 
#' ggplot2 scales. The examples demonstrate their use with x scales, but they 
#' work similarly for all scales, including those that generate legends rather 
#' than axes.
#' 
#' @examples
#' ggplot(gold_holdings, aes(x = date, y = amount)) +
#' geom_line() +
#' scale_x_date(labels = label_year_short())
#' @name label_date
NULL

#' @export
#' @rdname label_date
label_year_short <- function() {
  
  function(x) {
    
    year_full <- format(x, "%Y")
    year_short <- format(x, "%y", tz = "UTC")
    year_starts <- substr(year_full, start = 1, stop = 2)
    
    ifelse(duplicated(year_starts), year_short, year_full)
  }
}

#' @export
#' @rdname label_date
boe_date_labels <- function() {
  
  .Deprecated("scales::label_date_short", package = "scales")
  
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
