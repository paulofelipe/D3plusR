#' Adds .footer() method to the chart
#'
#' Defines the footer of the visualization.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#footer}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusFooter <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusFooter <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}