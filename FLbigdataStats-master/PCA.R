library(AER)
library(h2o)
localH2o = h2o.init(ip = "127.0.0.1", port = 54321)
data("HousePrices")
head(HousePrices)

housing_data<- as.h2o(HousePrices)

response <- housing_data[,1]

head(response)

covariates <- housing_data[,-1]

head(covariates)

pca_model <- h2o.prcomp(training_frame = covariates,
                        k=11,
                        max_iterations = 1000,
                        transform = "STANDARDIZE",
                        pca_method = "GramSVD"
                        )
summary(pca_model)

pca_data <- h2o.predict(pca_model,covariates)

pca_data <- pca_data[,1:5]
pca_data
