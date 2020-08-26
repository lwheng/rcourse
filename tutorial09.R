x <- rnorm(5)

for (i in x) {
  print(i)
}

print(x[1])

for (j in 1:length(x)) {
  print(x[j]) 
}

N <- 100
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach
#R is optimized to operate in vectors
# so this is more efficient
c <- a * b

#De-vectorized approach
# This is very slow when N is large
d <- rep(NA, N)
for (i in 1:N) {
  d[i] = a[i] * b[i]
}

c == d