setwd("/Users/lwheng/dev/rcourse")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
str(movies)
summary(movies)

movies$Year <- factor(movies$Year)
movies$Genre <- factor(movies$Genre)
summary(movies)

library(ggplot2)

#aesthetic
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre)) +
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=Genre)) +
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=BudgetMillions)) +
  geom_point()
#>>> This is #1

#Plotting with layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))

p + geom_point()
p + geom_line()
p + geom_point() + geom_line()
p + geom_line() + geom_point()

# Overriding aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))

q + geom_point()

q + geom_point(aes(size=CriticRating))

q + geom_point(aes(colour=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

q + geom_line(size=1) + geom_point()

# Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
# Mapping
r + geom_point(aes(colour=Genre))
# Setting
r + geom_point(colour="DarkGreen")
# ERROR "DarkGreen" is not a valid Genre
r + geom_point(aes(colour="DarkGreen"))


# Histogram and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

# add colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))
# add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>>> Chart 3

# Sometimes you need Density Chart
s + geom_density(aes(fill=Genre), position="stack")


# Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="White",
                   colour="Blue")

# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White",
                   colour="Blue")

# >>> Chart 4

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White",
                   colour="Blue")

# >>> Chart 5

# Stats Transformations

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
# tip: use boxplot with jitter
u + geom_boxplot(size=1.2) + geom_jitter()
# another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
# >>> Chart 6

# Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,
                   aes(fill=Genre),
                   colour="Black")

v + geom_histogram(binwidth = 10,
                   aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~., scales="free")

#scatterplots

w <- ggplot(data=movies, aes(x=CriticRating,
                             y=AudienceRating,
                             colour=Genre))
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

# Coordinates

#limits
#zoom
m <- ggplot(data=movies, aes(x=CriticRating,
                             y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)
# Won't work well always

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  ylim(0,50)

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0,50))

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))


# Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
h
# axes labels
h + xlab("Money Axis") + ylab("Number of Movies")
# label formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30)
        )
# tickmark formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20)
  )

# legend formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family = "Courier")
  )
