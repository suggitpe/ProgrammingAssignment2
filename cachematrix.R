## Put comments here that give an overall description of what your
## functions do

## Encapsulates the Matrix in its normal and invesrsed form.  This is essentially just a 
## wrapper to create the cache as a first class citizen.
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
