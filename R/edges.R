#' Adds .edges() method to the chart
#'
#' Sets the list of the edges in a network or rings charts. The data.frame should have the source and targe columns. The values should match with the id.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#edges}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusEdges <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusEdges <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}