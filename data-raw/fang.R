# save data (needs tidyquant pkg)
FANG <- tidyquant::FANG

usethis::use_data(FANG, overwrite = TRUE, compress = 'xz')
