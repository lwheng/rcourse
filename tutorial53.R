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


qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3),
      colour=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3),
      colour=Income.Group)

# Creating Data Frame
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
str(mydf)
summary(mydf)
