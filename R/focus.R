#' Adds .focus() method to the chart
#'
#' If supported, it defines which data node to focus on.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#focus}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusFocus <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusFocus <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}