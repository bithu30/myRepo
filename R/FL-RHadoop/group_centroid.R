#The Data consists of Customer data for the company CENet,
#first col is customer id next 12 cols are there bill value
#for all 12 months last column is 'type' which mentions the 
#type of transanctions,there 5 groups of transanctions:- 1 to 5

#load the data
CEnetBig = from.dfs('/CEnetBig')

#Mapper
#For data chunk i we compute via the map function 
#the i-th group sum s_1i, s_2i,...,s_5i and the 
#corresponding group sizes: n_1i,n_2i,...,n_5i. 
#The map function therefore returns key-value pairs (k,{n_ki, s_ki}),
#where k is the group label (1,2,…,5), n_ki is the number of data rows in k-th
#group, while s_ki is the sum of all the data rows from the k-th group.

mapper = function (., X) {
  n=nrow(X);
  ones=matrix(rep(1,n),nrow=n,ncol=1);
  ag=aggregate(cbind(ones,X[,2:13]),by=list(X[,14]),FUN="sum")
  key=factor(ag[,1]);
  keyval(key,split(ag[,-1],key))
}

#Reduce
#The REDUCE part computes the final sums of the data rows 
#for each group and returns the key-value pairs (k,{n_ki, s_ki}) 
#for the whole dataset

reducer = function(k, A) {
  keyval(k,list(Reduce('+', A)))
}

#Map-reduce
#Once we have defined the map and reduce function 
#we compute the groups sums with mapreduce.

GroupSums <-   from.dfs(
  mapreduce(
    input = "/CEnetBig",
    map = mapper,
    reduce = reducer,
    combine = T
  )
)

#To obtain the centroids we divide each 
#row of the group sums with by the size of the group.

GroupSumsM <- matrix(unlist(GroupSums$val), ncol =  13, byrow  = TRUE)
Centroids<-GroupSumsM[,-1]/GroupSumsM[,1]