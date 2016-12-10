## ------------------------------------------------------------------------
library(D3plusR)
data("trade_bra_chn")

d3plusbar(data = trade_bra_chn,
          x = "Period",
          y = "TradeValue",
          id = "Trade.Flow",
          xtime = TRUE,
          height = 400,
          width = "100%",
          title = "Brazilian Exports and Imports to/from China")

