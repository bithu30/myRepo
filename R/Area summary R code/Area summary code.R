
### Code to calculate the number of birds contained within a protected area ###
# -----------------------------------------------------------------------------
#Require dependencies
library(raster)
library(gdistance)
library(maptools)
library(rgdal)
library(rgeos)
library(colorRamps)

#rm(list=ls()) 

setwd("C:/myGit/local/myRepo/R/Area summary R code")

# -----------------------------------------------------------------------------

#Load distribution raster from wherever it is saved

distribution <- raster("Arctic_tern_1km_All_Ireland_2016.tif")

#Plot distribution to check it's loaded correctly
plot(distribution, col=(matlab.like(255)), colNA='white', zlim=(0.01), xaxt="n", 
     yaxt="n", main = "Arctic Tern", xlab = "UTM 29 Easting", ylab = "UTM 29 Northing", 
     legend.lab = "Individuals per 1km") # plots distribution as heat map

#Summarise key stats for the distribution e.g. total population size and total area of the distribution

total.pop <- sum(getValues(distribution),na.rm=T) #Calculate total number of birds in the entire distribution (i.e. total population size)

NAs <- freq(distribution, digits=2, value=0) #Number of 0 cells (rounds to 2 decimal places, so anything less than 0.005 will not be counted)

TotalCells <- ncell(distribution) #Total number of cells in raster including NAs

OccupiedCells <- TotalCells - NAs #Caluclates total number of cells occupied by at least 0.005 birds

# -----------------------------------------------------------------------------

#Load shapefile of area you want to assess, transform to UTM and plot

SAC <- readOGR("C:/myGit/local/myRepo/R/Area summary R code","Saltee_SAC")

#Define projection
UTMCRS = CRS("+proj=utm +zone=29 +ellps=WGS84 +datum=WGS84 +units=m +no_defs") 

#transform to UTM
SAC_utm <- spTransform(SAC,UTMCRS)

#Plot
lines(SAC_utm, lwd = 0.25, col = 'red') # plot shapefile to check it's properly aligned to raster
bbox=c(0.0,80.0,25.0,100.0)

-----------------------------------------------------------------------------
  
#Calculate number of birds in the shapefile area
  
extracted.values <- extract(distribution, SAC_utm) #extract values for all the cells in the area
extract.bbox <- extract(distribution, bbox) #extract values for all the cells in the area

area.sum <- sapply(extracted.values, sum) #sum raster cell values for each SAC
area.bbox <- sapply(extract.bbox, sum)
total.sum <- sum(area.sum) #Sum values for total SAC area
total.bbox<-sum(area.bbox)
total.sum #this is the output of the number of birds in the defined area that should be displayed when the GIS is queried 

# -----------------------------------------------------------------------------




