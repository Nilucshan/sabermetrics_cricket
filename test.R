#sample decission tree
library(rpart)

fit <- rpart(winner ~ opposition + overs + city, method="class", data=sri_lanka_all)