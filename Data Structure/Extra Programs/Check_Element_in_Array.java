import java.util.Scanner;

public class Check_Element_in_Array {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter size of array:");
        int n = sc.nextInt();
        int A[] = new int[n];
        for (int i = 0; i < A.length; i++) {
            A[i] = sc.nextInt();
        }
        System.out.println("Enter element to check:");
        int x = sc.nextInt();

        Demo c = new Demo();
        System.out.println(c.check(A, x));
    }

}

class Demo {

    public int check(int A[], int x) {
        if (A.length <= 0) {
            return 0;
        }
        if (A[0] == x) {
            return 1;
        } else {
            int A2[] = new int[A.length - 1];
            for (int j = 0, i = 0; j < A2.length; j++, i++) {
                A2[j] = A[i];
            }
            return check(A2, x);
        }
    }
}
