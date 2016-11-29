#    A Beginner's Guide to Data Exploration and Visualization with R
#    Elena Ieno & Alain Zuur

#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.


################################################################################
#IrishpH Data
#Figure 2.1

IrishpH <- read.table(file = "IrishpH.txt",
                      header = TRUE,
                      dec = ".")

par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(IrishpH$Altitude, ylab = "Altitude")


#Figure 2.2
Crayfish <- read.table(file = "Procambarus.txt",
                         header = TRUE,
                         dec = ".")

par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(Crayfish$CTL,
          ylab = "Cephalothorax length",
          main = expression(italic("Procambarus clarkii")))


#Figure 2.3
par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(CTL ~ Month,
        ylab = "Cephalothorax Length",
        xlab = "Month", 
        data= Crayfish,
        main = expression(italic("Procambarus clarkii")))

identify(y = Crayfish$CTL,
         x = Crayfish$Month)


table(Crayfish$Maturity)

# 0   1   2   3   4
# 1 369 326  40  10


#Figure 2.4
Crayfish2 <- Crayfish[Crayfish$Maturity != 0, ]

par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(CTL ~ Maturity, data = Crayfish2,
        ylab = "Cephalothorax length",
        xlab = "Sexual maturity",
        main = expression(italic("Procambarus clarkii")),
        varwidth = TRUE)

#Figure 2.5
Crayfish$fSex <- factor(Crayfish$Sex,
                        levels = c("f", "m"),
                        labels = c("Female", "Male"))

library (lattice)
bwplot(CTL ~ fSex | Month, data = Crayfish ,
      ylab = list(label = "Cephalothorax length", cex = 1.5),
      strip = strip.custom(bg = 'white',
      par.strip.text = list(cex = 1.2)),
      scales = list(rot = 45, cex = 1.3),
      par.settings = list(
        box.rectangle = list(col = 1),
        box.umbrella  = list(col = 1),
        plot.symbol   = list(cex = .5, col = 1)))


#Figure 2.6
par(mar = c(5,5,2,2), cex.lab = 1.5, cex.main = 1.5)
dotchart(IrishpH$Altitude,
         main = "Altitude",
         ylab = "Order of the data",
         xlab = "Range of the data")
           

#Figure 2.7
IrishpH$ID <- 1 : nrow(IrishpH)

par(mar = c(5,5,2,2), cex.lab = 1.5, cex.main = 1.5)
plot(y = IrishpH$ID,
     x = IrishpH$Altitude,
     ylab = "Order of the data",
     xlab = "Range of the data",
     main = "Altitude",
     pch = 16)

identify(y = IrishpH$ID, x = IrishpH$Altitude)



#Figure 2.8
IrishpH$fForested <- factor(IrishpH$Forested,
                            levels = c(1, 2),
                            labels = c("Forested", "Non-forested"))
           
par(mar = c(5,5,2,2), cex.lab = 1.5, cex.main = 1.5)           
dotchart(IrishpH$pH,
         groups = IrishpH$fForested,
         main = "pH",
         xlab = "Range of the data")

#Figure 2.9
library(lattice)
SelX <- c("pH", "Altitude", "SDI")
dotplot(as.matrix(IrishpH[, SelX]),
        groups = FALSE, 
        layout = c(3, 1),
        strip  = strip.custom(bg = 'white',
        par.strip.text = list(cex = 1.2)),
        scales = list(x = list(relation = "free", draw = TRUE),
                      y = list(relation = "free", draw = FALSE)),
        col  = 1, 
        cex  = 0.5, 
        pch = 16,
        xlab = list(label = c("Value of the variable"), cex = 1.5),
        ylab = list(label = c("Order of the data"), cex = 1.5))
          
          
#Figure 2.10
par(mfrow = c(1, 2), mar = c(5, 4, 1, 1), cex.lab = 1.5)
dotchart(Crayfish$PLsx,
         ylab = "Order of the data",
         xlab = "Range of the data")

boxplot(Crayfish$PLsx,
        ylab = "Range of the data")

 

#Workerbees data
Wbees <- read.table(file = "workerbees.txt",
                    header = TRUE)

min(Wbees$cell)
#0.014

max(Wbees$cell)
#0.753

