library(h2o)
localH2o = h2o.init(ip = "127.0.0.1", port = 54321)

fn = "bank_customer_data.csv"

market_data <- h2o.uploadFile(fn,destination_frame = "",parse = T,header = T,sep = ",",parse_type = "CSV",na.strings = c("UNKNOWN"))


cluster_data = market_data[,c(-11,-21)]

summary(cluster_data)


cluster_model1 <- h2o.kmeans(training_frame = cluster_data,k = 3,standardize = T,init = "Random")

summary(cluster_model )

cluster_model2 <- h2o.kmeans(training_frame = cluster_data,k = 2,standardize = T,init = "Random")

summary(cluster_model2 )
