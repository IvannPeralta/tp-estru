
mergeSort <- function(lista, key) {
  # Si ya no se puede subdividir la lista, pasa el control a la llamada anterior
  if (length(lista) > 1) {
    medio <- floor(length(lista) / 2)                                   
    # Dividir la lista en dos mitades          
    izquierda <- lista[1:medio]
    derecha <- lista[(medio + 1):length(lista)]

    # Ordenar recursivamente cada mitad
    izquierda <- mergeSort(izquierda, key)
    derecha <- mergeSort(derecha, key)

    i <- 1  # Índice para recorrer la sublista izquierda
    j <- 1  # Índice para recorrer la sublista derecha
    k <- 1  # Índice para recorrer la lista final

    lista_ordenada <- list()

    while (i <= length(izquierda) && j <= length(derecha)) {
        # Si el elemento de la izquierda es menor que el de la derecha, agregarlo a la lista principal
        if (izquierda[[i]][[key]] <= derecha[[j]][[key]]) {
            lista_ordenada[[k]] <- izquierda[[i]]
            i <- i + 1
        # Si el elemento de la derecha es menor que el de la izquierda, agregarlo a la lista principal
        } else {
            lista_ordenada[[k]] <- derecha[[j]]
            j <- j + 1
        }
        k <- k + 1
    }

    # Agregar los elementos restantes de la sublista izquierda, si los hay
    while (i <= length(izquierda)){
        lista_ordenada[[k]] <- izquierda[[i]]
        i <- i + 1
        k <- k + 1
    }

    # Agregar los elementos restantes de la sublista derecha, si los hay
    while (j <= length(derecha)){
        lista_ordenada[[k]] <- derecha[[j]]
        j <- j + 1
        k <- k + 1
    }
    return(lista_ordenada)
  }
  return(lista)
}

# Crear una lista de estudiantes con nombre, edad y calificación
estudiantes <- list(
  list(nombre = "Ana", edad = 23, calificacion = 90),
  list(nombre = "Luis", edad = 20, calificacion = 85),
  list(nombre = "Carlos", edad = 22, calificacion = 88),
  list(nombre = "Marta", edad = 21, calificacion = 92)
)

# Ordenar la lista de estudiantes
estudiantes_ordenados <- mergeSort(estudiantes, "calificacion")

for (estudiante in estudiantes_ordenados) {
  cat(estudiante$nombre, ":", estudiante$edad, "años, Calificación:", estudiante$calificacion, "\n")
}
