#    Highland Statistics Ltd.
#    www.highstat.com

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.



#######################################################################
#Import the data from a tab delimited ascii file
OC <- read.table(file = "OystercatcherData.txt",
                   header = TRUE,
                   dec = ".")

#dec = '.'   means that the point is used for decimals. 
#Change to   dec = ","   if required.
########################################################################


########################################################################
#House keeping
library(lattice)

#If you have not installed coefplot2 yet, then
#follow these steps (remove hashes):
#install.packages("reshape", dependencies = TRUE)
#install.packages("lme4", dependencies = TRUE)
#install.packages("coda", dependencies = TRUE)
#install.packages("coefplot2", 
#                  repos = "http://www.math.mcmaster.ca/bolker/R",  
#                  type = "source")
library(coefplot2)

################################################################




########################################################################
#Inspect the file
names(OC)
str(OC)  #Make sure you have num and not factors for the numerical variables!
###################################################################




##################################################################
#Underlying question: 
#         Investigate whether the ShellLength differs
#         per feeding type, feeding plot and season.
#         We may expect a 3-way interaction.
##################################################################




###################################################
#Figure 7.1
library(ggplot2)  
p1 <- ggplot()
p1 <- p1 + xlab("Feeding type") + ylab("Shell length")
p1 <- p1 + theme(text = element_text(size=15))

p1 <- p1 + geom_boxplot(data = OC, 
                    aes(x = FeedingType, y = ShellLength))
p1

p2 <- ggplot()
p2 <- p2 + xlab("Feeding plot") + ylab("Shell length")
p2 <- p2 + theme(text = element_text(size=15))

p2 <- p2 + geom_boxplot(data = OC, 
                    aes(x = FeedingPlot, y = ShellLength))
p2

p3 <- ggplot()
p3 <- p3 + xlab("Month") + ylab("Shell length")
p3 <- p3 + theme(text = element_text(size=15))
p3 <- p3 + geom_boxplot(data = OC, 
                    aes(x = Month, y = ShellLength))
p3


#http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_%28ggplot2%29/
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


multiplot(p1, p2, p3, cols=2)
#######################################################




#Balanced data?
table(OC$Month)
table(OC$FeedingPlot)
table(OC$FeedingType)




#########################################################
#Apply multiple linear regression
M1 <- lm(ShellLength ~ FeedingType * FeedingPlot * Month,
         data = OC)
print(summary(M1), digits = 2)
drop1(M1, test = "F")
#Try writing down the 12 equations!
#########################################################




#########################################################
#Figure 7.2
#Model validation
par(mfrow = c(2,2), mar = c(5,5,2,2))
E1 <- rstandard(M1)
F1 <- fitted(M1)

plot(x = F1, 
     y = E1,
     xlab = "Fitted values",
     ylab = "Residuals",
     cex.lab = 1.5)
abline(h = 0, lty = 2)     

boxplot(E1 ~ FeedingType, 
        xlab = "Feeding type", 
        cex.lab = 1.5,
        data = OC,
        ylab = "Residuals")
abline(h = 0, lty = 2)

boxplot(E1 ~ FeedingPlot, 
        xlab = "Feeding plot", 
        cex.lab = 1.5,
        data = OC,
        ylab = "Residuals")
abline(h = 0, lty = 2)
        
boxplot(E1 ~ Month, 
        xlab = "Month", 
        cex.lab = 1.5,
        data = OC,
        ylab = "Residuals")
abline(h = 0, lty = 2)
#########################################################




#########################################################
#Figure 7.3
par(mar = c(5, 5, 2, 2))
plot(cooks.distance(M1), 
     type = "h", 
     ylim = c(0,1),
     xlab = "Observation",
     ylab = "Cook's distance",
     cex.lab = 1.5)
#########################################################



drop1(M1, test = "F")
step(M1)
#and yes..the 3-way interaction is significant!
############################################




####################################################
#Figure 7.4
#Visualise the modelling results.
#Create data for which we want to predict
MyData <- expand.grid(FeedingType = levels(OC$FeedingType),
                      FeedingPlot = levels(OC$FeedingPlot),
                      Month       = levels(OC$Month))
MyData

#Do the actual prediction
P1 <- predict(M1, newdata = MyData, se = TRUE)                      

#Add the predicted values
MyData$Fit    <- P1$fit
MyData$SE     <- P1$se.fit
MyData$se.low <- P1$fit - 1.96 * P1$se.fit
MyData$se.up  <- P1$fit + 1.96 * P1$se.fit
print(MyData, digits = 3)



#And graph the whole thing
coefplot2(MyData$Fit,
          sds   = 0 * MyData$SE,
          varnames = paste(MyData$FeedingType, 
                           MyData$FeedingPlot,
                           MyData$Month, sep = " "),
          main = "Fitted values",
          lower1 = MyData$Fit - 1.96 * MyData$SE,
          upper1 = MyData$Fit + 1.96 * MyData$SE,
          cex.var = 1.2,
          cex.pts = 1.5,
          xlim = c(1.2, 3.5))
#######################################################       

   
   
#######################################################   
#Figure 7.5
library(ggplot2)  
p <- ggplot()
p <- p + xlab("Feeding type") + ylab("Shell length")
p <- p + theme(text = element_text(size=15)) + theme_bw()

p <- p + geom_point(data = MyData, 
                    aes(x = FeedingType, 
                        y = MyData$Fit, 
                        size = 6),    
                    col = ("black"))

p <- p + geom_errorbar(data = MyData,
                       aes(x = FeedingType, 
                           ymax = se.up, 
                           ymin = se.low), 
                       width=0.2)

p <- p + geom_point(data = OC, 
                    aes(x = FeedingType, y = ShellLength),
                    position = position_jitter(width = .02),
                    color = grey(0.3),
                    size = 2)
       
MyLabeller <- function(var, value){
    value <- as.character(value)
    if (var=="Month") { 
        value[value=="Jan"] <- "January"
        value[value=="Dec"] <- "December"
    }
    return(value)
}


                    
p <- p + facet_grid(Month ~ FeedingPlot, 
                    scales = "fixed",
                    labeller = MyLabeller)
p <- p + theme(legend.position="none") 
p <- p + theme(strip.text.y = element_text(size = 15, 
                                           colour = "black", 
                                           angle = 20),
               strip.text.x = element_text(size = 15, 
                                           colour = "black", 
                                           angle = 0)                            
                                           )
p
###########################################################


table(OC$Month, OC$FeedingPlot, OC$FeedingType)
####################################################

