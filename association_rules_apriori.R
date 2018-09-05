#Author : Nilucshan Siva
#This script is ued to find association rules with Apriori alogorithm

#loading necessary libraries
library(arules)
library(arulesViz)

#copying country data frame into an variable
transaction_data <- sri_lanka_all

#columns need to converted to factors to change into transaction class
transaction_data[] <- lapply(transaction_data, factor) 

#converting data fram into transactions
transaction_data <- as(transaction_data, "transactions")

#finding the most frequent items
#frequentItemSet <- eclat (transaction_data, parameter = list(supp = 0.07, maxlen = 11))

#creating assoication rules
rules <- apriori(transaction_data, parameter = list(supp = 0.001, conf = 0.5))

#sorting rules based on confidence
#rules_conf <- sort (rules, by="confidence", decreasing=TRUE) 

#sorting rules based on lift
#rules_lift <- sort (rules, by="lift", decreasing=TRUE)

#finding redundant rules (subset rules of larger rules)
#################### RUN INTO IDLE STATE ###########################
#redundant_rules <- which(colSums(is.subset(rules, rules)) > 1)

#finding rules against specific


