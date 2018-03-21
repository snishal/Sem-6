library(BBmisc)

wine = read.csv(file='wine.csv', header = TRUE)

for(col in names(wine)){
  if(class(wine[,col]) == 'numeric' || class(wine[,col]) == 'integer'){
    colMeanWine[col] = colMeans(wine[col], na.rm = TRUE)
    if(colMeanWine[col] != 0){
      wine[col] = normalize(wine[col], method = "standardize")
    }
  }
}

for(col in names(wine)){
  if(class(wine[,col]) == 'numeric' || class(wine[,col]) == 'integer'){
    colMeanWine[col] = colMeans(wine[col], na.rm = TRUE)
  }
}


View(wine)
View(colMeanWine)

dirty_iris = read.csv(file='dirty_iris.csv', header = TRUE)

for(col in names(dirty_iris)){
  if(class(dirty_iris[,col]) == 'numeric' || class(dirty_iris[,col]) == 'integer'){
    colMeanIris[col] = colMeans(dirty_iris[col], na.rm = TRUE)
    if(colMeanIris[col] != 0){
      dirty_iris[col] = normalize(dirty_iris[col], method = "standardize")
    }
  }
}

for(col in names(dirty_iris)){
  if(class(dirty_iris[,col]) == 'numeric' || class(dirty_iris[,col]) == 'integer'){
    colMeanIris[col] = colMeans(dirty_iris[col], na.rm = TRUE)
  }
}

View(dirty_iris)
View(colMeanIris)
