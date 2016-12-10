# D3plusR
A package for D3plus in R (very preliminary)

## Install

```
devtools::install_github('paulofelipe/D3plusR')
```

## First Example

```
library(D3plusR)
library(dplyr)

# Brazilian Exports and Imports to China

data("chn_anual_fat")

# Convert Year from numeric to character
# Important in order to preserve the bars ordering
chn_anual_fat <- chn_anual_fat %>% 
  mutate(CO_ANO = as.character(CO_ANO))

d3plusbar(chn_anual_fat, x = "CO_ANO", y = "VL_FOB",
          id = c("TIPO", "NO_FAT_AGREG"),
          xtime = TRUE, stackedy = c(FALSE, TRUE), currency_var = "VL_FOB")
```