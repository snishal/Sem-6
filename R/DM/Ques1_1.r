marks <- c()
names <- c()
count <- as.integer(readline(prompt<-"Enter Number of Students : "))
while(count > 0)
{
  name <- readline(prompt <- "Enter a Name : ")
  mark <- as.integer(strsplit(readline(prompt <- "Enter space separated Marks : ")," ")[[1]])
  marks <- rbind(marks,mark)
  names <- rbind(names,name)
  count <- count - 1
}
rownames(marks) <- names
marks <- cbind(marks,rowSums(marks),rowMeans(marks))
print(marks)
