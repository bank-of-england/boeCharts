#' Label percentages
#'
#' Helper function to format a vector of values as percentages.
#'
#' @param dp Number of decimal places to format to
#' 
#' @param separate_with_space Whether to put a space between the number and the
#' percent sign ([FALSE] by default)
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
#'  geom_point() +
#'  scale_y_continuous(
#'  labels = format_pct(dp = 2), 
#'  position = "right"
#'  )
format_pct = function(dp, separate_with_space = FALSE) {
  
  .Deprecated("scales::label_percent", package = "scales")
  
  function(x) {
    
    suffix = "%%"
    
    if (separate_with_space) {
      
      suffix = paste0(" ", suffix)
    }
    
    sprintf(paste0("%.", dp, "f", suffix), x)
  }
}
