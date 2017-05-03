#' Adds .attrs() method to the chart
#'
#' Pass data with attributes. Use a named list correspondent to id values.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#attrs}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusAttrs <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusAttrs <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}