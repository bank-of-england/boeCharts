.onAttach <- function(libname, pkgname) {
  
  packageStartupMessage(
    "boeCharts: Bank Chart Themes and Styles for 'ggplot2'. 
     For more information visit:
     https://almplatform/tfs/UnmanagedCollection/Shared%20Analytical%20Code/_git/boeCharts?path=%2FREADME.md
    "
  )
  
  # map calibri
  load_font_win("Calibri")

}