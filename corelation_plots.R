#Author : Nilucshan Siva
#This script is used to plot corelation between attributes

opp_data_list <- list(opp_afgh,opp_aus,opp_bang,opp_ber,opp_can,opp_can,opp_chin,opp_eng,opp_hong,opp_ind,opp_ire,opp_jap,opp_kenya,opp_neth,opp_newz,opp_pak,opp_sa,opp_scot,opp_sk,opp_thai,opp_uae,opp_wi,opp_zimb)

#Venue VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$venue,opp_data_list[[i]]$winner,"Venue","Winner")
}

#City VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$city,opp_data_list[[i]]$winner,"City","Winner")
}

#Toss Winner VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$toss_winner,opp_data_list[[i]]$winner,"Toss Winner","Winner")
}

#Date VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$dates,opp_data_list[[i]]$winner,"Date","Winner")
}

#Match Type VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$match_type,opp_data_list[[i]]$winner,"Match Type","Winner")
}

#Overs VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$overs,opp_data_list[[i]]$winner,"Venue","Winner")
}

#Toss Winner VS Toss Decision
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$toss_winner,opp_data_list[[i]]$toss_decision,"Toss Winner","Toss Decision")
}

#Venue VS Toss Decision 
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$venue,opp_data_list[[i]]$toss_decision,"Venue","Toss Decision")
}

#Toss Decision VS Winner
for(i in 1:length(opp_data_list)){
  corPlot(opp_data_list[[i]],opp_data_list[[i]]$toss_decision,opp_data_list[[i]]$winner,"Toss Decision","Winner")
}