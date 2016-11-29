#    Highland Statistics Ltd.
#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  




######################################################
#Load the data
HB <- read.table(file = "HawaiiBirdsV2.txt",
                 header = TRUE,
                 dec = ".")

names(HB)
str(HB)

#Species
# 1 = Stilt
# 2 = Coot
# 3 = Moorhen

# Island
# 1 = Oahu
# 2 = Maui
# 3 = Kauai and Niihau
######################################################



######################################################
#Coding of factors
SpeciesNames <- c("Stilts", "Coots", "Moorhens")
IslandsNames <- c("Oahu", "Maui", "Kauai and Niihau")

HB$Species2       <- SpeciesNames[HB$Species]
HB$Island2        <- IslandsNames[HB$Island]
HB$SpeciesIsland  <- paste(HB$Species2, HB$Island2, sep = ".")
HB$fSpeciesIsland <- factor(HB$SpeciesIsland)
######################################################



######################################################
#Load packages and functions
library(lattice)
library(mgcv)
######################################################



######################################################
#Figure 8.1
HB$fSpeciesIsland <- factor(HB$SpeciesIsland)
HB$fSpeciesIsland
levels(HB$fSpeciesIsland)

xyplot(Birds ~ Year | fSpeciesIsland,
       data = HB,
       ylab = "Bird abundance",     
       xlab = "Year",
       #Panel function 
       panel = function(x,y){
       	 panel.points(x, y , col = grey(0), pch = 1)
       	 panel.loess(x,y, span = 0.6, col = "black", lwd = 1)
       })
############################################################       



############################################################
#Figure 8.2
xyplot(Birds ~ Year | fSpeciesIsland,
       data = HB,
       #Scales along the axes
       scales = list(alternating = T,   
                     x = list(relation = "free"),
                     y = list(relation = "same")),
       #Adjust labels
       ylab = list("Bird abundance", cex = 1.5),       #x-label
       xlab = list("Year", cex = 1.5), #y-label
       #Adjust colours of the strips
       strip = strip.custom(bg = "white", 
                            par.strip.text = list(font = 1.5)),
       #layout
       layout = c(3,3),    
       #Panel function 
       panel = function(x,y){
       	 panel.points(x, y , col = grey(0.4), pch = 16)
       	 panel.loess(x,y, span = 0.7, col = "black", lwd = 3)
       })
############################################################






############################################################
#Figure 8.3
#So..the panels follow the order of the levels..
#From lower left to lower right, upper left to
#upper right. Now change the order of the levels in

HB$SpeciesIsland
unique(HB$SpeciesIsland)
MyLevels <- levels(HB$fSpeciesIsland)
MyLevels


# StiltsonMaui	    StiltsonOahu	  StiltsonKauai and Niihau
# MoorhensonMaui  	MoorhensonOahu    ----
# CootsonMaui 	    CootsonOahu		  CootsonKauai and Niihau


HB$SpeciesIsland2 <- factor(HB$SpeciesIsland,
                    levels = c("Coots.Maui","Coots.Oahu",
                               "Coots.Kauai and Niihau",
                               "Moorhens.Maui","Moorhens.Oahu",
                               "Stilts.Maui","Stilts.Oahu",
                               "Stilts.Kauai and Niihau"),
                    labels = c("Coots on Maui","Coots on Oahu",
                               "Cootson Kauai and Niihau",
                               "Moorhens on Maui","Moorhens on Oahu",
                               "Stilts on Maui","Stilts on Oahu",
                               "Stilts on Kauai and Niihau")       )

MySkip <- c(FALSE, FALSE, FALSE, 
            FALSE, FALSE, TRUE, 
            FALSE, FALSE, FALSE)


#And finally...change the labels.
HB$SpeciesIsland3 <- factor(HB$SpeciesIsland2,
                            labels = c("Coots on Maui", 
                                       "Coots on Oahu",
                                       "Coots on Kauai and Niihau", 
                                       "Moorhens on Maui", 
                                       "Moorhens on Oahu",
                                       "Stilts on Maui",
                                       "Stilts on Oahu",
                                       "Stilts on Kauai and Niihau"))

xyplot(Birds ~ Year | SpeciesIsland3,
       data = HB,
       skip = MySkip,
       #Scales along the axes
       scales = list(alternating = T,   
                     x = list(relation = "free"),
                     y = list(relation = "same")),
       #Adjust labels
       ylab = list("Bird abundance", cex = 1.5),       #x-label
       xlab = list("Year", cex = 1.5), #y-label
       #Adjust colours of the strips
       strip = strip.custom(bg = "white", 
                            par.strip.text = list(font = 2, cex = 1.3)),
       #layout
       layout = c(3,3),    
       #Panel function 
       panel = function(x,y){
       	 panel.points(x, y , col = 1, pch = 16)
       	 panel.loess(x,y, span = 0.7, col = "black", lwd = 3)
       })
##############################################







##############################################
#Figure 8.4
HB$Species3 <- factor(HB$Species2,
                      levels = c("Stilts", "Moorhens", "Coots"))

HB$Island3 <- factor(HB$Island2,
                      levels = c("Maui", "Oahu", "Kauai and Niihau"))


library(ggplot2)
p <- ggplot(data = HB, aes(y = Birds, x = Year))
p <- p + xlab("Year") + ylab("Bird abundance")
p <- p + theme(text = element_text(size=15)) + theme_bw()
p <- p + geom_point(shape = 16, size = 2, col = "black")
p <- p + geom_smooth(se = FALSE, col = "black", lwd = 1)
p <- p + facet_grid(Species3 ~ Island3 , scales = "fixed")
p <- p + theme(strip.text = element_text(size = 15))
p

