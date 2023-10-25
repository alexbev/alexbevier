##### Loading the necessary libraries, sf for geodata, tmap for mapping

library(sf)
library(dplyr)
library(tmap)

# Reading in the data
bus_stops <- st_read("DDOT_Bus_Stops.shp")      # This is a shapefile, which is a geospatial vector(point) data format
bus_stops_csv <- read.csv('bus stops.csv')      # A CSV file.

# Check out the class of the data of the data
class(bus_stops)
class(bus_stops_csv)

# We can check the crs of the data using the st_crs function
st_crs(bus_stops)
st_crs(bus_stops_csv)

# Converting the csv to sf object
# st_as_sf() function converts foreign object to a sf object
# c() function creates a vector (i.e., a combination of two variables)
colnames(bus_stops_csv)
bus_to_sf <- st_as_sf(x = bus_stops_csv,
                      coords = c("longitude", "latitude"))

# Kindly verify the class of the new data
class(bus_to_sf)

# Also check for the crs
st_crs(bus_to_sf)
st_crs(bus_stops)

# Set the crs of bus_to_sf
st_crs(bus_to_sf) <- 4326 


#check their crs
st_crs(bus_stops)
st_crs(bus_to_sf)


## Check if they are projected
st_is_longlat(bus_stops)
st_is_longlat(bus_to_sf)

# Let's pause here and take a look at the epsg website: https://epsg.org/home.html


# project them by transforming them
but_stop_proj <- st_transform(bus_stops, crs = 5623)
bus_to_sf_proj <- st_transform(bus_to_sf, crs = 5623)



## Check if they is projected
st_is_longlat(but_stop_proj)
st_is_longlat(bus_to_sf_proj)


#check their crs
st_crs(but_stop_proj)
st_crs(bus_to_sf_proj)

