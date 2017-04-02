#' Adds .aggs() method to the chart
#'
#' Defines how specific variables should be aggregated.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#aggs}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusAggs <- function(d3plus, ...){
  x <- c(list(...))
  
  d3plus$x$d3plusAggs <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}