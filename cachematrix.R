makeCacheMatrix <- function(n = matrix()) {
  aaa <- NULL
  mmm <- function(m){
    n <<- m
    aaa <<- NULL
  }
  get <- function() n
  setInverse <- function(solveMatrix) aaa <<- solveMatrix
  getInverse <- function() aaa
  list(mmm = mmm, get = get, setInverse = setInverse, getInverse = getInverse)
}


cacheSolve <- function(n, ...) {

  aaa <- n$getInverse()
  if(!is.null(aaa)){
    message("getting cached data")
    return(aaa)
  }
  dataset <- n$get()
  aaa <- solve(dataset)
  n$setInverse(aaa)
  aaa      
}