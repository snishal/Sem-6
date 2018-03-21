library(dplyr)

people = read.csv(file = 'people.csv', header = TRUE)

people = people %>%
  filter(0 < Age & Age < 150) %>%
    filter(YearsMarried <= Age) %>%
      filter(Status %in% c('single', 'married', 'widowed')) %>%
        filter((Age < 18 & Agegroup == 'child') | (18 < Age & Age < 65  & Agegroup == 'adult') | (65 < Age & Agegroup == 'elderly'))
      

View(people)
View(summary(people))
plot(people)
