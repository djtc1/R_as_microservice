


# A small script that imports Amazon S3 public data and runs a machine learning 
# algorithm called random forest to classify whether a high school is public or
# private based on multiple variables. The set is then encapsulated in a wrapper
# to transform any script and thus idea into a microservice that can be dockerizer
# and put into production on any existing cloud.


#* @post /meetup 
meetup <- function(ntree, na_wtf) {
  
  #########################################################
  #
  ## PREPARATION PART
  #
  #########################################################
  
  # Load packages
  library(randomForest) # Randomforest of course
  library(dplyr) # Dplyr, of course -> (http://dplyr.tidyverse.org/)
  library(rjson)

  # Load data from AWS
  load(url("https://s3.eu-west-3.amazonaws.com/meetup.public.data/lycee.RData"))
  
  
  #########################################################
  #
  ## TRAINING PART
  #
  #########################################################
  
  # Split the data {training and testing datasets}
  train <- lycee %>% sample_frac(0.8)
  
  # Set the seed for reproduction the experiment
  set.seed(123)
  
  # Run the random forest ;
  ( model <- randomForest(private_or_public ~ ., 
                          data = train, ntree = ntree,
                          na.action = na_wtf))
  
  
  #########################################################
  #
  ## TESTING PART
  #
  #########################################################
  
  # Predict the label from the model
  test <- anti_join(lycee, train)
  (test$predicted <- predict(model, test)) 
  
  
  #########################################################
  #
  ## RESULTS PART
  #
  #########################################################
  
  results <- table(test$predicted, test$private_or_public) %>% toJSON()

}


