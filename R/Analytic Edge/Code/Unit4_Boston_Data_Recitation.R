boston <- read.csv('boston.csv')
plot(boston$LON,boston$LAT)
#Plot LOcation
points(boston$LON[boston$CHAS == 1],boston$LAT[boston$CHAS == 1],col = "blue",pch=19)
#Plot MIT
points(boston$LON[boston$TRACT == 3531],boston$LAT[boston$TRACT == 3531],col = "red",pch=19)
# Plot polution
summary(boston$NOX)
points(boston$LON[boston$NOX>=0.55], boston$LAT[boston$NOX>=0.55], col="green", pch=20)
plot(boston$LON,boston$LAT)
summary(boston$MEDV)
points(boston$LON[boston$MEDV >= 21.2 ],boston$LAT[boston$MEDV >= 21.2 ],col = "red",pch=19)
latlonlm <- lm(MEDV ~ LAT + LON , data=boston)
summary(latlonlm)

points(boston$LON[latlonlm$fitted.values >= 21.2 ],boston$LAT[latlonlm$fitted.values >= 21.2 ],col = "blue",pch="$")

library(rpart)
library(rpart.plot)
latlontree <- rpart(MEDV ~ LAT + LON,data=boston,minbucket=50)
prp(latlontree)
plot(latlontree)
text(latlontree)
fittedvalues <- predict(latlontree)
points(boston$LON[fittedvalues >= 21.2 ],boston$LAT[fittedvalues >= 21.2 ],col = "blue",pch="$")
plot(boston$LON,boston$LAT)
abline(v=-71.07)
abline(h = 42.21)
abline(h=42.17)
points(boston$LON[boston$MEDV >= 21.2 ],boston$LAT[boston$MEDV >= 21.2 ],col = "red",pch=19)

library(caTools)
spBoston <- sample.split(boston$MEDV,SplitRatio = 0.7)
train_boston <- subset(census,spBoston==TRUE)
test_boston <- subset(census,spBoston==FALSE)

