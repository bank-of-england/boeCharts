
boe_export_chart <- function(filename, height, plot = ggplot2::last_plot(), 
                             width = 612
  
) {
  
  dpi <- 72

  ggplot2::ggsave(
    filename = filename, plot = plot, width = width / dpi, height = height / dpi,
    dpi = dpi, units = "in", limitsize = FALSE
    
  )
}