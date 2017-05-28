#' Adds .data() method to the chart
#'
#' Sets the data to the visualization and defines other options. If the user does not use any extra option, the data can be informed as an argument in d3plus() function.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#data}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusData <- function(d3plus, value = NULL, ...){
  
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusData <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}