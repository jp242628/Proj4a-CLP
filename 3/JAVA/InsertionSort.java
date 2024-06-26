// InsertionSort.java

public class InsertionSort {
    void insertionSort(int arr[]) {
        int n = arr.length;
        for (int i = 1; i < n; ++i) {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j = j - 1;
            }
            arr[j + 1] = key;
        }
    }

    public static void main(String args[]) {
        int arr[] = {12, 11, 13, 5, 6};
        InsertionSort ob = new InsertionSort();
        ob.insertionSort(arr);
        System.out.println("Array ordenado:");
        for (int i = 0; i < arr.length; ++i)
        System.out.print(arr[i] + " ");
        System.out.println();
    }
}

