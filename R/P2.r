dirty_iris = read.csv(file='dirty_iris.csv', header = TRUE)

naFreeIris = dirty_iris %>% 
  filter(Sepal.Length != 'NA') %>%
  filter(Sepal.Width != 'NA') %>%
  filter(Petal.Length != 'NA') %>%
  filter(Petal.Width != 'NA') %>%
  filter(Species != 'NA')

print(count(naFreeIris))

dirty_iris[!is.na(dirty_iris$Sepal.Length) && dirty_iris$Sepal.Length < 0, "Sepal.Length"] <- NA
dirty_iris[!is.na(dirty_iris$Sepal.Width) && dirty_iris$Sepal.Width < 0, "Sepal.Width"] <- NA
dirty_iris[!is.na(dirty_iris$Petal.Length) && dirty_iris$Petal.Length < 0,"Petal.Length"] <- NA
dirty_iris[!is.na(dirty_iris$Petal.Width) && dirty_iris$Petal.Width < 0,"Petal.Width"] <- NA

print(dirty_iris)
#dirty_iris[is.na(dirty_iris$Sepal.Length),"Sepal.Length"] <- colMeans(dirty_iris["Sepal.Length"], na.rm = TRUE)
#dirty_iris[is.na(dirty_iris$Sepal.Width),"Sepal.Width"] <- colMeans(dirty_iris["Sepal.Width"], na.rm = TRUE)
#dirty_iris[is.na(dirty_iris$Petal.Length),"Petal.Length"] <- colMeans(dirty_iris["Petal.Length"], na.rm = TRUE)
#dirty_iris[is.na(dirty_iris$Petal.Width),"Petal.Width"] <- colMeans(dirty_iris["Petal.Width"], na.rm = TRUE)

