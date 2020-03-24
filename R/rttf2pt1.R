# install rttf2pt1 in system library
# http://collaborate/workspaces/RHelpCentre/R%20Markdown/Importing_Custom_Fonts.html
install_rttf2pt1 <- function() {
  
  sys_lib_num <- grep("C:/Program Files",.libPaths())[1]
  
  if (!"Rttf2pt1" %in% rownames(
    utils::installed.packages(lib.loc = .libPaths()[sys_lib_num])
  )) {
    
    utils::install.packages("Rttf2pt1", lib = .libPaths()[sys_lib_num])
  }
}
