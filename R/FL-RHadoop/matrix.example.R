# PLAYING EXAMPLE
X1 <- matrix(rnorm(150,0,1), ncol=3)              # RANDOM 50x3 MATRIX X
X2 <- matrix(round(runif(50,1,5),0),ncol=1)       # RANDOM 50x1 MATRIX (COLUMN)
X<-cbind(X1,X2)                                   # MERGING X1 AND X2 INTO MATRIX X
colnames(X)<-c("X1","X2","X3","GROUP")  
#storing the matrix into a file
write.table(X, file="mymatrix.txt", row.names=FALSE, col.names=TRUE)
#converting the matrix into DF
Xd<- as.data.frame(X)
save(Xd, file = "mymatrixDF.RData")

#converting matrix to a csv file
library("MASS")
write.matrix(format(X, scientific=FALSE), 
             file = "mymatrix.csv", sep=",")
#how to read the files made till now
Xt <- read.table("mymatrix.txt")
load("mymatrixDF.RData")

