
#' Save a ggplot with website sizing defaults 
#'
#' @inheritParams [ggplot2::ggsave]
#' @param height chart height (in pixels)
#' @param width chart width (in pixels)
#'
#' @return
#' @export
#'
#' @examples
boe_export_chart <- function(filename, height, width = 612, 
                             plot = ggplot2::last_plot() 
                             ) {
  
  dpi <- 72

  ggplot2::ggsave(
    filename = filename, plot = plot, width = width / dpi, height = height / dpi,
    dpi = dpi, units = "in", limitsize = FALSE
  )
}