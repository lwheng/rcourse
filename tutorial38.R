x <- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]

Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008", "2009")]

#Will get Vectors
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

#Will get matrices
Games[1,,drop=FALSE]
Games[1,5,drop=FALSE]
