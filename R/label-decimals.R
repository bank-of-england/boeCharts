#' Label decimal numbers
#'
#' Format chart axis labels to decimal places (particularly via wrappers
#' for specified number of decimal places e.g. \code{format_one_dp()})
#'
#' @param dp Number of decimal places to format to
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
#' 
#' library(ggplot2)
#' 
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'     geom_point() +
#'     scale_y_continuous(labels = label_decimal_places(4), position = "right")
#'     
#' ggplot(mtcars, aes(x = disp, y = wt, color = carb)) +
#'  geom_point() +
#'  scale_y_continuous(labels = label_one_dp, position = "right")
label_decimal_places <- function(dp) {
  
  function(x) {
    
    sprintf(paste0("%.", dp, "f"), x)
  }
}

#' @export
#' @rdname label_decimal_places
label_one_dp <- label_decimal_places(1)

#' @export
#' @rdname label_decimal_places
label_zero_dp = label_decimal_places(0)

#' @export
#' @rdname label_decimal_places
format_decimal_places <- label_decimal_places

#' @export
#' @rdname label_decimal_places
format_one_dp <- label_one_dp

#' @export
#' @rdname label_decimal_places
format_zero_dp <- label_zero_dp
