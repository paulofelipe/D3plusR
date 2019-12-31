#' Adds .zoom() method to the chart
#'
#' Enables or Disables visualization zooming.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#zoom}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusZoom <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusZoom <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}