#Author : Nilucshan Siva
#This script is used to perform Naive Bayes algorithm
#Used library : e1071

library(e1071)

#loading the refined data
source("data_preprocess.R")

#removing columns which are not of our interest
sri_lanka_all <- sri_lanka_all[ , -which(names(sri_lanka_all) %in% c("outcome","dates", "player_of_match","winner"))]

#fitting Naive Bayes model
nbModel <- naiveBayes(result ~ city + match_type + overs + venue + opposition + toss_winner + toss_decision, data=sri_lanka_all)

#prediction on the dataset
nbPredictions <- predict(nbModel,sri_lanka_all)

#confusion matrix to check accuracy
table(nbPredictions,sri_lanka_all$result)
