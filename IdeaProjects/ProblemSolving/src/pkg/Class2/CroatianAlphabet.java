package pkg.Class2;

import java.io.*;

public class CroatianAlphabet {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String inStr = br.readLine();
		int length = inStr.length();
		int count = 0;
		for(int i=0;i<length;i++){
			String chkStr = inStr.substring(i,i+1);
			if((chkStr.equals("c")&&(i!=length-1))  || (chkStr.equals("s")&&(i!=length-1))){
				//c=, c-, s=, z=
				if(inStr.substring(i+1,i+2).equals("=") || inStr.substring(i+1,i+2).equals("-")){
					count++;
					if(i!=length-2){
						i++;
					}
				}else{
					count++;
				}
			}else if((chkStr.equals("l")&&(i!=length-1)) || (chkStr.equals("n")&&(i!=length-1))){
				//lj, nj
				if(inStr.substring(i+1,i+2).equals("j")){
					count++;
					if(i!=length-2){
						i++;
					}
				}else{
					count++;
				}
			}
			else if(chkStr.equals("d") && (i!=length-1)){
				if (inStr.substring(i+1,i+2).equals("z") && (i!=length-2)){
					//dz=
					count++;
					if(i<length-2 && inStr.substring(i+2,i+3).equals("=")) {
						i += 2;
					}else{
						i++;
					}
				}else if(inStr.substring(i+1,i+2).equals("-")){
					//d-
					count++;
					if(i!=length-2){
						i++;
					}
					
				}else{
					count++;
				}
			}else if(chkStr.equals("z") && (i!=length-1)){
				if(inStr.substring(i+1,i+2).equals("=")){
					count++;
					if(i!=length-2){
						i++;
					}
				}else{
					count++;
				}
			}
			else{
				count++;
			}
		}
		
		
		
		bw.append(String.valueOf(count));
		bw.flush();
		bw.close();
		br.close();
	}
}
