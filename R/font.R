#' Adds .font() method to the chart
#'
#' Sets global fonts options to the chart.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#font}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusFont <- function(d3plus, value = NULL, ...){
  
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusFont <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}