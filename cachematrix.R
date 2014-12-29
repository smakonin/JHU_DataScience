## This module takes the mean of a long vector using caching for speed
## Copyright (C) 2014 by Stephen Makonin.

# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) 
{
        m <- NULL
        set <- function(y) 
        {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above or from the cache (if it exists). 
# Th matrix supplied MUST always be invertible.
cacheSolve <- function(x, ...) 
{
        m <- x$getinv()
        if(!is.null(m)) 
        {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m # Return a matrix that is the inverse of 'x'
}

# To test the above code, run
testA2 <- function()
{
        message("make matrix...")
        M <- makeCacheMatrix(matrix(rnorm(100), nrow=10))
        message("1st inverse call...")
        m1 <- cacheSolve(M)
        message("2nd inverse call...")
        m2 <- cacheSolve(M)
}
