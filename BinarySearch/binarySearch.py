
# Definir la clase Producto
class Producto:
    def __init__(self, nombre, precio, cantidad):
        self.nombre = nombre
        self.precio = precio
        self.cantidad = cantidad

def binarySearch(lista, atributo, valorBuscado):
    # Verifica si la lista está vacía
    if len(lista) == 0:
        raise ValueError("La lista está vacía")
    
    # Inicializamos los extremos de la búsqueda
    izquierda = 0
    derecha = len(lista) - 1

    while izquierda <= derecha:
        medio = (izquierda + derecha) // 2
        productoMedio = lista[medio]

        # Obtenemos el valor del producto medio
        valorMedio = getattr(productoMedio, atributo)

        if valorMedio == valorBuscado:
            return productoMedio
        # Si el valor medio es menor que el valor buscado, buscamos en la mitad derecha
        elif valorMedio < valorBuscado:
            izquierda = medio + 1
        # Si el valor medio es mayor que el valor buscado, buscamos en la mitad izquierda
        else:
            derecha = medio - 1

    # Si no encontramos el valor, lanzamos un error
    raise ValueError(f"No se encontró el producto con {atributo} igual a {valorBuscado}")


# Crear una lista de productos ordenada
productos = [
    Producto("Arroz", 1000, 50),
    Producto("Azúcar", 2000, 100),
    Producto("Café", 3000, 150),
    Producto("Harina", 4000, 200),
    Producto("Leche", 5000, 250)
]

# Intentar buscar el producto Leche
try:
    resultado = binarySearch(productos, "nombre", "Leche")
    print(f"Producto encontrado: {resultado.nombre}, Precio: {resultado.precio}, Cantidad: {resultado.cantidad}")
except ValueError as e:
    print(e)

# Intentar buscar el producto Carne
try:
    resultado = binarySearch(productos, "nombre", "Carne")
    print(f"Producto encontrado: {resultado.nombre}, Precio: {resultado.precio}, Cantidad: {resultado.cantidad}")
except ValueError as e:
    print(e)

