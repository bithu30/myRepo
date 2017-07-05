cps <- read.csv('CPSData.csv')
str(cps)
summary(cps)
sort(table(cps$State))
table(cps$Race,cps$Hispanic)
table(cps$Region, is.na(cps$Married))
table(cps$Sex, is.na(cps$Married))
table(cps$Age, is.na(cps$Married))
table(cps$Citizenship, is.na(cps$Married))
table(cps$State,is.na(cps$MetroAreaCode))
table(cps$Region,is.na(cps$MetroAreaCode))
tapply(cps$State,is.na(cps$MetroAreaCode))

MetroAreaCode<-read.csv('MetroAreaCodes.csv')

CountryMap<-read.csv('CountryCodes.csv')

CPS = merge(cps, MetroAreaCode, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)

sort(table(CPS$MetroArea),decreasing = TRUE)

sort(tapply(CPS$Hispanic,CPS$MetroArea,mean))

asian<- subset(CPS,CPS$Race=="Asian")

table(asian$MetroArea)

sort(tapply(CPS$Race=="Asian",CPS$MetroArea,mean,na.rm=T))

sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean,na.rm=T),decreasing = T)

CPS = merge(CPS, CountryMap, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)

nyc <- subset(CPS,CPS$MetroArea=='New York-Northern New Jersey-Long Island, NY-NJ-PA')

mean(nyc$Country!='United States',na.rm = T)

sort(tapply(CPS$Country=="India", CPS$MetroArea, sum, na.rm=T))

sort(tapply(CPS$Country=="Brazil", CPS$MetroArea, sum, na.rm=T))

sort(tapply(CPS$Country=="Somalia", CPS$MetroArea, sum, na.rm=T))
