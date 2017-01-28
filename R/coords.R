#' Adds .coords() method to the chart
#'
#' Function to pass topojson object to D3plus. It could be a loaded topojson file or a URL.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#coords}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusCoords <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusCoords <- toJSON(x,
                                  auto_unbox = T,
                                  force = T,
                                  json_verbatim = T)
  d3plus
}