#Dataset is explained in BigData_reg_class_desc.txt

#Method
#The K-means algorithm runs in a for loop and in each iteration 
#it calls MAP-REDUCE functions to compute new centroids and new clusters. 
#It stops when the clusters (or centroids) do not change anymore or when 
#the maximum number of iteration sis reached.

#MAP
#For data chunk i we compute via MAP function for each data point 
#the centroid that is closest to the data point and assign to this 
#data point the corresponding label. Note that the current 
#centroids (NULL at the beginning) are available as global variable M.
M=NULL
mapper = function (., XX) {
  n=nrow(XX);p=16; 
  if (is.null(M)) {           # happens at the beginning
    set.seed(100)             # to assure that every time we get the same clustering
    clust <- round(runif(n, 1,K),0)   # RANDOM GROUPING VECTOR y
  } else {                                       
    dists=rdist(XX[,2:p],M);
    clust = apply(dists,1, function(distvect){
      which.min(distvect)
    })
  }
  Mnew=matrix(0,K,p-1)
  nnew=matrix(0,ncol=K,nrow=1)
  for (k in 1:K){
    ss=sum(clust==k,na.rm = TRUE);
    if(ss>0){
      nnew[1,k]=ss
      if (ss==1){
        Mnew[k,]=XX[clust==k,2:p]
      } else {Mnew[k,]=colSums(XX[clust==k,2:p],na.rm = TRUE)}
    } 
  }
  val=list(nnew,Mnew)
  keyval(1:2,val)
}

#MAP function returns for each data chunk the row-sums of 
#columns 2-16 for each newly formed cluster in this 
#data chunk (value with key == 2). Additionally it also 
#returns the sizes of new clusters in the 
#data chunk (value corresponding to key == 1).

#REDUCE
#The reduce part simply adds values with key == 1 and with key == 2.

reducer = function(k, A) {
  keyval(k, list(Reduce('+', A)))    # FOR EACH KEY PERFORM ADDITION
}

#MAP-REDUCE
#One step of K-means algorithm needs one call of MAP-REDUCE, 
#i.e., if the current centroids are stored in matrix M, 
#we first compute the row-sums of columns 1-16 for all 
#new clusters and also the sizes of new clusters by calling:
  
  Mn<-from.dfs(
    mapreduce(
      input = "/BigData_reg_class",
      map = mapper,
      reduce = reducer,
      combine = T
    )
  )
#Final code
#Finally, we compute clustering assignment of data points into 
#3 clusters using variables 1-16 by the following for loop. 
#It ends when the maximum number of iterations is achieved or 
#if the clusters (i.e., centroids) stabilise.

K=3;         # NUMBER OF CLUSTERS
M=NULL;      # INITIAL CENTROIDS
MaxIt=7;    # MAX Nr. OF Kmeans ITERATIONS
D=matrix(0,nrow=1,ncol=MaxIt)  # DISTANCES BETWEEN CONS. CENTROIDS

for(i in 1:MaxIt){
  Mn<-from.dfs(
    mapreduce(
      input = "/BigData_reg_class",
      map = mapper,
      reduce = reducer,
      combine = T
    )
  )
  group_n = Mn$val[[1]];
  group_sums = Mn$val[[2]];
  Mnew=group_sums/group_n[1,];
  if (!is.null(M)) {                              # important at the beginning
    D[i]=sum((M-Mnew)^2)
    if (D[i] <0.01) break;
  }
  M=Mnew;
}
