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

glm_grber <- glm(voting ~ civicduty+hawthorne+self+neighbors, data = gerber, family = binomial)
summary(glm_grber)
predict_grber <- predict(glm_grber,newdata = gerber)
table(gerber$voting,predict_grber > 0.3)
