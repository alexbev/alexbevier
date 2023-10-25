library(readxl)
library(writexl)
library(dplyr)

trips <- read.csv('trips.csv')

ncol(trips)
nrow(trips)

# unique() function shows when a new data value for a given column is observed for the first time
trips %>% 
  select(service_id) %>%
  unique()

# colnames gives you the name of the columns of trips
# tail() gives you the last 6 columns (by default), here it will give the last 4
# head() gives you the first 6 column names
# - removes
trips2 <- trips %>%
  select(-tail(colnames(trips), 4))
deleted_col_counts = ncol(trips) - ncol(trips2)
deleted_col_counts

colnames(trips2)

trips2 %>%
  select(direction_id) %>%
  head(10)

trips2 <- trips2%>%
  mutate(direction_text = ifelse(direction_id == 1, "outbound", "inbound")) %>%
  head(5)

trips2 %>%
  select(direction_text)%>%
  head(10)

route_4_count <- trips2 %>%
  filter(route_id == 4 & trip_headsign == 'Washtenaw to YTC') %>%
  count()
route_4_count

routes <- read.csv ('routes.csv') 
colnames(routes)

# unique routes in trips df
trips_uniq_routes <- trips %>%
  select(route_id) %>%
  unique()
# num of unique trips
trips_uniq_routes %>% count()
# num of routes
routes %>% count()

