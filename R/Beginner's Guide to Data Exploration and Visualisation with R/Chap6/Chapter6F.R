#    Highland Statistics Ltd.
#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.



#######################################################################
#Import the data from a tab delimited ascii file
Methane <- read.table(file = "Methane_YvonDurocher.txt", 
                      header = TRUE)
names(Methane)
#######################################################################




#######################################################################
#Figure 6.1
library(lattice)
library(maps)

xyplot(Latitude ~ Longitude | Ecosystem,
       data = Methane,
       layout = c(1,3),
       aspect = "iso",
       xlab = list(label = "Longitude", cex = 1.5),
       ylab = list(label = "Latitude", cex = 1.5),
        panel = function(x,y) {
          panel.points(x,y, pch = 16, col = 1, cex = 1.5)
          mp <- map(database = "world", plot = FALSE)
          #lpolygon(mp$x, mp$y, fill = TRUE)
          panel.lines(mp$x, mp$y, col = grey(0.5))
        })
#######################################################################





#######################################################################
#Figure 6.2
library(ggplot2)
qplot(y = Flux, 
      x = Temp,
      data = Methane)

qplot(y = Flux, 
      x = Temp,
      data = Methane,
      col = Ecosystem)


qplot(y = Flux, 
      x = Temp,
      data = Methane,
      col = Ecosystem,
      shape = Ecosystem)
#######################################################


#######################################################
#Not in the book:
qplot(y = Flux, 
      x = Temp,
      data = Methane,
      geom = c("point", "smooth"))

qplot(y = Flux, 
	  x = Temp,
      data = Methane,
      geom = c("point", "smooth"),
      alpha = I(1/10))

qplot(y = Flux, 
      x = Temp,
      data = Methane,
      geom = c("point", "smooth"),
      method = "lm")

qplot(y = Flux, 
      x = Ecosystem,
      data = Methane,
      geom = c("point", "boxplot"))

qplot(Flux,
      data = Methane,
      geom = c("histogram"))

qplot(Flux,
      data = Methane,
      geom = c("histogram"),
      binwidth = 0.5)

qplot(Flux,
      data = Methane,
      geom = c("density"),
      binwidth = 0.1,
      colour = Ecosystem)

qplot(y = Flux, 
      x = Temp,
      data = Methane,
      facets = . ~ Ecosystem)
#######################################################





#######################################################
#Same graph as Figure 6.2
p <- ggplot(Methane, aes(y = Flux, x = Temp))
p <- p + layer(geom = "point")
p
#######################################################


#######################################################
#Figure 6.3
p <- ggplot(Methane, aes(y = Flux, x = Temp))
p <- p + geom_point()
p <- p + geom_smooth(colour = 1)
p <- p +  labs(title = "Scatterplot") + xlab("Temperature") + ylab("FLux")
p


#Similar pieces of code...not in the book
p <- ggplot(Methane, aes(y = Flux, x = Temp, colour = Ecosystem))
p <- p + geom_point() + geom_smooth(colour = 1)
p

p <- ggplot(Methane, aes(y = Flux, x = Ecosystem))
p <- p + geom_boxplot() + labs(title = "Scatterplot") +
     xlab("Ecosystem") + ylab("FLux")
p 

p <- ggplot(Methane, aes(y = Flux, x = Temp, colour = Ecosystem))
p <- p + geom_point() + geom_smooth(colour = 1)  
p <- p + xlim(-3.5, 3.5)
p
#################################################################




#################################################################
#Figure 6.4 Dotplot
plot(y = 1:nrow(Methane), x = Methane$Flux)

MyData <- data.frame(Y = 1:nrow(Methane),
                     X = Methane$Flux,
                     ID = Methane$Ecosystem)
                     
p <- ggplot(MyData, aes(y = Y, x = X))
p <- p + geom_point() + ylab("Order of the data") + xlab("Range of the data")
p <- p + theme(text = element_text(size=15))
p 
################################################################




################################################################
#Figure 6.5
MyVar  <- c("Temp", "Flux", "Latitude", "Longitude") 
K      <- length(MyVar)
MyData <- data.frame(Y = rep(1:nrow(Methane), K),
                     X = as.vector(as.matrix(Methane[, MyVar])),
                     Var = rep(MyVar, each = nrow(Methane))) 
                     
p <- ggplot(MyData, aes(y = Y, x = X))
p <- p + geom_point() + ylab("Order of the data") + xlab("Range of the data")
p <- p + theme(text = element_text(size=15))
p <- p + facet_wrap(~ Var, scales = "free_x")
p


MyDotplot.ggp2 <- function(Z, varx) {
  K     <- length(varx)
  MyData <- data.frame(Y = rep(1:nrow(Z), K),
                       X = as.vector(as.matrix(Z[, MyVar])),
                       Var = rep(MyVar, each = nrow(Z))) 

  p <- ggplot(MyData, aes(y = Y, x = X))
  p <- p + geom_point() + ylab("Order of the data") + xlab("Range of the data")
  p <- p + theme(text = element_text(size=15))
  p <- p + facet_wrap(~ Var, scales = "free_x")
  print(p)	
}

