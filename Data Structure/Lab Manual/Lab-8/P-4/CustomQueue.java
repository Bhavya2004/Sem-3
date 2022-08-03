// Write a program to implement queue using singly linked list.

import java.util.Scanner;

public class CustomQueue extends CustomLinkedList {

    Node tail;

    public int dequeue() {
        if (head == null) {
            System.out.println("Queue is Empty \nCannot Remove an item from an empty list");
            return -1;
        }
        int element = head.data;
        head = head.next;
        return element;
    }

    public void enqueue(int a) {
        Node node = new Node(a);
        if (head == null) {
            tail = head = node;
            return;
        }
        tail.next = node;
        tail = node;
    }

    public void display() {
        if (head == null) {
            System.out.println("Queue is empty");
            return;
        }
        Node currentNode = head;
        while (currentNode != null) {
            System.out.print("[" + currentNode.data + "] ");
            currentNode = currentNode.next;
        }
        System.out.println();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        CustomQueue queue = new CustomQueue();
        String str = "Enter Your choice\nPress 1 to enqueue\nPress 2 to dequeue \nPress 3 to display\nPress 4 to exit";
        System.out.println(str);
        int choice = sc.nextInt();
        while (choice != 4) {
            switch (choice) {
                case 1:
                    System.out.println("Enter value");
                    queue.enqueue(sc.nextInt());
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 2:
                    System.out.println("Deleted Element [" + queue.dequeue() + "]");
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                case 3:
                    queue.display();
                    System.out.println(str);
                    choice = sc.nextInt();
                    break;
                default:
                    break;
            }
        }
        sc.close();
    }
}