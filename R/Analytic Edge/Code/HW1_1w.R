#loading data

mvt <- read.csv('mvtWeek1.csv')

#for Questions 1-5
str(mvt)
summary(mvt)

#for Section2 Q1-5

DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert
write.csv(mvt,file = "mvt_new.csv")

#for section3 Q1-5
mvt<-read.csv('mvt_new.csv')
hist(mvt$Year, breaks=100)
boxplot(mvt$Date~mvt$Arrest)
mvt <- read.csv('mvtWeek1.csv')
mvt_new<-read.csv('mvt_new.csv')

#for section4 Q1-5

sort(table(mvt$LocationDescription),decreasing = TRUE)

Top5 = subset(mvt_new,mvt_new$LocationDescription == 'STREET' | mvt_new$LocationDescription == 'ALLEY'| 
                mvt_new$LocationDescription == 'PARKING LOT/GARAGE(NON.RESID.)' |  mvt_new$LocationDescription == 'DRIVEWAY - RESIDENTIAL'|
                mvt_new$LocationDescription == 'GAS STATION')

str(Top5)

Top5$LocationDescription = factor(Top5$LocationDescription)

table(Top5$LocationDescription,Top5$Arrest)

gas_station = subset(Top5,Top5$LocationDescription=='GAS STATION')

table(gas_station$Weekday)

driveway = subset(Top5,Top5$LocationDescription=='DRIVEWAY - RESIDENTIAL')

table(driveway$Weekday)
