import java.util.Scanner;

class Student_Detail{
	long enrollment_no;
	String name;
	int sem;
	double cpi;
	public Student_Detail(int enrollment_no,String name,int sem,double cpi){
		this.enrollment_no=enrollment_no;
		this.name=name;
		this.sem=sem;
		this.cpi=cpi;
	}
	public void printDetails(){
		System.out.println("Enrollment No. : "+enrollment_no);
		System.out.println("Name : "+name);
		System.out.println("Semester : "+sem);
		System.out.println("CPI : "+cpi);
	}
}

public class Student{
	public static void main(String[] args) {
		Student_Detail obj[]=new Student_Detail[5];
		obj[0]=new Student_Detail(2101001,"jay",3,7.5);
		obj[1]=new Student_Detail(2101002,"dhruvik",3,8.5);
		obj[2]=new Student_Detail(2101003,"rohan",3,9.5);
		obj[3]=new Student_Detail(2101004,"Ajay",3,8.42);
		obj[4]=new Student_Detail(2101005,"deep",3,9.45);
		for(int i=0;i<5;i++){
			System.out.println("-----Details of student "+(i+1)+"-----");
			obj[i].printDetails();
		}
	}
}
