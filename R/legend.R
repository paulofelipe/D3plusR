#' Adds .legend() method to the chart
#'
#' Adds and controls legend options.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#x}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusLegend <- function(d3plus, value = TRUE, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusLegend <- toJSON(x,
                                  auto_unbox = T,
                                  force = T,
                                  json_verbatim = T)
  d3plus
}