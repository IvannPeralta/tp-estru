import java.util.ArrayList;
import java.util.List;

// Definir la clase Producto
class Producto {
    String nombre;
    int precio;
    int cantidad;

    public Producto(String nombre, int precio, int cantidad) {
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
    }
}

public class BinarySearch {
    public static Producto binarySearch(List<Producto> lista, String atributo, String valorBuscado) {
        // Verifica si la lista está vacía
        if (lista.size() == 0) {
            throw new IllegalArgumentException("La lista está vacía");
        }

        // Inicializamos los extremos de la búsqueda
        int izquierda = 0;
        int derecha = lista.size() - 1;

        while (izquierda <= derecha) {
            int medio = (izquierda + derecha) / 2;
            Producto productoMedio = lista.get(medio);

            // Obtenemos el valor del producto medio
            String valorMedio = getAttribute(productoMedio, atributo);

            if (valorMedio.equals(valorBuscado)) {
                return productoMedio;
            // Si el valor medio es menor que el valor buscado, buscamos en la mitad derecha
            } else if (valorMedio.compareTo(valorBuscado) < 0) {
                izquierda = medio + 1;
            // Si el valor medio es mayor que el valor buscado, buscamos en la mitad izquierda
            } else {
                derecha = medio - 1;
            }
        }

        // Si no encontramos el valor, lanzamos un error
        throw new IllegalArgumentException("No se encontró el producto con " + atributo + " igual a " + valorBuscado);
    }

    // Método para obtener el atributo en tiempo de ejecución
    public static String getAttribute(Producto producto, String atributo) {
        switch (atributo) {
            case "nombre":
                return producto.nombre;
            case "precio":
                return String.valueOf(producto.precio);
            case "cantidad":
                return String.valueOf(producto.cantidad);
            default:
                throw new IllegalArgumentException("Atributo no válido");
        }
    }

    public static void main(String[] args) {
        // Crear una lista de productos ordenada
        List<Producto> productos = new ArrayList<>();
        productos.add(new Producto("Arroz", 1000, 50));
        productos.add(new Producto("Azúcar", 2000, 100));
        productos.add(new Producto("Café", 3000, 150));
        productos.add(new Producto("Harina", 4000, 200));
        productos.add(new Producto("Leche", 5000, 250));

        // Intentar buscar el producto Leche
        try{
            Producto resultado = binarySearch(productos, "nombre", "Leche");
            System.out.println("Producto encontrado: " + resultado.nombre + ", Precio: " + resultado.precio + ", Cantidad: " + resultado.cantidad);
        }catch (IllegalArgumentException e){
            System.out.println(e.getMessage());
        }

        // Intentar buscar el producto Carne
        try{
            Producto resultado = binarySearch(productos, "nombre", "Carne");
            System.out.println("Producto encontrado: " + resultado.nombre + ", Precio: " + resultado.precio + ", Cantidad: " + resultado.cantidad);
        }catch (IllegalArgumentException e){
            System.out.println(e.getMessage());
        }
    }
}