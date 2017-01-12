#' Adds .icon() method to the chart
#'
#' Defines the column name that contains the icon URL and controls other options.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#icon}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusIcon <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusIcon <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}