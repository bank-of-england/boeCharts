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
#' @examples
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
#' p + md_theme_fsr()
#' 
#' @rdname theme_fsr
#' @export
md_theme_fsr <- function(...) {
  as_md_theme(theme_fsr(...))
}

#' @rdname theme_mpr
#' @export
md_theme_mpr <- function(...) {
  as_md_theme(theme_mpr(...))
}

#' @rdname theme_overground
#' 
#' @export
md_theme_overground <- function(...) {
  as_md_theme(theme_overground(...))
}

#' @rdname theme_mcg_pub
#' 
#' @export
md_theme_mcg_pub <- function(...) {
  as_md_theme(theme_mcg_pub(...))
}
