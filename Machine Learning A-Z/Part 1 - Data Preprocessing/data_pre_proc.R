df = read.csv('Data.csv')
#Handling Missing Data
df$Age = ifelse(is.na(df$Age), ave(df$Age, FUN = function(x) mean(x,na.rm = TRUE) ),df$Age)
df$Salary = ifelse(is.na(df$Salary), ave(df$Salary, FUN = function(x) mean(x,na.rm = TRUE) ),df$Salary)
df
