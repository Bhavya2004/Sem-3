// . Write a program to implement stack using singly linked list.
import java.util.Scanner;

public class CustomStack{
    Node head,currentNode;
    Node tail;
    int size = 0;

    static class Node{
        int data;
        Node next;
        Node(int data){
            this.data=data;
            this.next=null;
        }
    }
    public void push(int a) {
        Node node = new Node(a);
        if (head == null) {
            tail = head = node;
            size++;
            return;
        }
        tail.next = node;
        tail = node;
        size++;
    }

    public int pop() {
        if (head == null) {
            System.out.println("Stack is Empty \nCannot Remove an item from an empty list");
            size = 0;
            return -1;
        }
        Node currentnode = head, prev = null;
        int element = -1;
        while (currentnode.next != null) {
            prev = currentnode;
            currentnode = currentnode.next;
            element = currentnode.data;
        }
        if (currentnode == head) {
            tail = head = null;
            return currentnode.data;
        }
        prev.next = null;
        tail = prev;
        size--;
        return element;
    }

    public int peep(int i) {
        if (head == null) {
            System.out.println("stack is empty");
            return -1;
        }
        if (size - i < 0) {
            System.out.println("Stack underflow");
            return -1;
        }
        int count = 0;
        Node currentNode = head;
        while (count != size - i && currentNode != null) {
            currentNode = currentNode.next;
            count++;
        }
        return currentNode.data;
    }

    public void change(int i, int value) {
        if (head == null) {
            System.out.println("stack is empty");
            return;
        }
        if (size - i < 0) {
            System.out.println("Stack underflow");
            return;
        }
        int count = 0;
        currentNode = head;
        while (count != size - i && currentNode != null) {
            currentNode = currentNode.next;
            count++;
        }
        currentNode.data = value;
    }

    public int peek() {
        if (head == null) {
            System.out.println("Stack is empty");
            return -1;
        }
        return tail.data;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        CustomStack stack = new CustomStack();
        String str = "Enter Your choice\nPress 1 to push an element\nPress 2 to pop the top of the stack\nPress 3 to peek the top of the stack\nPress 4 to peep the ith element from the stack\nPress 5 to change the ith element from the stack\nPress 6 to display\nPress 7 to exit";
        System.out.println(str);
        int choice = sc.nextInt();
        while (choice > 0 && choice < 7) {
            switch (choice) {
                case 1:
                    System.out.println("Enter element");
                    stack.push(sc.nextInt());
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 2:
                    System.out.println("Top of the stack [" + stack.pop() + "]");
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 3:
                    System.out.println("Top of the stack [" + stack.peek() + "]");
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 4:
                    System.out.println("Enter i");
                    int i = sc.nextInt();
                    System.out.println("Element " + i + " from top of the stack :[" + stack.peep(i) + "]");
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 5:
                    System.out.println("Enter i");
                    int j = sc.nextInt();
                    System.out.println("Enter element");
                    int n = sc.nextInt();
                    stack.change(j, n);
                    System.out.println(str);
                    choice = sc.nextInt();
                // case 6:
                //    // stack.display();
                //     System.out.println(str);
                //     choice = sc.nextInt();
                //     break;
                // default:
                //     break;
            }
        }
        sc.close();
    }
}