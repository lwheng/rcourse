#Method 1: Choose file manually
stats <- read.csv(file.choose())
stats

#Method 2: Set WD and Read Data
getwd()
setwd("/Users/lwheng/dev/rcourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats
