#' Adds .nodes() method to the chart
#'
#' Sets the positions of the nodes (x, y) in a network.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#nodes}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusNodes <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusNodes <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}