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

  b <- ggplot_build(x)
  g <- ggplotGrob(x)
  
  right = textGrob(
    b$plot$labels$y, x = 1, y = 1, just = c("right", "top"), 
    gp = gpar(
      fontsize = b$plot$theme$axis.title$size, col =  b$plot$theme$axis.title$colour
    )
  )
  labs = gTree("Labs", children = gList(right))
  
  g <- gtable_filter(g, pattern = "ylab", invert = TRUE)
  
  pos = g$layout[grepl("panel", g$layout$name), c('t', 'l')]
  
  if (nrow(pos) > 1)
    stop("move_ylab not available for facetted charts, yet.")
  
  # # select correct facet panel
  # if (nrow(pos) > 1) {
  #   
  #   # which side is y axis
  #   axis_grobs <- gtable_filter(g, pattern = "axis-l|axis-r")
  #   axis_names <- axis_grobs$layout$name[!sapply(
  #     axis_grobs$grobs, grepl, "zeroGrob[NULL]", fixed = TRUE
  #     )]
  #   
  #   # select panel if y-axis on right
  #   if (any(grepl("axis-r", axis_names))) {
  #     
  #     pos <- subset(pos, l == max(l) & t == max(t))
  #     
  #     # y-axis on left
  #   } else {
  #     
  #     pos <- subset(pos, l == min(l) & t == max(t))
  #   }
  #   
  # }
  
  height = unit(1.5, "grobheight", right)
  g <- gtable_add_rows(g, height, pos$t-1)
  
  g = gtable_add_grob(g, labs, t = pos$t, l = pos$l, r = pos$l)
  
  g <- gtable_trim(g)
  
  ggplotify::as.ggplot(g)
}
