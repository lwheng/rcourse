setwd("/Users/lwheng/dev/rcourse/advanced")
getwd()

util <- read.csv("P3-Machine-Utilization.csv")
head(util,12)
str(util)
summary(util)

# Derive utilization column
util$Utilization = 1 - util$Percent.Idle
head(util,12)

# Handling Date-Time in R
head(util,12)
tail(util,12)
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,12)
summary(util)
util$Timestamp <- NULL

util <- util[c(4,1,2,3)] # Rearranging columns in dataframes

# What is a list?
head(util,12)
summary(util)
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)

# Construct list
util_stats_rl1 <- c(min(RL1$Utilization, na.rm=TRUE),
                    mean(RL1$Utilization, na.rm=TRUE),
                    max(RL1$Utilization, na.rm=TRUE))
util_stats_rl1
length(which(RL1$Utilization < 0.90))
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

# Naming components of a list
list_rl1
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)

#Extract components of a list
list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
typeof(list_rl1[2])
list_rl1[[2]]
typeof(list_rl1[[2]])
list_rl1$Stats
typeof(list_rl1$Stats)

# Access 3rd element of vector i.e. max
list_rl1$Stats[3]

# Adding and deleting components
# Using a large number will add NULLs
list_rl1[10] <- "New Information"
list_rl1

list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

list_rl1$Data <- RL1
summary(list_rl1)
str(list_rl1)

#QuickChallenge
list_rl1$UnknownHours[1]

# Subsetting a list
list_rl1[1:2]
list_rl1[c(1,4)]
list_rl1[c("Machine","Stats")]

# Creating a timeseries plot
library(ggplot2)

p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime, y=Utilization, 
                  colour=Machine), size=1.2) +
  facet_grid(Machine~.) +
  geom_hline(yintercept = 0.90,
             colour="Gray", size=1.2,
             linetype=3)

myplot <- p + geom_line(aes(x=PosixTime, y=Utilization, 
                            colour=Machine), size=1.2) +
  facet_grid(Machine~.) +
  geom_hline(yintercept = 0.90,
             colour="Gray", size=1.2,
             linetype=3)
myplot

list_rl1$Plot <- myplot
list_rl1
