number <- as.integer(readline(prompt <- "Enter a Number : "))
armstrong <- 0
temporary <- number

while(number != 0){
  armstrong <- armstrong + (number%%10)^3
  number <- floor(number/10);
}
print(ifelse(armstrong == temporary,"Is Armstrong","Is not Armstrong"))

