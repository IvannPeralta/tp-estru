
// Definir la clase Estudiante
class Estudiante{
    public string nombre {get; set;}
    public int edad {get; set;}
    public int calificacion {get; set;}

    public Estudiante(string nombre, int edad, int calificacion){
        this.nombre = nombre;
        this.edad = edad;
        this.calificacion = calificacion;
    }
}

class Program{
    static void mergeSort(List<Estudiante> lista, string key){
        // Si ya no se puede subdividir la lista, pasa el control a la llamada anterior
        if (lista.Count > 1){
            int medio = lista.Count / 2;
            // Dividir la lista en dos mitades          
            List<Estudiante> izquierda = lista.GetRange(0, medio);
            List<Estudiante> derecha = lista.GetRange(medio, lista.Count - medio);

            // Ordenar recursivamente cada mitad
            mergeSort(izquierda, key);
            mergeSort(derecha, key);

            // Indices para recorrer las sublistas
            int i = 0, j = 0, k = 0;

            while (i < izquierda.Count && j < derecha.Count){
                // Si el elemento de la izquierda es menor que el de la derecha, agregarlo a la lista principal
                if (getAttribute(izquierda[i], key) < getAttribute(derecha[j], key)){
                    lista[k] = izquierda[i];
                    i++;
                }
                // Si el elemento de la derecha es menor que el de la izquierda, agregarlo a la lista principal
                else{
                    lista[k] = derecha[j];
                    j++;
                }
                k++;
            }

            // Agregar los elementos restantes de la sublista izquierda, si los hay
            while (i < izquierda.Count){
                lista[k] = izquierda[i];
                i++;
                k++;
            }

            // Agregar los elementos restantes de la sublista derecha, si los hay
            while (j < derecha.Count){
                lista[k] = derecha[j];
                j++;
                k++;
            }
        }
    }

    // Método para obtener el valor de un atributo en tiempo de ejecución
    static int getAttribute(Estudiante estudiante, string key){
        switch (key){
            case "Calificacion":
                return estudiante.calificacion;
            case "edad":
                return estudiante.edad;
            default:
                throw new ArgumentException("Llave no válida");
        }
    }

    static void Main(){
        // Crear una lista de objetos de la clase Estudiante
        List<Estudiante> estudiantes = new List<Estudiante>{
            new Estudiante("Ana", 23, 90),
            new Estudiante("Luis", 20, 85),
            new Estudiante("Carlos", 22, 88),
            new Estudiante("Marta", 21, 92)
        };

        // Ordenar la lista de estudiantes
        mergeSort(estudiantes, "edad");

        foreach(Estudiante estudiante in estudiantes){
            Console.WriteLine($"{estudiante.nombre}: {estudiante.edad} años, Calificación: {estudiante.calificacion}");
        }
    }
}




