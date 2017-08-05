default<-read.csv("C:\\Users\\sandhyao\\Desktop\\RDataMiningBlueprints_Code\\Chapter 8\\default.csv")

df<-default[-1,-c(1,3:5,7:12,25)]

func1<-function(x){
  as.numeric(x)
}

df<-as.data.frame(apply(df,2,func1))

#calculating correlation between variables
cor(df)

pairs(df[1:900,])

corrplot::corrplot(cor(df),method="ellipse")

normalize<-function(x){
  (x-mean(x))
}

dn<-as.data.frame(apply(df,2,normalize))

str(dn)

options(digits = 2)

pca1<-princomp(df,scores = T, cor = T)

summary(pca1)

#Loadings of Principal Components
pca1$loadings

pca1

plot(pca1, main = "Percentage Variation Explained by Principal Components")

screeplot(pca1, type = "line", main = "Scree Plot")

#Biplot of the score variables
biplot(pca1)

diag(cov(df))

#scores of the components
pca1$scores[1:10,]

eigen(cor(df),TRUE)$values

head(eigen(cor(df),TRUE)$vectors)

pca1$sdev

pca1$center


pca2<-princomp(dn)

summary(pca2)

result<-round(summary(pca2)[1]$sdev,0)

plot(result, main = "Standard Deviation by Principal Components",
      xlab="Principal Components",ylab="Standard Deviation",type='o')

pca<-prcomp(df,scale. = T)
summary(pca)


summary(pca)$rotation

head(summary(pca)$x)

biplot(prcomp(df,scale. = T))

#calculating Eigen vectors
eig<-eigen(cor(df))

#Compute the new dataset
eigvec<-t(eig$vectors) #transpose the eigen vectors

df_scaled<-t(dn) #transpose the adjusted data

df_new<-eigvec %*% df_scaled

df_new<-t(df_new)

colnames(df_new)<-c("PC1","PC2","PC3","PC4",
                     "PC5","PC6","PC7","PC8",
                     "PC9","PC10","PC11","PC12",
                     "PC13","PC14")

head(df_new)



