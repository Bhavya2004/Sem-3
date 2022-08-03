import java.util.Scanner;
class Postfix_convert{
    static int a[]=new int[100];
    static char temp;
    static int top=-1,value=0,s;

    public static void push(int c){
        if(top>=100){
            System.out.println("Stack Overflow");
        }
        else{
            top++;
            a[top]=c;
        }
    }
    public static int pop(){
        if(top<0){
            System.out.println("Stack Underflow");
        }
        else{
            s=a[top];
            top--;
            return s;
        }
        return 0;
    }
    public static void postfixstring(String str){
        for(int i=0;i<str.length();i++){
            temp=str.charAt(i);
                if(Character.isDigit(temp)){
                    int d=(int)temp-48;
                    push(d);
                }
                else{
                    int operand2=pop();
                    int operand1=pop();

                    switch(temp){

                        case '+':
                        value=operand2+operand1;
                        push(value);
                        break;

                        case '-':
                        value=operand2-operand1;
                        push(value);
                        break;

                        case '*':
                        value=operand2*operand1;
                        push(value);
                        break;

                        case '/':
                        value=operand2/operand1;
                        push(value);
                        break;

                    }
                }
        }
        System.out.println("Your Output is:"+a[top]);
    }
}
public class Postfix_Expression{
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter Your Expression:");
        String str=sc.next();

        Postfix_convert.postfixstring(str);
    }
}
