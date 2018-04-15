library(rpart) #Decison Tree
library(caret) #Confusion Matrix, train
library(e1071) #Naive Bayes
library(class) #Knn
data(iris) #load dataset

#Holdout
smp_size <- floor(0.75 * nrow(iris))
train <- iris[1:smp_size, ]
test <- iris[-(1:smp_size), ]

#Naive Bayes
model <- naiveBayes(Species ~ ., data = train)
prediction <- predict(model, test)
View(confusionMatrix(prediction, test[,5])$table, 'NaiveBayes Holdout')

#Decision Tree
model <- rpart(Species ~ ., data = train)
prediction <- predict(model, test, type = "class")
View(confusionMatrix(prediction, test[,5])$table, 'Decision Tree Holdout')

#KNN
prediction = knn(train[,-5], test[,-5], factor(train[,5]), k = 10)
View(confusionMatrix(prediction, test[,5])$table, 'KNN Holdout')

#Random Subsampling
smp_size <- floor(0.75 * nrow(iris))
set.seed(123)
train_ind <- sample(nrow(iris), size = smp_size)
train <- iris[train_ind, ]
test <- iris[-train_ind, ]

#Naive Bayes
model <- naiveBayes(Species ~ ., data = train)
prediction <- predict(model, test)
View(confusionMatrix(prediction, test[,5])$table, 'NaiveBayes Random Sampling')

#Decision Tree
model <- rpart(Species ~ ., data = train)
prediction <- predict(model, test, type = "class")
View(confusionMatrix(prediction, test[,5])$table, 'Decision Tree Random Sampling')

#KNN
prediction = knn(train[,-5], test[,-5], factor(train[,5]), k = 10)
View(confusionMatrix(prediction, test[,5])$table, 'KNN Random Sampling')

#K-Fold Cross Validation Naive Bayes
train_control <- trainControl(method="cv", number=10)
model <- train(Species~., data=iris, trControl=train_control, method="nb")
prediction <- predict(model, test)
View(confusionMatrix(prediction, test[,5])$table, 'NaiveBayes KFOLD')

#K-Fold Cross Validation Decision Tree
train_control <- trainControl(method="cv", number=10)
model <- train(Species~., data=iris, trControl=train_control, method="rpart")
prediction <- predict(model, test)
View(confusionMatrix(prediction, test[,5])$table, 'Decision Tree KFOLD')

#K-Fold Cross Validation KNN
train_control <- trainControl(method="cv", number=10)
model <- train(Species~., data=iris, trControl=train_control, method="knn")
prediction <- predict(model, test)
View(confusionMatrix(prediction, test[,5])$table, 'KNN KFOLD')
