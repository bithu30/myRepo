climate<-read.csv('climate_change.csv')
str(climate)
train_data = subset(climate,climate$Year <= 2006)
test_data = subset(climate,climate$Year > 2006)
model1 <- lm(Temp~MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols,data=train_data)
summary(model1)
cor(train_data)

model2 <- lm(Temp~MEI+N2O+TSI+Aerosols,data=train_data)
summary(model2)

new_model = step(model1)

summary(new_model)

predictClimate = predict(new_model,newdata = test_data)

SSE_PC = sum((test_data$Temp - predictClimate ) ^ 2)

SST_PC = sum((test_data$Temp - mean(train_data$Temp))^2)

1-SSE_PC/SST_PC
