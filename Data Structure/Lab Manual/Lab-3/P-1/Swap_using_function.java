import java.util.Scanner;

public class Swap_using_function{
	public static void Swapnumbers(int n1,int n2)
	{
		n1=n1+n2;
		n2=n1-n2;
		n1=n1-n2;

		System.out.println("After Swapping:");
		System.out.println("1st number:"+n1);
		System.out.println("2nd number:"+n2);
	}

	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);

		System.out.println("Enter 1st number:");
		int n1=sc.nextInt();

		System.out.println("Enter 2nd number:");
		int n2=sc.nextInt();

		Swapnumbers(n1,n2);
	}
}