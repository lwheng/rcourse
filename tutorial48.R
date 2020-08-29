getwd()
setwd("/Users/lwheng/dev/rcourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats
typeof(stats)

# Exploring data
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats, n=10)
str(stats)
summary(stats)

# Using the $ sign
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[2]

unique(stats$Income.Group)
