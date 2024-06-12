#include <stdio.h>

int ackermann_A(int m, int n) {
    if (m == 0) return n + 1;
    if (m > 0 && n == 0) return ackermann_A(m - 1, 1);
    return ackermann_A(m - 1, ackermann_A(m, n - 1));
}

int main() {
    int m = 2, n = 3;
    printf("A(%d, %d) = %d\n", m, n, ackermann_A(m, n));
    return 0;
}
