library(readxl)
library(writexl)
library(dplyr)

airlines <- read.csv('airlines.csv')
flights <- read.csv('flights.csv')

colnames(airlines)
colnames(flights)

flight2 <- flights %>%
          select(year, month, day, hour, origin, dest, tailnum, carrier, air_time, arr_delay, dep_delay)

flight2 <- flight2 %>%
          select(-origin, -dest) %>%
          left_join(airlines, by = 'carrier')
flight2

jan1st <- flight2 %>%
          filter(month == '1', day == '1')
jan1st

dec25th <- flight2 %>%
          filter(month == '12', day == '25')
dec25th

avgdels <- flight2 %>%
          group_by(year, month, day) %>%
          summarize(del_avg = mean(dep_delay, na.rm = TRUE))
avgdels

flight2 <- flight2 %>%
          mutate(gain = arr_delay-dep_delay)%>%
          mutate(hours = air_time/60) %>%
          mutate(gain_per_hour = gain/hour)
flight2 <- flight2 %>%
          mutate(duration = ifelse(hours < 3, "short flight", "long flight"))
flight2

durcount <- flight2 %>% 
          count(duration) %>%
          na.omit()
durcount

# There are 90,075 'long flights' and 237,271 'short flights'