MyDotplot.ggp2(Methane, MyVar)
##########################################################




##########################################################
#Figure 6.6
library(GGally)
MyVar <- c("Temp", "Latitude", "Longitude", "Ecosystem") 
ggpairs(Methane[,MyVar], 
        axisLabels = "show",
        params = list(corSize = 30),
        color = 1)
##############################################################



##############################################################
#Figure 6.7
p <- ggplot(Methane, aes(y = Flux, x = Temp))
#p <- p + geom_point(shape = ".")
#p <- p + geom_point(shape = 16, colour = "black", alpha = 1/5)
p <- p + geom_point(shape = 1, colour = "grey50")
p <- p + geom_smooth(colour = "black", size = 2, se = FALSE)
p <- p +  xlab("Temperature") + ylab("FLux")
p <- p + theme(text = element_text(size=15))
p
##############################################################



##############################################################
#Figure 6.8
p <- ggplot(Methane, aes(y = Flux, x = Ecosystem))
p <- p + geom_boxplot()
p <- p + xlab("Ecosystem") + ylab("FLux")
p <- p + theme(text = element_text(size=15))
p
##############################################################





##############################################################
#Figure 6.9 Interactions
p <- ggplot(Methane, aes(y = Flux, x = Temp))
p <- p + geom_point(shape = 1, colour = "grey50")
p <- p + geom_smooth(col = "black", size = 2, se = FALSE)
p <- p +  xlab("Temperature") + ylab("FLux")
p <- p + facet_grid(. ~ Ecosystem, scales = "fixed")
p <- p + theme(text = element_text(size=15))
p
##############################################################




##############################################################
#Figure 6.10
library(ggmap)
range(Methane$Longitude)
range(Methane$Latitude)

glgmap   <- get_map(location = c(-115, -40, 150, 75), 
                     maptype= "terrain",
                     col = "bw")    
p <- ggmap(glgmap)
p <- p + geom_point(data = Methane,
                    aes(Longitude, Latitude),
                    size = 3, color = "black") 
p
##############################################################




##############################################################
#Figure 6.11
WorldMap <- map_data("world")p <- ggplot(WorldMap, aes(long, lat))p <- p + geom_polygon(aes(group = group), 
                          fill = "white",                          color = "gray50",                          size = 0.3)p <- p + geom_point(data = Methane,                    aes(Longitude, Latitude),                    size = 3, 
                    color = "black")p
##############################################################



##############################################################
#Figure 6.12
p <- p + facet_grid(. ~ Ecosystem)p
##############################################################





##############################################################
#Section 6.3

#Function to calculate a new factor.
#Is equivalent of tapply(Zfactor, FUN = mean, INDEX = IndexFactor)
Myfapply <- function(Zfactor, INDEX) {
  INDEX <- factor(INDEX)	
  AllLevels <- levels(INDEX)
  MyNewFactor <- NULL
  for (i in AllLevels) {
	ThisLevel <- as.character(Zfactor[INDEX == i] [1])
	MyNewFactor <- c(MyNewFactor, ThisLevel)
  }
  MyNewFactor <- factor(MyNewFactor)
  MyNewFactor	
}

Myfapply(Methane$Ecosystem, INDEX = Methane$Site)
  




Methane.lm <- data.frame(
                Flux = tapply(Methane$Flux, INDEX = Methane$Site, FUN = mean),
                Temp = tapply(Methane$Temp, INDEX = Methane$Site, FUN = mean),
                Latitude = tapply(Methane$Latitude, INDEX = Methane$Site, FUN = mean),
                Longitude = tapply(Methane$Longitude, INDEX = Methane$Site, FUN = mean),
                Ecosystem = Myfapply(Methane$Ecosystem, INDEX = Methane$Site)
                ) 
Methane.lm


M1 <- lm(Flux ~ Temp * Ecosystem, data = Methane.lm)
summary(M1)
drop1(M1, test = "F")
##############################################################


##############################################################
#Figure 6.13
E1 <- rstandard(M1)
F1 <- fitted(M1)
par(mar = c(5,5,2,2))
plot(x = F1,
     y = E1,
     xlab = "Fitted values",
     ylab = "Residuals",
     cex.lab = 1.5)
abline(h = 0)
##############################################################



tapply(E1, FUN = var, INDEX = Methane.lm$Ecosystem)



##############################################################
#Figure 6.14	
par(mar = c(5,5,2,2)) 
boxplot(E1 ~ Ecosystem,
     xlab = "Ecosystem",
     ylab = "Residuals",
     data = Methane.lm,
     cex.lab = 1.5)
abline(h = 0)
##############################################################




##############################################################
#Figure 6.15
par(mar = c(5,5,2,2))     
plot(x = Methane.lm$Temp,
     y = E1,
     xlab = "Temperature",
     ylab = "Residuals",
     cex.lab = 1.5)
