using System;
using System.Collections.Generic;

// Definir la clase Producto
class Producto{
    public string Nombre { get; set; }
    public int Precio { get; set; }
    public int Cantidad { get; set; }

    public Producto(string nombre, int precio, int cantidad){
        Nombre = nombre;
        Precio = precio;
        Cantidad = cantidad;
    }
}

class Program{
    public static Producto? binarySearch(List<Producto> lista, string atributo, string valorBuscado){
        // Verifica si la lista está vacía
        if (lista.Count == 0){
            Console.WriteLine("La lista está vacía");
            throw new ArgumentException("La lista está vacía");
        }

        // Inicializamos los extremos de la búsqueda
        int izquierda = 0;
        int derecha = lista.Count - 1;

        while (izquierda <= derecha){
            int medio = (izquierda + derecha) / 2;
            Producto productoMedio = lista[medio];

            // Obtenemos el valor del producto medio
            string valorMedio = getAttribute(productoMedio, atributo);

            if (valorMedio == valorBuscado){
                return productoMedio;
            }
            // Si el valor medio es menor que el valor buscado, buscamos en la mitad derecha
            else if (valorMedio.CompareTo(valorBuscado) < 0){
                izquierda = medio + 1;
            }
            // Si el valor medio es mayor que el valor buscado, buscamos en la mitad izquierda
            else{
                derecha = medio - 1;
            }
        }

        // Si no encontramos el valor, lanzamos un error
        throw new ArgumentException($"No se encontró el producto con {atributo} igual a {valorBuscado}");
    }

    // Método para obtener el atributo en tiempo de ejecución
    public static string getAttribute(Producto producto, string atributo){
        switch (atributo){
            case "nombre":
                return producto.Nombre;
            case "precio":
                return producto.Precio.ToString();
            case "cantidad":
                return producto.Cantidad.ToString();
            default:
                throw new ArgumentException("Atributo no válido");
        }
    }

    static void Main(){
        // Crear una lista de productos ordenada
        List<Producto> productos = new List<Producto>{
            new Producto("Arroz", 1000, 50),
            new Producto("Azúcar", 2000, 100),
            new Producto("Café", 3000, 150),
            new Producto("Harina", 4000, 200),
            new Producto("Leche", 5000, 250)
        };

        // Intentar buscar el producto Leche
        try{
            Producto resultado = binarySearch(productos, "nombre", "Leche");
            Console.WriteLine($"Producto encontrado: {resultado.Nombre}, Precio: {resultado.Precio}, Cantidad: {resultado.Cantidad}");
        }
        catch (ArgumentException e){
            Console.WriteLine(e.Message);
        }

        // Intentar buscar el producto Carne
        try{
            Producto resultado = binarySearch(productos, "nombre", "Carne");
            Console.WriteLine($"Producto encontrado: {resultado.Nombre}, Precio: {resultado.Precio}, Cantidad: {resultado.Cantidad}");
        }
        catch (ArgumentException e){
            Console.WriteLine(e.Message);
        }
    }
}

