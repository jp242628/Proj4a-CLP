#include <stdio.h>

int ackermann_phi(int m, int n, int p) {
    if (p == 0) return m + n;
    if (p == 1) return 0;
    if (p == 2) return 1;
    if (p == 3) return m;
    if (n == 0 && p > 2) return ackermann_phi(m, 0, p - 1);
    return ackermann_phi(m, ackermann_phi(m, n - 1, p), p - 1);
}

int main() {
    int m = 2, n = 3, p = 4;
    printf("φ(%d, %d, %d) = %d\n", m, n, p, ackermann_phi(m, n, p));
    return 0;
}
