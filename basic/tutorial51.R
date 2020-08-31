getwd()
setwd("/Users/lwheng/dev/rcourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
head(stats)

# Introduction to qplot()
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1),
      colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1),
      geom="boxplot")
