nums <- as.integer(strsplit(readline(prompt <- "Enter Space separated Number : ")," ")[[1]])

for(vec in nums){
  if(vec == 2){
    print("2 is Prime")
  }else{
    temp <- 2:sqrt(vec)
    print(paste(vec,ifelse(sum(vec%%temp) == 0,"is not Prime","is Prime")))
  }
}