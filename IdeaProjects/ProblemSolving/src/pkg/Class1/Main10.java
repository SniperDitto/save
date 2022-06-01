package pkg.Class1;

import java.util.Scanner;

public class Main10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int maxVal = 0;
        int maxIdx = 0;
        int[] inputInts = new int[9];
        for(int i=0;i<9;i++){
            inputInts[i] = Integer.parseInt(scanner.nextLine());
            if(maxVal<inputInts[i]){
                maxVal = inputInts[i];
                maxIdx = i+1;
            }
        }
        System.out.println(maxVal);
        System.out.println(maxIdx);
    }
}
