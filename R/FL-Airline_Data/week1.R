#import all of the data from 2008 dataset
airline=read.csv('C://myRepo//R//FL-Airline_Data//2008.csv')


head(airline$Origin == 'IND')
sum(airline$Origin == 'IND')
sum(airline$Origin == 'ORD')
sum(airline$Dest == 'ORD')
sum( (airline$Origin == 'IND') & (airline$Dest == 'ORD') )
myIndieFlights <- subset(airline,airline$Origin=='IND')
myIndieDest <- subset(airline,airline$Dest=='IND')
plot(table(myIndieFlights$Month))
myTupFlights <- subset(airline,airline$Origin=='TUP')
mean(myTupFlights$DepDelay)
head(myIndieFlights)
sum(myIndieFlights$DepTime<600,na.rm = TRUE)
sum(airline$Dest=='LAX')
temp_flight<-subset(airline,(airline$Origin == 'ATL') & (airline$Dest == 'LAX') )
sum(temp_flight$DepTime < 1200,na.rm = TRUE)
