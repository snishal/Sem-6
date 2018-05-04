data("longley")

model = lm(Employed ~ Population + Unemployed + Armed.Forces, longley)

test = data.frame(Population = c(121, 140, 110), Unemployed = c(468, 400, 335), Armed.Forces = c(263, 200, 165))
prediction = predict(model, test)

View(cbind(test, prediction), "Prediction")