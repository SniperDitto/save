package pkg.Class2;

import java.io.*;
//https://www.acmicpc.net/problem/2941
public class CroatianAlphabet {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String inStr = br.readLine();
		int length = inStr.length();
		int count = 0;
		for(int i=0;i<length;i++){
			String chkStr = inStr.substring(i,i+1);
			
			if(chkStr.equals("c")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("=")||chkStr2.equals("-")){
						//c=, c-
						count++;
						i++;
					}else{
						count++;
					}
				}else{
					//c
					count++;
				}
			}else if(chkStr.equals("d")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("z") && i<length-2){
						if(inStr.substring(i+2,i+3).equals("=")){
							//dz=
							count++;
							i+=2;
						}else{
							//d
							count++;
						}
					}else if(chkStr2.equals("-")){
						//d-
						count++;
						i++;
					}
					else{
						//d
						count++;
					}
				}else{
					//d
					count++;
				}
			}else if(chkStr.equals("l")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("j")){
						//lj
						count++;
						i++;
					}else{
						//l
						count++;
					}
				}else{
					//l
					count++;
				}
			}else if(chkStr.equals("n")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("j")){
						//nj
						count++;
						i++;
					}else{
						//n
						count++;
					}
				}else{
					//n
					count++;
				}
			}else if(chkStr.equals("s")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("=")){
						//s=
						count++;
						i++;
					}else{
						//s
						count++;
					}
				}else{
					//s
					count++;
				}
			}else if(chkStr.equals("z")){
				if(i<length-1){
					String chkStr2 = inStr.substring(i+1,i+2);
					if(chkStr2.equals("=")){
						//z=
						count++;
						i++;
					}else{
						//z
						count++;
					}
				}else{
					//z
					count++;
				}
			}else{
				count++;
			}
			
			
		}
		
		
		
		bw.append(String.valueOf(count));
		bw.flush();
		bw.close();
		br.close();
	}
}
