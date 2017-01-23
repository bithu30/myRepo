#Loading data

train<-read.csv("Train_BigMart3.csv")
test<-read.csv("Test_BigMart3.csv")

#adding a col
test$Item_Outlet_Sales <- 1

#combine both tarin and test

combi<-rbind(train,test)

#imputing missing values with media

combi$Item_Weight[is.na(combi$Item_Weight)] <- median(combi$Item_Weight,na.rm = TRUE )

#imputing zeros with median

combi$Item_Visibility <- ifelse(combi$Item_Visibility  == 0,median(combi$Item_Visibility),combi$Item_Visibility)

table(combi$Outlet_Size,combi$Outlet_Type)

levels(combi$Outlet_Type)[1] <- "Other"

#Removing cols from the data
my_data<-subset(combi,select=-c(Item_Outlet_Sales, Item_Identifier,Outlet_Identifier))
colnames(my_data)

#Check structure
str(my_data)

#5 out of 9 features are categorical , we need to convert 
#them to numeric for the PCA to work
library(dummies)

my_new_data <- dummy.data.frame(my_data,names=c("Item_Fat_Content","Item_Type",
                                                "Outlet_Establishment_Year","Outlet_Size",
                                                "Outlet_Location_Type","Outlet_Type"))

#checking the structure of the new dataset
str(my_new_data)

#divide into test and train data
pca.train<-my_new_data[1:nrow(train),]
pca.test<-my_new_data[- (1:nrow(train)), ]

#doing PCA
prin_comp <- prcomp(pca.train,scale. = T)
names(prin_comp)

#outputs the mean of variables
prin_comp$center

#outputs the standard deviation of variables
prin_comp$scale
#outputs the loadings of variables
prin_comp$rotation

#Principal componenets for the first 4 componenets
#first 5 rows
prin_comp$rotation[1:5,1:4]

#the matrix x has the) principal component score vectors in a 8523 × 44 dimension.
dim(prin_comp$x)

#plot
biplot(prin_comp,scale=0)
#calculating variance

#proportion of variance explained
 prop_varex <- pr_var/sum(pr_var)
 prop_varex[1:20]
 
 #scree plot
 plot(prop_varex, xlab = "Principal Component",
        ylab = "Proportion of Variance Explained",
        type = "b")
 
 #cumulative scree plot
  plot(cumsum(prop_varex), xlab = "Principal Component",
        ylab = "Cumulative Proportion of Variance Explained",
        type = "b")
  
  #predictive modeliing with PCA
  
  #add a training set with principal components
   train.data <- data.frame(Item_Outlet_Sales = train$Item_Outlet_Sales, prin_comp$x)
  
  #we are interested in first 30 PCAs
 train.data <- train.data[,1:31]
  
  #run a decision tree
   install.packages("rpart")
   library(rpart)
   rpart.model <- rpart(Item_Outlet_Sales ~ .,data = train.data, method = "anova")
   rpart.model
  
  #transform test into PCA
   test.data <- predict(prin_comp, newdata = pca.test)
   test.data <- as.data.frame(test.data)
  
  #select the first 30 components
   test.data <- test.data[,1:30]
  
  #make prediction on test data
   rpart.prediction <- predict(rpart.model, test.data)
