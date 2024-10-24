
# Definir la clase Estudiante
class Estudiante:
    def __init__(self, nombre, edad, calificacion):
        self.nombre = nombre
        self.edad = edad
        self.calificacion = calificacion

def mergeSort(lista, key):
    # Si ya no se puede subdividir la lista, pasa el control a la llamada anterior
    if len(lista) > 1:  
        medio = len(lista) // 2   
        # Dividir la lista en dos mitades          
        izquierda = lista[:medio]
        derecha = lista[medio:]

        # Ordenar recursivamente cada mitad
        mergeSort(izquierda, key)
        mergeSort(derecha, key)

        # Indices para recorrer las sublistas
        i = j = k = 0
        
        while i < len(izquierda) and j < len(derecha):
            # Si el elemento de la izquierda es menor que el de la derecha, agregarlo a la lista principal
            if getattr(izquierda[i], key) < getattr(derecha[j], key):
                lista[k] = izquierda[i]
                i += 1
            # Si el elemento de la derecha es menor que el de la izquierda, agregarlo a la lista principal
            else:
                lista[k] = derecha[j]
                j += 1
            k += 1

        # Agregar los elementos restantes de la sublista izquierda, si los hay
        while i < len(izquierda):
            lista[k] = izquierda[i]
            i += 1
            k += 1

        # Agregar los elementos restantes de la sublista derecha, si los hay
        while j < len(derecha):
            lista[k] = derecha[j]
            j += 1
            k += 1


# Crear una lista de objetos de la clase Estudiante
estudiantes = [
    Estudiante("Ana", 23, 90),
    Estudiante("Luis", 20, 85),
    Estudiante("Carlos", 22, 88),
    Estudiante("Marta", 21, 92)
]

# Ordenar la lista de estudiantes
mergeSort(estudiantes, "calificacion")

for estudiante in estudiantes:
    print(f"{estudiante.nombre}: {estudiante.edad} años, Calificación: {estudiante.calificacion}")