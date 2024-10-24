
binary_search <- function(lista, atributo, valor_buscado) {
  # Verifica si la lista está vacía
  if (length(lista) == 0) {
    stop("La lista está vacía")
  }
  
  # Inicializamos los extremos de la búsqueda
  izquierda <- 1
  derecha <- length(lista)
  
  while (izquierda <= derecha) {
    medio <- floor((izquierda + derecha) / 2)
    producto_medio <- lista[[medio]]
    
    # Obtenemos el valor del producto medio
    valor_medio <- producto_medio[[atributo]]
    
    if (valor_medio == valor_buscado) {
      return(producto_medio)
    # Si el valor medio es menor que el valor buscado, buscamos en la mitad derecha
    } else if (valor_medio < valor_buscado) {
      izquierda <- medio + 1
    # Si el valor medio es mayor que el valor buscado, buscamos en la mitad izquierda
    } else {
      derecha <- medio - 1
    }
  }
  
  # Si no encontramos el valor, lanzamos un error
  stop(paste("No se encontró el producto con", atributo, "igual a", valor_buscado))

}

# Crear una lista de productos ordenada
productos <- list(
  list(nombre = "Arroz", precio = 1000, cantidad = 50),
  list(nombre = "Azúcar", precio = 2000, cantidad = 100),
  list(nombre = "Café", precio = 3000, cantidad = 150),
  list(nombre = "Harina", precio = 4000, cantidad = 200),
  list(nombre = "Leche", precio = 5000, cantidad = 250)

)

# Intentar buscar el producto Leche
tryCatch({
  resultado <- binary_search(productos, "nombre", "Leche")
  cat("Producto encontrado:", resultado$nombre, ", Precio:", resultado$precio, ", Cantidad:", resultado$cantidad, "\n")
}, error = function(e) {
  cat(e$message, "\n")
})

# Intentar buscar el producto Carne
tryCatch({
  resultado <- binary_search(productos, "nombre", "Carne")
  cat("Producto encontrado:", resultado$nombre, ", Precio:", resultado$precio, ", Cantidad:", resultado$cantidad, "\n")
}, error = function(e) {
  cat(e$message, "\n")
})
