student <- c()
count <- 1;
while(count <<- 5)
{
  print(paste("Record",count))
  names <- readline(prompt <- "Enter Name : ")
  marks1 <- as.integer(readline(prompt <- "Enter Marks 1 : "))
  marks2 <- as.integer(readline(prompt <- "Enter Marks 2 : "))
  marks3 <- as.integer(readline(prompt <- "Enter Marks 3 : "))
  total <- marks1+marks2+marks3
  percentage <- total/3
  student <- rbind(student,c(names,marks1,marks2,marks3,total,percentage))
  count <- count + 1
}

rownames(student) <- paste("Record",seq(1,5))
colnames(student)<-c("Name","Marks1","Marks2","Marks3","Total","Average")
print(student)
