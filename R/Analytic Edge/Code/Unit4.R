stevens <- read.csv('stevens.csv')
str(stevens)
library(caTools)
set.seed(3000)
spl<-sample.split(stevens$Reverse,SplitRatio = 0.7 )
Train <- subset(stevens,spl==TRUE)
Test<-subset(stevens,spl==FALSE)
library(rpart)
library(rpart.plot)

#CART Model

StevensTree = rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, method="class", minbucket=25)
prp(StevensTree)
PredictCART <- predict(StevensTree,newdata = Test,type="class")
table(Test$Reverse,PredictCART)
#Accuracy 

(41+71)/(41+36+22+71)

library(ROCR)
PredictROC = predict()
