#Refer CEnetBig_dataset_info.txt for dataset info

#Goal
#For each group of customers (1:5) find the customer 
#with the maximum total amount for the bills paid in 2016.

#Method
#We have to compute the row sums for all columns 
#2016_1 to 2016_12 and then find for each group the row 
#that has the maximum sum. This can be efficiently done with map-reduce: 
#in each data chunk we find the top row for each group using the map 
#operation and then pass them to the reduce part, which instead of sum 
#performs the maximum operation.

#Map
#The map function computes the row sums for 
#all the data instances in each data chunk 
#and then finds and returns the rows with the 
#maximum row sum for each group.

mapperTopRows = function (., X) {
  top5iList=list();
  for (i in 1:5){
    selectRows=which(X[,14]==i);
    rSum=rowSums(X[selectRows,2:13]);
    indMax <- which.max(rSum)
    top5iList[[i]]=rSum[indMax];  
  }
  keyval(1:5,top5iList);
}

#Reduce
#In the reduce part we simply take the 
#maximum of the row maxima over all the key-value pairs.

reducerTopRows = function(k, A) {
  keyval(k,list(Reduce('max', A)))
}

#Map-Reduce
#In this part we perform map and reduce on the data CEnetBig

