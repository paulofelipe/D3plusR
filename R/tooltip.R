#' Adds .tooltip() method to the chart
#'
#' Adds variables to the tooltip and controls options.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#tooltip}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#'

d3plusTooltip <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusTooltip <- toJSON(x,
                                   auto_unbox = T,
                                   force = T,
                                   json_verbatim = T)
  d3plus
}