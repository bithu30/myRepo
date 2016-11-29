#    A Beginner's Guide to Data Exploration and Visualization with R
#    Elena Ieno & Alain Zuur

#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.



################################################################################
Mussels <- read.table(file = "Mussels.txt", 
                      header = TRUE)
names(Mussels)
# "LengthM"  "BiomassM" "LengthD"  "BiomassD"


#Figure 4.1    (A and B)
Biomass <- c(Mussels$BiomassM, Mussels$BiomassD)
Length  <- c(Mussels$LengthM, Mussels$LengthD)
ID      <- rep(c("Mesodesma", "Donax"), each = 154)
MyPch   <- rep(c(1, 17), each = 154)

par(mfrow = c(1,2), mar = c(5,5,2,2))
plot(x = Length,
     y = Biomass,
     xlab = "Length (mm)",
     ylab = "Biomass (mg)",
     cex.lab = 1.5,
     pch = MyPch,
     cex = 1.5)
text(10,1.55,"A", cex = 1.5)

legend(x = 4,
       y = 1.45,
       legend = expression (italic("M. mactroides"),
                            italic("D. hanleyanus")),
       horiz = FALSE,
       pch = c(1, 17), 
       cex = 1.5, 
       bty = "n")

LogLength  <- log(Length)
LogBiomass <- log(Biomass)
plot(x = LogLength,
     y = LogBiomass,
     xlab = "Log Length (mm)",
     ylab = "Log Biomass (mg)",
     cex.lab = 1.5,
     pch = MyPch,
     cex = 1.5)
text(1.9,0.45,"B", cex = 1.5)

legend(x = log(5),
       y = log(1),
       legend = expression (italic("M. mactroides"),
                            italic("D. hanleyanus")),
       horiz = FALSE,
       pch = c(1,17), cex = 1.5, bty = "n")


#Figure 4.2
Rabbits <- read.table(file = "rabbit.txt",
                      header = TRUE)

par(mfrow = c(1,1), mar = c(5,5,2,2), cex.lab = 1.5)
plot(y = Rabbits$RbyP_index,
     x = Rabbits$year,
     pch = 16,
     ylab = "Rabbit/partridge index",
     xlab = "Year")

M.loess <- loess(RbyP_index ~ year,
                 data = Rabbits)
Fit <- fitted(M.loess)
lines(x = Rabbits$year,
      y = Fit,
      lwd = 2)


#Figure 4.3
Maggot <- read.table(file = "maggot.txt",
                     header = TRUE)

par(mfrow = c(1,1), mar = c(5,5,2,2), cex.lab = 1.5)
plot(y = Maggot$Length,
     x = Maggot$Series,
     xlab = "Time",
     ylab = "Maggot length")
M.Loess <- loess(Length ~ Series, 
                 data = Maggot)
Fit <- fitted(M.Loess)
lines(x = Maggot$Series, 
      y = Fit)


#Figure 4.4
Poly <- read.table(file = "Zoobenthos.txt",
                   header = TRUE)

MyVar <- c("Glyceridae", "Spionidae",
           "Nephtydae", "Lumbrineridae",
           "Terebellidae", "Capitellidae")
SpAbund <- as.vector(as.matrix(Poly[, MyVar]))
ID      <- rep(MyVar, each = 80)
Silt    <- rep(Poly$silt, 6)

library(lattice)
xyplot(SpAbund ~ Silt | factor(ID),
       data = Poly,
       xlab = list(label = "Silt content", cex = 1.5),
       ylab = list(label = "Abundance", cex = 1.5),
       scales = list(alternating = TRUE,
                     x = list(relation = "same"),
                     y = list(relation = "same")),
       panel = function(x, y){
                panel.points(x, y, pch = 16, col = 1)
                panel.loess(x, y, col = 1, span = 0.7)})


#Figure 4.5
BL <- read.table(file = "HegerPriede.txt",
                 header = TRUE)

library(lattice)
xyplot(Sources ~ Depth|factor(Station),
       ylab = list(label = expression(paste("Sources (",m^-3,")")), cex = 1.5),
       xlab = list(label = "Depth (m)", cex = 1.5),
       data = BL,
       col = 1,
       type = "l",
       lwd = 2)


#Figure 4.6
MyVar <- c("Sources", "Depth", "flcugl", "Temp")
pairs(BL[, MyVar], 
      upper.panel = panel.smooth)


#Figure 4.7
Squid <- read.table(file = "Squid.txt",
                    header = TRUE)

par(mfrow = c(1,1), mar = c(5,5,2,2), cex.lab = 1.5)
pairs(Squid[c(1,2,3)],
      cex = 1.5,
      pch = c(1,16)[unclass(Squid$Species)],
      label = c("Weight", "Mantel length", "Lower rostral length"),
      lower.panel = NULL,
      cex.labels = 2)


