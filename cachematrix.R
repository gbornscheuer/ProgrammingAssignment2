#  Comments in spanish es (for me); english en (course) 
#  This is the code for programing assignment 2
#  Due date july 26 th, 2015
#  es: Este programa R obtiene la inversa de una matriz; en: This R program computes the inverse of a matrix
#  es: Evita calcularla más de una vez, asignándola a otro ambiente (cache); en: It provides a cache inverse.
#  es: Previamente se debe verificar que la matriz sea invertible, es decir su determinante sea diferente de 0
#  en: You have to check previously that the determinant of the input matrix is not 0
#  es: El programa contiene dos funciones: makeCacheMatrix y cacheSolve; en: The program includes two functions: makeCacheMatrix and cacheSolve
#  es: makeCacheMatrix es la función que "guarda" (utilizando <<-) un objeto en otro ambiente
#  es: 
makeCacheMatrix <- function(x = matrix()) {
    #
    #
    inversa <- NULL
    # es: set es la función que reemplaza la matriz; en: set is the function that changes the stored matrix
	set <- function(y) {
        #
        x <<- y
        inversa <<- NULL
    }
    # es: la función get retorna la matriz; en: get is the function that returns the matrix 
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inversa

# es: se crea la lista con las funciones creadas por makeCacheMatrix 
# en: this is the result of the constructor function 
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
  
}

# es: la función cacheSolve utiliza la función estándar de R solve() para obtener la inversa
# en: the function cacheSolve computes the inverse using the standard R function solve()
# 
cacheSolve <- function(x, ...) {
    #
    inversa = x$getinv()
    #
#  es: verifica si la inversa ya se calculó; en: check if the inverse has been previously computed
#
    if (!is.null(inversa)) {
      #
      message("get inv. matrix cached")
      return(inversa)
      
    }
    
# es: se obtiene la inversa con solve(); solve() computes the inverse
# es:
	matriz = x$get()
    inversa = solve(matriz, ...)
    
    #
    x$setinv(inversa)
    inversa
    
  }

