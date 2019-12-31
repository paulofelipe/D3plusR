#' Adds .axes() method to the chart
#'
#' Defines specifics aspects of the X and Y axes.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#axes}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusAxes <- function(d3plus, ticks = TRUE, mirror = FALSE, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusAxes <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}