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
