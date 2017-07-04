songs <- read.csv('songs.csv')
songs_2010 <- subset(songs,songs$year=='2010')
mj_songs <- subset(songs,songs$artistname=='Michael Jackson')
mj_songs_2010 <- subset(songs_2010,songs_2010$artistname=='Michael Jackson')
mj_top10 <- subset(mj_songs,mj_songs$Top10==TRUE)
table(songs$timesignature)

SongsTrain = subset(songs,songs$year<=2009)

SongsTest = subset(songs,songs$year==2010)

nonvars = c("year", "songtitle", "artistname", "songID", "artistID")

SongsTrain = SongsTrain[ , !(names(SongsTrain) %in% nonvars) ]

SongsTest = SongsTest[ , !(names(SongsTest) %in% nonvars) ]

SongsLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)

summary(SongsLog1)

cor(songs$loudness,songs$energy)

SongsLog2 = glm(Top10 ~ . - loudness, data=SongsTrain, family=binomial)

summary(SongsLog2)

SongsLog3 = glm(Top10 ~ . - energy, data=SongsTrain, family=binomial)

summary(SongsLog3)
