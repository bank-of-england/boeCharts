#' Bank ggplot2 Markdown Themes
#'
#' `{ggplot2}` themes supporting markdown syntax
#'
#' @param ... Arguments passed on to the corresponding `{boeCharts}` theme 
#'
#' @return An object of class `theme` that can be added to any `ggplot`
#'
#' @seealso [as_md_theme()]
#'
#' @examples \dontrun{
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
#' geom_point() +
#' labs(title = "A **Lovely** Plot",
#' subtitle = "A *thought-provoking* subtitle.")
#'
#' # With a 'usual' theme the text is not rendered
#' p + theme_fsr()
#'
#' # By adding an 'md' theme the text is rendered properly
#' p + theme_fsr_md()
#' }
#' 
#' @name theme_md
#' @export
theme_fsr_md <- function(...) {
  as_md_theme(theme_fsr(...))
}

#' @rdname theme_md
#' @export
theme_mpr_md <- function(...) {
  as_md_theme(theme_mpr(...))
}

#' @rdname theme_md
#' 
#' @export
theme_overground_md <- function(...) {
  as_md_theme(theme_overground(...))
}

#' @rdname theme_md
#' 
#' @export
theme_mcg_pub_md <- function(...) {
  as_md_theme(theme_mcg_pub(...))
}

#' @rdname theme_md
#' 
#' @export
theme_boe_identity_md <- function(...) {
  as_md_theme(theme_boe_identity(...))
}
