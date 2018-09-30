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

#identifying oppositions
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

#splitting total dataset into train and test data 75% Train 25% Test
tot_samp_size <- floor(0.75*nrow(sri_lanka_all))  
set.seed(123)
tot_train_index <- sample(seq_len(nrow(sri_lanka_all)), size = tot_samp_size)

train_tot <- sri_lanka_all[tot_train_index,]
test_tot <- sri_lanka_all[-tot_train_index,]

#splitting country wise dataset into train and test data 75% Train 25% Test
ind <- sample(seq_len(nrow(opp_afgh)), size = floor(0.75*nrow(opp_afgh)))
train_afgh <- opp_afgh[ind,]
test_afgh <- opp_afgh[-ind,]

ind <- sample(seq_len(nrow(opp_aus)), size = floor(0.75*nrow(opp_aus)))
train_aus <- opp_aus[ind,]
test_aus <- opp_aus[-ind,]

ind <- sample(seq_len(nrow(opp_bang)), size = floor(0.75*nrow(opp_bang)))
train_bang <- opp_bang[ind,]
test_bang <- opp_bang[-ind,]

ind <- sample(seq_len(nrow(opp_ber)), size = floor(0.75*nrow(opp_ber)))
train_ber <- opp_ber[ind,]
test_ber <- opp_ber[-ind,]

ind <- sample(seq_len(nrow(opp_can)), size = floor(0.75*nrow(opp_can)))
train_can <- opp_can[ind,]
test_can <- opp_can[-ind,]

ind <- sample(seq_len(nrow(opp_chin)), size = floor(0.75*nrow(opp_chin)))
train_chin <- opp_chin[ind,]
test_chin <- opp_chin[-ind,]

ind <- sample(seq_len(nrow(opp_eng)), size = floor(0.75*nrow(opp_eng)))
train_eng <- opp_eng[ind,]
test_eng <- opp_eng[-ind,]

ind <- sample(seq_len(nrow(opp_hong)), size = floor(0.75*nrow(opp_hong)))
train_hong <- opp_hong[ind,]
test_hong <- opp_hong[-ind,]

ind <- sample(seq_len(nrow(opp_ind)), size = floor(0.75*nrow(opp_ind)))
train_ind <- opp_ind[ind,]
test_ind <- opp_ind[-ind,]

ind <- sample(seq_len(nrow(opp_ire)), size = floor(0.75*nrow(opp_ire)))
train_ire <- opp_ire[ind,]
test_ire <- opp_ire[-ind,]

ind <- sample(seq_len(nrow(opp_jap)), size = floor(0.75*nrow(opp_jap)))
train_jap <- opp_jap[ind,]
test_jap <- opp_jap[-ind,]

ind <- sample(seq_len(nrow(opp_kenya)), size = floor(0.75*nrow(opp_kenya)))
train_kenya <- opp_kenya[ind,]
test_kenya <- opp_kenya[-ind,]

ind <- sample(seq_len(nrow(opp_neth)), size = floor(0.75*nrow(opp_neth)))
train_neth <- opp_neth[ind,]
test_neth <- opp_neth[-ind,]

ind <- sample(seq_len(nrow(opp_newz)), size = floor(0.75*nrow(opp_newz)))
train_newz <- opp_newz[ind,]
test_newz <- opp_newz[-ind,]

ind <- sample(seq_len(nrow(opp_pak)), size = floor(0.75*nrow(opp_pak)))
train_pak <- opp_pak[ind,]
test_pak <- opp_pak[-ind,]

ind <- sample(seq_len(nrow(opp_sa)), size = floor(0.75*nrow(opp_sa)))
train_sa <- opp_sa[ind,]
test_sa <- opp_sa[-ind,]

ind <- sample(seq_len(nrow(opp_scot)), size = floor(0.75*nrow(opp_scot)))
train_scot <- opp_scot[ind,]
test_scot <- opp_scot[-ind,]

ind <- sample(seq_len(nrow(opp_sk)), size = floor(0.75*nrow(opp_sk)))
train_sk <- opp_sk[ind,]
test_sk <- opp_sk[-ind,]

ind <- sample(seq_len(nrow(opp_thai)), size = floor(0.75*nrow(opp_thai)))
train_thai <- opp_thai[ind,]
test_thai <- opp_thai[-ind,]

ind <- sample(seq_len(nrow(opp_uae)), size = floor(0.75*nrow(opp_uae)))
train_uae <- opp_uae[ind,]
test_uae <- opp_uae[-ind,]

ind <- sample(seq_len(nrow(opp_wi)), size = floor(0.75*nrow(opp_wi)))
train_wi <- opp_wi[ind,]
test_wi <- opp_wi[-ind,]

ind <- sample(seq_len(nrow(opp_zimb)), size = floor(0.75*nrow(opp_zimb)))
train_zimb <- opp_zimb[ind,]
test_zimb <- opp_zimb[-ind,]
