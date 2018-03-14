vec <- as.integer(strsplit(readline(prompt <- "Enter Space separated Number : ")," ")[[1]])
total <- 0
for(v in vec)
{
  i <- sqrt(v)
  count <- 0
  while(i >= 2)
  {
    if(v%%i == 0)
      count <- count + 1
    i <- i-1
  }
  if(count == 1){
    print(v)
    total <- total+1
  }
}
print(paste("Total Count : ",total))