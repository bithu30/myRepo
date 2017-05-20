
# Download each of the data sets for 2006, 2007, 2008
df1 <- read.csv("/Users/mark/Downloads/2006.csv")
df2 <- read.csv("/Users/mark/Downloads/2007.csv")
df3 <- read.csv("/Users/mark/Downloads/2008.csv")

# check their dimensions
dim(df1)
dim(df2)
dim(df3)

# row bind (using the rbind function) all 3 of these data frames into one big data frame
myDF <- rbind(df1,df2,df3)

# check its dimension
dim(myDF)

# remove the 3 smaller data frames
rm(df1,df2,df3)

# check the head and the tail of the new data frame with the 2006, 2007, 2008 flights
head(myDF)
tail(myDF)
unique(myDF$Year)

mytable <- table(list(myDF$Origin, myDF$Dest))
head(mytable)

# We can make a table with 315 rows and 321 columns,
# so that each entry corresponds to a unique Origin and Destination pair
dim(mytable)
315*321

# over 100,000 entries, but 94,000 of them are just zeroes (i.e., no such flights)
sum(mytable == 0)
sum(mytable != 0)

# it is more efficient to make a vector of the flight paths that are possible
mynewtable <- table(paste(myDF$Origin, myDF$Dest))

# indeed, there are 6266 flight paths possible, and we now stored
# the number of times that an airplane flew on each such flight path
length(mynewtable)
head(mynewtable)
tail(mynewtable)

# neither of these plots are very helpful
plot(mynewtable)
dotchart(mynewtable)

# we could try to sort the data first
dotchart(sort(mynewtable))

# we are focusing on the flights with IND as the origin
plot(mytable["IND", ])
dotchart(mytable["IND", ])

# save that flight data into a vector
v <- mytable["IND", ]

# now we only plot the flights from IND to airports that have at least one flight
dotchart(sort(v[v != 0]))

# we conclude by making a plot that displays the number of flights from IND
# to each city for which there were 4000 or more flights during 2006 to 2008
dotchart(sort(v[v > 4000]))

# importing the data about the airports themselves (locations, etc.)
airportsDF <- read.csv("/Users/mark/Downloads/airports.csv")
dim(airportsDF)

head(airportsDF, n=100)
airportsDF[airportsDF$iata == "IND", ]
airportsDF[airportsDF$iata %in% c("IND","ORD","MDW"), ]

# we made a vector to store the airport name, city, state
w <- paste(airportsDF$airport, airportsDF$city, airportsDF$state, sep=", ")
head(w)
tail(w)

# we are going to make the "name" of each entry in the vector
# by the 3 letter airport code itself
names(w) <- airportsDF$iata
head(w)
tail(w)
w[c("IND", "ORD", "MDW")]
w["CMH"]

# remember that this is the data we plotted in the dotchart
v[v > 4000]

# we still do not know where (city, state) these airports are located
# unless we just recognized the airport codes


w[names(v[v > 4000])]

# this is the data that we plotted
myvec <- v[v > 4000]
names(myvec) <- w[names(v[v > 4000])]

myvec
dotchart(myvec)

# this is a more insightful version of our earlier dotchart
# because we now have airport names and locations
dotchart(sort(myvec))

head(airportsDF)
table(airportsDF$state)

subset(airportsDF, state == "IN")

indyairports <- subset(airportsDF, state == "IN")

# we can make a table that shows all of the flight counts
# (as origins) for all airports in the full data set
# from 2006 to 2008 (not just Indiana airports)
table(myDF$Origin)
table(myDF$Origin)["IND"]
table(myDF$Origin)["ORD"]

# These are the 3-letter airport codes for the airports in Indiana
as.character(indyairports$iata)

# We can check to see which of these show up in our airline data from 2006 to 2008
table(myDF$Origin)[as.character(indyairports$iata)]

# We save that information (many of the entries are NA, which means that
# there were no commercial flights from those airports between 2006 to 2008)
v <- table(myDF$Origin)[as.character(indyairports$iata)]
v[!is.na(v)]
# these are the four airports in Indiana that do have commercial flights
names(v[!is.na(v)])

