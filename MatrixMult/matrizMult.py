
def multiplicar_matrices(A, B):
    # Verifica si el número de columnas de la matriz A es igual al número de filas de la matriz B
    if len(A[0]) != len(B):
        raise ValueError("Las dimensiones de las matrices no son compatibles para la multiplicación.")

    # Dimensiones de la matriz resultante
    filas_A = len(A)
    columnas_A = len(A[0])
    columnas_B = len(B[0])

    # Crear la matriz resultante inicializada en 0
    resultado = [[0 for _ in range(columnas_B)] for _ in range(filas_A)]

    # Multiplicación de matrices
    for i in range(filas_A):
        for j in range(columnas_B):
            for k in range(columnas_A):
                resultado[i][j] += A[i][k] * B[k][j]

    return resultado


# Definir dos matrices
A = [
    [1, 2, 3],
    [4, 5, 6]
]

B = [
    [7, 8],
    [9, 10],
    [11, 12]
]

# Multiplicar las matrices
try:
    resultado = multiplicar_matrices(A, B)
    print("Resultado de la multiplicación de matrices:")
    for fila in resultado:
        print(fila)
except ValueError as e:
    print(e)
