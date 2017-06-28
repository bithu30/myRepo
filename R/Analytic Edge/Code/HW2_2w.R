pisaTrain = read.csv('pisa2009train.csv')
pisaTest = read.csv('pisa2009test.csv')
str(pisaTrain)
tapply(pisaTrain$readingScore,pisaTrain$male,mean)
summary(pisaTrain)
pisaTrain = na.omit(pisaTrain)
pisaTest = na.omit(pisaTest)
str()
pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")
lmScore = lm(readingScore~.,data=pisaTrain)
summary(lmScore)

lmPredict <- predict(lmScore,newdata = pisaTest)
error = pisaTest$readingScore - lmPredict

#Calculating RMSE of lmScore

sqrt(mean(lmScore$residuals^2))

sse<- sum((pisaTest$readingScore - lmPredict)^2)
rmse_pred<- sqrt(mean((pisaTest$readingScore - lmPredict)^2))

baseline= mean(pisaTrain$readingScore)

sst <- sum((baseline - pisaTest$readingScore)^2)

rsquare<-1-sse/sst



