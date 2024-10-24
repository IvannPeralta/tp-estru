
# Definir la clase Producto
class Producto
  attr_accessor :nombre, :precio, :cantidad

  def initialize(nombre, precio, cantidad)
    @nombre = nombre
    @precio = precio
    @cantidad = cantidad
  end
end

def binarySearch(lista, atributo, valorBuscado)
  # Verifica si la lista está vacía
  if lista.empty?
    raise "La lista está vacía"
  end

  # Inicializamos los extremos de la búsqueda
  izquierda = 0
  derecha = lista.length - 1

  while izquierda <= derecha
    medio = (izquierda + derecha) / 2
    productoMedio = lista[medio]

    # Obtenemos el valor del producto medio
    valorMedio = productoMedio.send(atributo)  

    if valorMedio == valorBuscado
      return productoMedio
    # Si el valor medio es menor que el valor buscado, buscamos en la mitad derecha
    elsif valorMedio < valorBuscado
      izquierda = medio + 1
    # Si el valor medio es mayor que el valor buscado, buscamos en la mitad izquierda
    else
      derecha = medio - 1
    end
  end

  # Si no encontramos el valor, lanzamos un error
  raise "No se encontró el producto con #{atributo} igual a #{valorBuscado}"
end

# Crear una lista de productos ordenada
productos = [
  Producto.new("Arroz", 1000, 50),
  Producto.new("Azúcar", 2000, 100),
  Producto.new("Café", 3000, 150),
  Producto.new("Harina", 4000, 200),
  Producto.new("Leche", 5000, 250)
]

# Intentar buscar el producto Leche
begin
  resultado = binarySearch(productos, :nombre, "Leche")
  puts "Producto encontrado: #{resultado.nombre}, Precio: #{resultado.precio}, Cantidad: #{resultado.cantidad}"
rescue => e
  puts e.message
end

# Intentar buscar el producto Carne
begin
  resultado = binarySearch(productos, :nombre, "Carne")
  puts "Producto encontrado: #{resultado.nombre}, Precio: #{resultado.precio}, Cantidad: #{resultado.cantidad}"
rescue => e
  puts e.message
end
