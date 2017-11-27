N=1000;
X=rbinom(N,5,0.5)
Y=sample(c("a","b","c","d","e"), 1000, replace=TRUE)
Data=data.frame(X,Y)
colnames(Data)=c("value","group")
#storing the file in hdfs
to.dfs(Data, "SmallData",format="native")
#reading the file from hdfs
SmallData=from.dfs("/SmallData")
#removing the file from hdfs
dfs.rmr("/SmallData")

CEnetBig<-from.dfs("/CEnetBig")
#check that CEnetBig has 1 million of rows and 14 columns
dim(CEnetBig$val)
#finding out the product distribution among customers
#last col 'type' in the CEnetBig Dataset gives info
#about that

T = table(CEnetBig$val[,"type"])


