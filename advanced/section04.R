setwd("/Users/lwheng/dev/rcourse/advanced")
getwd()

Chicago <- read.csv("Weather Data/Chicago-F.csv", row.names = 1)
Chicago

NewYork <- read.csv("Weather Data/NewYork-F.csv", row.names = 1)
NewYork

Houston <- read.csv("Weather Data/Houston-F.csv", row.names = 1)
Houston

SanFrancisco <- read.csv("Weather Data/SanFrancisco-F.csv", row.names = 1)
SanFrancisco

is.data.frame(Chicago)

# Convert to matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(Chicago)

# Put into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather$Chicago["AvgHigh_F", "Jan"]

# What is 'Apply' family? apply(), lapply(), sapply() are the most popular ones

# Using apply()
apply(Chicago, 1, mean)
apply(Chicago, 1, max)
apply(Chicago, 1, min)

# Practice
apply(Chicago, 2, mean) # makes no sense, just for practice
apply(Chicago, 2, max) # makes no sense, just for practice
apply(Chicago, 2, min) # makes no sense, just for practice

# Compare
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

# Using lapply()
?lapply()
Chicago
t(Chicago)
t(Weather$Chicago)
lapply(Weather, t)

Chicago
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)

?rowMeans
Chicago
lapply(Weather, rowMeans)

# Combining lapply() with []
Weather
Weather$Chicago[1,1]
lapply(Weather, "[", 1, 1)
lapply(Weather, "[", 1, )
lapply(Weather, "[", , "Mar")

# Adding your own functions
func <- function(x) x[1,]
diff <- function(x) x[1,] - x[2,]
fluc <- function(x) round((x[1,] - x[2,])/x[2,], 2)
Weather
lapply(Weather, func)
lapply(Weather, diff)
lapply(Weather, fluc)

# Using sapply()
sapply(Weather, func)
sapply(Weather, diff)
sapply(Weather, fluc) # Deliv 2

round(sapply(Weather, rowMeans), 2) # Deliv 1


# Nesting apply()
Weather
lapply(Weather, rowMeans)
lapply(Weather, apply, 1, max)
lapply(Weather, function(x) apply(x, 1, mean))
sapply(Weather, apply, 1, max) # Deliv 3
sapply(Weather, apply, 1, min) # Deliv 4

# which.max() and which.min()
names(which.max(Chicago[1,]))
apply(Chicago, 1, function(x) names(which.max(x))) # x is the row

lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))

sapply(Weather, function(y) apply(y, 1, function(x) names(which.min(x))))
