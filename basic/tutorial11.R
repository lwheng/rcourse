install.packages("ggplot2")

#These functions won't be available
#before we load the package using
#the library() function
?qplot()
?ggplot()
?diamonds

library(ggplot2)

qplot(data=diamonds, carat, price,
      colour=clarity, facets=.~clarity)