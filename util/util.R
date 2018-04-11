# remove rows with unknown family and less than minOccurrence occurrences
filter_by_family <- function(dataframe, minOccurrence) {
  dataframe[dataframe$family != "Unknown",] %>%
    group_by(family) %>%
    filter(n() > minOccurrence)
}


to_btc <- function(satoshi) {
  satoshi / 100000000
}