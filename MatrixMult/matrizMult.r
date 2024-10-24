
multiplicar_matrices <- function(A, B){
  # Verifica si el número de columnas de la matriz A es igual al número de filas de la matriz B
  if (ncol(A) != nrow(B)){
    stop("Las dimensiones de las matrices no son compatibles para la multiplicación.")
  }
  
  # Dimensiones de la matriz resultante
  filas_A <- nrow(A)
  columnas_A <- ncol(A)
  columnas_B <- ncol(B)
  
  # Crear la matriz resultante inicializada en 0
  resultado <- matrix(0, nrow = filas_A, ncol = columnas_B)
  
  # Multiplicación de matrices
  for (i in 1:filas_A){
    for (j in 1:columnas_B){
      for (k in 1:columnas_A){
        resultado[i, j] <- resultado[i, j] + A[i, k] * B[k, j]
      }
    }
  }
  
  return(resultado)
}

# Definir dos matrices
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, byrow = TRUE)
B <- matrix(c(7, 8, 9, 10, 11, 12), nrow = 3, byrow = TRUE)

# Multiplicar las matrices
tryCatch({
  resultado <- multiplicar_matrices(A, B)
  print("Resultado de la multiplicación de matrices:")
  print(resultado)
}, error = function(e){
  print(e$message)
})
