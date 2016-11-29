#    A Beginner's Guide to Data Exploration and Visualization with R
#    Elena Ieno & Alain Zuur

#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.



################################################################################
#Figure 3.1
library(lattice)
set.seed(12345)
x1 <- sort(runif(100))
y1 <- 1 + 2 * x1 + rnorm(100, 0, 0.2)

par(mfrow = c(1,2), mar = c(5,5,2,2), cex.lab = 1.5)
plot(x = x1,
     y = y1,
     xlab = "Covariate",
     ylab = "Response variable",
     cex.lab = 1.5)

M1 <- lm(y1 ~ x1)
abline(M1, lwd = 3)
text(0, 3.2, "A", cex = 2)

#And add this for the points
plot(x = x1,
     y = y1,
     xlab = "Covariate",
     ylab = "Response variable",
     cex.lab = 1.5)
text(0, 3.2, "B", cex = 2)

M1 <- lm(y1 ~ x1)
abline(M1, lwd = 3)

ps <- seq(1, 100, length = 10)
for (i in 1:10){
	yr <- rnorm(100, mean = coef(M1)[1] + coef(M1)[2] * x1[ps[i]], sd = 0.23)
	points(rep(x1[ps[i]], 100),
	       yr, pch = 16)
}


#Figure 3.2
Sparrows <- read.table(file = "Sparrows.txt",
                       header = TRUE)
                       
Sparrows2 <- Sparrows[Sparrows$Species == "SSTS",]

par(mar = c(5,5,2,2), cex.lab = 1.5)
hist(Sparrows2$Wt,
     xlab = "Weight in grams",
     main = expression(italic("Ammodramus caudacutus ")))


#Figure 3.3
library(lattice)
histogram(~ Wt|factor(Observer),
          data = Sparrows2,
          layout = c(1, 7),
          nint = 30,
          xlab = list("Weight in grams", cex.lab = 1.5),
          strip = FALSE,
          strip.left = TRUE,
          ylab = "Frequencies")

#Figure 3.4
M1 <- lm(Wt ~ factor(Sex)+ factor(Age) +
              factor(Observer),
         data = Sparrows2)
E1 <- rstandard(M1)
 
par(mar = c(5,5,2,2), cex.lab = 1.5)
hist(E1, xlab = "Residuals", main = "")


#Figure 3.5
d <- density(Sparrows$Wt)
Sparrows$fSpecies <- factor(Sparrows$Species,
                            levels = c("SESP","SSTS"),
                            labels = c("A.maritimus",
                                       "A.caudacutus"))
                                  
par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(d,
     xlab = "Weights (in grams)",
     cex.lab = 1.5,
     cex.main = 1.5,
     main = "",
     xlim = c(15,28),
     ylim = c(0, 0.35),
     lwd = 5)

d1 <- density(Sparrows$Wt[Sparrows$fSpecies == "A.maritimus"])
d2 <- density(Sparrows$Wt[Sparrows$fSpecies == "A.caudacutus"])

lines(d1, lty = 2, lwd = 2)
lines(d2, lty = 3, lwd = 2)
legend("topright",
        legend = expression("Both Species",
                        italic("A. maritimus"),
                        italic("A. caudacutus")),
        lty = c(1, 2, 3),
        lwd = c(5, 2, 2))
         
         
#Figure 3.6
par(mar = c(5,5,2,2), cex.lab = 1.5) 
qqnorm(E1)
qqline(E1)


#Figure 3.7
library(lattice)
qqmath (~Wt|fSpecies,
        data = Sparrows,
        cex = 1, col = 1,
        ylab = list("Weight (in grams)", cex.lab = 1.5),
        xlab = list("Theoretical Quantiles", cex.lab = 1.5))
          

#NORMALITY TESTS
Clam <- read.table(file = "Clams.txt",
                   header = TRUE)

ks.test(Clam$Size, pnorm)
#data:  Clam$Size
#D = 1, p-value < 2.2e-16
#alternative hypothesis: two-sided

#Warning message:
#In ks.test(Clam$Size, pnorm) :
#  ties should not be present for the Kolmogorov-Smirnov test