# and here is where those airports are located in the State of Indiana
subset(airportsDF, iata %in% names(v[!is.na(v)]))

# let's build a function that for a state given by the user
# will identify all of the airports in the 2006 to 2008 data set
# that have commerical flights from that state

# start with "IN" as the state example

# succinctly, this summarizes what we did in the previous video
mystate <- "IN"
myairports <- subset(airportsDF, state == mystate)
v <- table(myDF$Origin)[as.character(myairports$iata)]
subset(airportsDF, iata %in% names(v[!is.na(v)]))

# now wrap this into a function that lets us do this for any state
# the name of my function I am creating is called "activeairports"
# because that is the information it finds
# it only needs 1 input, namely, the state to look in
activeairports <- function(mystate) {
  myairports <- subset(airportsDF, state == mystate)
  v <- table(myDF$Origin)[as.character(myairports$iata)]
  subset(airportsDF, iata %in% names(v[!is.na(v)]))
}

# seems to work well for the Indiana airports
activeairports("IN")
# how about Illinois?
activeairports("IL")
# what about California?
activeairports("CA")


# consider the distances flown by the planes (this is the "data" in the tapply),
# split up according to the tailnum of the planes themselves (this is the way to split),
# and the function we use, within each group of distances, is the "sum"
head(sort(tapply(myDF$Distance, myDF$TailNum, sum)))
tail(sort(tapply(myDF$Distance, myDF$TailNum, sum)))

# here is an admittedly terrible plot of this
dotchart(sort(tapply(myDF$Distance, myDF$TailNum, sum)))

# we dive in further
v <- sort(tapply(myDF$Distance, myDF$TailNum, sum))
head(v)
v <- tail(v, 23)

# now v has the information about the 23 flights that flew the most miles
v

# but the last 3 are erroneous, so let's remove them
v <- v[1:20]

# these are the most traveled 20 airplanes
v

# we download information about the airplanes themselves
planeDF <- read.csv("/Users/mark/Downloads/plane-data.csv")
head(planeDF, n=200)

# here are the tailnums we are interested in
names(v)
# and here is the information from the supplemental data about these 20 airplanes
# that had the largest number of miles flown between 2006 to 2008
subset(planeDF, tailnum %in% names(v))


# reality check: there should be this many days during 2006 to 2008
365+365+366
# remember 2008 is a leap year

# handy: we have the month abbreviations stored in R in month.abb
month.abb

# we can use numbers from 1 to 12 as indices into this vector
month.abb[c(9,9,1,2,3,9,12,1,1,1,6,6,7)]

# the first six flights in our data frame myDF are all
# from Jan (2006, but do not see the year information here)
head(month.abb[myDF$Month])
# the last six flights are from Dec (2008, but we do not see it here)
tail(month.abb[myDF$Month])

# here are the dates of the flights, in international format
head(paste(myDF$DayofMonth, month.abb[myDF$Month], myDF$Year))
tail(paste(myDF$DayofMonth, month.abb[myDF$Month], myDF$Year))

mydates <- paste(myDF$DayofMonth, month.abb[myDF$Month], myDF$Year)

# we saved a vector more than 21 million dates corresponding to the 21 million flights
length(mydates)

# use tapply
# with the departure delays as the data
# and split the data up according to the value of mydates
# and the function we take (within each day) on the data is the "mean"
# of course we throw away the NA values
tapply(myDF$DepDelay, mydates, mean, na.rm=TRUE)

# these are the days with the smallest average departure delays
head(sort(tapply(myDF$DepDelay, mydates, mean, na.rm=TRUE)))

# these are the days with the longest average departure delays
tail(sort(tapply(myDF$DepDelay, mydates, mean, na.rm=TRUE)))

# here are the worst 20 days in terms of the average departure delays
tail(sort(tapply(myDF$DepDelay, mydates, mean, na.rm=TRUE)), n=20)



