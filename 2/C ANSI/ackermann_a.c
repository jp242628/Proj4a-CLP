#include <stdio.h>
#include <time.h>

int ackermann_A(int m, int n) {
    if (m == 0) return n + 1;
    if (m > 0 && n == 0) return ackermann_A(m - 1, 1);
    return ackermann_A(m - 1, ackermann_A(m, n - 1));
}

int main() {
    int m, n;
    clock_t ini, fim;
    double cpu_usado;

    for (m = 0; m <= 2; ++m) {
        for (n = 0; n <= 3; ++n) {
            ini = clock();
            int resultado = ackermann_A(m, n);
            fim = clock();
            cpu_usado = ((double) (fim - ini)) / CLOCKS_PER_SEC;
            if (cpu_usado < 60.0) {
                    printf("φ(%d, %d) = %d (calculado em %f segundos)\n", m, n, resultado, cpu_usado);
                } else {
                    printf("φ(%d, %d) excedeu o limite de tempo\n", m, n);
                }
        }
    }
    return 0;
}
