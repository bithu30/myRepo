#    A Beginner's Guide to Data Exploration and Visualization with R
#    Elena Ieno & Alain Zuur

#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.



################################################################################
TF <- read.table(file = "Trifur.txt", 
                 header = TRUE)

MyVar <- c("Weight", "LT")
cor(TF[ ,MyVar])

TF$WeightNew <- TF$Weight
TF$WeightNew[TF$Weight == 420] <- 4200
head(TF$WeightNew, 15)

MyVar <- c("WeightNew", "LT")
cor(TF[ ,MyVar ])

MyVar <- c("Weight", "LT", "LS")
cor(TF[ , MyVar])



#Figure 5.1
Spiders <- read.table(file = "Spiders.txt",
                      header = TRUE)

source("HighstatLibV7.R")

Spiders2 <- na.exclude(Spiders)
MyVar <- c("GVC", "HLC", "SLC", "NLC", "LC",
           "FWDC", "CWDC", "LLC", "MLD",
           "OM")

pairs(Spiders2[,MyVar],
      lower.panel = panel.cor)


#Figure 5.2
Ozone <- read.table(file = "Ozone.txt",
                    header = TRUE)

Ozone$TW <- Ozone$temp * Ozone$wind
MyVar <- c("temp", "wind", "rad", "TW")

pairs(Ozone[, MyVar],
      lower.panel = panel.cor)


#Figure 5.3
Benthos <- read.table(file = "Macrobenthos.txt",
                      header = TRUE)

Benthos$fCT     <- factor(Benthos$CT)
Benthos$fPeriod <- factor(Benthos$period)

library (lattice)
MyY <- c("o_matter", "mud", "silt", "clay")
Mybwplot(Benthos, MyY, "fCT")


#Figure 5.4
library (lattice)
MyY <- c("o_matter", "mud", "silt", "clay")
Mybwplot(Benthos, MyY, "fPeriod")


#Figure 5.5. Fit of the linear regression model applied on the simulated
#data.
#Stable solution

set.seed(12345)
x1 <- rnorm(30)
x2 <- rnorm(30)
z <- 2 + 0.25 * x1 + 1.6 * x2 + rnorm(30,mean=0,sd=0.1)
M <- lm(z~x1+x2)
summary(M)

surf <-  expand.grid(x1 = seq(-2.5,2.5,length = 25), x2 = seq(-2.5,2.5,length=25))
surf$z <- M$coeff[1] + M$coeff[2]*surf$x1 + M$coeff[3]*surf$x2
pts <- data.frame(x1 = x1, x2 = x2, z = z)

wireframe(z ~ x1 * x2, 
          data = surf, 
          aspect = c(1, .5),
          main =  "Stable linear regression solution",
          scales = list(arrows = FALSE),
          pts = pts,
          panel.3d.wireframe =
          function(x, y, z,
                   xlim, ylim, zlim,
                   xlim.scaled, ylim.scaled, zlim.scaled,
                   pts,
                   ...) {
              panel.3dwire(x = x, y = y, z = z,
                           xlim = xlim, ylim = ylim, zlim = zlim,
                           xlim.scaled = xlim.scaled,
                           ylim.scaled = ylim.scaled,
                           zlim.scaled = zlim.scaled, ...)
              xx <-xlim.scaled[1] + diff(xlim.scaled) * (pts$x1 - xlim[1]) / diff(xlim)
              yy <-ylim.scaled[1] + diff(ylim.scaled) * (pts$x2 - ylim[1]) / diff(ylim)
              zz <-zlim.scaled[1] + diff(zlim.scaled) * (pts$z - zlim[1]) / diff(zlim)
              panel.3dscatter(x = xx, y = yy, z = zz,
                              xlim = xlim, ylim = ylim, zlim = zlim,
                              xlim.scaled = xlim.scaled,
                              ylim.scaled = ylim.scaled,
                              zlim.scaled = zlim.scaled,
                              pch=16,cex=1.5,col=1, ...)
          })


#Figure 5.6.
#Not stable
x1    <- rnorm(30)
x2    <- x1
x2[1] <- x1[1]* 0.95
cor(x1, x2)

z <- 2 + 0.25 * x1 + 1.6 * x2 + rnorm(30,mean=0,sd=0.1)
M <- lm(z~x1+x2)
summary(M)

surf   <-  expand.grid(x1 = seq(-2.5,2.5,length=25), x2 = seq(-2.5,2.5,length=25))
surf$z <- M$coeff[1] + M$coeff[2]*surf$x1 + M$coeff[3]*surf$x2
pts    <- data.frame(x1 = x1, x2 = x2, z = z)

wireframe(z ~ x1 * x2, 
          data = surf, 
          aspect = c(1, .5),
          main =  "Unstable linear regression solution",
          scales = list(arrows = FALSE),
          pts = pts,
          panel.3d.wireframe =
          function(x, y, z,
                   xlim, ylim, zlim,
                   xlim.scaled, ylim.scaled, zlim.scaled,
                   pts,
                   ...) {
              panel.3dwire(x = x, y = y, z = z,
                           xlim = xlim, ylim = ylim, zlim = zlim,
                           xlim.scaled = xlim.scaled,
                           ylim.scaled = ylim.scaled,
                           zlim.scaled = zlim.scaled, ...)
              xx <-xlim.scaled[1] + diff(xlim.scaled) * (pts$x1 - xlim[1]) / diff(xlim)
              yy <-ylim.scaled[1] + diff(ylim.scaled) * (pts$x2 - ylim[1]) / diff(ylim)
              zz <-zlim.scaled[1] + diff(zlim.scaled) * (pts$z - zlim[1]) / diff(zlim)
              panel.3dscatter(x = xx, y = yy, z = zz,
                              xlim = xlim, ylim = ylim, zlim = zlim,
                              xlim.scaled = xlim.scaled,
                              ylim.scaled = ylim.scaled,
                              zlim.scaled = zlim.scaled,
                              pch=16,cex=1.5,col=1, ...)
          })



