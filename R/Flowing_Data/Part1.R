paste('Hello,World')

#checking index

vec <- c(1,2,3)
vec[1] #vector index start with 1

fakedata <- c(1,2,3,4,5)
morefake<-c("a","a","a","a","a")
fake.df<-data.frame(cbind(fakedata,morefake))
colnames(fake.df)
fake.df$morefake <- as.character(fake.df$morefake)
colnames(fake.df)

edu<- read.csv('2009education.csv',header = TRUE,sep = ',',as.is = TRUE)
str(edu)
#sorting greatest to lowest
high.order <- order(edu$high)
edu.high <- edu[high.order,]

#sorting lowest to greatest

high.order <- order(edu$high,decreasing = TRUE)
edu.high.low <- edu[high.order,]
plot(fakedata)

#will not work,since it is a df
plot(edu)
plot(edu.high$high)
plot(edu.high.low$high)

plot(edu$high,edu$bs)

plot(edu[,2:3])

plot(edu[,2:4])

#for line chart

plot(edu.high$high,type='l',las=1)

plot(edu.high$high,type='h')

plot(edu.high$high,las=1)

par(mfrow=c(3,3),mar=c(2,5,2,1),las=1,bty="n")
plot(edu.high$high)
plot(edu$high,edu$bs)
plot(edu.high$high,type='l')
plot(edu.high$high,type = 'h')
plot(edu.high$high,type='s')
barplot(edu.high$high)
barplot(edu$high,names.arg = edu$state,horiz = T,las=1,cex.names = 0.5,border = NA )
boxplot(edu$high)
boxplot(edu[,2:4])
