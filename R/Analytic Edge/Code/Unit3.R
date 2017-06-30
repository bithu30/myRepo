B <- c(-1.5, 3, -0.5)
x<-c(1,5)
logit <- B[1]+B[2]*x[1]+B[3]*x[2]
exp(logit)

#p(y==1) , prediction of a binary value using logit 

1/(1+exp(-1*logit))

quality <- read.csv('quality.csv')
str(quality)
table(quality$PoorCare)
library(caTools)
set.seed(88)
split=sample.split(quality$PoorCare,SplitRatio = 0.75)
quality_train = subset(quality,split==TRUE)
quality_test = subset(quality,split==FALSE)

qualityLR <- glm(PoorCare ~ OfficeVisits+Narcotics,data=quality_train,family = binomial)
summary(qualityLR)

predictTrain <- predict(qualityLR,type = "response")
summary(predictTrain)
tapply(predictTrain,quality_train$PoorCare,mean)

q1LR <- glm(PoorCare ~ StartedOnCombination+ProviderCount,data=quality_train,family = binomial)
summary(q1LR)
q1Predict = predict(q1LR,type="response")
summary(q1Predict)
tapply(q1Predict,quality_train$PoorCare,mean)
table(quality_train$PoorCare,predictTrain > 0.5)
library(ROCR)

ROCRpred = prediction(predictTrain,quality_train$PoorCare)
<<<<<<< HEAD
ROCRpref = performance(ROCRpred,"tpr","fpr")
plot(ROCRpref)
plot(ROCRpref,colorize=TRUE,print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))

#firmingham study

framingham = read.csv('framingham.csv')
str(framingham)
library(caTools)
set.seed(1000)
split=sample.split(framingham$TenYearCHD,SplitRatio = 0.65)
=======

# Performance function
ROCRperf = performance(ROCRpred, "tpr", "fpr")

# Add colors
plot(ROCRperf, colorize=TRUE)

# Add threshold labels 
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))


# Add colors
plot(ROCRperf, colorize=TRUE)

# Add threshold labels 
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))

predictTest = predict(qualityLR, type="response", newdata=quality_test)
ROCRpredTest = prediction(predictTest, quality_test$PoorCare)
auc = as.numeric(performance(ROCRpredTest, "auc")@y.values)
>>>>>>> d6e487f01203afd64d3b3de6600e27db97cd4c11
