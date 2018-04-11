# seed addresses

load_addresses <- function(csv_file) {
  read_delim(
    csv_file,
    delim = ",",
    col_types =
      cols(address = col_character(),
           family = col_factor(levels = NULL)
      )
  )
}


# generic CSV file with separate header file
load_csv_with_header <- function(csv_file, col_types) {
  read_delim(csv_file,
             delim = ",",
             col_names = colnames(read_delim(paste0(sub('\\.csv$', '', csv_file), "_headers.csv"), delim = ",")),
             col_types = col_types
  )
}

# blockchain stats
load_blockchain_stats <- function(csv_file) {
  load_csv_with_header(csv_file,
                       col_types = cols(
                         blocks = col_integer(), # blocks
                         transactions = col_integer(), # transactions
                         addresses = col_integer(), # addresses
                         clusters = col_integer(), # clusters
                         addressRel = col_integer(), # addressRel
                         clusterRel = col_integer()# clusterRel
                       )
  )
}




# seed address stats
load_addresses_stats <- function(csv_file) {
  load_csv_with_header(csv_file,
                       col_types = cols(
                         address = col_character(),
                         family = col_factor(levels = NULL),
                         cluster = col_factor(levels = NULL),
                         noIncomingTxs = col_integer(),
                         noOutgoingTxs = col_integer(),
                         firstTx = col_integer(),
                         lastTx = col_integer(),
                         totalReceivedSATOSHI = col_number(),
                         totalReceivedUSD = col_double()
                       )
  )
}

# expanded addresses
load_expanded_addresses <- function(csv_file) {
  load_csv_with_header(csv_file,
                       col_types = cols(
                         address = col_character(), # address
                         family = col_factor(levels = NULL), # family
                         totalReceivedSATOSHI = col_number(), #totalReceivedSATOSHI
                         totalReceivedUSD = col_double() #totalReceivedUSD
                        )
  )
}


# seed address transactions (incoming, outgoing)

load_transactions <- function(csv_file) {
  tmp <- load_csv_with_header(csv_file,
                              col_types = cols(
                                address = col_character(), # address
                                txHash = col_character(), # txHash
                                timestamp = col_integer(), # timestamp
                                valueSATOSHI = col_number(), # valueSATOSHI
                                family = col_factor(levels = NULL), # family
                                cluster = col_factor(levels = NULL) #cluster
                              )
  )
}

# cluster statistics

load_cluster_stats <- function(csv_file) {
  load_csv_with_header(csv_file,
                       col_types = cols(
                        cluster = col_factor(levels = NULL),
                        noIncomingTxs = col_integer(),
                        noOutgoingTxs = col_integer(),
                        firstTx = col_datetime(format = ""),
                        lastTx = col_datetime(format = ""),
                        activityHours = col_double(),
                        totalReceivedUSD = col_double(),
                        totalReceivedSATOSHI = col_double(),
                        totalSpentUSD = col_double(),
                        totalSpentSATOSHI = col_double(),
                        noAddresses = col_integer(),
                        clusterTagCount = col_integer(),
                        clusterTags = col_character(),
                        clusterCategories = col_character()
             )
  )
}

# google trends files

load.gTrends <- function(csv_file) {
  family <- substr(basename(csv_file), 1, nchar(basename(csv_file)) - 4)
  data <- read_delim(
    csv_file,
    delim = ",",
    skip = 2,
    col_types = NULL
  )
  colnames(data) <- c("month", family)
  data$month <- as.Date(paste0(data$month, "-01"))
  data
}

