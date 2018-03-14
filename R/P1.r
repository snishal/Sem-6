library(dplyr)

people = read.csv(file = 'people.csv', header = TRUE)

people = people %>%
  filter(0 < Age & Age < 150) %>%
    filter(YearsMarried <= Age) %>%
      filter(Status == 'single' | Status == 'married' | Status == 'widowed')

print(summary(people))
plot(people)
