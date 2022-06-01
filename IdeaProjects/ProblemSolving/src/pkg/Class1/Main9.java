package pkg.Class1;

import java.util.Scanner;

public class Main9 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int result = 0;

        String[] inputStr = scanner.nextLine().split(" ");
        int[] inputCnts = {0,0,0,0,0,0};//각 눈별 나온 수

        for(int i=1;i<7;i++){
            for(String s : inputStr){
                if(Integer.parseInt(s)==i){
                    inputCnts[i-1]++;
                }
            }
        }

        System.out.println(getResult(inputCnts));

    }

    public static int getResult(int[] inputCnts){
        int result = 0;

        for(int i=6;i>0;i--){
            if(inputCnts[i-1]==3){
                result = 10000 + 1000*i;
                return result;
            }
        }
        for(int i=6;i>0;i--){
            if(inputCnts[i-1]==2){
                result = 1000 + 100*i;
                return result;
            }
        }
        for(int i=6;i>0;i--){
            if(inputCnts[i-1]==1){
                result = 100*i;
                return result;
            }
        }

        return result;
    }
}
