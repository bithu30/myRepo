library(h2o)
localH2o = h2o.init(ip = "127.0.0.1", port = 54321)
fn="bank_customer_data.csv"

market_data <- h2o.uploadFile(fn,destination_frame = "",header = T,parse = T,sep = ",",progressBar = FALSE,na.strings = c("unknown"),parse_type = 'CSV')
summary(market_data)
market_data_1 <- market_data[,-11]
split_data <- h2o.splitFrame(market_data_1,ratios = 0.75)
train <- split_data[[1]]
test <- split_data[[2]]
str(train)
glm_model <- h2o.glm(x=1:19,y=20,training_frame = train,validation_frame = test,intercept = T,max_iterations = 100,solver = "L_BFGS",family = "binomial",alpha = 1)
summary(glm_model)
