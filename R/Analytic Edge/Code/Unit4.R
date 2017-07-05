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
PredictROC = predict(StevensTree,newdata = Test)
pred = prediction(PredictROC[,2],Test$Reverse)

perf = performance(pred,"tpr","fpr")
plot(perf)
as.numeric(performance(pred, "auc")@y.values)

StevensTree_2 = rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, method="class", minbucket=5)
prp(StevensTree_2)

StevensTree_3 = rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, method="class", minbucket=100)
prp(StevensTree_3)

library(randomForest)

Train$Reverse = as.factor(Train$Reverse)

Test$Reverse = as.factor(Test$Reverse)

StevensForrest = randomForest(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, ntree=200, nodesize=25 )



PredictForest = predict(StevensForrest, newdata = Test)
table(Test$Reverse, PredictForest)

(44+75)/(44+75+33+18)

set.seed(100)

StevensForrest_100 = randomForest(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, ntree=200, nodesize=25 )

PredictForest_100 = predict(StevensForrest_100, newdata = Test)

table(Test$Reverse, PredictForest_100)
(77+42)/(77+42+35+16)

set.seed(200)

StevensForrest_200 = randomForest(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, ntree=200, nodesize=25 )

PredictForest_200 = predict(StevensForrest_200, newdata = Test)

table(Test$Reverse, PredictForest_200)

(44+76) /(33+17+44+76)

library(caret)
library(class)
library(e1071)
library(ggplot2)
