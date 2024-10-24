using System;

class MultiplicacionMatrices{
    public static int[,] MultiplicarMatrices(int[,] A, int[,] B){
        // Verifica si el número de columnas de la matriz A es igual al número de filas de la matriz B
        if (A.GetLength(1) != B.GetLength(0)){
            throw new ArgumentException("Las dimensiones de las matrices no son compatibles para la multiplicación.");
        }

        // Dimensiones de la matriz resultante
        int filas_A = A.GetLength(0);
        int columnas_A = A.GetLength(1);
        int columnas_B = B.GetLength(1);

        // Crear la matriz resultado inicializada en 0
        int[,] resultado = new int[filas_A, columnas_B];

        // Multiplicación de matrices
        for (int i = 0; i < filas_A; i++){
            for (int j = 0; j < columnas_B; j++){
                for (int k = 0; k < columnas_A; k++){
                    resultado[i, j] += A[i, k] * B[k, j];
                }
            }
        }

        return resultado;
    }

    static void Main(){
        // Definir dos matrices
        int[,] A = {
            {1, 2, 3},
            {4, 5, 6}
        };

        int[,] B = {
            {7, 8},
            {9, 10},
            {11, 12}
        };

        // Multiplicar las matrices
        try{
            int[,] resultado = MultiplicarMatrices(A, B);
            Console.WriteLine("Resultado de la multiplicación de matrices:");
            for (int i = 0; i < resultado.GetLength(0); i++){
                Console.Write("[ ");
                for (int j = 0; j < resultado.GetLength(1); j++){
                    Console.Write(resultado[i, j] + " ");
                }
                Console.Write("]");
                Console.WriteLine();
            }
        }
        catch (ArgumentException e){
            Console.WriteLine(e.Message);
        }
    }
}
