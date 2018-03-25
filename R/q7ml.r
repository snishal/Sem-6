M1 <- matrix(c(-12:-1), nrow = 4, byrow = TRUE)

M1 = abs(M1)

View(M1)

M1 = -M1

View(M1)

M1 = M1[,-1]
View(M1)

M1 = M1[-1,]
View(M1)

M1 = rbind(M1, c(10,11))
M1 = cbind(M1, c(12,13,14,15))

print(max(M1))
print(min(M1))

print(sum(M1))
