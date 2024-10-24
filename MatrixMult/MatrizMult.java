import java.util.Arrays;

public class MatrizMult{
    public static int[][] multiplicarMatrices(int[][] A, int[][] B){
        // Verifica si el número de columnas de la matriz A es igual al número de filas de la matriz B
        if (A[0].length != B.length){
            throw new IllegalArgumentException("Las dimensiones de las matrices no son compatibles para la multiplicación.");
        }

        // Dimensiones de la matriz resultante
        int filas_A = A.length;
        int columnas_A = A[0].length;
        int columnas_B = B[0].length;

        // Crear la matriz resultante inicializada en 0
        int[][] resultado = new int[filas_A][columnas_B];

        // Multiplicación de matrices
        for (int i = 0; i < filas_A; i++){
            for (int j = 0; j < columnas_B; j++){
                for (int k = 0; k < columnas_A; k++){
                    resultado[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        return resultado;
    }

    public static void main(String[] args){
        // Definir dos matrices
        int[][] A = {
            {1, 2, 3},
            {4, 5, 6}
        };

        int[][] B = {
            {7, 8},
            {9, 10},
            {11, 12}
        };

        // Multiplicar las matrices
        try{
            int[][] resultado = multiplicarMatrices(A, B);
            System.out.println("Resultado de la multiplicación de matrices:");
            for (int[] fila : resultado){
                System.out.println(Arrays.toString(fila));
            }
        }catch (IllegalArgumentException e){
            System.out.println(e.getMessage());
        }
    }
}