shapiro.test(Clam$Size)
#Shapiro-Wilk normality test
#data:  Clam$Size
#W = 0.9826, p-value = 0.5812


library(moments)
agostino.test(Clam$Size)
#   D'Agostino skewness test
#data:  Clam$Size
#skew = -0.0155, z = -0.0347, p-value = 0.9723
#alternative hypothesis: data have a skewness

ks.test(Sparrows2$Wt, pnorm)
# One-sample Kolmogorov-Smirnov test
# data:  Sparrows2$Wt
# D = 1, p-value < 2.2e-16
# alternative hypothesis: two-sided

# Warning message:
# In ks.test(Sparrows2$Wt, pnorm) :
# ties should not be present for the Kolmogorov-Smirnov test

shapiro.test(Sparrows2$Wt)
#W = 0.9771, p-value = 2.175e-10

library(moments)
agostino.test(Sparrows2$Wt)

#D'Agostino skewness test
#data:  Sparrows2$Wt
#skew = -0.3581, z = -2.7689, p-value = 0.005624
#alternative hypothesis: data have a skewness

#Generate random  numbers from a normal distribution
#with mean = 0 and standard deviation 1
hist((rnorm(10000, mean = 0, sd = 1)))
hist((rnorm(800, mean = 0, sd = 1)))
hist((rnorm(50, mean = 0, sd = 1)))


#Figure 3.8
Benthos <- read.table(file = "Macrobenthos.txt",
                      header = TRUE)
Benthos$fTaxonID <- factor(Benthos$TaxonID,
                           levels = c(1, 2, 3, 4, 5),
                           labels = c ("Mol","Cru","Ech","Sip","Pol"))

par(mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(Abundance ~ fTaxonID,
        ylab = "Abundance", 
        data = Benthos)


#Figure 3.9
Fseal<- read.table(file = "Fur_seal.txt",
                   header = TRUE)
                    
Fseal$Sex2 <- Fseal$Sex
Fseal$Sex2[Fseal$Sex == 1] <- 1
Fseal$Sex2[Fseal$Sex == 2] <- 16
 
par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(x = Fseal$IS,
     y = Fseal$VAR26,
     pch = Fseal$Sex2,
     ylab = "Longitudinal length of lower alveoli",
     xlab = "Age",
     main = "Fur Seal")
    
#Tests for homogeneity of variances
bartlett.test(Abundance ~ fTaxonID,
              data = Benthos)
var.test(Benthos$CT, Benthos$Abundance)

library(lawstat)
levene.test(Benthos$Abundance,
            Benthos$fTaxonID,
            location = c("mean"), 
            trim.alpha = 0.25)


M1 <- lm(Wt ~ factor(Sex) + factor(Age) +
              factor(Observer),
         data = Sparrows2)
E1 <- rstandard(M1)

#Next we apply the Bartlett test.
bartlett.test(E1 ~ factor(Sex), data=Sparrows2)
bartlett.test(E1 ~ factor(Age), data=Sparrows2)
bartlett.test(E1 ~ factor(Observer),
              data = Sparrows2)

tapply(E1, FUN = var, INDEX = Sparrows2$Sex)


#Figure 3.10
par(mfrow = c(2, 2), mar = c(5,5,2,2), cex.lab = 1.5)
boxplot(E1 ~ factor(Sex),
        data = Sparrows2,
        xlab = "Sex",
        ylab = "Residuals")

boxplot(E1 ~ factor(Age),
        data = Sparrows2,
        xlab = "Age",
        ylab = "Residuals")

boxplot(E1 ~ factor(Observer),
        data = Sparrows2,
        xlab = "Observer",
        ylab = "Residuals")
          

#Figure 3.11
BL <- read.table(file = "HegerPriede.txt",
                 header = TRUE)

BL2 <- BL[BL$Station!=52&BL$Station!=53,]

library(mgcv)
M1 <- gam(Sources ~ s(Depth) + factor(Location),
          data = BL2)
E1 <- resid(M1)
 
par(mar = c(5,5,2,2), cex.lab = 1.5)
plot(y = E1,
     x = BL2$Depth,
     ylab = "Residuals",
     xlab = "Depth",
     main = "Bioluminescence data")
abline(h = 0)
  
#####################################END of code################################
