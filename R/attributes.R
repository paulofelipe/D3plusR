#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
#' 

d3plusAttributes <- function(d3plus, value = NULL){
  
  d3plus$x$d3plusAttributes <- toJSON(value,
                                      auto_unbox = T,
                                      force = T,
                                      json_verbatim = T)
  d3plus
}