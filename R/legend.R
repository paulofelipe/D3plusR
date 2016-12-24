#' <Add Title>
#'
#' <Add Description>
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