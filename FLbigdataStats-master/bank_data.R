library(dplyr)
library(ggplot2)
library(h2o)
localH2O = h2o.init(ip='127.0.0.1',port=54321)
#path is put after setting the working dir
bank_data = h2o.uploadFile('bank_customer_data.csv',destination_frame="",parse=T,header=T,sep=",",na.strings = c('unknown'),progressBar = FALSE,parse_type = 'CSV')

dim(bank_data)

summary(bank_data)

by_job <- bank_data_sample %>% group_by(y,job) %>% tally()

by_job
#plotting the y_job stats
