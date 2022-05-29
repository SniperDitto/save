package pkg.Exec;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main11 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int inputCaseNum = Integer.parseInt(br.readLine());
        System.out.println(inputCaseNum);

        String inputStr = br.readLine();
        System.out.println(inputStr);


        br.close();
    }
}
