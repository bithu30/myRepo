library(ggmap)
nyc <- c(lon = -74.0059, lat = 40.7128)

nyc_map<-get_map(location=nyc,zoom = 10)

ggmap(nyc_map)