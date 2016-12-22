# Map color to year_built
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

# Map size to bedrooms
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, size = bedrooms), data = sales)

# Map color to price / finished_squarefeet
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color = price / finished_squarefeet), 
             data = sales)