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

numFolds = trainControl(method = "cv",number = 10)
cpGrid = expand.grid(.cp=seq(0.01,0.5,0.01))
train(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train,method="rpart",trControl=numFolds,tuneGrid=cpGrid)

StevensTreeCV = rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst,data = Train,method="class",cp=0.18)

PredictCV=predict(StevensTreeCV,newdata = Test,type="class")

table(Test$Reverse,PredictCV)

(59+64)/(59+64+18+29)

prp(StevensTreeCV)

#Claims Data
claims <- read.csv('ClaimsData.csv')
str(claims)
table(claims$bucket2009)/nrow(claims)
library(caTools)
set.seed(88)
split_claims <- sample.split(claims$bucket2009,SplitRatio = 0.6)
ClaimsTrain = subset(claims,split_claims == TRUE)
ClaimsTest = subset(claims,split_claims == FALSE)
mean(ClaimsTrain$age)

summary(ClaimsTrain)

table(ClaimsTrain$diabetes)

104692/274803

#Predicting the baseline


table(ClaimsTest$bucket2009,ClaimsTest$bucket2008)

#Accuracy
(110138+10721+2774+1539+104)/nrow(ClaimsTest)

PenaltyMatrix = matrix(c(0,1,2,3,4,2,0,1,2,3,4,2,0,1,2,6,4,2,0,1,8,6,4,2,0), byrow=TRUE, nrow=5)

#PenaltyError
sum(as.matrix(table(ClaimsTest$bucket2009,ClaimsTest$bucket2008))*PenaltyMatrix)/nrow(ClaimsTest)
