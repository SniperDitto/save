package pkg.Class1;

import java.util.Scanner;

public class Main3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] inputStr = scanner.nextLine().split(" ");
        int result = 0;
        for(String s : inputStr){
            result += Integer.parseInt(s)*Integer.parseInt(s);
        }
        result = result%10;
        System.out.println(result);
    }
}
