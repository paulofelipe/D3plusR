#' Adds .text() method to the chart
#'
#' Defines the text to be shown in shapes and tooltips.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#text}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusText <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusText <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}