#' Adds .title() method to the chart
#'
#' Defines the visualization's title and control other options.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#title}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusTitle <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusTitle <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}