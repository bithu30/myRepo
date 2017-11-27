#Refer CEnetBig_dataset_info.txt for dataset info

#Computing the within the group sum-of-squares

#Map
#The map function computes for each data chunk i 
#the sizes of the groups, the group row sums and the 
#group matrix products Xi1^T *Xi1. We actually use the knowledge 
#that we have 5 groups coded with numbers 1,2,3,4,5 in the 14th column. 
#The map function returns key-value pairs containing as key the 
#group index and the corresponding value is a list containing: 
#the group size, the group row sums and the groups matrix products
#Xi1^T *Xi1.

mapperSS = function (., X) {
  n=nrow(X);
  N=5;
  n_vec=matrix(nrow = 1,ncol = 5);       # vector of group sizes
  sum_mat=matrix(nrow = 5,ncol=12);      # matrix of group row sums
  SS_tensor=array(dim=c(5,12,12));       # tensor containing SS matrices
  for (i in 1:N){
    Xi=subset.matrix(X[,2:13],X[,14]==i);
    si=colSums(Xi);
    ni=nrow(Xi);
    SSi=t(Xi)%*%Xi;
    n_vec[i]=ni;
    sum_mat[i,]=si;
    SS_tensor[i,,]=SSi;
  }
  keyval(1:3,list(n_vec,sum_mat,SS_tensor));
}
#Reduce
#In the reduce part we simply add the key values over 
#all the key-value pairs.

reducerSS = function(k, A) {
  keyval(k,list(Reduce('+', A)))
}
#Map-Reduce
#In this part we perform map-reduce on the data CEnetBig

GroupRes <-   from.dfs(
  mapreduce(
    input = "/CEnetBig",
    map = mapperSS,
    reduce = reducerSS,
    combine = T
  )
)
#Final code
#Here we finally compute the group means (centroids) and the SS matrices

N=5     # 5 groups in CEnetBig data
K=12    # 12 relevant data variables 
GroupMeans=matrix(nrow=N,ncol=K)  # matrix containing mean vectors as rows
GroupSS=vector("list", N);                   # list with group SS matrices
for (i in 1:N){
  GroupMeans[i,] <- GroupRes$val[[2]][i,]/GroupRes$val[[1]][i]  
  GroupSS[[i]] <- GroupRes$val[[3]][i,,]-GroupRes$val[[1]][i]*outer(GroupMeans[i,],GroupMeans[i,])
}