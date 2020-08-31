
myplot <- function(dataset, rows=1:10) {
  # It is important to use `drop` to keep it
  # as a Matrix
  Data <- dataset[rows,,drop=FALSE]
  PlayersS <- Players[rows]
  
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=PlayersS, pch=15:18, col=c(1:4,6), horiz=FALSE)  
}

myplot(Salary, 3)
