dirty_iris = read.csv(file='dirty_iris.csv', header = TRUE)
for(col in names(dirty_iris)){
  if(class(dirty_iris[,col]) == 'numeric' || class(dirty_iris[,col]) == 'integer'){
    dirty_iris[!is.na(dirty_iris[,col]) & (dirty_iris[,col] > 30 | dirty_iris[,col] < 0), col] = NA
  }
}

View(dirty_iris)

