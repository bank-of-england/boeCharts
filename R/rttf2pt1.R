# install rttf2pt1 in system library
# http://collaborate/workspaces/RHelpCentre/R%20Markdown/Importing_Custom_Fonts.html
install_rttf2pt1 <- function() {
  
  programFilesLibNum = grep("C:/Program Files",.libPaths())[1]
  
  install.packages("Rttf2pt1", lib = .libPaths()[programFilesLibNum])
  
}
