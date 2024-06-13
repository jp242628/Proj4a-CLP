import java.util.Random;

public class JAVA {

    private static final int NUM_TESTES = 10;
    private static final double TEMPO_LIMIT = 60.0;

    public static void main(String[] args) {
        int[] tam = {10, 100, 1000, 10000, 100000};
        int num_tam = tam.length;

        double[] insertionSortTempo = new double[num_tam];
        double[] bubbleSortTempo = new double[num_tam];
        double[] mergeSortTempo = new double[num_tam];
        double[] quickSortTempo = new double[num_tam];

        for (int i = 0; i < num_tam; i++) {
            int n = tam[i];
            int[] arr = new int[n];
            int[] copia = new int[n];

            GerarRandomArray(arr);

            insertionSortTempo[i] = medirTempo(JAVA::insertionSort, arr);
            if (insertionSortTempo[i] > TEMPO_LIMIT) {
                insertionSortTempo[i] = TEMPO_LIMIT + 1;
            }

            System.arraycopy(arr, 0, copia, 0, n);
            bubbleSortTempo[i] = medirTempo(JAVA::bubbleSort, copia);
            if (bubbleSortTempo[i] > TEMPO_LIMIT) {
                bubbleSortTempo[i] = TEMPO_LIMIT + 1;
            }

            System.arraycopy(arr, 0, copia, 0, n);
            mergeSortTempo[i] = medirTempoMerge(JAVA::mergeSort, copia, 0, n - 1);
            if (mergeSortTempo[i] > TEMPO_LIMIT) {
                mergeSortTempo[i] = TEMPO_LIMIT + 1;
            }

            System.arraycopy(arr, 0, copia, 0, n);
            quickSortTempo[i] = medirTempoMerge(JAVA::quickSort, copia, 0, n - 1);
            if (quickSortTempo[i] > TEMPO_LIMIT) {
                quickSortTempo[i] = TEMPO_LIMIT + 1;
            }
        }

        System.out.println("Tamanho da Lista\tInsertion Sort\t\tBubble Sort\t\tMerge Sort\t\tQuick Sort");
        for (int i = 0; i < num_tam; i++) {
            System.out.print(tam[i] + "\t\t\t");
            if (insertionSortTempo[i] > TEMPO_LIMIT) {
                System.out.print("Excedeu\t\t");
            } else {
                System.out.printf("%.6f\t\t", insertionSortTempo[i]);
            }
            if (bubbleSortTempo[i] > TEMPO_LIMIT) {
                System.out.print("Excedeu\t\t");
            } else {
                System.out.printf("%.6f\t\t", bubbleSortTempo[i]);
            }
            if (mergeSortTempo[i] > TEMPO_LIMIT) {
                System.out.print("Excedeu\t\t");
            } else {
                System.out.printf("%.6f\t\t", mergeSortTempo[i]);
            }
            if (quickSortTempo[i] > TEMPO_LIMIT) {
                System.out.println("Excedeu");
            } else {
                System.out.printf("%.6f\n", quickSortTempo[i]);
            }
        }
    }

    private static void GerarRandomArray(int[] arr) {
        Random random = new Random();
        for (int i = 0; i < arr.length; i++) {
            arr[i] = random.nextInt(10000);
        }
    }

    private static void insertionSort(int[] arr) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int chave = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > chave) {
                arr[j + 1] = arr[j];
                j = j - 1;
            }
            arr[j + 1] = chave;
        }
    }

    private static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    private static void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = l + (r - l) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }

    private static void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;

        int[] L = new int[n1];
        int[] R = new int[n2];

        System.arraycopy(arr, l, L, 0, n1);
        System.arraycopy(arr, m + 1, R, 0, n2);

        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k] = L[i];
                i++;
            } else {
                arr[k] = R[j];
                j++;
            }
            k++;
        }

        while (i < n1) {
            arr[k] = L[i];
            i++;
            k++;
        }

        while (j < n2) {
            arr[k] = R[j];
            j++;
            k++;
        }
    }

    private static void quickSort(int[] arr, int baixo, int alto) {
        if (baixo < alto) {
            int pi = partition(arr, baixo, alto);
            quickSort(arr, baixo, pi - 1);
            quickSort(arr, pi + 1, alto);
        }
    }

    private static int partition(int[] arr, int baixo, int alto) {
        int pivot = arr[alto];
        int i = (baixo - 1);
        for (int j = baixo; j < alto; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        int temp = arr[i + 1];
        arr[i + 1] = arr[alto];
        arr[alto] = temp;
        return i + 1;
    }

    @FunctionalInterface
    interface SortFunction {
        void sort(int[] arr);
    }

    private static double medirTempo(SortFunction sortFunc, int[] arr) {
        double TempoTotal = 0;

        for (int i = 0; i < NUM_TESTES; i++) {
            int[] copia = arr.clone();

            long ini = System.nanoTime();
            sortFunc.sort(copia);
            long fim = System.nanoTime();

            TempoTotal += (fim - ini) / 1e9;
            if (TempoTotal > TEMPO_LIMIT) return TempoTotal;
        }

        return TempoTotal / NUM_TESTES;
    }

    @FunctionalInterface
    interface MergeSortFunction {
        void sort(int[] arr, int l, int r);
    }

    private static double medirTempoMerge(MergeSortFunction sortFunc, int[] arr, int l, int r) {
        double TempoTotal = 0;

        for (int i = 0; i < NUM_TESTES; i++) {
            int[] copia = arr.clone();

            long ini = System.nanoTime();
            sortFunc.sort(copia, l, r);
            long fim = System.nanoTime();

            TempoTotal += (fim - ini) / 1e9;
            if (TempoTotal > TEMPO_LIMIT) return TempoTotal;
        }

        return TempoTotal / NUM_TESTES;
    }
}
