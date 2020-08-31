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
