public class Ackermann_phi {
    public static int ackermannPhi(int m, int n, int p) {
        if (p == 0) return m + n;
        if (p == 1) return 0;
        if (p == 2) return 1;
        if (p == 3) return m;
        if (n == 0 && p > 2) return ackermannPhi(m, 0, p - 1);
        return ackermannPhi(m, ackermannPhi(m, n - 1, p), p - 1);
    }

    public static void main(String[] args) {
        long ini, fim;
        for (int m = 0; m <= 2; m++) {
            for (int n = 0; n <= 3; n++) {
                for (int p = 0; p <= 4; p++) {
                    ini = System.currentTimeMillis();
                    int resultado = ackermannPhi(m, n, p);
                    fim = System.currentTimeMillis();
                    double temp_usado = (fim - ini) / 1000.0;
                    if (temp_usado < 60.0) {
                        System.out.println("φ(" + m + ", " + n + ", " + p + ") = " + resultado + " (calculado em " + temp_usado + " sec)");
                    } else {
                        System.out.println("φ(" + m + ", " + n + ", " + p + ") excedeu o limite");
                    }
                }
            }
        }
    }
}
