# read data
FANG <- read.csv(file = "//bankwide/files/Bankwide Data/r-data-training/FANG.csv",
                 colClasses = c("character", "Date", "numeric", "numeric", "numeric", 
                 "numeric", "numeric", "numeric"))


usethis::use_data(FANG, overwrite = TRUE, compress = 'xz')
