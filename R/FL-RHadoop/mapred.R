#finding out the product distribution among customers
#last col 'type' in the CEnetBig Dataset gives info
#about that

T = table(CEnetBig$val[,"type"])

# to perform above task using map-reduce we need to apply the 
#script table on every data block that is passed to the map function. 
#The map function, therefore, counts the customers in given data block 
#that have a particular product and returns these frequencies 
#as a key-value pair, where the key is always 1 and the value is the
#list with the only element being the table of frequencies

mapperTable = function (., X) {
  T=table(X[,"type"])
  keyval(1,list(T))
}
#The reducer simply groups all the returned key-value pairs and 
#performs a matrix sum over all the values, i.e., over all the 
#frequency tables:
  
  reducerTable = function(k, A) {
    keyval(k,list(Reduce('+', A)))
  
  }

#The final map-reduce code for computing the distribution of 
#customers in terms of the type of product is simple:
    
    BigTable<-from.dfs(
      mapreduce(
        input = "/CEnetBig",
        map = mapperTable,
        reduce = reducerTable
      )
    )