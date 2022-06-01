package pkg.Class1;

import java.util.ArrayList;
import java.util.Scanner;

public class Main7 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> answers = new ArrayList<Integer>();

        while(scanner.hasNext()){
            String inputStr = scanner.nextLine();
            if(!inputStr.equals("")) {
                String[] nextNums = inputStr.split(" ");
                System.out.print("");
                int A = Integer.parseInt(nextNums[0]);
                int B = Integer.parseInt(nextNums[1]);
                if (A > 0 && B > 0 && A < 10 && B < 10) {
                    answers.add(A + B);
                }
            }
        }

        for(int i : answers){
            System.out.println(i);
        }

    }
}