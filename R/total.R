#' Adds .total() method to the chart
#'
#' Defines the variable in data associated with the total number of parts of a data point.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#total}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusTotal <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusTotal <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}