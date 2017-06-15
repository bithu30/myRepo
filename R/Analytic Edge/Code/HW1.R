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