#' Position line chart labels according to the largest voronoi cells
#'
#' This position adjustment is able to select an appropriate data label
#' position based on the largest voronoi cells identified by overlaying a
#' voronoi diagram onto the data. This is particularly useful for automating
#' the direct labelling of line chart series.
#'
#' @param position closeness to centroid (1 = close to centroid, 0 = far from centroid)
#'
#' @name position_voronoi
#' @rdname position_voronoi
#'
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(FANG, aes(x = date, y = close, colour = symbol)) +
#'   geom_line() +
#'   geom_text(aes(label = symbol),
#'     position = position_voronoi()
#'   )
NULL

#' @rdname boeCharts-extensions
#' @format NULL
#' @usage NULL
#' @export
PositionVoronoi <- ggproto("PositionVoronoi", Position,
                           position = 0, seed = NULL,
                           setup_params = function(self, data) {
                             try_require('deldir', snake_class(self))
                             list(position = self$position)
                           },
                           compute_panel = function(self, data, params, scales) {
                             rw <- with(data, c(range(x), range(y)))
                             del <- with(data, deldir::deldir(x, y,
                                                              z = group, rw = rw,
                                                              suppressMsge = TRUE
                             ))
                             del_summ <- del$summary
                             del_summ$index <- seq_len(nrow(del_summ))
                             
                             index <- vapply(
                               split(del_summ, del_summ$z),
                               function(x) x$index[which.max(x$dir.area)], 1
                             )
                             out <- data[index, ]
                             
                             centroids <- deldir::tile.centroids(deldir::tile.list(del))[index, ]
                             
                             out$x <- (1 - params$position) * out$x + params$position * centroids$x
                             out$y <- (1 - params$position) * out$y + params$position * centroids$y
                             out
                           }
)

#' @rdname position_voronoi
#' @export
position_voronoi <- function(position = 0.5) {
  ggproto(NULL, PositionVoronoi, position = position)
}
