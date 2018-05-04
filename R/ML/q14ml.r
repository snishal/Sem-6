data("mtcars")

train = mtcars[, c("am", "cyl", "hp", "wt")]

model = glm(am ~ cyl + hp + wt, data = train, family = binomial(link = "logit"))

print(model)
print(summary(model))