## makeCacheMatrix is a function for making a cache file of inverse matrix of a given input matrix. It is
## assumed that the given matrix is suitable to take inverse of.
## cacheSolve is a fucntion for providing inverse of a given matrix. If the inverse of the given matrix has already
## been generated, it'll just read the cache file and give the value. Otherwise generate and provide the value.


## I am using "R.cache" library to generate cache file which has inverse value of a given matrix. If the inverse
## already exists, it'll not create cache file otherwise it will.

makeCacheMatrix <- function(x = matrix()) {
  dir.create(path = "~./.Rcache", showWarnings = F)
  library("R.cache")
  setCacheRootPath(path = "~./.Rcache")
  cahceRoot <- getCacheRootPath()
  key <- list(x)
  data <- loadCache(key)
  if(!is.null(x = data)) {
    return()
  }
  data <- solve(x)
  Sys.sleep(1)
  saveCache(object = data,key = key,comment = "makeCacheMatrix")

}


## This functino uses makeCacheMatrix function to give inverse of a matrix. First of all it'll create a cahce file
## with the help of makeCacheMatrix function and then read the cahce file to give inverse

cacheSolve <- function(x, ...) {
  source("makeCacheMatrix.R")
  output <- makeCacheMatrix(x)
  key <- list(x)
  data <- loadCache(key)
  data
}
