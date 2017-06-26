wine <- read.csv('wine.csv')
str(wine)
summary(wine)

model1=lm(Price ~ AGST,data=wine)
summary(model1)
#Residuals of the model
model1$residuals
#Calulating SSE for model1

SSE = sum(model1$residuals^2)
SSE

#Adding more independent variables

model2 = lm(Price ~ AGST+HarvestRain, data=wine)
summary(model2)
SSE=sum(model2$residuals^2)
SSE

model3 = lm(Price ~ AGST+HarvestRain+WinterRain+Age+FrancePop,data=wine)
summary(model3)
model5SSE=sum(model3$residuals^2)

model4 = lm(Price ~ AGST+HarvestRain+WinterRain+Age,data=wine )
summary(model4)

model_qw = lm(Price ~ HarvestRain+WinterRain,data=wine)
summary(model_qw )
SSE=sum(model_qw$residuals^2)
model_qw$coefficients

#co-relation

cor(wine$WinterRain,wine$Price)

cor(wine$Age,wine$FrancePop)

cor(wine)

model5 = lm(Price ~ AGST+HarvestRain+WinterRain,data=wine )
summary(model5)

winetest = read.csv('wine_test.csv')
predictTest = predict(model4,newdata = winetest)

#claculating the accuracy of model4

SSE = sum((winetest$Price - predictTest)^2)
SST = sum((winetest$Price-mean(wine$Price))^2)

#SSE = sum((wineTest$Price - predictTest)^2)
#SST = sum((wineTest$Price - mean(wine$Price))^2)
#1 - SSE/SST

1-SSE/SST
