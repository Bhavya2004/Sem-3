import java.util.Scanner;
public class Prime{
	public static void main(String args[]){
		int flag=0;

		Scanner sc=new Scanner(System.in);

		System.out.println("Enter the number to find it's prime/not");
		int n=sc.nextInt();

		for (int i=2;i<n ;i++ ) {
			if(n%i==0)
			{
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			System.out.println("Prime");
		}
		if(flag==1)
		{
			System.out.println("Not Prime");
		}
	}
}