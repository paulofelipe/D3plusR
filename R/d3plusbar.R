#' D3plus bar chart
#'
#' Function to create D3plus bar charts.
#'
#' @import htmlwidgets
#' @import jsonlite
#' 
#' @param data a data.frame object to create the visualization.
#' @param x  name of the column for x-axis.
#' @param y  name of the column for y-axis.
#' @param id a vector with the id's column names.
#' @param xlabel label of x-axis. Also it could be TRUE or FALSE. If true the value in `x`param is used. If false, x-label is ommited.
#' @param ylabel label of y-axis. Also it could be TRUE or FALSE. If true the value in `y`param is used. If false, y-label is ommited.
#' @param title title of the visualization. If false, no title is displayed.
#' @param xtime a logical value indicating whether or not the x variable is a time variable.
#' @param attributes a named list with attributes data.frame. If the visualization has more than one level, each level is should be an element in the list. "hex" column for colors and "icon" for icons. See the examples.
#' @param gridx a logical value indicating whether or not the grid lines of x-axis should be displayed.
#' @param gridy a logical value indicating whether or not the grid lines of y-axis should be displayed.
#' @param filters a logical value indicanting whether or not the filter buttons should be included in the legend's tooltips.
#' @param background_color an hex color value for the visualization background.
#' @param width_panel a number indicating the panel's border width.
#' @param legend a logical value indicating whether or not the legend is visible.
#' @param stackedy a vector with logical value indicating whether or not at that level bars should be stacked. Use only when y scale is linear.
#' @param stackedx a vector with logical value indicating whether or not at that level bars should be stacked. Use only when x scale is linear.
#' @param scaley a name indicating the scale type for the y axis (log, linear, discrete and share).
#' @param scalex a name indicating the scale type for the x axis (log, linear, discrete and share).
#' @param legend_data a logical value indicating if the legend's tooltips should show some data summaries.
#' @param legend_size a number indicating the size of legend box.
#' @param currency a name indicating the currency symbol (US$, R$, etc.).
#' @param number_text a name to show after the number. In portuguese: c("Mil", "Milhão", "Milhões", "Bilhão", "Bilhões").
#' @param currency_var a vector with variable names to apply the currency format.
#' @param percent_var a vector with variable names to apply the share format.
#' @param locale a name indicating the language to be used
#' @param dictionary a named list. The element's name should be the original text and the value should be the new text.
#' @param width a number (in pixels) or percent text ("100\%") indicating the visualization's width.
#' @param height a number (in pixels) or percent text ("100\%") indicating the visualization's height.
#' @param elementId a name for the visualization's ID.
#' 
#' @export
#' @examples #' 
#' library(D3plusR)
#' library(dplyr)
#' data("trade_bra_chn")

#' # Fake shares
#' trade_bra_chn <- trade_bra_chn %>% 
#'   mutate(share = sample(100, nrow(trade_bra_chn), replace = TRUE))

#' dictionary <- list(TradeValue = "Trade Value", Period = "Year",
#'                    share = "Share")

#' attributes <- list(Trade.Flow = data.frame(Trade.Flow = c("Export", "Import"),
#'                                            hex = c("#344969", "#992234")))

#' d3plusbar(data = trade_bra_chn,
#'           x = "Period",
#'           y = "TradeValue",
#'           id = "Trade.Flow",
#'           tooltip = c("Period", "TradeValue", "share"),
#'           xtime = TRUE,
#'           height = 400,
#'           width = "100%",
#'           title = "Brazilian Exports and Imports to/from China",
#'           currency_var = "TradeValue",
#'           dictionary = dictionary,
#'           attributes = attributes,
#'           elementId = 'viz1')
#' 
#' 
d3plusbar <- function(data, x, y, id = NULL, xlabel = FALSE, ylabel = FALSE,
                      title = FALSE, xtime = FALSE, attributes = NULL,
                      gridx = FALSE, gridy = TRUE, filters = TRUE,
                      background_color = "#FFFFFF", width_panel = 0, legend = TRUE,
                      tooltip = NULL, stackedy = c(FALSE, FALSE),
                      stackedx = c(FALSE, FALSE), scaley = "linear",
                      scalex = "discrete", legend_data = FALSE, legend_size = 20,
                      currency = "US$", number_text = c("K", "M", "M", "B", "B"),
                      currency_var = NULL, percent_var = NULL, locale = "en_US",
                      dictionary = NULL,
                      width = NULL, height = NULL, elementId = NULL) {

    if(is.null(attributes)){
        attributes <- jsonlite::toJSON(FALSE, auto_unbox = TRUE)
    } else {
        attributes <- jsonlite::toJSON(attributes)
    }

    settings = list(
        x = x,
        y = y,
        id = jsonlite::toJSON(id),
        xlabel = xlabel,
        ylabel = ylabel,
        title = title,
        xtime = ifelse(xtime, x, ""),
        legend = legend,
        tooltip = jsonlite::toJSON(tooltip),
        gridx = gridx,
        gridy = gridy,
        filters = filters,
        background_color = background_color,
        width_panel = width_panel,
        stackedx = jsonlite::toJSON(stackedx),
        stackedy = jsonlite::toJSON(stackedy),
        scaley = scaley,
        scalex = scalex,
        legend_data = legend_data,
        legend_size = legend_size,
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
        settings = settings,
        attributes = attributes
    )

    # create widget
    htmlwidgets::createWidget(
        name = 'd3plusbar',
        x,
        width = width,
        height = height,
        package = 'D3plusR',
        elementId = elementId,
        sizingPolicy = htmlwidgets::sizingPolicy(
            viewer.padding = 0,
            browser.fill = TRUE))
}

#' Shiny bindings for d3plusbar
#'
#' Output and render functions for using d3plusbar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a d3plusbar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name d3plusbar-shiny
#'
#' @export
d3plusbarOutput <- function(outputId, width = '100%', height = '400px'){
    htmlwidgets::shinyWidgetOutput(outputId, 'd3plusbar', width, height, package = 'D3plusR')
}

#' @rdname d3plusbar-shiny
#' @export
renderD3plusbar <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    htmlwidgets::shinyRenderWidget(expr, d3plusbarOutput, env, quoted = TRUE)
}
