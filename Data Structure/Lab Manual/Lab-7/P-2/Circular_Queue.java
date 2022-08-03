class AllMethodsOfQueue{
	static int front=-1,rear=-1,temp,temp2;
	static int tempForEnque=0;
	static int array[]=new int[5];
	static boolean flag=true;
	public static void enque(int n){
		if(rear==4){
			rear=0;
			if(rear==front){
				rear=4;
				System.out.println("Queue Overflow");
			}
			else{
				array[rear]=n;
				flag=false;
			}
		}
		else{
			if(rear==-1){
				front=0;
			}
			rear++;
			if(!flag){
				if(rear==front){
					System.out.println("Queue Overflow");
				}
				else{
					array[rear]=n;
				}
			}
			else{
				array[rear]=n;
			}	
		}
	}
	public static int deque(){
		if(front==-1){
			System.out.println("Queue Underflow");
			return 0;
		}
		else{
			if(front==rear){
				temp2=array[front];
				front=-1;
				rear=-1;
				return temp2;
			}
			else{
				temp=front;
				if(front>=4){
					front=0;
				}
				front++;
				return array[temp];
			}
		}
	}
	public static void display(){
		if(front>=rear){
			for(int k=0;k<=rear;k++){
				System.out.println("Queue element : "+array[k]);
			}
			if(front==rear){
				for(int j=front+1;j<5;j++){
					System.out.println("Queue element : "+array[j]);	
				}
			}
			else{
				for(int j=front;j<5;j++){
					System.out.println("Queue element : "+array[j]);	
				}
			}
				
		}
		else{
			for(int i=front;i<=rear;i++){
				System.out.println("Queue element : "+array[i]);
			}
		}
	}
}
public class Circular_Queue{
	public static void main(String[] args) {
		AllMethodsOfQueue obj=new AllMethodsOfQueue();
		obj.enque(1);
		obj.enque(2);
		obj.enque(3);
		obj.enque(4);
		obj.enque(5);
		System.out.println("Deque 1st element is : "+obj.deque());
		System.out.println("Deque 2nd element is : "+obj.deque());
		obj.enque(6);
		
		obj.enque(7);
		// System.out.println("Deque 3rd element is : "+obj.deque());
		obj.enque(9);
		// System.out.println("Deque 4th element is : "+obj.deque());																					
		// obj.enque(10);

		obj.display();
	}
}