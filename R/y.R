#' Add .y() method to the chart
#'
#' Add and control options to the y axis in the visualization.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#x}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusY <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusAxisY <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}