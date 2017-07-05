library(dplyr)
library(ggplot2)
library(h2o)
localH2O = h2o.init(ip='127.0.0.1',port=54321)
#path is put after setting the working dir
bank_data = h2o.uploadFile('bank_customer_data.csv',destination_frame="",parse=T,header=T,sep=",",na.strings = c('unknown'),progressBar = FALSE,parse_type = 'CSV')

dim(bank_data)

summary(bank_data)

sample_frame <- h2o.splitFrame(bank_data,ratios = 0.2)[[1]]

bank_data_sample <- as.data.frame(sample_frame)

by_job <- bank_data_sample %>% group_by(y,job) %>% tally()


#plotting the y_job stats
ggplot(data=by_job,aes(x=job,y=n, fill=y))+geom_bar(stat="identity",position = "dodge")
        