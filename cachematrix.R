# Matrix inversion is usually a costly computation and there may be some benefit to 
#       caching the inverse of a matrix rather than computing it repeatedly (there are 
#       also alternatives to matrix inversion that we will not discuss here).

# Computing the inverse of a square matrix can be done with the solve function in 
#       R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

# This function creates a special "matrix" object that can cache its inverse.
# Encapsulates the Matrix in its normal and invesrsed form.  This is essentially just a 
#       wrapper to create the cache as a first class citizen.
makeCacheMatrix <- function(data = matrix()) {
    inversedMatrix <- NULL
    
    # set resets the cached inverse to NULL
    set <- function(aMatrix){
        data <<- aMatrix
        inversedMatrix <<- NULL
    }
    
    # get the matrix
    get <- function(){
        data   
    }
    
    # sets the inversed matrix
    setInverse <- function(anInversedMatrix){
        inversedMatrix <<- anInversedmatrix
    }
    
    # gets the inversed matrix
    getInverse <- function(){
        inversedMatrix
    }
    
    list(
        set = set,
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
        )
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
##      above. If the inverse has already been calculated (and the matrix has not changed), 
##      then cacheSolve should retrieve the inverse from the cache.
## Caching functionality to work with the matrix wrapper to manage the caching functionality.
cacheSolve <- function(matrixWrapper, ...) {
    inversedMatrix <- matrixWrapper$getInverse()    
    if(!is.null(inversedMatrix)){
        print("using cached version of inversed matrix")
        return(inversedMatrix)        
    }
    inversedMatrix <- solve(matrixWrapper$get())
    matrixWrapper$setInverse(inversedMatrix)
    inversedMatrix
}
