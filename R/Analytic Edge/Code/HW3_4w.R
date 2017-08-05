census <- read.csv('census.csv')
str(census)
table(census$over50k)
library(caTools)
set.seed(2000)
split_census <- sample.split(census$over50k,SplitRatio = 0.6)

train_census = subset(census,split_census == TRUE)
test_census = subset(census,split_census == FALSE)

glm_census <- glm(over50k ~ .,data=train_census,family = "binomial")
summary(glm_census)

table(test_census$over50k)

predict_census <- predict(glm_census,newdata = test_census,type="response")

table(test_census$over50k,predict_census >= 0.5)

(9051+1888)/nrow(test_census)
#baseline accuracy
9713/nrow(test_census)

library(ROCR)

ROCPred <- prediction(predict_census,test_census$over50k)
auc_glm <- as.numeric(performance(ROCPred, "auc")@y.values)

censusTree <- rpart(over50k ~ .,data=train_census,method = "class")
prp(censusTree)

predictTree <- predict(censusTree,newdata = test_census,type="class")
table(test_census$over50k,predictTree)

(9243+1596)/nrow(test_census)

predictROC<-predict(censusTree,newdata = test_census)
head(predictROC)

ROCTree <- prediction(predictROC[,2],test_census$over50k)

auc_tree <- as.numeric(performance(ROCTree,"auc")@y.values)

#random forrests
library(randomForest)

set.seed(1)

trainSmall = train_census[sample(nrow(train_census), 2000), ]
set.seed(1)

censusForrest <- randomForest(over50k ~ .,data=trainSmall)

predictForrest <- predict(censusForrest,newdata = test_census)

table(test_census$over50k,predictForrest)
(9637+859)/nrow(test_census)

table(test_census$over50k,predictForrest >=0.5)

#Determining the variable which was split the max times for creating
#the random forrest

vu = varUsed(censusForrest, count=TRUE)

vusorted = sort(vu, decreasing = FALSE, index.return = TRUE)

#A different metric we can look at is related to "impurity", 
#which measures how homogenous each bucket or leaf of the tree is. 
#In each tree in the forest, whenever we select a variable and perform a split, 
#the impurity is decreased. Therefore, one way to measure the importance of a 
#variable is to average the reduction in impurity, taken over all the times 
#that variable is selected for splitting in all of the trees in the forest. 
#To compute this metric, run the following command in R (replace "MODEL" with the name of your random forest model):
  
  varImpPlot(censusForrest)

dotchart(vusorted$x, names(censusForrest$forest$xlevels[vusorted$ix]))

#CrossValidation
set.seed(2)

library(caret)
library(e1071)

numFolds = trainControl(method = "cv", number = 10)

cartGrid = expand.grid( .cp = seq(0.002,0.1,0.002))

train(over50k ~ .,data=train_census,method = "rpart", trControl = numFolds, tuneGrid = cartGrid)

cpTree <- rpart(over50k ~ .,data=train_census,method = "class",cp=0.002)

predictCP <- predict(cpTree,newdata = test_census,type = "class")

table(test_census$over50k,predictCP)

(9178+1838)/nrow(test_census)
prp(cpTree)
