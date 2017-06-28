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
