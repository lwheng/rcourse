getwd()
setwd("/Users/lwheng/dev/rcourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
head(stats)

# Introduction to qplot()
library(ggplot2)

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

# Merge Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")
head(merged)

merged$Country <- NULL
head(merged)
