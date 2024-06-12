public class Ackermann {

    public static int ackermannPhi(int m, int n, int p) {
        if (p == 0) return m + n;
        if (p == 1) return 0;
        if (p == 2) return 1;
        if (p == 3) return m;
        if (n == 0 && p > 2) return ackermannPhi(m, 0, p - 1);
        return ackermannPhi(m, ackermannPhi(m, n - 1, p), p - 1);
    }

    public static void main(String[] args) {
        int m = 2, n = 3, p = 4;
        System.out.println("φ(" + m + ", " + n + ", " + p + ") = " + ackermannPhi(m, n, p));
    }
}
