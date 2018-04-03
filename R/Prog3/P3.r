library(BBmisc)

wine = read.csv(file='wine.csv', header = TRUE)

colMeanWine = c()

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

colMeanIris = c()

for(col in names(iris)){
  if(class(iris[,col]) == 'numeric' || class(iris[,col]) == 'integer'){
    colMeanIris[col] = colMeans(iris[col], na.rm = TRUE)
    if(colMeanIris[col] != 0){
      iris[col] = normalize(iris[col], method = "standardize")
    }
  }
}

for(col in names(iris)){
  if(class(iris[,col]) == 'numeric' || class(iris[,col]) == 'integer'){
    colMeanIris[col] = colMeans(iris[col], na.rm = TRUE)
  }
}

View(iris)
View(colMeanIris)
