# This function creates a special "matrix", which is a list containing 
# a function to set the value of the matrix, get the value of the matrix
# set the value of the inverted matrix, and get the value of the inverted 
# matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}