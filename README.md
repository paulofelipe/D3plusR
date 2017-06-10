# D3plusR  

A package to bring D3plus to R
-------------------------------------------------------------

## About D3plus

[D3plus] (https://d3plus.org/) is a library built on top of [D3] (https://d3js.org/). The purpose of the library is to make visualization creation simple and easy. Please access the original D3plus project [at this link] (https://d3plus.org/) to learn more.

## About D3plusR

D3plusR is a package created using the htmlwidgets framework. The methods available in the D3plus library have been converted to R functions. The initial options are available in the `d3plus ()` function. The other functions are directly linked to the methods. For example, the `d3plusSize()` function exists for the `.size()` (D3plus) method.

## Options

The authors of D3plus have made this [page available](https://github.com/alexandersimoes/d3plus/wiki/Visualizations) with the options for each method. 

See a comparison between the D3plus and the D3plusR.

- D3plus:
```js
.axes({"ticks": false,
       "background": {"color": "#FFFFFF",
                      "stroke": {"width": 0}}})
```

- D3plusR
```r
d3plusAxes(ticks = FALSE,
           background = list(color = "#FFFFFF",
                             stroke = list(width = 0)))
```

## First Example

```r
library(D3plusR)
library(dplyr)
data("trade_bra_chn")

# Fake shares
trade_bra_chn <- trade_bra_chn %>% 
  mutate(share = sample(100, nrow(trade_bra_chn), replace = TRUE))

dictionary <- list(TradeValue = "Trade Value", Period = "Year",
                   share = "Share")

attributes <- list(Trade.Flow = data.frame(Trade.Flow = c("Export", "Import"),
                             hex = c("#344969", "#992234")))

d3plus(data = trade_bra_chn, id = "Trade.Flow",
       type = "bar",
       dictionary = dictionary,) %>% 
  d3plusX(value = "Period") %>% 
  d3plusY(value = "TradeValue") %>% 
  d3plusLegend(value = TRUE, size = 30, data = FALSE) %>% 
  d3plusTooltip(value = c("Period", "TradeValue", "share")) %>% 
  d3plusAttrs(value = attributes) %>% 
  d3plusColor(value = "hex") %>% 
  d3plusTitle("Brazilian Exports and Imports to/from China")
```

See more examples:

```r
vignette("D3plusR")
```

