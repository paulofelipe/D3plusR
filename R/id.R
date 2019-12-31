#' Set other .id() options to the chart. The d3plus() function already sets the value to the .id() method.
#'
#' Defines the options to the data point's identifier.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#id}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusId <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusId <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}