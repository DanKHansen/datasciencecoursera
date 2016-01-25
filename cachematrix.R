## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##First the 'constructor' function, that takes a matrix as input
##return it's inverse, and caches the result

makeCacheMatrix <- function(mtrx = matrix()) {
        ##Initially set the local var 'invmtrx' to NULL
        invmtrx <- NULL
        ##Set the matrix from the 'main' function
        setmtrx <- function(mtry) {
                mtrx <<- mtry
                invmtrx <<- NULL
        }
        ##Retreive the matrix (not the inverse)
        getmtrx <- function() mtrx
        ##Setting the inverse of the matrix
        setinvmtrx <- function(inv) invmtrx <<- inv
        ##Retrieving the inverse of the matrix
        getinvmtrx <- function() invmtrx
        ##Store all 4 functions so we can use them when assigning
        ##makeCahceMatrix to an object
        list(setmtrx = setmtrx, getmtrx = getmtrx,
             setinvmtrx = setinvmtrx,
             getinvmtrx = getinvmtrx)
}


## Write a short comment describing this function

##CacheSolve function uses makeCacheMatrix to create the inverse of a matrix
##and caches the result
##First time you use CacheSolve, you will get an inversed matrix
##Second time, you will get the cached result

cacheSolve <- function(x, ...) {
        ##Check via makeCacheMatrix function 'getinvmtrx' to see if 
        ##inverse have already been calculated. 
        LocInvMtrx <- x$getinvmtrx()
        ##if so, pop a message, and return the cached matrix
        if(!is.null(LocInvMtrx)) {
                message("Getting cached matrix")
                return(LocInvMtrx)
        }
        ##If not, call the 'getmtrx' in makeCacheMatrix...
        LocMtrx <- x$getmtrx()
        ##generate the inverse... 
        LocInvMtrx <- solve(LocMtrx, ...)
        ##Cache it...
        x$setinvmtrx(LocInvMtrx)
        ##and return the result
        LocInvMtrx
}

##Validation of code:

##Create object 'm' as a matrix
##m <- matrix(c(-1, -2, 1, 1), 2,2)

##Create an object 'x' containing the result of the makeCacheMatrix on m
##x <- makeCacheMatrix(m)

##Check the value of x is correct created in the makeCacheMatrix function
##x$getmtrx()
##      [,1] [,2]
## [1,]   -1    1
## [2,]   -2    1

##Use the cacheSolve function to get either a new inversed matrix...
##cacheSolve(x)

##      [,1] [,2]
## [1,]    1   -1
## [2,]    2   -1

##... or a cached version of the matrix
##cacheSolve(x)

## getting cached data
##      [,1] [,2]
## [1,]    1   -1
## [2,]    2   -1