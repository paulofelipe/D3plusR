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

d3plusbar(data = trade_bra_chn,
          x = "Period",
          y = "TradeValue",
          id = "Trade.Flow",
          tooltip = c("Period", "TradeValue", "share"),
          xtime = TRUE,
          height = 400,
          width = "100%",
          title = "Brazilian Exports and Imports to/from China",
          currency_var = "TradeValue",
          dictionary = dictionary,
          attributes = attributes,
          elementId = 'viz1')

