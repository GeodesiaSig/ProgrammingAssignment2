## Put comments here that give an overall description of what your
## These couples functions creates a special matrix caching the inverse and calculates the inverse matrix of special matrix


## this function creates a special matrix and caching its "inverse" in a list of functions as outputs

makeCacheMatrix <- function(sq_matrix = matrix()){
    i <- NULL
    set <- function(y_sq){
        sq_matrix <<- y_sq
        i <<- NULL
    }
    get <- function(){sq_matrix}
    setinv <- function(inv) {i <<- inv}
    getinv <- function() {i}
    list(set = set, 
         get = get,
         setinv = setinv,
         getinv = getinv)
}

## takes the especial matrix and the other functions aand calculates its real "inverse", but first check if that was not created by other.

cacheSolve <- function(sq_matrix, ...) {
    i <- sq_matrix$getinv()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- sq_matrix$get()
    i <- solve(data, ...)
    sq_matrix$setinv(i)
    i
}
