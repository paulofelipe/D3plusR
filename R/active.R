#' Adds .active() method to the chart
#'
#' Function to define the key associated with the active parts .
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#active}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusActive <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusActive <- toJSON(x,
                                  auto_unbox = T,
                                  force = T,
                                  json_verbatim = T)
  d3plus
}