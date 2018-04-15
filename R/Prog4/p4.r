library(arules)
grocery = read.csv(file="grocery.csv", header = FALSE)

rules <- apriori(Adult, parameter = list(supp = 0.5, conf = .5, target = "rules"))
summary(rules)
inspect(head(rules))