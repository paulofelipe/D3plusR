#' Adds .depth() method to the chart
#'
#' If id has more than one level, this function sets a specific nesting level.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#depth}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#'

d3plusDepth<- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusDepth <- toJSON(x,
                                   auto_unbox = T,
                                   force = T,
                                   json_verbatim = T)
  d3plus
}