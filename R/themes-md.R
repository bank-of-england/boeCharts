#' Turn a Usual Theme into a Markdown Theme
#'
#' Transform any `{ggplot2}` theme into a theme that renders text as markdown
#'
#' @param theme An object of class `theme`
#' @param all_plain `logical`. Should all text be plain by default?
#'
#' @return An object of class `theme` that can be added to any `ggplot`
#'
#' @examples
#' library(ggplot2)
#' data(mtcars)
#'
#' # Create a custom theme
#' my_theme <- theme_gray() +
#'   theme(
#'     panel.grid.minor = element_blank(),
#'     panel.grid.major = element_blank()
#'   )
#' p <- ggplot(mtcars, aes(hp)) +
#'   geom_histogram() +
#'   ggtitle("Mixing **bold** and *italics* is easy")
#'
#' # Text is not rendered
#' p + my_theme
#'
#' # Text is rendered properly
#' p + as_md_theme(my_theme)
#'
#' @export
as_md_theme <- function(theme, all_plain = TRUE) {
  if (all_plain) {
    emd <- ggtext::element_markdown(face = "plain")
  } else {
    emd <- ggtext::element_markdown()
  }
  theme +
    ggplot2::theme(
      axis.title = emd,
      axis.title.x = emd,
      axis.title.y = emd,
      axis.text = emd,
      axis.text.x = emd,
      axis.text.y = emd,
      legend.text = emd,
      legend.title = emd,
      plot.title = emd,
      plot.subtitle = emd,
      plot.caption = emd,
      strip.text = emd,
      strip.text.x = emd,
      strip.text.y = emd
    )
}

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
