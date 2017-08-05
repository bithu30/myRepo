train <- read.csv('train.csv')
test<-read.csv('test.csv')
dim(train)
str(train)
str(test)
table(train$trip_duration[1:100])
max_duration_index=which.max(train$trip_duration)
train[max_duration_index,]
