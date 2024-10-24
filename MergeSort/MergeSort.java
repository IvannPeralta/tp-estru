import java.util.ArrayList;
import java.util.List;

// Definir la clase Estudiante
class Estudiante {
    String nombre;
    int edad;
    int calificacion;

    public Estudiante(String nombre, int edad, int calificacion) {
        this.nombre = nombre;
        this.edad = edad;
        this.calificacion = calificacion;
    }
}

public class MergeSort {
    public static void mergeSort(List<Estudiante> lista, String key) {
        // Si ya no se puede subdividir la lista, pasa el control a la llamada anterior
        if (lista.size() > 1) {
            int medio = lista.size() / 2;
            // Dividir la lista en dos mitades          
            List<Estudiante> izquierda = new ArrayList<>(lista.subList(0, medio));
            List<Estudiante> derecha = new ArrayList<>(lista.subList(medio, lista.size()));

            // Ordenar recursivamente cada mitad
            mergeSort(izquierda, key);
            mergeSort(derecha, key);

            // Indices para recorrer las sublistas
            int i = 0, j = 0, k = 0;
            
            while (i < izquierda.size() && j < derecha.size()) {
                // Si el elemento de la izquierda es menor que el de la derecha, agregarlo a la lista principal
                if (getAttribute(izquierda.get(i), key) < getAttribute(derecha.get(j), key)) {
                    lista.set(k, izquierda.get(i));
                    i++;
                // Si el elemento de la derecha es menor que el de la izquierda, agregarlo a la lista principal
                } else {
                    lista.set(k, derecha.get(j));
                    j++;
                }
                k++;
            }

            // Agregar los elementos restantes de la sublista izquierda, si los hay
            while (i < izquierda.size()) {
                lista.set(k, izquierda.get(i));
                i++;
                k++;
            }

            // Agregar los elementos restantes de la sublista derecha, si los hay
            while (j < derecha.size()) {
                lista.set(k, derecha.get(j));
                j++;
                k++;
            }
        }
    }

    // Método para obtener el valor de un atributo en tiempo de ejecución
    public static int getAttribute(Estudiante estudiante, String key){
        switch (key){
            case "calificacion":
                return estudiante.calificacion;
            case "edad":
                return estudiante.edad;
            default:
                throw new IllegalArgumentException("Llave no válida");
        }
    }

    public static void main(String[] args) {
        // Crear una lista de estudiantes
        List<Estudiante> estudiantes = new ArrayList<>();
        estudiantes.add(new Estudiante("Ana", 23, 90));
        estudiantes.add(new Estudiante("Luis", 20, 85));
        estudiantes.add(new Estudiante("Carlos", 22, 88));
        estudiantes.add(new Estudiante("Marta", 21, 92));

        // Ordenar la lista de estudiantes
        mergeSort(estudiantes, "calificacion");

        for (Estudiante estudiante : estudiantes) {
            System.out.println(estudiante.nombre + ": " + estudiante.edad + " años, Calificación: " + estudiante.calificacion);
        }
    }
}
