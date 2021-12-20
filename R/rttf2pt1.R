#' Install specific rttf2pt1 version
#' 
#' Install {rttf2pt1} v1.3.8 so that font import works.
#'
#' @export
install_rttf2pt1 <- function() {
  
  if (utils::packageVersion("Rttf2pt1") != "1.3.8") {
    try_require("remotes", "install_rttf2pt1")
    remotes::install_version("Rttf2pt1", version = "1.3.8")
  }
  
  message(
    "Rttf2pt1 v1.3.8 installed. Run `boeCharts::import_xxx()` to install fonts"
  )
}
