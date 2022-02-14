#' Move y axis label above axis (experimental)
#' 
#' Creates a text element containing the y-axis title, positioned
#' above the axis (as found in publications such as the Monetary 
#' Policy Report (MPR)).
#'
#' @param x a ggplot object
#'
#' @return a ggplot object
#' @export
#'
#' @examples \dontrun{
#' 
#' p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#' geom_point() +
#' labs(title = "A Lovely Plot", subtitle = "Something insightful", x = NULL) +
#' theme_mpr() +
#' scale_y_continuous(
#' position = "right", sec.axis = dup_axis(labels = NULL)
#' )
#' 
#' move_ylab(p)
#' }

move_ylab <- function(x) {
  
  try_require('grid', "move_ylab")
  try_require('gtable', "move_ylab")
  
  b <- ggplot_build(x)
  g <- ggplotGrob(x)
  
  right = grid::textGrob(
    b$plot$labels$y, x = 1, y = 1, just = c("right", "top"), 
    gp = grid::gpar(
      fontsize = b$plot$theme$axis.title$size, col =  b$plot$theme$axis.title$colour
    )
  )
  labs = grid::gTree("Labs", children = grid::gList(right))
  
  g <- gtable::gtable_filter(g, pattern = "ylab", invert = TRUE)
  
  pos = g$layout[grepl("panel", g$layout$name), c('t', 'l')]
  
  if (nrow(pos) > 1)
    stop("move_ylab not available for facetted charts, yet.")

  height = ggplot2::unit(2, "grobheight", right)

  g <- gtable::gtable_add_rows(g, height, pos$t-1)
  
  g = gtable::gtable_add_grob(g, labs, t = pos$t, l = pos$l, r = pos$l)
  
  g <- gtable::gtable_trim(g)
  
  grid::grid.newpage()
  grid::grid.draw(g)
}

#' Add a strong horizontal line at zero
#'
#' @export
add_hline0 <- function(colour = "#C4C9CE", size = 1.5) {
  
  layers <- list(
    ggplot2::geom_hline(
      yintercept = 0, linetype = "solid", colour = colour, size = size,
      )
  )
  
  return(layers)
}

#' Add a strong horizontal line at zero
#' 
#' @param colour line colour ("#C4C9CE" by default)
#' @param size line size (1.5 by default)
#'
#' @export
add_hline0 <- function(colour = "#C4C9CE", size = 1.5) {
  
  layers <- list(
    ggplot2::geom_hline(
      yintercept = 0, linetype = "solid", colour = colour, size = size,
      )
  )
  
  return(layers)
}
