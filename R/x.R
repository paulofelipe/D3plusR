#' Add .x() method to the chart
#'
#' Add and control options to the x axis in the visualization.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#x}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusX <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusAxisX <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}