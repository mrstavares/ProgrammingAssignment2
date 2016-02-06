## This function creates a "matrix" object that cache its inverse.

## Write a short comment describing this functionm
## this function creates a set of functions to hadle a given matrix and its inverse in a perent environment

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  # creates function named "set" 
  set <- function(y) {
    x <<- y     
    m <<- NULL  
  }
  get <- function() x                        #creates "Get" function witch return "x"
  setmatrix <- function(solve) m <<- solve   #creates setmatrix function 
  getmatrix <- function() m                  #creates getmatrix function
  list(set = set, get = get,                 
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## check the given matrix from the makeCacheMatrix function and if not yet compute its inverse and return it

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()                        # "m" receive the result from getmatrix function above
  if(!is.null(m)) {                         # if "getmean not null, returns the "cached result"
    message("getting cached data")
    return(m)
  }
  data <- x$get()                         #else 
  m <- solve(data, ...)                   #calculate the inverse
  x$setmatrix(m)                          #set it on m
  m                                       #return it
}