
def multiplicar_matrices(a, b)
  # Verifica si el número de columnas de la matriz a es igual al número de filas de la matriz b
  if a[0].length != b.length
    raise "Las dimensiones de las matrices no son compatibles para la multiplicación."
  end

  # Dimensiones de la matriz resultante
  filas_a = a.length
  columnas_a = a[0].length
  columnas_b = b[0].length

  # Crear la matriz resultante inicializada en 0
  resultado = Array.new(filas_a) { Array.new(columnas_b, 0) }

  # Multiplicación de matrices
  for i in 0...filas_a
    for j in 0...columnas_b
      for k in 0...columnas_a
        resultado[i][j] += a[i][k] * b[k][j]
      end
    end
  end

  return resultado
end

# Definir dos matrices
a = [
  [1, 2, 3],
  [4, 5, 6]
]

b = [
  [7, 8],
  [9, 10],
  [11, 12]
]

# Multiplicar las matrices
begin
  resultado = multiplicar_matrices(a, b)
  puts "Resultado de la multiplicación de matrices:"
  resultado.each { |fila| puts fila.inspect }
rescue => e
  puts e.message
end
