.onAttach <- function(libname, pkgname) {
  
  packageStartupMessage(
    "boeCharts: Bank Chart Themes and Styles for 'ggplot2'. 
     For more information visit:
     https://almplatform/tfs/UnmanagedCollection/Shared%20Analytical%20Code/_git/boeCharts?path=%2FREADME.md
    "
  )
  
  if (.Platform$OS.type == "windows")  { # nocov start
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }
  
  if (getOption("boeCharts.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

}