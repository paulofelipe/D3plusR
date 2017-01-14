#' Adds .labels() method to the chart
#'
#' Controls the labels settings. To control which text should be showed, use the d3plusText() function.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#labels}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusLabels <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusLabels <- toJSON(x,
                                auto_unbox = T,
                                force = T,
                                json_verbatim = T)
  d3plus
}