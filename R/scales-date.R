scale_x_year <- function(labels = label_year_short(), ...) {
  
  ggplot2::scale_x_date(labels = labels, ...)
  
}