#include <stdio.h>
#include <time.h>

int ackermann_phi(int m, int n, int p) {
    if (p == 0) return m + n;
    if (p == 1) return 0;
    if (p == 2) return 1;
    if (p == 3) return m;
    if (n == 0 && p > 2) return ackermann_phi(m, 0, p - 1);
    return ackermann_phi(m, ackermann_phi(m, n - 1, p), p - 1);
}

int main() {
    int m, n, p;
    clock_t ini, fim;
    double cpu_usado;

    for (m = 0; m <= 2; ++m) {
        for (n = 0; n <= 3; ++n) {
            for (p = 0; p <= 4; ++p) {
                ini = clock();
                int resultado = ackermann_phi(m, n, p);
                fim = clock();
                cpu_usado = ((double) (fim - ini)) / CLOCKS_PER_SEC;
                if (cpu_usado < 60.0) {
                    printf("φ(%d, %d, %d) = %d (calculado em %f segundos)\n", m, n, p, resultado, cpu_usado);
                } else {
                    printf("φ(%d, %d, %d) excedeu o limite de tempo\n", m, n, p);
                }
            }
        }
    }
    return 0;
}
