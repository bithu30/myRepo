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
