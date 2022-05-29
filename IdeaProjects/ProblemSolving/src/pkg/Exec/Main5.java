package pkg.Exec;

import java.util.Scanner;

public class Main5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int inputNum = Integer.parseInt(scanner.nextLine());

        String result = "";

        for(int i=inputNum;i>0;i--){//4 3 2 1
            for(int j=i-1;j>0;j--){//321 21 1
                result += " ";
            }
            for(int k=inputNum-(i-1);k>0;k--){//1 12 123 1234
                result += "*";
            }
            result += "\n";
        }

        System.out.println(result);

    }

    public static String getStars(int num){
        String result = "";

        for(int i=num;i>0;i--){//4 3 2 1
            for(int j=i-1;j>0;j--){//321 21 1
                result += " ";
            }
            for(int k=num-(i-1);k>0;k--){//1 12 123 1234
                result += "*";
            }
            result += "\n";
        }

        return result;
    }
}
