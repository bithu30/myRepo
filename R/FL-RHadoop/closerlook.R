# Most popular airports
sort(table(myDF$Origin))
?sort

# look at the origin airports in order
# from most popular to least popular
# by using the decreasing=T parameter when we sort
sort(table(myDF$Origin), decreasing=T)[1:10]
# These are the most popular ten airports,
# according to the number of origins of flights

sort(table(myDF$Dest), decreasing=T)[1:10]

# Remember that we have about 7 million flights altogether in 2008
dim(myDF)

# These are the names of the 10 most popular airports in 2008
mostpopular <- names(sort(table(myDF$Dest), decreasing=T)[1:10])

# We check each flight to see whether its origin was
# one of these 10 most popular airports

# 2.3 million of the 7 million flights had their origin
# in one of these popular cities
sum(myDF$Origin %in% mostpopular)

# same concept, for the destinations
sum(myDF$Dest %in% mostpopular)

# Find flights for which the origin and the destination
# were among the 10 most popular airports
sum(myDF$Origin %in% mostpopular & myDF$Dest %in% mostpopular)
# Half a million of the flights had origin and destination
# at one of the 10 most popular airports.

# review: Here is the vector of the ten most popular airports
mostpopular

myDF$Origin[1:100]
(myDF$Origin %in% mostpopular)[1:100]

# it is good to frequently check things like:
dim(myDF)  # the dimension of a data frame

length(mostpopular)  # length of a vector

class(mostpopular)   # class of a vector

# Here is the table of how many flights originate at each airport
table(myDF$Origin)

# We can index a vector according to the names of the 
# elements in the vector
table(myDF$Origin)["IND"]

# We can manually type the names of elements we want to extract
table(myDF$Origin)[c("IND","ORD","JFK","EWR","IAD")]

# or we can save the indices of elements we want to extract
# into a vector, such as mostpopular:
mostpopular

# and use that whole vector as a set of indices into another vector
table(myDF$Origin)[mostpopular]

# we can do this on the fly as well, for instance:
myairports <- c("IND","ORD","JFK","EWR","IAD")
# and use this as an index into the table of counts
table(myDF$Origin)[myairports]

# Here are two ways to check the first 20 flights
# and see which ones departed on time (or early)
head(myDF$DepDelay <= 0, n=20)
(myDF$DepDelay <= 0)[1:20]

# This tells us how many flights at each airport
# departed on time or early
tapply(myDF$DepDelay <= 0, myDF$Origin, sum, na.rm=T)
# This is the total number of flights
# that departed from each airport
table(myDF$Origin)

# We restrict attention to only the 10 most popular airports
tapply(myDF$DepDelay <= 0, myDF$Origin, sum, na.rm=T)[mostpopular]
table(myDF$Origin)[mostpopular]

# We divide each element in the first vector
# by the analogous element in the second vector
# This gives us basically 10 divisions in a row
tapply(myDF$DepDelay <= 0, myDF$Origin, sum, na.rm=T)[mostpopular] / 
  table(myDF$Origin)[mostpopular]
# and as a result, we know the percentage of the flights
# at each of the 10 most popular airports
# that departed on time or early

# double check the result for Atlanta (looks right)
233718/414513  

# We had already analyzed (in an earlier session)
# how many flights occur altogether, during each hour of the day
v <- table(cut(myDF$DepTime, breaks=seq(0,2400,by=100)))

# Here is another way to do that, by dividing each 4-digit time
# by 100, and then rounding the resulting fraction up to the
# next closest integer
w <- table(ceiling(myDF$DepTime / 100))

# all of the results from the two methods agree; none disagree
sum(v != w)

# Here is the analogous plot
# and the x-axis looks better than it did the first time
# that we visited this question
plot(w)

# We can break the data in the DepDelay vector
# according to which city of origin or according to the month 
tapply(myDF$DepDelay, myDF$Origin, length)
tapply(myDF$DepDelay, myDF$Month, length)

# We now know how many flights occur from each airport in each month
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)

