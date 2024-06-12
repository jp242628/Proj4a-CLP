public class Ackermann_a {
    public static int ackermannA(int m, int n) {
        if (m == 0) return n + 1;
        if (m > 0 && n == 0) return ackermannA(m - 1, 1);
        return ackermannA(m - 1, ackermannA(m, n - 1));
    }

    public static void main(String[] args) {
        long ini, fim;
        for (int m = 0; m <= 2; m++) {
            for (int n = 0; n <= 3; n++) {
                ini = System.currentTimeMillis();
                int resultado = ackermannA(m, n);
                fim = System.currentTimeMillis();
                double tempo_usado = (fim - ini) / 1000.0;
                if (tempo_usado < 60.0) {
                    System.out.println("A(" + m + ", " + n + ") = " + resultado + " (calculado em " + tempo_usado + " sec)");
                } else {
                    System.out.println("A(" + m + ", " + n + ") excedeu limite");
                }
            }
        }
    }
}
