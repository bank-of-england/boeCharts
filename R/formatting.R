#' Format data sources to be captioned
#' 
#' Format data sources for use in chart caption.
#'
#' @param ... character vector of data source names
#' @param manipulated_data logical; has data been manipulated?
#'
#' @return character vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_source("FANG"))
caption_source <- function(..., manipulated_data = FALSE) {
  
  sources <- sort(...)
  
  if (manipulated_data) {
    formatted_sources <- glue::glue_collapse(c(sources, "Bank calculations"), sep = ", ", last = " and ")
  } else {
    formatted_sources <- glue::glue_collapse(sources, sep = ", ", last = " and ")
  }
  
  if (length(sources) + manipulated_data == 1) {
    glue::glue("Source: {formatted_sources}.")
  } else {
    glue::glue("Sources: {formatted_sources}.")
  }
}

#' Format chart footnotes to be captioned
#' 
#' Format footnotes for use in chart caption.
#'
#' @param ... character vector of footnotes
#'
#' @return character vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_footnote("Here's a footnote"))
caption_footnote <- function(...) {
  
  footnotes <- as.list(...)
  
  if (length(footnotes) == 0) return(NULL)
  
  glue::glue_collapse(
    glue::glue("({letters[1:length(footnotes)]}) {footnotes}"), sep = "\n"
    )
  
}


#' Format chart data sources and footnotes for captioning
#'
#' @param source character vector of data sources
#' @param footnote character vector of footnotes
#' @param manipulated_data logical; has data been manipulated?
#'
#' @return a length 1 vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_boe(
#'        source = "FANG", footnote = "Here's a footnote", manipulated_data = TRUE
#'        ))
caption_boe <- function(source, footnote = NULL, manipulated_data = FALSE) {
  
  glue::glue_collapse(
    c(
      caption_source(source, manipulated_data = manipulated_data),
      footnote = caption_footnote(footnote)
      ), 
    sep = "\n\n"
  )
}

#' @title Currency formatter for use in chart axis labels
#' 
#' @description Helper function to format a vector of values as currency.
#' Wraps the \code{dollar_format} function from the \code{scales} package.
#'
#' @param prefix Symbol to display before amount, defaults to \code{intToUtf8(0x00A3)} (aka a pound sign)
#' @param suffix Symbol to display after amount
#' @param largest_with_pence the value that all values of x must be less than in order for the pence to be displayed
#' @param ... Other arguments passed on to format
#' @param big.mark Character used between every 3 digits
#' @param negative_parens Should negative values be shown with parentheses
#'
#' @return a character vector
#' 
#' @export
#' 
#' @seealso \link{format_pound}
#'
#' @examples
#' format_currency()(100)
#' format_currency(prefix ="EUR")(100)

format_currency = function(prefix = intToUtf8(0x00A3), suffix = "", largest_with_pence = 1e+05, ...,
                           big.mark = ",", negative_parens = FALSE) {
  
  dollar_format(prefix = prefix, suffix = suffix, largest_with_cents = largest_with_pence,
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
#' @return a character vector
#' @export
#'
#' @seealso \link{format_currency}
#'
#' @examples
#' format_pound()(100.75)
#' format_pound(negative_parens = TRUE)(c(100.75, 251))

format_pound = function(suffix = "", largest_with_pence = 1e+05, ...,
                        big.mark = ",", negative_parens = FALSE) {
  
  format_currency(suffix = suffix,
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
#' @return a character vector
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = format_decimal_places(4), position = "right")

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
#' @param x numeric vector to format
#'
#' @return a character vector
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'  geom_point() +
#'  scale_y_continuous(labels = format_one_dp, position = "right")

format_one_dp = format_decimal_places(1)


#' Formatter function to round values to integer and return as strings
#'
#' @description Format chart axis labels to zero decimal places.
#' 
#' @param x numeric vector to format
#'
#' @return character vector
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'  geom_point() +
#'  scale_y_continuous(labels = format_zero_dp, position = "right")

format_zero_dp = format_decimal_places(0)

#' Formatter function to display values as percentages and return as strings
#'
#' Helper function to format a vector of values as percentages.
#'
#' @param dp Number of decimal places to format to
#' 
#' @param separate_with_space Whether to put a space between the number and the
#' percent sign
#'
#' @return a character vector
#' 
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'  geom_point() +
#'  scale_y_continuous(
#'  labels = format_pct(dp = 2), 
#'  position = "right"
#'  )

format_pct = function(dp, separate_with_space = F) {
  
  function(x) {
    
    suffix = "%%"
    
    if (separate_with_space) {
      
      suffix = paste0(" ", suffix)
    }
    
    sprintf(paste0("%.", dp, "f", suffix), x)
  }
}
