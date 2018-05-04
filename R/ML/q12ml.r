data("longley")

model = lm(Employed ~ Population, longley)

test = data.frame(Population = c(121, 140, 110))
prediction = predict(model, test)

View(cbind(test, prediction), "Prediction")

plot(longley$Population, longley$Employed, abline(model), cex = 1.3, pch = 16, main = "Employment Prediction", xlab = "Population", ylab = "Employment")