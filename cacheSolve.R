# The following function inverts the special "matrix" created with 
# the makeCacheMatrix function. However, it first checks to see if 
# the inverse of the matrix has already been calculated. If so, it gets 
# the inverse matrix from the cache and skips the computation. Otherwise, 
# it calculates the inverse of the matrix and sets the value of the inverted
# matrix in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}