#' Adds .ui() method to the chart
#'
#' Adds UI elements to the chart that can change values for a specific method.
#' See options: \href{https://github.com/alexandersimoes/d3plus/wiki/Visualizations#axes}{d3plus wiki page}.
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusUi <- function(d3plus, value = NULL, ...){
  
  if(!is.list(value[[1]])){
    value <- list(value)
  }
  x <- c(value, list(...))
  
  d3plus$x$d3plusUi <- toJSON(x,
                              auto_unbox = T,
                              force = T,
                              json_verbatim = T)
  d3plus
}