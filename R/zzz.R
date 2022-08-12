.onAttach <- function(libname, pkgname) {
  
  if (.Platform$OS.type == "windows")  { # nocov start
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }
  
  if (getOption("boeCharts.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }
  
  fnt <- extrafont::fonttable()
  if (!any(grepl("Arial|Calibri", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Arial font is required to use these themes.")
    packageStartupMessage("      Please use boeCharts::import_arial() to install Arial and")
    packageStartupMessage("      boeCharts::import_calibri() to install Calibri")
  } 

}