# We can extract the data from a particular row (i.e., origin airport)
# and from a particular column (i.e., the month)
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["IND",6]
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["ATL",3]

# notice that we need to give 2 dimensions when we extract data from a matrix
# we need to specify both the row and the column

# Here is the number of flights from 3 particular airports
# during the months 7,8,9,10 (July through October)
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month),
       length)[c("ATL","AUS","BDL"), c(7,8,9,10)]
# same effect, just writing 7:10 to get the vector c(7,8,9,10)
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month),
       length)[c("ATL","AUS","BDL"), 7:10]

# Here are all the flights, month-by-month, from IND airport
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["IND", 1:12]

# same effect, just leave the column specification blank
# but make sure to put a comma between the rows and the columns
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["IND", ]

# What about Chicago O'Hare?
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["ORD", ]

# What about both IND and ORD at once?
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"), ]

# We can check that the result is a matrix
class(tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month),
             length)[c("IND","ORD"), ])

# how big is the matrix?  should be 2-by-12
dim(tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month),
             length)[c("IND","ORD"), ])

# We make a data frame with all of the flights that are
# delayed more than 30 minutes when departing
longdelayDF <- subset(myDF, myDF$DepDelay > 30)
# There are over 800000 such flights
dim(longdelayDF)

# double-check
head(longdelayDF$DepDelay)

# The counts of all of the flights, from ORD or IND, according to month     
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"), ]

# same thing, but now for the flight with delays or more than 30 minutes
tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"), ]

# We can divide entry by entry, to get the percentage of flights
# that have really long delays (more than 30 minutes) from IND or ORD
# broken up, month by month
M1 <- tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"), ]
M2 <- tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"), ]

# here is the division; it yields the percentage of flights with long delays
M1/M2

# We can plot this with a dotchart
?dotchart
dotchart(M1/M2)

# M3 has the percentages of flights with long delays from IND or ORD, month-by-month
M3 <- M1/M2
dotchart(M3)
M3["ORD", ] - M3["IND", ] > 0

# Break the day into 4 parts:
# early morning (1) corresponds to times midnight to 6 AM
# late morning (2) corresponds to times 6 AM to 12 noon
# early evening (3) corresponds to times 12 noon to 6 PM
# late evening (4) corresponds to times 6 PM to 12 midnight
v <- ceiling(myDF$DepTime/600)

# build a vector called parts of day
# initially we put 7000000 NA values inside
partsofday <- rep(NA, times=dim(myDF)[1])
head(partsofday)
length(partsofday)

partsofday[v == 1] <- "early morning"
partsofday[v == 2] <- "late morning"
partsofday[v == 3] <- "early evening"
partsofday[v == 4] <- "late evening"
table(partsofday)

# double-check that the length of partsofday vector is the same
# as the number of rows in the data frame myDF
length(partsofday)
dim(myDF)

# and then we can create a new column in the myDF data frame called "timeofday"
# and we can store this information we just found into this column
myDF$timeofday <- partsofday

# now our data frame myDF has 30 columns instead of 29 columns
dim(myDF)

# just check to make sure that the first 6 flights were done properly
head(myDF$timeofday)
head(myDF$DepTime)

tail(myDF$timeofday)
tail(myDF$DepTime)

# We can tabulate how many flights occur, by splitting the flights according to
# both the city of origin and also the time of day when the flight departed
tapply(myDF$DepDelay, list(myDF$Origin, myDF$timeofday), length)

# We get matrix with all of the results
class(tapply(myDF$DepDelay, list(myDF$Origin, myDF$timeofday), length))
dim(tapply(myDF$DepDelay, list(myDF$Origin, myDF$timeofday), length))
# We have a matrix with 303 rows (one row per city)
# and 4 columns (one column per time of day)

# We can restrict attention to the flights that departed from IND, CVG, or JFK
tapply(myDF$DepDelay, list(myDF$Origin, myDF$timeofday), length)[c("IND","CVG","JFK"), ]
# Here we did not specify the columns, so as a result, we get all 4 possible columns

