library(nnet)
data("mtcars")

train = mtcars[, c("am", "cyl", "hp", "wt")]

model = nnet(am ~ cyl + hp + wt, data = train, size = 2)

print(model)
print(summary(model))

test = mtcars[, c("am", "cyl", "hp", "wt")]
prediction = predict(model, test)

View(cbind(test, prediction), "Prediction")