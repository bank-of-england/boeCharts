library(dplyr)

# save FANG data (needs tidyquant pkg)
FANG <- tidyquant::FANG

# load gold data
gold_holdings <- readxl::read_excel(
  path = system.file("extdata", "gold-data.XLSX", package = "boeCharts"),
  skip = 5
  ) %>% 
  select(
    date = Date, holdings = `Holdings (‘000s)`, percent_change = `% change`
    ) %>% 
  dplyr::filter(!is.na(date)) %>% 
  mutate(percent_change = as.numeric(percent_change))

usethis::use_data(FANG, gold_holdings, overwrite = TRUE, compress = 'xz')
