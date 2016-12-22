#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusY <- function(d3plus, value = NULL, ...){
  x <- c(as.list(environment())[-1], list(...))
  
  d3plus$x$d3plusAxisY <- toJSON(x,
                                 auto_unbox = T,
                                 force = T,
                                 json_verbatim = T)
  d3plus
}