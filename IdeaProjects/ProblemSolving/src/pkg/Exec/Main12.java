package pkg.Exec;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main12 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] inputNums = br.readLine().split(" ");
        int[] chkArr = new int[7];
        int[] ascArr = {-3, -2, -1, 0, 1, 2, 3};
        int[] descArr = {4, 3, 2, 1, 0, -1, -2};

        for(int i=0;i<7;i++){
            chkArr[i] = Integer.parseInt(inputNums[i])-4;
        }

        if(Arrays.equals(chkArr,ascArr)){
            System.out.println("ascending");
        }else if(Arrays.equals(chkArr,descArr)){
            System.out.println("descending");
        }else{
            System.out.println("mixed");
        }

    }
}