#Figure 4.8
MyVar <- c("Phyllodocidae", "Spionidae",
           "Maldanidae", "Glyceridae",
           "Onuphidae", "Lumbrineridae")

par(mfrow = c(1,1), mar = c(5,5,2,2), cex.lab = 1.5)
pairs(Poly[, MyVar])


#Figure  4.9
IrishpH <- read.table(file = "IrishpH.txt",
                      header = TRUE)

IrishpH$LOGAltitude <- log10(IrishpH$Altitude)
IrishpH$fForested <- factor(IrishpH$Forested,
                            levels = c(1, 2),
                            labels = c("Forested", "Not forested"))

library(lattice)
xyplot(pH ~ LOGAltitude | fForested,
       data = IrishpH,
       strip = strip.custom(bg = 'white',
                            par.strip.text = list(cex = 1.5)),
       xlab = list(label = "Log altitude", cex = 1.5),
       ylab = list(label = "pH", cex = 1.5),
       panel = function(x, y) { 
                 M1 <- lm(y ~ x)
                 panel.abline(M1, lwd = 3)
                 panel.points(x, y, pch = 16, col =1) })


#Figure 4.10
coplot(pH ~ LOGAltitude | fForested,
       data = IrishpH,
       panel = function(x, y, ...) {
           tmp <- lm(y ~ x, na.action = na.omit)
           abline(tmp)
           points(x, y) })


#Figure 4.11
Limosa <- read.table(file = "limosa.txt",
                     header = TRUE)
Limosa$Bplumage01 <- Limosa$Bplumage
Limosa$Bplumage01[Limosa$Bplumage01>0] <- 1
Limosa$fBplumage01 <- factor(Limosa$Bplumage01)
Limosa$fplumage <- factor(Limosa$Bplumage01,
                          levels = c(0, 1),
                          labels = c("NonBreeding", "Breeding"))


library(lattice)
xyplot(IntakeRate ~ Time | fplumage,
       data = Limosa,
       strip = strip.custom(bg = 'white',
                   par.strip.text = list(cex = 1.5)),
       xlab = list(label = "Time", cex = 1.5),
       ylab = list(label = "Intake rate", cex = 1.5),
       panel = function(x, y) {
                 M1 <- lm(y ~ x)
                 panel.abline(M1, lwd = 3)
                 panel.points(x, y, pch = 16, col =1) })


#Figure 4.12
coplot(pH ~ LOGAltitude | SDI * fForested,
       number = 4 ,
       data = IrishpH,
       panel = function(x, y, ...) {
               tmp <- lm(y ~ x, na.action = na.omit)
               abline(tmp)
               points(x, y)})


#Figure 4.13
TF <- read.table(file = "Trifur.txt",
                 header = TRUE)

TF$fsex <- factor(TF$Sex,
                  labels = c("Female", "Male"))
TF$farea <- factor(TF$Area)


library(lattice)
xyplot(Trifur~LT |farea*fsex,
       data = TF,
       strip = strip.custom(bg = 'white',
       par.strip.text = list(cex = 1.5)),
       xlab = list(label = "Length (cm)", cex = 1.5),
       ylab = list(label =  expression(paste("Prevalence of ",italic("T.tortuosus"),   
                                             sep = "")),
                   cex = 1.5),
       panel = function(x, y) {
                 N1 <- sum(y == 1)
                 N0 <- sum(y == 0)
                 if(N0 > 5 & N1 > 5 ) {
                     tmp <- glm(y ~ x, family = binomial, na.action = na.omit)
                     MyDat <- data.frame(x = seq(from = min(x, na.rm = TRUE),
                                                 to = max(x, na.rm = TRUE),
                                                 length = 25))
                     P1 <- predict(tmp, newdata = MyDat, type = "response")
                     panel.lines(MyDat$x, P1, lwd = 3, col = 1)
                    }
                  panel.points(x, y, pch = 16, col = 1) })


#Figure 4.14
Bio <- read.table(file = "Biodiversity.txt",
                  header = TRUE)

Bio$fNutrient <- factor(Bio$Nutrient)
Bio$Treatment
plot.design(Concentration ~ Nutrient+ Treatment,
            data = Bio,
            ylab = expression(paste("Concentration (mg", l^-1,")")))


#Figure 4.15
interaction.plot(Bio$Nutrient,
                 Bio$Treatment,
                 Bio$Concentration,
                 legend = FALSE,
                 lty = c(1, 2),
                 xlab = "Nturient ID",
                 ylim = c(0,16),
                 ylab = "Concentration",
                 main = "Interaction Plot")

legend("topright",
       c("Algae", "Non Algae"),
       bty = "o",
       lty = c(1,2),
       cex = 0.8,
       title = "Treatment")

#######################################End of Code##############################