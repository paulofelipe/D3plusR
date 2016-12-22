## ---- message=FALSE, warning=FALSE---------------------------------------
library(D3plusR)
library(dplyr)
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
       title = "Brazilian Exports and Imports to/from China",
       height = 400,
       width = "100%") %>% 
  d3plusX(value = "Period") %>% 
  d3plusY(value = "TradeValue") %>% 
  d3plusTooltip(value = c("Period", "TradeValue", "share")) %>% 
  d3plusAttributes(value = attributes) %>% 
  d3plusColor(value = "hex") %>% 
  d3plusIcon(value = "icon", style = "knockout")

