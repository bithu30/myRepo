M1 <- matrix(rnorm(150,0,1), ncol=3)              
colnames(M1)<-c("X1","X2","X3")

#M1*M1
t(M1)%*%(M1)
#Covariance matrix
cov(M1)

#sum-of-squares and coproducts matrix (SS matrix) of M1 by
n=nrow(M1)         #number of rows in M1
SS=(n-1)*cov(M1)

#centralise the data (subtract the centroid from each row):
M1s=scale(M1,scale=FALSE)

#SS matrix can also be computed as

SS1=t(M1s)%*%M1s
#covariance matrix can also be computed as

#Once we have an SS matrix (i.e., SS2) 
#we can easily obtain the corresponding correlation matrix by

D=diag(1/sqrt(diag(SS2)))
R=D%*%SS2%*%D
R1 = cor(M1,method=c("pearson")) #We can see that R1 is equal to R.

#SS is symmetric and hence has 3 real eigenvalues and 
#3 corresponding eigenvectors.

ev = eigen(SS)

