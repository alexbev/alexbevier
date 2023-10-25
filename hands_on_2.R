library(sf)
library(dplyr)
library(tmap)

# Question 1
nbhds <- st_read("Neighborhoods.shp")
cbn <- read.csv("crime_by_neighborhood1.csv")

#Question 2
colnames(nbhds)
colnames(cbn)
# the common variable is the name of the neighborhood (i.e., 'nhood_name' and 'neighborhood')

# Question 3 Part A
new_crime_data <- nbhds %>%
  left_join(cbn, by = c('nhood_name' = 'neighborhood'))
# using a left_join, I have just added all the rows(and their corresponding values) in the 'cbn' df to the 'nbhds' dataframe that had a value for 'neighborhood' variable.
# the 'by' argument is to set the parameter of the join. That means you are telling R which columns have the same data in both dataframes.  

# Question 3 Part B
nbhds <- nbhds %>% 
  rename('neighborhood' = 'nhood_name')
new_crime_data1 <- nbhds %>%
  left_join(cbn, by = 'neighborhood')

# Question 4 
st_crs(new_crime_data)
st_is_longlat(new_crime_data)
# shape file 'new_crime_data' is NOT projected.
ncd_proj <- st_transform(new_crime_data, crs = 5623)
st_is_longlat(ncd_proj)
