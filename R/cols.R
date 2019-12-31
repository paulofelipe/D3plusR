#' Adds .cols() method to the chart
#'
#' Specify the columns in a table visualization.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#cols}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusCols <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusCols <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}