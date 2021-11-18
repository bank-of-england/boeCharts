devtools::load_all()

library(dplyr)
library(tidyr)
library(readxl)

# save FANG data (needs tidyquant pkg)
FANG <- tidyquant::FANG

# load gold data
gold_holdings <- readxl::read_excel(
  path = system.file("extdata", "gold-data.XLSX", package = "boeCharts"),
  skip = 6
  ) %>% 
  unite("date", .:...2, na.rm = TRUE) %>% 
  select(date, amount = ...3) %>% 
  dplyr::filter(!is.na(date)) %>% 
  mutate(date = as.Date(date))

# load sovereign debt defaults
sovereign_defaults <- readxl::read_excel(
  path = system.file("extdata", "CRAG-Database-Update-05-07-21.xlsx", package = "boeCharts"),
  sheet = "DATA ",
  skip = 5
) %>% 
  pivot_longer(cols = Total:`- Domestic arrears`) %>% 
  mutate(name = gsub(pattern = "- ", replacement = "", x = name)) %>% 
  rename(creditor=name, year=time) %>% 
  dplyr::filter(creditor != "Total")

usethis::use_data(FANG, gold_holdings, sovereign_defaults, overwrite = TRUE, compress = 'xz')
