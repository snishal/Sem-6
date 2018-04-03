num <- readline(prompt <- "Enter a Number : ")

print(ifelse(num == sum((as.numeric(strsplit(num,"")[[1]]))^3),"Is Armstrong","Is not Armstrong"))