## ---- eval=FALSE---------------------------------------------------------
#  d3plus(data = data,
#         type = "bar",
#         id = "name") %>%
#    d3plusX(value = "year") %>%
#    d3plusY(value = "value")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(D3plusR)
library(dplyr)
library(jsonlite)
data("trade_bra_chn")

# Fake shares
trade_bra_chn <- trade_bra_chn %>% 
  mutate(share = sample(100, nrow(trade_bra_chn), replace = TRUE))

dictionary <- list(TradeValue = "Trade Value", Period = "Year",
                   share = "Share")

attributes <- list(Trade.Flow = data.frame(Trade.Flow = c("Export", "Import"),
                             icon = c("exp.png",
                                      "imp.png"),
                             hex = c("#344969", "#992234")))

d3plus(data = trade_bra_chn, id = "Trade.Flow",
       type = "bar",
       dictionary = dictionary,
       height = 400,
       width = "100%") %>% 
  d3plusX(value = "Period") %>% 
  d3plusY(value = "TradeValue") %>% 
  d3plusLegend(value = TRUE, size = 30, data = FALSE) %>% 
  d3plusTooltip(value = c("Period", "TradeValue", "share")) %>% 
  d3plusAttrs(value = attributes) %>% 
  d3plusColor(value = "hex") %>% 
  d3plusIcon(value = "icon", style = "knockout") %>% 
  d3plusTitle("Brazilian Exports and Imports to/from China")

## ------------------------------------------------------------------------
data("bra_inflation")
# Date variables must have this format
bra_inflation$Date <- format(bra_inflation$Date, "%Y/%m/%d")
# dates to be passed in solo argument
date_filter <- bra_inflation$Date[bra_inflation$Date > "2013/01/01"]


d3plus(data = bra_inflation, id = "country",
       type = "line",
       percent_var = "Rate",
       height = 400,
       width = "100%") %>% 
  d3plusX(value = "Date", grid = FALSE) %>% 
  d3plusY(value = "Rate") %>% 
  d3plusTime(value = "Date", solo = date_filter) %>% 
  d3plusTooltip(value = "Date") %>% 
  d3plusTitle("Brazilian Inflation (IPCA)")


## ------------------------------------------------------------------------
data("bra_exp_2015")
d3plus(data = bra_exp_2015,
       type = "tree_map",
       id = c("region", "Partner"),
       width = "100%",
       height = 500) %>% 
  d3plusSize(value = "Trade.Value..US..") %>% 
  d3plusLegend(value = TRUE, order = list(sort = "desc", value = "size")) %>% 
  d3plusColor("region") %>% 
  d3plusDepth(0) %>% 
  d3plusLabels(valign = "top") %>% 
  d3plusUi(value = list(list(method = "color",
                             value = list(list(Region = "region"), list(Value = "Trade.Value..US.."))),
                        list(method = "depth", type = "drop",
                             value = list(list(Continent = 0), list(Country = 1)))))

## ------------------------------------------------------------------------
mapa <- system.file("extdata", "countries.topojson", package = "D3plusR")
mapa <- jsonlite::fromJSON(mapa, simplifyVector = F)

d3 <- d3plus(data = bra_exp_2015,
       type = "geo_map",
       id = "Partner.ISO",
       width = "100%",
       height = 500) %>% 
  d3plusCoords(mapa, projection = "equirectangular") %>% 
  d3plusColor(value = "Trade.Value..US..") %>% 
  d3plusTooltip(value = c("Trade.Value..US..", "Partner.ISO")) %>% 
  d3plusLabels(FALSE) %>% 
  d3plusText("Partner") %>% 
  d3plusTitle("Brazilian Exports Destinations") %>% 
  d3plusZoom(value = TRUE, scroll = FALSE) 

d3


## ------------------------------------------------------------------------
library(jsonlite)
sample_data <- fromJSON('[
    {"name": "alpha", "size": 10},
    {"name": "beta", "size": 12},
    {"name": "gamma", "size": 30},
    {"name": "delta", "size": 26},
    {"name": "epsilon", "size": 12},
    {"name": "zeta", "size": 26},
    {"name": "theta", "size": 11},
    {"name": "eta", "size": 24}
  ]')

positions <- fromJSON('[
    {"name": "alpha", "x": 10, "y": 15},
    {"name": "beta", "x": 12, "y": 24},
    {"name": "gamma", "x": 16, "y": 18},
    {"name": "delta", "x": 26, "y": 21},
    {"name": "epsilon", "x": 13, "y": 4},
    {"name": "zeta", "x": 31, "y": 13},
    {"name": "theta", "x": 19, "y": 8},
    {"name": "eta", "x": 24, "y": 11}
  ]')

connections <- fromJSON('[
    {"source": "alpha", "target": "beta"},
    {"source": "alpha", "target": "gamma"},
    {"source": "beta", "target": "delta"},
    {"source": "beta", "target": "epsilon"},
    {"source": "zeta", "target": "gamma"},
    {"source": "theta", "target": "gamma"},
    {"source": "eta", "target": "gamma"}
  ]')

## ------------------------------------------------------------------------
d3plus(data = sample_data, type = "network", id = "name",
       width = "100%",
       height = "400px") %>% 
  d3plusNodes(positions) %>% 
  d3plusEdges(value = connections, arrows = TRUE) %>% 
  d3plusSize("size")

## ------------------------------------------------------------------------
data("arg_exp_imp_2015")

d3plus(type = "sankey", id = "id", height = 500, width = "100%") %>% 
  d3plusNodes(value = nodes) %>% 
  d3plusEdges(value = edges %>% filter(Trade_Value > 1e9), strength = "Trade_Value") %>% 
  d3plusFocus(tooltip = FALSE, value = "Argentina") %>% 
  d3plusAttrs(nodes) %>% 
  d3plusLegend(FALSE) %>% 
  d3plusSize(100) %>% 
  d3plusTitle("Argentina - Imports and Exports Origins/Destinations") %>% 
  d3plusTooltip("Trade_Value") %>% 
  d3plusColor("color")

