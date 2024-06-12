#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_TESTES 10
#define TEMPO_LIMIT 60.0

// Funções de ordenação
void insertionSort(int arr[], int n);
void bubbleSort(int arr[], int n);
void mergeSort(int arr[], int l, int r);
void quickSort(int arr[], int baixo, int alto);

// Funções auxiliares
void GerarRandomArray(int arr[], int n);
void copiaArray(int ori[], int dest[], int n);
double medirTempo(void (*sortFunc)(int[], int), int arr[], int n);
double medirTempoMerge(void (*sortFunc)(int[], int, int), int arr[], int l, int r);

int main() {
    // Define tamanhos das listas para os testes
    int tam[] = {10, 100, 1000, 10000, 100000};
    int num_tam = sizeof(tam) / sizeof(tam[0]);

    // Arrays para armazenar os tempos de execução de cada algoritmo
    double insertionSortTempo[num_tam];
    double bubbleSortTempo[num_tam];
    double mergeSortTempo[num_tam];
    double quickSortTempo[num_tam];

    // Para cada tamanho de lista, mede o tempo de execução dos algoritmos
    for (int i = 0; i < num_tam; i++) {
        int n = tam[i];
        int *arr = (int *)malloc(n * sizeof(int));
        int *copia = (int *)malloc(n * sizeof(int));

        // Gera uma lista aleatória
        GerarRandomArray(arr, n);

        // Mede o tempo do Insertion Sort
        insertionSortTempo[i] = medirTempo(insertionSort, arr, n);
        if (insertionSortTempo[i] > TEMPO_LIMIT) {
            insertionSortTempo[i] = TEMPO_LIMIT + 1;
        }

        // Mede o tempo do Bubble Sort
        copiaArray(arr, copia, n);
        bubbleSortTempo[i] = medirTempo(bubbleSort, copia, n);
        if (bubbleSortTempo[i] > TEMPO_LIMIT) {
            bubbleSortTempo[i] = TEMPO_LIMIT + 1;
        }

        // Mede o tempo do Merge Sort
        copiaArray(arr, copia, n);
        mergeSortTempo[i] = medirTempoMerge(mergeSort, copia, 0, n - 1);
        if (mergeSortTempo[i] > TEMPO_LIMIT) {
            mergeSortTempo[i] = TEMPO_LIMIT + 1;
        }

        // Mede o tempo do Quick Sort
        copiaArray(arr, copia, n);
        quickSortTempo[i] = medirTempoMerge(quickSort, copia, 0, n - 1);
        if (quickSortTempo[i] > TEMPO_LIMIT) {
            quickSortTempo[i] = TEMPO_LIMIT + 1;
        }

        // Libera a memória alocada
        free(arr);
        free(copia);
    }

    // Imprime os resultados
    printf("Tamanho da Lista\tInsertion Sort\t\tBubble Sort\t\tMerge Sort\t\tQuick Sort\n");
    for (int i = 0; i < num_tam; i++) {
        printf("%d\t\t\t", tam[i]);
        if (insertionSortTempo[i] > TEMPO_LIMIT) {
            printf("Excedeu\t\t");
        } else {
            printf("%.6f\t\t", insertionSortTempo[i]);
        }
        if (bubbleSortTempo[i] > TEMPO_LIMIT) {
            printf("Excedeu\t\t");
        } else {
            printf("%.6f\t\t", bubbleSortTempo[i]);
        }
        if (mergeSortTempo[i] > TEMPO_LIMIT) {
            printf("Excedeu\t\t");
        } else {
            printf("%.6f\t\t", mergeSortTempo[i]);
        }
        if (quickSortTempo[i] > TEMPO_LIMIT) {
            printf("Excedeu\n");
        } else {
            printf("%.6f\n", quickSortTempo[i]);
        }
    }

    return 0;
}

// Gera um array de números aleatórios
void GerarRandomArray(int arr[], int n) {
    srand(time(NULL));
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 10000;
    }
}

// Copia o conteúdo de um array para outro
void copiaArray(int ori[], int dest[], int n) {
    for (int i = 0; i < n; i++) {
        dest[i] = ori[i];
    }
}

// Mede o tempo de execução de uma função de ordenação
double medirTempo(void (*sortFunc)(int[], int), int arr[], int n) {
    clock_t ini, fim;
    double TempoTotal = 0;

    for (int i = 0; i < NUM_TESTES; i++) {
        int *copia = (int *)malloc(n * sizeof(int));
        copiaArray(arr, copia, n);

        ini = clock();
        sortFunc(copia, n);
        fim = clock();

        TempoTotal += ((double)(fim - ini)) / CLOCKS_PER_SEC;
        free(copia);

        if (TempoTotal > TEMPO_LIMIT) return TempoTotal;
    }

    return TempoTotal / NUM_TESTES;
}

// Mede o tempo de execução de uma função de ordenação com três argumentos (merge sort, quick sort)
double medirTempoMerge(void (*sortFunc)(int[], int, int), int arr[], int l, int r) {
    clock_t ini, fim;
    double TempoTotal = 0;

    for (int i = 0; i < NUM_TESTES; i++) {
        int *copia = (int *)malloc((r - l + 1) * sizeof(int));
        copiaArray(arr, copia, r - l + 1);

        ini = clock();
        sortFunc(copia, l, r);
        fim = clock();

        TempoTotal += ((double)(fim - ini)) / CLOCKS_PER_SEC;
        free(copia);

        if (TempoTotal > TEMPO_LIMIT) return TempoTotal;
    }

    return TempoTotal / NUM_TESTES;
}

// Implementação do algoritmo Insertion Sort
void insertionSort(int arr[], int n) {
    int i, chave, j;
    for (i = 1; i < n; i++) {
        chave = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > chave) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = chave;
    }
}

// Implementação do algoritmo Bubble Sort
void bubbleSort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

// Função auxiliar para o Merge Sort que mescla dois subarrays
void merge(int arr[], int l, int m, int r) {
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    int L[n1], R[n2];

    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    i = 0;
    j = 0;
    k = l;
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

// Implementação do algoritmo Merge Sort
void mergeSort(int arr[], int l, int r) {
    if (l < r) {
        int m = l + (r - l) / 2;
        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);
        merge(arr, l, m, r);
    }
}

// Função auxiliar para o Quick Sort que troca dois elementos
void swap(int* a, int* b) {
    int t = *a;
    *a = *b;
    *b = t;
}

// Função auxiliar para o Quick Sort que particiona o array
int partition(int arr[], int baixo, int alto) {
    int pivot = arr[alto];
    int i = (baixo - 1);

    for (int j = baixo; j <= alto - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[alto]);
    return (i + 1);
}

// Implementação do algoritmo Quick Sort
void quickSort(int arr[], int baixo, int alto) {
    if (baixo < alto) {
        int pi = partition(arr, baixo, alto);
        quickSort(arr, baixo, pi - 1);
        quickSort(arr, pi + 1, alto);
    }
}
