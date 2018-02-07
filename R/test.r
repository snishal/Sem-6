library(dplyr)
df = starwars

df$mass[is.na(df$mass)] <- colMeans(df['mass'], na.rm = TRUE)

temp = table(data$hair_color)
df$hair_color[is.na(df$hair_color)] <- names(temp[temp == max(temp)])

View(df)