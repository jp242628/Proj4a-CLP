public class Ackermann {

    public static int ackermannA(int m, int n) {
        if (m == 0) return n + 1;
        if (m > 0 && n == 0) return ackermannA(m - 1, 1);
        return ackermannA(m - 1, ackermannA(m, n - 1));
    }

    public static void main(String[] args) {
        int m = 2, n = 3;
        System.out.println("A(" + m + ", " + n + ") = " + ackermannA(m, n));
    }
}
