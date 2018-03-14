input <- as.integer(strsplit(readline(prompt <- "Enter Space Separated Number : ")," ")[[1]])
result <- rbind(input^1,input^2,input^3)
print(result)