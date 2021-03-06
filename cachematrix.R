## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather 
## than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
## Your assignment is to write a pair of functions that cache the inverse of a matrix.


# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()){
  inv <- NULL                           ## initialize the value as NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL                        ## reset the value as NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv   ## assign the value of the inverse matrix
  getInverse <- function() inv          ## return the value of the inverse matrix
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



# This function computes the inverse of the special "matrix"  returned by makeCacheMatrix above.
# If the inverse has already been calculated (and the matrix  has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
          message("getting cached data")
          return(inv)                   ## Return a matrix that is the inverse of 'x'
  }
  data <- x$get()                       ## get the data
  inv <- solve(data, ...)               
  x$setInverse(Inv)
  inv                                   ## return the inverse matrix
}
