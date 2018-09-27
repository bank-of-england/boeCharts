# read excel chart data
data <- readxl::read_excel(path = "//MFSD/Data/DATA/MS/GRP/Outputs/Statistical Releases/Money & Credit/Backing tables/Part 1. deposits and loans of financial and non-financial businesses.xlsx",
                           sheet = "Chart data", skip = 2)

# select cols to keep
data_subset <- dplyr::select(data, date=X__3, Construction:Manufacturing, `Wholesale and retail trade`=X__5)

# gather industries
nfc_deposits <- tidyr::gather(data_subset, key="industry", value=pct_change, -date)

devtools::use_data(nfc_deposits, overwrite = TRUE, compress = 'xz')
