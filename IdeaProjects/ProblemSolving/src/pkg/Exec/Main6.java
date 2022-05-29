package pkg.Exec;

import java.util.Scanner;

public class Main6 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numCnt = Integer.parseInt(scanner.nextLine());
        System.out.println();//일부러 한줄 내림, 제출 시 삭제
        String[] inputStr = scanner.nextLine().split(" ");
        int[] inputInts = new int[numCnt];

        int index=0;
        for(String s : inputStr){
            inputInts[index] = Integer.parseInt(s);
            index++;
        }

        int minVal = inputInts[0];
        int maxVal = inputInts[numCnt-1];

        for(int i=0;i<inputInts.length;i++){
            if(inputInts[i]>maxVal){
                maxVal = inputInts[i];
            }
            if(inputInts[i]<minVal){
                minVal = inputInts[i];
            }
        }

        System.out.println(minVal+" "+maxVal);
    }
}
