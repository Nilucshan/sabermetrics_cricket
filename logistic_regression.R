#Author : Nilucshan Siva
#This script is used to perform logistic regression analysis

library(caTools)
library(dplyr)

#source("data_preprocess_new.R")
#loading the data from .csv file
sri_lanka_all <- read.csv("sri_lanka.csv")

#converting it into a data frame
sri_lanka_all <- as.data.frame(sri_lanka_all)

#converting columns into appopriate type
sri_lanka_all$city <- as.character(sri_lanka_all$city)
sri_lanka_all$dates <- as.character.Date(sri_lanka_all$dates)
sri_lanka_all$match_type <- as.character(sri_lanka_all$match_type)
sri_lanka_all$outcome <- as.character(sri_lanka_all$outcome)
sri_lanka_all$overs <- as.numeric(sri_lanka_all$overs)
sri_lanka_all$player_of_match <- as.character(sri_lanka_all$player_of_match)
sri_lanka_all$venue <- as.character(sri_lanka_all$venue)
sri_lanka_all$winner <- as.character(sri_lanka_all$winner)
sri_lanka_all$opposition <- as.character(sri_lanka_all$opposition)
sri_lanka_all$toss_winner <- as.character(sri_lanka_all$toss_winner)
sri_lanka_all$toss_decision <- as.character(sri_lanka_all$toss_decision)

#filling empty values 
sri_lanka_all$city <- ifelse(sri_lanka_all$city == "","unknown",sri_lanka_all$city)
sri_lanka_all$match_type <- ifelse(sri_lanka_all$match_type == "","unknown",sri_lanka_all$match_type)
sri_lanka_all$outcome <- ifelse(sri_lanka_all$outcome == "","unknown",sri_lanka_all$outcome)
sri_lanka_all$overs <- ifelse(sri_lanka_all$overs == "","unknown",sri_lanka_all$overs)
sri_lanka_all$player_of_match <- ifelse(sri_lanka_all$player_of_match == "","unknown",sri_lanka_all$player_of_match)
sri_lanka_all$venue <- ifelse(sri_lanka_all$venue == "","unknown",sri_lanka_all$venue)
sri_lanka_all$winner <- ifelse(sri_lanka_all$winner == "","unknown",sri_lanka_all$winner)
sri_lanka_all$opposition <- ifelse(sri_lanka_all$opposition == "","unknown",sri_lanka_all$opposition)
sri_lanka_all$toss_winner <- ifelse(sri_lanka_all$toss_winner == "","unknown",sri_lanka_all$toss_winner)
sri_lanka_all$toss_decision <- ifelse(sri_lanka_all$toss_decision == "","unknown",sri_lanka_all$toss_decision)

#removing white spaces from necessary columns to remove typos and errors
sri_lanka_all$city <- gsub('\\s+','',sri_lanka_all$city)
sri_lanka_all$match_type <- gsub('\\s+','',sri_lanka_all$match_type)
sri_lanka_all$venue <- gsub('\\s+','',sri_lanka_all$venue)
sri_lanka_all$winner <- gsub('\\s+','',sri_lanka_all$winner)
sri_lanka_all$opposition <- gsub('\\s+','',sri_lanka_all$opposition)
sri_lanka_all$toss_winner <- gsub('\\s+','',sri_lanka_all$toss_winner)
sri_lanka_all$toss_decision <- gsub('\\s+','',sri_lanka_all$toss_decision)

#removing repeated data
sri_lanka_all <- unique(sri_lanka_all)

#identifying oppositions
opposition <- unique(sri_lanka_all$opposition)


sri_lanka_all$result <- ifelse(sri_lanka_all$winner == "SriLanka","yes","no")     #draw is considered as loss since it is an binomial classification
sri_lanka_all$result <- as.factor(sri_lanka_all$result)

#splitting the dataset into train and test
split <- sample.split(sri_lanka_all, SplitRatio = 0.75)
train <- subset(sri_lanka_all, split == "TRUE")
test <- subset(sri_lanka_all, split == "FALSE")

#train the model using training data
#use glm the general linear model function
#dependent variable is result
model <- glm(result ~ city + match_type + overs + venue + opposition + toss_winner + toss_decision, data = train, family = "binomial")

#model <- glm(result ~ city + match_type + overs + venue + opposition + toss_winner + toss_decision,family=binomial(link='logit'),data=train)

summary(model)

