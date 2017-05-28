#' Adds .format() method to the chart
#'
#' Format numbers and texts displayed in the visualization.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#format}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusFormat <- function(d3plus, value = NULL, ...){
  
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusFormat <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}