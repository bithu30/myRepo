#import all of the data from 2008 dataset
airline=read.csv('C://myRepo//R//FL-Airline_Data//2008.csv')
table(airline$Origin)
#sorting the no:of flight origins to determine the city with max flight origins
sort(table(airline$Origin))

#sampleDepTimes
head(airline$DepTime)
#creating buckets or categories for the Dep time
#finding the no:of flights grouped by their dep time
table(cut(airline$DepTime,breaks = seq(0,2400,by = 100) ))
plot(table(cut(airline$DepTime,breaks = seq(0,2400,by = 100) )))
