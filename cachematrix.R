## Put comments here that give an overall description of what your: 

## functions do their function by taking existing data and making a 
# matrix so we can store and cache the inverse, while the cahceSolve acutually does 
# does the inverse matrix but looking to see if it is cahced first.

## Write a short comment describing this function
# Here we are telling it to create the matrix 


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL

        set <- function(y) {
                x <<- y 
                inv <<- NULL        
        }

        get <- function() x 

        setInverse <- function(inverse) inv <<- inverse 

        getInverse <- function() inv 

        list(set = set, get = get,
                setInverse = setInverse,
                getInverse = getInverse)
}


## Write a short comment describing this function, 
# Here we compute the cache, and if it is already in cache we inform the user and return it as well

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()

        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }

        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
        ## Return a matrix that is the inverse of 'x'
}
