library(sf)
library(dplyr)
library(tmap)

neighborhoods_data <- st_read('Neighborhoods.shp')
crime_by_neigh <- read.csv('crime_by_neighborhood1.csv')
grocery_stores <- st_read('Grocery_Stores_in_City_of_Detroit_Public_View.shp')

# Question 1
# Part A
class(neighborhoods_data)
class(crime_by_neigh)
class(grocery_stores)
# Part B
st_crs(neighborhoods_data) # crs of neighborhoods_data: 4326
st_crs(crime_by_neigh) # crs of crime_by_neigh: NA
st_crs(grocery_stores) # crs of grocery_stores: 4326
# Part C
st_is_longlat(neighborhoods_data) # crs for neightborhoods_data is unprojected, meaning that the data is in longitudes and latitudes
st_is_longlat(crime_by_neigh) # crs for crime_by_neigh is NA because it was imported from a csv file
st_is_longlat(grocery_stores) # crs for grocery_stores is unprojected, meaning that the data is in longitudes and latitudes

# Question 2
# grocery_stores shape object not projected
grocery_stores_proj <- st_transform(grocery_stores, crs = 5623)
st_is_longlat(grocery_stores_proj)

# Question 3 
colnames(neighborhoods_data)
colnames(crime_by_neigh)

combined_crime_neigh <- neighborhoods_data %>% 
  left_join(crime_by_neigh, by = c('nhood_name' = 'neighborhood'))

# Question 4
combined_crime_neigh <- combined_crime_neigh %>% 
  select(OBJECTID, nhood_num, nhood_name, no_of_crime_inci) %>% 
  rename(
    NeighborhoodID = OBJECTID,
    Neighborhood_Number = nhood_num, 
    Neighborhood_Name = nhood_name,
    Crime_Inci_Number = no_of_crime_inci
  )
# rm(mod)  

# Question 5
highest <- combined_crime_neigh %>% 
  filter(Crime_Inci_Number != 'NA') %>% 
  arrange(Crime_Inci_Number) %>% 
  head()
lowest <- combined_crime_neigh %>% 
  filter(Crime_Inci_Number != 'NA') %>% 
  arrange(Crime_Inci_Number) %>% 
  tail()
highest
lowest

# Question 6
# Part A
combined_crime_neigh <- combined_crime_neigh %>% 
  mutate(Neigh_Type = ifelse(Crime_Inci_Number > 2500, "Unsafe", "Safe"))
# Part B
Neigh_Count <- combined_crime_neigh %>% 
  group_by(Neigh_Type) %>% 
  summarise(safety_info = n())
Neigh_Count