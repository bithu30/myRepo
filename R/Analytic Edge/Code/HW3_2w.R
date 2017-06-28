FluTrain<-read.csv('FluTrain.csv')
FluTrain$Week[which.max(FluTrain$ILI)]
FluTrain$Week[which.max(FluTrain$Queries)]
hist(FluTrain$ILI)
plot(FluTrain$Queries,log(FluTrain$ILI))

FluTrend1<-lm(log(ILI)~Queries,data=FluTrain)
summary(FluTrend1)
FluTest = read.csv('FluTest.csv')
PredTest1 = exp(predict(FluTrend1, newdata=FluTest))


library(zoo)
ILILag2 = lag(zoo(FluTrain$ILI), -2, na.pad=TRUE)
FluTrain$ILILag2 = coredata(ILILag2)
summary(FluTrain$ILILag2)
plot(FluTrain$ILILag2,log(FluTrain$ILI))

FluTrend2<-lm(log(ILI)~Queries+log(ILILag2),data=FluTrain)
summary(FluTrend2)

ILILag2 = lag(zoo(FluTest$ILI), -2, na.pad=TRUE)
FluTest$ILILag2 = coredata(ILILag2)
summary(FluTest$ILILag2)
FluTest$ILI.lag2[1:2]<- FluTrain$ILI[416:417]

PredTest2 = exp(predict(FluTrend2, newdata=FluTest))
rmse_flu2<- sqrt(mean((FluTest$ILI - PredTest2)^2))
