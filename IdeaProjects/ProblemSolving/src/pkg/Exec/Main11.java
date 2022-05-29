package pkg.Exec;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main11 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int inputCaseNum = Integer.parseInt(br.readLine());

        for(int i=0;i<inputCaseNum;i++){
            String[] inputStr = br.readLine().split(" ");

            int repeat = Integer.parseInt(inputStr[0]);
            String repeatStr = inputStr[1];

            for(int j=0;j<repeatStr.length();j++){
                for(int k=0;k<repeat;k++){
                    sb.append(repeatStr.substring(j,j+1));
                }
            }
            sb.append("\n");
        }
        System.out.println(sb);
        br.close();
    }
}
