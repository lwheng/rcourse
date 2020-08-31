setwd("/Users/lwheng/dev/rcourse/advanced")
getwd()

# Import data in R
fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings = c(""))
# na.strings = c("") --. Treat "" as NA
head(fin)
str(fin)
summary(fin)

# Factors refresher
fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)
summary(fin)
str(fin)

# Factor Variable Trap (FVT)
a <- c(12, 13, 14, 12, "12")
typeof(a)
b <- as.numeric(a)
b
typeof(b)

z <- factor(c(12, 13, 14, 12, "12"))
z
typeof(z) # This is the type for the Levels created
y <- as.numeric(z)
y
x <- as.numeric(as.character(z))
x
typeof(x)
# Tip convert factors to characters first before converting to numeric

str(fin)

#sub() and gsub()
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Expenses <- as.numeric(fin$Expenses)

fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Revenue <- as.numeric(fin$Revenue)

fin$Growth <- gsub("\\%", "", fin$Growth)
fin$Growth <- gsub(",", "", fin$Growth)
fin$Growth <- as.numeric(fin$Growth)

fin$Industry <- factor(fin$Industry)
fin$State <- factor(fin$State)
fin$City <- factor(fin$City)

head(fin)
tail(fin)
str(fin)

# What is an NA
?NA

TRUE == FALSE
TRUE == 5
TRUE == 1
FALSE == 0
FALSE == FALSE
NA == TRUE
NA == FALSE
NA == NA

# Locating Missing Data
head(fin, n=24)
fin[!complete.cases(fin),] # This is unsafe because "" is not NA.
# Must use na.strings=c("") in read.csv

# Filtering: using which() for non-missing data
fin[fin$Revenue == 9746272,] # Does not work well when the column as NA
which(fin$Revenue == 9746272) # Return indices that returns TRUE for check
fin[which(fin$Revenue == 9746272),]

# Filtering: using is.na() for missing data
fin[is.na(fin$Expenses),]

# Removing records with missing data
fin_backup <- fin
fin[!complete.cases(fin),]

fin <- fin[!is.na(fin$Industry),]
head(fin,n=20)

# Resetting the dataframe index

rownames(fin) <- 1:nrow(fin)
head(fin,n=20)
rownames(fin) <- NULL # Let R do it for you
head(fin,n=20)

# Replacing Missing Data: Factual Analysis
fin[!complete.cases(fin),]

fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="New York","State"] <- "NY"
fin[c(11,377),]

fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"
fin[c(82,265),]

# Replacing Missing Data: Median (Part 1)
fin[!complete.cases(fin),]

med_empl_retail <- median(fin[fin$Industry=="Retail","Employees"], na.rm=TRUE)
# mean(fin[fin$Industry=="Retail","Employees"], na.rm=TRUE)

fin[is.na(fin$Employees) & fin$Industry=="Retail","Employees"] <- med_empl_retail
fin[3,]

med_empl_finan_serv <- median(fin[fin$Industry=="Financial Services","Employees"], na.rm=TRUE)

fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"] <- med_empl_finan_serv
fin[330,]

# Replacing Missing Data: Median (Part 2)
fin[!complete.cases(fin),]

med_growth_constr <- median(fin[fin$Industry=="Construction","Growth"], na.rm=TRUE)
fin[is.na(fin$Growth) & fin$Industry=="Construction","Growth"] <- med_growth_constr
fin[8,]

# Replacing Missing Data: Median (Part 3)
med_revenue_constr <- median(fin[fin$Industry=="Construction", "Revenue"], na.rm=TRUE)
fin[is.na(fin$Revenue) & fin$Industry=="Construction", "Revenue"] <- med_revenue_constr
fin[c(8,42),]

med_expenses_constr <- median(fin[fin$Industry=="Construction", "Expenses"], na.rm=TRUE)
fin[is.na(fin$Expenses) & fin$Industry=="Construction", "Expenses"] <- med_expenses_constr
fin[c(8,42),]

fin[!complete.cases(fin),]

# Replacing Missing Data: Deriving values
fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]

fin[is.na(fin$Expenses), "Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]

# Visualizing results
library(ggplot2)
p <- ggplot(data=fin)
p + geom_point(aes(x=Revenue, y=Expenses,
                   colour=Industry, size=Profit))


d <- ggplot(data=fin, aes(x=Revenue, y=Expenses,
                          colour=Industry))
d + geom_point() +
  geom_smooth(fill=NA, size=1.2)

f <- ggplot(data=fin, aes(x=Industry, y=Growth, 
                          colour=Industry))
f + geom_jitter() +
  geom_boxplot(size=1, alpha=0.5, outlier.colour=NA)
