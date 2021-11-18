#' Stock prices for the "FANG" stocks
#'
#' A dataset containing the daily historical stock prices for the "FANG" tech stocks,
#' "FB", "AMZN", "NFLX", and "GOOG", from 2013 to 2016.
#'
#' @format A "tibble" ("tidy" data frame) with 4,032 rows and 8 variables:
#' \describe{
#'   \item{symbol}{stock ticker symbol}
#'   \item{date}{trade date}
#'   \item{open}{stock price at the open of trading, in USD}
#'   \item{high}{stock price at the highest point during trading, in USD}
#'   \item{low}{stock price at the lowest point during trading, in USD}
#'   \item{close}{stock price at the close of trading, in USD}
#'   \item{volume}{number of shares traded}
#'   \item{adjusted}{stock price at the close of trading adjusted for stock splits, in USD}
#' }
#' @source \url{http://www.investopedia.com/terms/f/fang-stocks-fb-amzn.asp}
#' @name FANG
"FANG"

#' Bank of England gold holdings
#'
#' A dataset containing the weight of gold the Bank of England has in it's 
#' custody on the last business day of each month, from 2011 to 2021.
#'
#' @format A "tibble" ("tidy" data frame) with 130 rows and 2 variables:
#' \describe{
#'   \item{date}{observation date (last business day of each month)}
#'   \item{amount}{gold in thousands of fine troy ounces}
#' }
#' @source \url{https://www.bankofengland.co.uk/statistics/gold}
#' @name gold_holdings
"gold_holdings"

#' Sovereign government debt defaults
#'
#' A dataset containing nominal values of the different types of sovereign 
#' government debt in default. Data is provided annually, by country, from 1960
#' to 2020.
#'
#' @format A "tibble" ("tidy" data frame) with 104,368 rows and 5 variables:
#' \describe{
#'   \item{country}{name of country or region}
#'   \item{country_group}{name of country or regional grouping}
#'   \item{year}{observation year}
#'   \item{creditor}{type of creditor}
#'   \item{value}{nominal amount of debt in US$ millions}
#' }
#' @source \url{https://www.bankofcanada.ca/2021/07/staff-analytical-note-2021-15/}
#' @name sovereign_defaults
"sovereign_defaults"
