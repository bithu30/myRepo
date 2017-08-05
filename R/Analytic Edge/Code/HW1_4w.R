gerber <- read.csv('gerber.csv')
str(gerber)
table(gerber$voting)
108696/344084

civicvote <- gerber$civicduty[gerber$voting == 1]
table(civicvote)/length(civicvote)

neivote <- gerber$neighbors[gerber$voting == 1]
table(neivote)/length(neivote)

hawvote <- gerber$hawthorne[gerber$voting == 1]
table(hawvote)/length(hawvote)

selfvote <- gerber$self[gerber$voting==1]
table(selfvote)/length(selfvote)


glm_grber <- glm(voting ~ civicduty+hawthorne+self+neighbors, data = gerber)
summary(glm_grber)

predict_grber <- predict(glm_grber)

table(gerber$voting,predict_grber > 0.3)

table(gerber$voting,predict_grber > 0.3)

CARTmodel = rpart(voting ~ civicduty + hawthorne + self + neighbors, data=gerber)
prp(CARTmodel)

ControlCART <- rpart(voting ~ control , data=gerber,cp=0.0 )
prp(ControlCART,digits = 6)

abs(0.296638 - 0.34)

ControlSexCART <- rpart(voting ~ control + sex, data=gerber,cp=0.0 )
prp(ControlSexCART,digits = 6)
abs(0.302795 - 0.345818)
abs(0.290456 - 0.334176)

glm_ctrlsex <- glm(voting ~  control + sex, data = gerber, family = binomial)
summary(glm_ctrlsex)

Possibilities = data.frame(sex=c(0,0,1,1),control=c(0,1,0,1))
predict(glm_ctrlsex, newdata=Possibilities, type="response")

abs(0.2908065 - 0.290456)

glm_ctrlsex2 = glm(voting ~ sex + control + sex:control, data=gerber, family="binomial")
summary(glm_ctrlsex2)

predict(glm_ctrlsex2, newdata=Possibilities, type="response")

abs(0.2904558 - 0.290456)
