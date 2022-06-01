package pkg.Class1;

import java.util.Scanner;

public class Main1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int inputNum = Integer.parseInt(scanner.nextLine());

        String result = "";
        for(int i=0;i<inputNum;i++){
            for(int j=0;j<=i;j++){
                result += "*";
            }
            result += "\n";
        }

        System.out.println(result);
    }
}
