
# Definir la clase Estudiante
class Estudiante
    attr_accessor :nombre, :edad, :calificacion

    def initialize(nombre, edad, calificacion)
        @nombre = nombre
        @edad = edad
        @calificacion = calificacion
    end
end

def mergeSort(lista, key)
    # Si ya no se puede subdividir la lista, pasa el control a la llamada anterior
    if lista.length > 1
        medio = lista.length / 2
        # Dividir la lista en dos mitades          
        izquierda = lista[0..medio-1]
        derecha = lista[medio..lista.length-1]

        # Ordenar recursivamente cada mitad
        mergeSort(izquierda, key)
        mergeSort(derecha, key)

        i = 0 # Índice para la sublista izquierda
        j = 0 # Índice para la sublista derecha
        k = 0 # Índice para la lista final

        while i < izquierda.length && j < derecha.length
            # Si el elemento de la izquierda es menor que el de la derecha, agregarlo a la lista principal
            if izquierda[i].send(key) < derecha[j].send(key)
                lista[k] = izquierda[i]
                i += 1
            # Si el elemento de la derecha es menor que el de la izquierda, agregarlo a la lista principal
            else
                lista[k] = derecha[j]
                j += 1
            end
            k += 1
        end

        # Agregar los elementos restantes de la sublista izquierda, si los hay
        while i < izquierda.length
            lista[k] = izquierda[i]
            i += 1
            k += 1
        end
    
        # Agregar los elementos restantes de la sublista derecha, si los hay
        while j < derecha.length
            lista[k] = derecha[j]
            j += 1
            k += 1
        end
    end
end

# Crear una lista de objetos de la clase Estudiante
estudiantes = [
    Estudiante.new("Ana", 23, 90),
    Estudiante.new("Luis", 20, 85),
    Estudiante.new("Carlos", 22, 88),
    Estudiante.new("Marta", 21, 92)
]

# Ordenar la lista de estudiantes
mergeSort(estudiantes, :edad)

estudiantes.each do |estudiante|
    puts "#{estudiante.nombre}: #{estudiante.edad} años, Calificación: #{estudiante.calificacion}"
  end