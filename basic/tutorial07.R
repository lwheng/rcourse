MyFirstVector <- c(3, 45, 56, 732)

is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 123L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("Hello", "world", 7)
V3
is.numeric(V2)
is.integer(V2)
is.double(V2)
is.character(V3)

seq() #sequence - like ':'
rep() #replicate

seq(1,15)
1:15

seq(1,15,2)
z <- seq(1,15,4)
z

rep(3, 20)
rep("a", 1000)

x <- c(80,20)
y <- rep(x, 10)
y
