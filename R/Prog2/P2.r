library(dplyr)
library(editrules)
dirty_iris = read.csv(file='dirty_iris.csv', header = TRUE)
View(dirty_iris)

naFreeIris = dirty_iris %>% 
  filter(Sepal.Length != 'NA') %>%
  filter(Sepal.Width != 'NA') %>%
  filter(Petal.Length != 'NA') %>%
  filter(Petal.Width != 'NA') %>%
  filter(Species != 'NA')

View(count(naFreeIris))
View(naFreeIris)

temp_dirty_iris = dirty_iris

for(col in names(temp_dirty_iris)){
  if(class(temp_dirty_iris[,col]) == 'numeric' || class(temp_dirty_iris[,col]) == 'integer'){
    temp_dirty_iris[!is.na(temp_dirty_iris[,col]) & (temp_dirty_iris[,col] > 30 | temp_dirty_iris[,col] < 0), col] = NA
  }
}

for(col in names(temp_dirty_iris)){
  if(class(temp_dirty_iris[,col]) == 'numeric' || class(temp_dirty_iris[,col]) == 'integer'){
    temp_dirty_iris[is.na(temp_dirty_iris[,col]), col] = colMeans(temp_dirty_iris[col], na.rm = TRUE)
  }
}

View(temp_dirty_iris)

rules <- editfile(file = 'rules.txt', type = 'all')

violations = violatedEdits(rules, dirty_iris, datamodel = TRUE)
View(summary(violations))
plot(violations)


stat = boxplot.stats(dirty_iris['Sepal.Length'])
View(stat$out)
View(dirty_iris[!is.na(dirty_iris$Sepal.Length) & dirty_iris$Sepal.Length %in% stat$out, ])
