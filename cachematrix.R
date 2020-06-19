## Put comments here that give an overall description of what your
## functions do

## Create vector with function to obtain the object or seit it. Also the list 
#contain other 2 functions to get the inversion of the matrix o set it.

makeCacheMatrix <- function(x = matrix()) {#the people hate github
     m<-NULL
     set<-function(y){
          x<<-y
          m<<-NULL
     }
     get<-function()x
     set_inversion<- function(inversion) m<<-inversion
     get_inversion<- function()m
     list(set=set, get=get, set_inversion=set_inversion,
          get_inversion=get_inversion)
}



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     m<-x$get_inversion()
     if(!is.null(m)){
      message("getting cahed data")
          return(m)
     }
     data<-x$get()
     m<-solve(data)
     x$set_inversion(m)
     m
}
xlist<-makeCacheMatrix(n)
n<-matrix(1:4,2,2)
cacheSolve(xlist)
cacheSolve(xlist)%*%n
