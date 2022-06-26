package pkg.coconetest;

class Member{
	int no;
	String name ;
	
	Member(int no){
		this.no = no;
	}
	
	Member(int no, String name){
		this.no = no;
		this.name = name;
	}
}

public class MemberEx {
	public static void main(String[] args) {
		Member one = new Member(1);
	}
}