abline(h = 0)
##############################################################



##############################################################
#Figure 6.16
world  <- map_data("world")
MySize <- 10 * sqrt(abs(E1) / max(abs(E1)))
MyCol  <- NULL
MyCol[E1 <= 0 ] <- "grey50"
MyCol[E1 >  0 ] <- "grey10"
p <- ggplot(world, aes(long, lat))  
p <- p + geom_polygon(aes(group = group), fill = "white",
                      color = "gray50", 
                      size = .3)                  
p <- p + geom_point(data = Methane.lm, 
                    aes(Longitude, Latitude),
                    size = MySize, 
                    color = MyCol)
p <- p + xlab("Longitude") + ylab("Latitude")
p <- p + theme(legend.position = "none", 
               text = element_text(size=15))
p             
##############################################################
             



##############################################################
#Figure 6.17
Methane.lm$E1 <- E1   
p <- ggplot(data = Methane.lm, 
            aes(x = E1))
p <- p + geom_histogram(colour = "black", fill = "white", binwidth = 0.5) +
     xlab("Residuals")
p <- p + theme(text = element_text(size = 15))     
p 
##############################################################



##############################################################
#Section 6.3.4: Figures 6.18 - 6.20
range(Methane.lm$Temp)

#Wrong approach
MyData <- expand.grid(Temp = seq(2.017286, 1.980298, length = 5),
                      Ecosystem = c("Aquatic", "RicePaddy", "Wetland"))

RangeTemp <- tapply(Methane.lm$Temp, 
                    FUN = range, 
                    INDEX = Methane.lm$Ecosystem)
RangeTemp
                      
                      

MyData1 <- data.frame(Temp = seq(-0.72, 1.17, length = 5),
                      Ecosystem = rep("Aquatic", 5))

MyData2 <- data.frame(Temp = seq( 0.29, 1.98, length = 5),
                      Ecosystem = rep("RicePaddy", 5))

MyData3 <- data.frame(Temp = seq(-2.01, 1.80, length = 5),
                      Ecosystem = rep("Wetland", 5))
MyData <- rbind(MyData1, MyData2, MyData3)
MyData$Ecosystem <- factor(MyData$Ecosystem)               
MyData


P1 <- predict(M1, newdata = MyData, se = TRUE)
MyData$Fit <- P1$fit
MyData$Fit975 <- P1$fit + 1.96 * P1$se.fit
MyData$Fit025 <- P1$fit - 1.96 * P1$se.fit



#Figure 6.20
p <- ggplot()
p <- p + xlab("Temperature") + ylab("Flux")
p <- p + theme(text = element_text(size=15)) 
p <- p + theme_bw()
p <- p + geom_point(data = Methane.lm, 
                    aes(y = Flux, x = Temp),
                    shape = 16,
                    size = 3)
p <- p + geom_line(data = MyData, 
                   aes(x = Temp, y = Fit, group = Ecosystem), 
                   colour = "black")
p


#Figure 6.18
#Add polygons with 95% CIs
p <- p + geom_ribbon(data = MyData, 
                     aes(x = Temp, 
                         ymax = Fit975, 
                         ymin = Fit025,
                         group = Ecosystem#,
                         #fill  = Ecosystem
                         ),
                         alpha = 0.5)
p 



#And this is the full code for Figure 6.19
p <- ggplot()
p <- p + geom_point(data = Methane.lm, 
                    aes(y = Flux, x = Temp),
                    shape = 16, 
                    colour = "black")
p <- p + xlab("Temperature") + ylab("Flux")
p <- p + theme(text = element_text(size=15)) 
p <- p + theme_bw()
p <- p + geom_line(data = MyData, aes(x = Temp, y = Fit))
p <- p + geom_ribbon(data = MyData, 
                     aes(x = Temp, 
                         ymax = Fit975, 
                         ymin = Fit025),
                         alpha = 0.5)
p <- p + facet_grid(. ~ Ecosystem, scales = "fixed")
p 
#########################################################





#########################################################
#Section 6.4
library(lme4)
M2 <- lmer(Flux ~ Temp * Ecosystem + (1 | Site), 
          data = Methane)
summary(M2)

E2 <- resid(M2)


#Figure 6.21
Methane$Fit <- fitted(M2)
p <- ggplot()
p <- p + xlab("Temperature") + ylab("Flux")
p <- p + theme(text = element_text(size = 15)) 
p <- p + theme_bw()
p <- p + geom_point(data = Methane, 
                    aes(y = Flux, x = Temp),
                    shape = 16, 
                    colour = "grey60")
p <- p + theme(strip.text.x = element_text(size = 20, colour = "black", angle = 0))
p <- p + geom_line(data = Methane, aes(x = Temp, y = Fit, group = Site))
p <- p + facet_grid(. ~ Ecosystem, scales = "fixed")
p 

