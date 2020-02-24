## The following code contains 2 functions makeCacheMatrix and cacheSolve
## The makeCacheMatrix funtion creates a special "matrix" object that can cache its inverse.
## The cacheSolve function returns the inverse of the special "matrix" object returned by makeCacheMatrix
## It is assumed that the input matrix is an invertible matrix.


## The following function creates a special "matrix" object that can cache its inverse.
## It actually just returns a list which has funtions to get and set the matrix and to get and set the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) 
{
  inv<-NULL
  getmatrix<-function() ## Function to get the matrix
  {
    x    
  }
  setmatrix<-function(y) ## Function to set the value of the matrix
  {
    x<<-y
    inv<<-NULL
  }
  getinverse<-function() ## Function to get the inverse of the matrix
  {
    inv
  }
  setinverse<-function(inv_sol) ## Function to set the inverse of the matrix
  {
    inv<<-inv_sol
  }
  ## Return a list containing the 4 above funtions
  list(getmatrix=getmatrix,setmatrix=setmatrix,getinverse=getinverse,setinverse=setinverse)
}

## This  following function computes the inverse of the special "matrix" returned by makeCacheMatrix
## If the inverse is already computed,it just gets the cached value

cacheSolve <- function(x, ...) 
{
  inverse<-x$getinverse() ## get the inverse value from makeCacheMatrix function
  if(!is.null(inverse)) ## If inverse is already computed
  {
    message("Getting the cached inverse value")
    return(inverse) ## return the cached inverse value
  }
  inverse<-solve(x$getmatrix()) ## Compute the inverse value if not already computed
  x$setinverse(inverse) ## Cache the computed inverse value 
  inverse
}
