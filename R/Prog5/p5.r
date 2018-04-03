library(caret)
library(e1071)
data(iris)

#Holdout
## 75% of the sample size
smp_size <- floor(0.75 * nrow(iris))

train <- iris[1:smp_size, ]
test <- iris[-(1:smp_size), ]

m <- naiveBayes(Species ~ ., data = iris)
print(m)

prediction <- predict(m, test)
print(confusionMatrix(prediction, test[,5]))

#Random Subsampling
## 75% of the sample size
smp_size <- floor(0.75 * nrow(iris))

## set the seed to make your partition reproductible
set.seed(123)
train_ind <- sample(nrow(iris), size = smp_size)

train <- iris[train_ind, ]
test <- iris[-train_ind, ]

m <- naiveBayes(iris[,-5], iris[,5])
print(m)

prediction <- predict(m, test)
print(confusionMatrix(prediction, test[,5]))
