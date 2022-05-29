package pkg.Exec;

import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] inputStr = scanner.nextLine().split(" ");
        int result = Integer.parseInt(inputStr[0]) * Integer.parseInt(inputStr[1]);
        System.out.println(result);
    }
}
