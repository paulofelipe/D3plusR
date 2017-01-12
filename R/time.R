#' Adds .time() method to the chart
#'
#' Defines the time variable and controls other options. The time variable slices the chart in time periods
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#time}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusTime <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusTime <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}