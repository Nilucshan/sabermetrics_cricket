#Author : Nilucshan Siva
#This script is used to prepare the data set for the analysis

library(dplyr)

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

#filtering data country wise
opposition <- unique(sri_lanka_all$opposition)

#filtering data country wise
opp_aus <- filter(sri_lanka_all, sri_lanka_all$opposition == "Australia")
opp_sa <- filter(sri_lanka_all, sri_lanka_all$opposition == "SouthAfrica")
opp_ind <- filter(sri_lanka_all, sri_lanka_all$opposition == "India")
opp_pak <- filter(sri_lanka_all, sri_lanka_all$opposition == "Pakistan")
opp_eng <- filter(sri_lanka_all, sri_lanka_all$opposition == "England")
opp_zimb <- filter(sri_lanka_all, sri_lanka_all$opposition == "Zimbabwe")
opp_wi <- filter(sri_lanka_all, sri_lanka_all$opposition == "WestIndies")
opp_ire <- filter(sri_lanka_all, sri_lanka_all$opposition == "Ireland")
opp_thai <- filter(sri_lanka_all, sri_lanka_all$opposition == "Thailand")
opp_bang <- filter(sri_lanka_all, sri_lanka_all$opposition == "Bangladesh")
opp_newz <- filter(sri_lanka_all, sri_lanka_all$opposition == "NewZealand")
opp_ber <- filter(sri_lanka_all, sri_lanka_all$opposition == "Bermuda")
opp_kenya <- filter(sri_lanka_all, sri_lanka_all$opposition == "Kenya")
opp_uae <- filter(sri_lanka_all, sri_lanka_all$opposition == "UnitedArabEmirates")
opp_can <- filter(sri_lanka_all, sri_lanka_all$opposition == "Canada")
opp_jap <- filter(sri_lanka_all, sri_lanka_all$opposition == "Japan")
opp_neth <- filter(sri_lanka_all, sri_lanka_all$opposition == "Netherlands")
opp_afgh <- filter(sri_lanka_all, sri_lanka_all$opposition == "Afghanistan")
opp_scot <- filter(sri_lanka_all, sri_lanka_all$opposition == "Scotland")
opp_hong <- filter(sri_lanka_all, sri_lanka_all$opposition == "HongKong")
opp_chin <- filter(sri_lanka_all, sri_lanka_all$opposition == "China")
opp_sk <- filter(sri_lanka_all, sri_lanka_all$opposition == "SouthKorea")

