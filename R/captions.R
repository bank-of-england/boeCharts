#' Format data sources to be captioned
#' 
#' Format data sources for use in chart caption.
#'
#' @param ... character vector of data source names
#' @param manipulated_data logical; has data been manipulated?
#'
#' @return character vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_source("FANG"))
caption_source <- function(..., manipulated_data = FALSE) {
  
  sources <- sort(...)
  
  if (manipulated_data) {
    formatted_sources <- glue::glue_collapse(c(sources, "Bank calculations"), sep = ", ", last = " and ")
  } else {
    formatted_sources <- glue::glue_collapse(sources, sep = ", ", last = " and ")
  }
  
  if (length(sources) + manipulated_data == 1) {
    glue::glue("Source: {formatted_sources}.")
  } else {
    glue::glue("Sources: {formatted_sources}.")
  }
}

#' Format chart footnotes to be captioned
#' 
#' Format footnotes for use in chart caption.
#'
#' @param ... character vector of footnotes
#'
#' @return character vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_footnote("Here's a footnote"))
caption_footnote <- function(...) {
  
  footnotes <- as.list(...)
  
  if (length(footnotes) == 0) return(NULL)
  
  glue::glue_collapse(
    glue::glue("({letters[1:length(footnotes)]}) {footnotes}"), sep = "\n"
    )
  
}


#' Format chart data sources and footnotes for captioning
#'
#' @param source character vector of data sources
#' @param footnote character vector of footnotes
#' @param manipulated_data logical; has data been manipulated?
#' @param sep source/footnote separator ("\\n" by default)
#'
#' @return a length 1 vector
#' @export
#'
#' @examples
#' 
#' library(ggplot2)
#'
#' ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   labs(title = "BoE Palette Test",
#'        subtitle = "A plot for demonstration purposes",
#'        y = "Closing price", x = NULL,
#'        caption = caption_boe(
#'        source = "FANG", footnote = "Here's a footnote", manipulated_data = TRUE
#'        ))
caption_boe <- function(source, footnote = NULL, manipulated_data = FALSE, sep = "\n") {
  
  glue::glue_collapse(
    c(
      caption_source(source, manipulated_data = manipulated_data),
      footnote = caption_footnote(footnote)
      ), 
    sep = sep
  )
}
