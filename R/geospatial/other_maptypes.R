library(ggmap)
corvallis <- c(lon = -123.2620, lat = 44.5646)
# Get map at zoom level 5: map_5
map_sat <- get_map(location=corvallis, zoom = 5, scale = 1,maptype="satellite")
ggmap(map_sat)
#google terrain
map_toner <- get_map(location=corvallis, zoom = 5, scale = 1,maptype="terrain")
ggmap(map_toner)
#stemer toner
map_stemer <- get_map(location=corvallis, zoom = 5, scale = 1,maptype="toner",source="stamen")
ggmap(map_stemer)

#openstreet toner
map_osm_hybrid <- get_map(location=corvallis, zoom = 5, scale = 1,maptype="terrain",source="osm")
ggmap(map_osm_hybrid)

