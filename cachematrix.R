## Joseph Hennawy 2021.01.15
##
## This package will create a special matrix object that can store 
## a cached inverse attribute. User need to call inverse solver once to compute 
## a matrix inverse. All other subsequent calls will just return the stored 
## inverse attribute saving compuatation time.


## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize inverse matrix object data 
  i <- NULL
  
  ## Matrix Set Method 
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Matrix Get Method 
  get <- function() {
    m
  }
  
  ## Matrix Set Inverse Method 
  setinverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Matrix Get Inverse Method 
  getinverse <- function() {
    i
  }
  
  ## Matrix List Methods
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## function to compute inverse of the cached matrix.
## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  
  ## Get object inverse attribute
  m <- x$getinverse()
  
  ## If inverse is cached, return it
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## If inverse is not cached:
  
  ## Get object matrix  
  data <- x$get()
  
  ## Get object inverse  
  m <- solve(data) 
  
  ## Set object inverse  
  x$setinverse(m)
  
  ## Return a matrix that is the inverse of 'x'
  m
}

