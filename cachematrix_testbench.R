
source("cachematrix.R")

## Test 
m <- matrix(c(1,2,3,4),2,2)
m
solve(m) 

m1 <- makeCacheMatrix(m)
cacheSolve(m1) ## solver
cacheSolve(m1) ## cached

