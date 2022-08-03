import java.util.Scanner;

class linkedlist{
	static class Node{
		int data;
		Node next;
		Node(int data){
			this.data=data;
			this.next=null;
		}
	}
	Node head=null;

	public void insert(int data){
		Node new_node=new Node(data);
		if(head==null){
			head=new_node;
		}
		else{
			new_node.next=head;
			head=new_node;
		}
	}
	public void display(){
		Node temp=head;
		if(head==null){
			System.out.println("Linkedlist does not exists");
		}
		else{
			while(temp!=null){
				System.out.println(temp.data);
				temp=temp.next;
			}
		}
	}
}

public class Linked_List{
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		linkedlist li=new linkedlist();

		while(true){
			System.out.println("Enter 1 for Insert:");
			System.out.println("Enter 2 for Display:");
			System.out.println("Enter your Choice:");
			int ch=sc.nextInt();

			if(ch==1){
				System.out.println("Enter Data:");
				int data=sc.nextInt();
				li.insert(data);
			}
			else if(ch==2){
				li.display();
			}
		}
	}
}