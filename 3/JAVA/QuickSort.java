// QuickSort.java

public class QuickSort {
    int partition(int arr[], int baixo, int alto) {
        int pivot = arr[alto];
        int i = (baixo-1);
        for (int j=baixo; j<alto; j++) {
            if (arr[j] <= pivot) {
                i++;
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        int temp = arr[i+1];
        arr[i+1] = arr[alto];
        arr[alto] = temp;
        return i+1;
    }

    void sort(int arr[], int baixo, int alto) {
        if (baixo < alto) {
            int pi = partition(arr, baixo, alto);
            sort(arr, baixo, pi-1);
            sort(arr, pi+1, alto);
        }
    }

    public static void main(String args[]) {
        int arr[] = {10, 7, 8, 9, 1, 5};
        int n = arr.length;
        QuickSort ob = new QuickSort();
        ob.sort(arr, 0, n-1);
        System.out.println("Array ordenado:");
        for (int i=0; i<n; ++i)
            System.out.print(arr[i] + " ");
        System.out.println();
    }
}