#Figure 5.7
R2  <- seq(0, 0.99, length = 30)
VIF <- 1 / (1 - R2)

par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(x = R2,
     y = sqrt(VIF),
     type = "l",
     xlab = expression(paste(R^2)),
     ylab = expression(sqrt(VIF)))

#source(file = " HighstatLibV8.R")
MyVar <- c("GVC", "HLC", "SLC", "NLC", "LC",
           "FWDC", "LLC", "CWDC","MLD", "OM","X","Y")

corvif(Spiders2[,MyVar])
MyVar <- c("GVC", "HLC", "SLC", "NLC", "LC",
           "FWDC","CWDC","MLD", "OM","X","Y")

corvif(Spiders2[,MyVar])

MyVar <- c("GVC", "HLC", "SLC","LC",
           "FWDC","CWDC","MLD", "OM","X","Y")

corvif(Spiders2[,MyVar])

M <- lm(GVC ~ HLC + SLC + LC + FWDC + CWDC +
              MLD + OM + X + Y,
        data = Spiders2)
VIF <- 1 / (1 - summary(M)$r.squared)
VIF


X <- TF[, c("Weight", "LS", "LT")]
corvif(X)

TF$fSex<- factor(TF$Sex)
TF$fArea<- factor(TF$Area)

X2 <- TF[, c("Weight", "LS", "LT", "fSex","fArea")]
corvif(X2)


#Figure 5.8
MyVar <- c("GVC", "HLC", "SLC", "NLC", "LC",
           "FWDC", "CWDC", "LLC", "MLD","OM", "X", "Y")

cor_PCA <- princomp(Spiders2[, MyVar],
                    cor = TRUE)

biplot(cor_PCA,
       choices = 1:2,
       scale = 0,
       cex = c(0.5, 1.5),
       col = 1,
       arrow.len = 0,
       xlim = c(-3,4), 
       ylim = c(-3, 4),)


#Figure 5.9
Loyn <- read.table(file = "loyn.txt",
                   header = TRUE)

par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(YR.ISOL ~ factor(GRAZE),
        ylab = "Year of isolation",
        xlab = "Graze level", 
        data = Loyn)


Loyn$LOGAREA  <- log10(Loyn$AREA)
Loyn$LOGDIST  <- log10(Loyn$DIST)
Loyn$LOGLDIST <- log10(Loyn$LDIST)
M1 <- lm(ABUND ~ LOGAREA + LOGDIST + LOGLDIST +
                 YR.ISOL + ALT + factor(GRAZE),
         data = Loyn)
drop1(M1,test = "F")

M2 <- lm(ABUND ~ LOGAREA + LOGDIST + LOGLDIST +
                 YR.ISOL + ALT,
         data = Loyn)
drop1(M2,test = "F")



#Figure 5.10. Number of stork pairs plotted versus birth rate in 17
#European countries.
Storks <- c(100, 300, 1, 5000, 9, 140, 3300, 2500, 4, 
            5000, 5, 30000, 1500, 5000, 8000, 150, 25000)
BirthRate <- c(83, 87, 118, 117, 59, 774, 901, 106, 188, 
               124, 551, 610, 120, 367, 439, 82, 1576)

par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(x = Storks,
     y = BirthRate,
     cex.lab = 1.5,
     ylab = "Birth rate (10,000 / yr)",
     xlab = "Storks (pairs)",
     pch = 16)
M1 <- lm(BirthRate ~ Storks)
abline(M1, lwd = 3)


#Figure 5.11.
CM <- read.table(file = "CommonMurre.txt",
                 header = TRUE)
names(CM)

library(lattice)
CM$fMonth <- factor(CM$Month, 
                    levels = c(11, 1, 3),
                    labels = c("November", "January", "March"))

CM$fWinter <- factor(CM$Winter, 
                     levels = c(2, 3),
                     labels = c("Winter 2007/2008", "Winter 2008/2009"))
               

xyplot(Midpointlat ~ Midpointlong | fWinter * fMonth, 
       col = 1,
       strip = function(bg='white', ...) 
          strip.default(bg='white', ...),
       par.strip.text = list(cex = 1.5),
       scales = list(alternating = TRUE,
                     x = list(relation = "same"),
                     y = list(relation = "same")),
       xlab = list(label = "Longitude", cex = 1.5),
       ylab = list(label = "Latitude", cex = 1.5),
       aspect = "iso", 
       cex = 0.5,
       data = CM)


#Figure 5.12
PB <- read.table(file = "PolarBears.txt",
                 header = TRUE)


MF <- function(x){ length(unique(x)) }

NBears <- tapply(PB$BearID, INDEX = PB$YEAR,FUN = MF)

par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(x = 1988:1999, 
     y = NBears,
     pch = 16,
     xlab = "Year",
     ylab = "Number of bears with working tag")

##################################End of code###################################