library(outliers)
grubbs.test(Wbees$cell, type = 10)

# Grubbs test for one outlier
# data: Wbees$cell
# G = 9.8516, U = 0.9670, p-value < 2.2e-16
# alternative hypothesis: lowest value 0.014 is an outlier


#Figure 2.11
par(mar = c(5, 5, 2, 2), cex.lab = 1.5)
plot(x = Wbees$cell,
     y = 1:nrow(Wbees),
     xlab = "Cell size",
     ylab = "Order of the data",
     pch = 16)


grubbs.test(Wbees$cell, 
            type = 10,
            opposite = TRUE)


#Figure 2.12
Wclam <- read.table(file = "wedgeclamII.txt",
                    header = TRUE)

Wclam$LOGAFD    <- log10(Wclam$AFD)
Wclam$LOGLENGTH <- log10(Wclam$LENGTH)

par(mar = c(5, 5, 2, 2), cex.lab = 1.5, cex.main = 1.5)
plot(x = Wclam$LOGLENGTH,
     y = Wclam$LOGAFD,
     xlab = "Length",
     ylab = "Weight",
     main = "Wedge clam")

identify(x = Wclam$LOGLENGTH, y = Wclam$LOGAFD)


#Figure 2.13
M1 <- lm(LOGAFD ~ LOGLENGTH, data = Wclam)
M2 <- lm(LOGAFD ~ LOGLENGTH, data = Wclam,
         subset = -108)
           
par(mfrow = c(2, 1), mar = c(5, 5, 2, 2), cex.lab = 1.5, cex.main = 1.5)
plot(M1, which = 4)
plot(M2, which = 4)


#Figure 2.14
Cockles <- read.table(file = "Cockles.txt",
                      header = TRUE)
                        
par(mar = c(5, 5, 2, 2), cex.lab = 1.5)                        
boxplot(Cockles$Concentration,
        ylab = "Concentration",
        main = "NH4 Concentration")


#Figure 2.15
Heteromastus <- read.table(file = "pellets.txt",
                             header = TRUE)

#A log transformation is then applied.
LogHeter <- log10(Heteromastus$Length)

par(mfrow = c(1, 2), mar = c(5, 5, 2, 2), cex.lab = 1.5, cex.main = 1.5, width = 700)
dotchart(Heteromastus$Length,
         ylab = "Order of the data",
         xlab = "Range of length",
         main = "Length data")

dotchart(LogHeter, 
         ylab = "Order of the data",
         xlab = "Range of length",
         main = "Log-transformed length data")



#Figure 2.16
Clam <- read.table(file = "Clams.txt",
                   header = TRUE)

max(Clam$Size)
SizeReflect <- 45.1 - Clam$Size
Size2       <- sqrt(SizeReflect)

par(mfrow = c(3, 1), mar = c(5, 5, 2, 2), cex.lab = 1.5)
dotchart(Clam$Size,
         ylab = "Order of the data",
         xlab = "Range of size (mm)")

dotchart(SizeReflect,
         ylab = "Order of the data",
         xlab = "Range of size (mm)")

dotchart(Size2,
         ylab = "Order of data",
         xlab = "Range of size (mm)")



#Figure 2.17
Varroa <- read.table(file = "Varroa_M.txt",
                     header = TRUE)
                      
Varroa.PCA <- princomp(~ WDS + WMS + WGS + WAS,
                       data = Varroa,
                       cor = TRUE)
biplot(Varroa.PCA)

#Figure 2.18
#We reproduce the same PCA biplot, after removing two observations.
Varroa2 <- Varroa[c(-319, -333), ]
Varroa2.PCA <- princomp(~ WDS + WMS + WGS+ WAS,
                        data = Varroa2,
                        cor = TRUE)
biplot(Varroa2.PCA)



NewH_similis <- Heteromastus$Width[Heteromastus$month == 8]
#Compute the mean and the median.
mean(NewH_similis)
#0.3452874
median(NewH_similis)
#0.4

LogNewH_similis <- log10(NewH_similis)
#and the mean and median of the log transform variable are
mean(LogNewH_similis)
# -0.5057098
median(LogNewH_similis)
#-0.39794
10^(-0.5057098)
#0.3120974
10^(-0.39794)
#0.4

#End of code