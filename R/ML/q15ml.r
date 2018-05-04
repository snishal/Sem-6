library(glmnet)
data("mtcars")

train = mtcars[, c("am", "cyl", "hp", "wt")]

X = as.matrix(train[, c("cyl", "hp", "wt")])

model = glmnet(y = train[,"am"], x = X, family="binomial", alpha=0)

print(model)
print(summary(model))