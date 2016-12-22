#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
d3plus <- function(data = data, type = "bar",  id = NULL, title = FALSE, currency = "US$", number_text = c("K", "M", "M", "B", "B"),
                   currency_var = NULL, percent_var = NULL, locale = "en_US",
                   dictionary = NULL, width = NULL, height = NULL, elementId = NULL) {

  settings = list(
    type = type,
    id = jsonlite::toJSON(id),
    title = title,
    currency = currency,
    number_text = number_text,
    currency_var = currency_var,
    percent_var = percent_var,
    locale = locale,
    dictionary = jsonlite::toJSON(dictionary)
  )
  # forward options using x
  x = list(
    data = data,
    settings = settings
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'd3plus',
    x,
    width = width,
    height = height,
    package = 'D3plusR',
    elementId = elementId
  )
}

#' Shiny bindings for d3plus
#'
#' Output and render functions for using d3plus within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a d3plus
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name d3plus-shiny
#'
#' @export
d3plusOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'd3plus', width, height, package = 'D3plusR')
}

#' @rdname d3plus-shiny
#' @export
renderD3plus <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, d3plusOutput, env, quoted = TRUE)
}
