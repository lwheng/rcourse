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

# Basic Operations with a DF
stats[1:10,]
stats[3:9,]
stats[c(4,100),]
# Remeber how the [] work:
stats[1,]
is.data.frame(stats[1,]) # no need to drop=FALSE
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=FALSE])

#multiply columns
stats$Birth.rate * stats$Internet.users

# add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#Test of knowledge
stats$xyz <- 1:5
head(stats,n=10)

#Remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)