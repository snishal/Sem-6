library(arules)
grocery = read.transactions('grocey.csv', format = c("basket", "single"), sep = "", cols = NULL, rm.duplicates = FALSE, quote = "\"'", skip = 0, encoding = "unknown")

rules <- apriori(Adult, parameter = list(supp = 0.5, conf = .5, target = "rules"))
summary(rules)
inspect(head(rules))