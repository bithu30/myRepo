library(plyr) 
set.seed(1000)

M1 <- matrix(rnorm(150,0,1), ncol=3)              
colnames(M1)<-c("X1","X2","X3")

M2 <- matrix(round(runif(50,1,4),0),ncol=1)       
group=c('Group_A','Group_B','Group_D','Group_E')

colnames(M3)<-c("group")

M<-data.frame(M1,M3)  

table(M$group)
summary(M$group)

#mean values of first 3 cols in the M DF

centr <- colMeans(M[,1:3])

#finding group mean

aggregate(M[,1:3],by=list(M$group),FUN=mean)
)