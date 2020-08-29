getwd()
setwd("/Users/lwheng/dev/rcourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats

# Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & filter,]
stats[stats$Income.Group == "High income",]
