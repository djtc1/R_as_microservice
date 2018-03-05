
# Import package
library(plumber)

# Wrap the model/function/microservice/life
r<-plumb("/microservice/predict_public_private.R")

# Run the server
r$run(host = '0.0.0.0', port = 8000)
